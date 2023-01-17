package model;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class ProductTypeDAO {

	public static List<ProductType> readProductType() {
		SessionFactory SessionFactory = null;
		try {
			SessionFactory = new Configuration().configure().buildSessionFactory();
		} catch (Exception ex) {
			System.out.println("SessionFactory error " + ex.getMessage());
			return null;
		}
		try {
			Session Session = SessionFactory.openSession();
			Session.getTransaction().begin();
			TypedQuery<ProductType> query = Session.createQuery("from ProductType", ProductType.class);
			List<ProductType> list = query.getResultList();
			Session.getTransaction().commit();
			SessionFactory.close();
			return list;
		} catch (Exception e) {
			System.out.println("Error:" + e.getMessage());
			return null;
		}

	}

}
