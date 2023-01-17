package model;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class OrderMainDAO {

	
	// 新增OrderMain
	public static String addOrder(OrderMain orderMain) {
		SessionFactory sessionFactory = null;
		try {
			sessionFactory = new Configuration().configure().buildSessionFactory();
		} catch (Exception ex) {
			System.out.println("SessionFactory error " + ex.getMessage());
			return null;
		}
		Session session = sessionFactory.openSession();
		session.getTransaction().begin();
		session.persist(orderMain);
		session.getTransaction().commit();
		sessionFactory.close();
		return "Order Success";
	}

	// 更新付款狀態(需傳入orderID)
	public static String updatePaid(String orderID) {
		SessionFactory sessionFactory = null;
		try {
			sessionFactory = new Configuration().configure().buildSessionFactory();
		} catch (Exception ex) {
			System.out.println("SessionFactory error " + ex.getMessage());
			return null;
		}
		Session session = sessionFactory.openSession();
		session.getTransaction().begin();
		// 從DB撈出符合orderID的資料
		OrderMain orderMain = session.get(OrderMain.class, orderID);
		// 將付款狀態改為1(true)
		orderMain.setPaidStatus(1);
		session.update(orderMain);
		session.getTransaction().commit();
		sessionFactory.close();
		// 回傳字串: 已付款
		return "Paid!!!";
	}

	// 刪除訂單(需傳入orderID)
	public static String deleteOrder(String orderID) {
		SessionFactory sessionFactory = null;
		try {
			sessionFactory = new Configuration().configure().buildSessionFactory();
		} catch (Exception ex) {
			System.out.println("SessionFactory error " + ex.getMessage());
			return null;
		}
		Session session = sessionFactory.openSession();
		session.getTransaction().begin();
		// 找出orderID相符資料
		OrderMain orderMain = session.get(OrderMain.class, orderID);
		// 從DB將符合資料刪除
		session.delete(orderMain);
		session.getTransaction().commit();
		sessionFactory.close();
		return "Order deleted!!";
	}

	// 查詢所有OrderMain
	public static List<OrderMain> readOrder() {
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
			// 執行SQL query (SELECT * FROM Order_Main)
			TypedQuery<OrderMain> query = session.createQuery("from OrderMain", OrderMain.class);
			// 執行結果存入orderList變數
			List<OrderMain> orderList = query.getResultList();
			session.getTransaction().commit();
			sessionFactory.close();
			return orderList;
		} catch (Exception e) {
			System.out.println("Error:" + e.getMessage());
			return null;
		}
	}

	// 查詢單筆OrderMain
	public static OrderMain readOneOrderMain(String orderID) {
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
			// 從DB撈出orderID符合的單筆資料
			OrderMain orderMain = session.get(OrderMain.class, orderID);
			session.getTransaction().commit();
			sessionFactory.close();
			// 回傳資料
			return orderMain;
		} catch (Exception e) {
			System.out.println("Error:" + e.getMessage());
			return null;
		}
	}
	
	// 更新訂單總金額(需傳入orderID, totalPrice)
	public static String updatePrice(String orderID, Integer totalPrice) {
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
			// 找出單筆符合OrderID的資料
			OrderMain orderMain = session.get(OrderMain.class, orderID);
			// 設定總金額
			orderMain.setTotalPrice(totalPrice);
			// 存回DB
			session.update(orderMain);
			session.getTransaction().commit();
			sessionFactory.close();
			return "Price updated";
		} catch (Exception e) {
			System.out.println("Error:" + e.getMessage());
			return null;
		}
	}
}
