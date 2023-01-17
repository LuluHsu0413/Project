package model;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class OrderDetailDAO {

	// 新增OrderDetail (呼叫傳進orderDetail)
	public static String addOrderDetail(OrderDetail orderDetail) {
		SessionFactory sessionFactory = null;
		try {
			// 產生session factory 
			sessionFactory = new Configuration().configure().buildSessionFactory();
		} catch (Exception ex) {
			System.out.println("SessionFactory error " + ex.getMessage());
			return null;
		}
		// 建立session
		Session session = sessionFactory.openSession();
		// 建立連線
		session.getTransaction().begin();
		// 新增資料庫資料
		session.persist(orderDetail);
		// DB commit(確認)
		session.getTransaction().commit();
		// 關閉連線
		sessionFactory.close();
		// 回傳字串
		return "OrderDetail Inserted";
	}

	// 刪除OrderDetail (呼叫傳進orderID)
	public static String deleteOrderDetail(Integer orderID) {
		SessionFactory sessionFactory = null;
		try {
			sessionFactory = new Configuration().configure().buildSessionFactory();
		} catch (Exception ex) {
			System.out.println("SessionFactory error " + ex.getMessage());
			return null;
		}
		Session session = sessionFactory.openSession();
		session.getTransaction().begin();
		// 從DB找orderID相符的資料存在 orderDetail
		OrderDetail orderDetail = session.get(OrderDetail.class, orderID);
		// 從DB刪除orderDetail 資料
		session.delete(orderDetail);
		session.getTransaction().commit();
		sessionFactory.close();
		return "OrderDetail deleted!!";
	}

	// 查詢全部OrderDetail (未使用)
	public static List<OrderDetail> readOrderDetailList() {
		SessionFactory sessionFactory = null;
		try {
			sessionFactory = new Configuration().configure().buildSessionFactory();
		} catch (Exception ex) {
			System.out.println("SessionFactory error " + ex.getMessage());
			return null;
		}
		try {
			Session session = sessionFactory.openSession();
			session.getTransaction().begin();
			// DB query (SELECT * from Order_Detail)，撈取Table(Order_Detail)裡的資料
			TypedQuery<OrderDetail> query = session.createQuery("from OrderDetail", OrderDetail.class);
			// 將執行query結果存在orderDetailList
			List<OrderDetail> orderDetailList = query.getResultList();
			session.getTransaction().commit();
			sessionFactory.close();
			// 把撈出的資料回傳給呼叫者(Controller)
			return orderDetailList;
		} catch (Exception e) {
			System.out.println("Error:" + e.getMessage());
			return null;
		}
	}

	// SELECT productID,productNameChi,orderID,quantity(前端渲染用)
	public static List<Object> readOneOrderDetailAndProduct(String orderID) {
		SessionFactory sessionFactory = null;
		try {
			sessionFactory = new Configuration().configure().buildSessionFactory();
		} catch (Exception ex) {
			System.out.println("SessionFactory error " + ex.getMessage());
			return null;
		}
		try {
			Session session = sessionFactory.openSession();
			session.getTransaction().begin();
			// 執行SQL query (SELECT od.order_ID, od.product_ID, p.product_Name_Chi, od.quantity FROM Order_Detail as od INNER JOIN Product as p ON od.product_ID = p.product_ID WHERE od.order_ID = ?)
			String query = "SELECT od.orderID, od.productID, p.productNameChi, od.quantity FROM OrderDetail as od INNER JOIN Products as p ON od.productID = p.productID where od.orderID = :orderID";
			// 將執行結果存數orderDetailList變數
			List<Object> orderDetailList = session.createQuery(query)
					// 傳入orderID變數至SQL條件式
					.setParameter("orderID", orderID).list();
			session.getTransaction().commit();
			sessionFactory.close();
			return orderDetailList;
		} catch (Exception e) {
			System.out.println("Error:" + e.getMessage());
			return null;
		}
	}

	// 更新OrderDetail (需傳入orderID, orderDetailData參數)
	public static List<OrderDetail> updateOrder(String orderID, List<OrderDetail> orderDetailData) {
		SessionFactory sessionFactory = null;
		try {
			sessionFactory = new Configuration().configure().buildSessionFactory();
		} catch (Exception ex) {
			System.out.println("SessionFactory error " + ex.getMessage());
			return null;
		}
		try {
			Session session = sessionFactory.openSession();
			session.getTransaction().begin();
			// 從DB撈出orderID相符的所有資料存在preOrderDetailList(舊資料)
			List<OrderDetail> preOrderDetailList = OrderDetailDAO.readOneOrderDetail(orderID);
			// 比較新資料(orderDetailData)與舊資料
			for (OrderDetail pre : preOrderDetailList) {
				for (OrderDetail post : orderDetailData) {
					// 判斷新資料(orderDetailData)與舊資料orderID是否一致
					if (pre.getProductID() == post.getProductID()) {
						// 更新OrderDetail數量(數量為0則刪除)
						if (post.getQuantity() == 0) {
							session.delete(pre);
						} 
						// 新資料數量若不為0則修改
						else {
							pre.setQuantity(post.getQuantity());
							session.update(pre);
						}
					}
				}
			}
			session.getTransaction().commit();
			// 從DB撈出修改後的資料
			List<OrderDetail> postOrderDetailList = OrderDetailDAO.readOneOrderDetail(orderID);
			sessionFactory.close();
			return postOrderDetailList;
		} catch (Exception e) {
			System.out.println("Error:" + e.getMessage());
			return null;
		}
	}

	
	// 從DB撈出ID符合的OrderDetail
	public static List<OrderDetail> readOneOrderDetail(String orderID) {
		SessionFactory sessionFactory = null;
		try {
			sessionFactory = new Configuration().configure().buildSessionFactory();
		} catch (Exception ex) {
			System.out.println("SessionFactory error " + ex.getMessage());
			return null;
		}
		try {
			Session session = sessionFactory.openSession();
			session.getTransaction().begin();
			// 執行SQL query (SELETE * FROM Order_Detail WHERE order_ID = ?)
			TypedQuery<OrderDetail> query = session
					.createQuery("from OrderDetail WHERE orderID = :orderID", OrderDetail.class)
					// 傳入orderID變數至SQL條件式
					.setParameter("orderID", orderID);
			// 執行結果存數orderDetailList變數
			List<OrderDetail> orderDetailList = query.getResultList();
			session.getTransaction().commit();
			sessionFactory.close();
			return orderDetailList;
		} catch (Exception e) {
			System.out.println("Error:" + e.getMessage());
			return null;
		}
	}
}
