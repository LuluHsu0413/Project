package model;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.*;
import org.hibernate.cfg.*;

public class ProductDAO {
	public static List<Products> addProduct(Products Products) {
		List<Products> ProductList = null;
		SessionFactory SessionFactory = null;
		try {
			SessionFactory = new Configuration().configure().buildSessionFactory();
		} catch (Exception ex) {
			System.out.println("SessionFactory error " + ex.getMessage());
			return null;
		}
		Session Session = SessionFactory.openSession();
		Session.getTransaction().begin();
		Session.persist(Products);
		Session.getTransaction().commit();
		SessionFactory.close();
		ProductList = ProductDAO.readProduct();
		return ProductList;
	}

	public static List<Products> updateProduct(Products Products) {
		List<Products> ProductList = null;
		SessionFactory SessionFactory = null;
		try {
			SessionFactory = new Configuration().configure().buildSessionFactory();
		} catch (Exception ex) {
			System.out.println("SessionFactory error " + ex.getMessage());
			return null;
		}
		Session Session = SessionFactory.openSession();
		Session.getTransaction().begin();
		Products Product = Session.get(Products.class, Products.getProductID());
		Product.setProductCatagory(Products.getProductCatagory());
		Product.setProductName(Products.getProductName());
		Product.setProductPrice(Products.getProductPrice());
		Product.setProductImagePath(Products.getProductImagePath());
		Product.setProductDescribe(Products.getProductDescribe());
		Session.update(Product);
		Session.getTransaction().commit();
		SessionFactory.close();
		ProductList = ProductDAO.readProduct();
		return ProductList;
	}

	public static List<Products> deleteProduct(Products Products) {
		List<Products> ProductList = null;
		SessionFactory SessionFactory = null;
		try {
			SessionFactory = new Configuration().configure().buildSessionFactory();
		} catch (Exception ex) {
			System.out.println("SessionFactory error " + ex.getMessage());
			return null;
		}
		Session Session = SessionFactory.openSession();
		Session.getTransaction().begin();
		Products Product = Session.get(Products.class, Products.getProductID());
		Session.delete(Product);
		Session.getTransaction().commit();
		SessionFactory.close();
		ProductList = ProductDAO.readProduct();
		return ProductList;
	}

	public static List<Products> readProduct() {
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
			TypedQuery<Products> query = Session.createQuery("from Products", Products.class);
			List<Products> ProductList = query.getResultList();
			Session.getTransaction().commit();
			SessionFactory.close();
			return ProductList;
		} catch (Exception e) {
			System.out.println("Error:" + e.getMessage());
			return null;
		}
	}

	public static Products readOneProduct(Integer prdoctID) {
		SessionFactory sessionFactory = null;
		Products product = null;
		try {
			sessionFactory = new Configuration().configure().buildSessionFactory();
		} catch (Exception ex) {
			System.out.println("SessionFactory error " + ex.getMessage());
			return null;
		}
		try {
			Session session = sessionFactory.openSession();
			session.getTransaction().begin();
			product = session.get(Products.class, prdoctID);
			session.getTransaction().commit();
			sessionFactory.close();
			return product;
		} catch (Exception e) {
			System.out.println("Error:" + e.getMessage());
			return null;
		}
	}
}
