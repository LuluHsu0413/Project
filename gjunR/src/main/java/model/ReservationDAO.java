package model;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.*;
import org.hibernate.cfg.*;

public class ReservationDAO {

	// 新增訂位
	public static String addReservation(Reservation r) {
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
			session.persist(r);
			session.getTransaction().commit();
			sessionFactory.close();
			return "Reservation Success!!";

		} catch (Exception e) {
			System.out.println("Error: " + e.getMessage());
			return null;
		}
	}

	// 修改訂位(未使用)
	public static List<Reservation> updateReservation(Reservation Reservations) {
		List<Reservation> ReservationList = null;
		SessionFactory SessionFactory = null;
		try {
			SessionFactory = new Configuration().configure().buildSessionFactory();
		} catch (Exception ex) {
			System.out.println("SessionFactory error " + ex.getMessage());
			return null;
		}
		Session Session = SessionFactory.openSession();
		Session.getTransaction().begin();
		Reservation Reservation = Session.get(Reservation.class, Reservations.getReservationID());
		Reservation.setReservationDate(Reservations.getReservationDate());
		Reservation.setReservationTime(Reservations.getReservationTime());
		Reservation.setReservationPerson(Reservations.getReservationPerson());
		Reservation.setReservationName(Reservations.getReservationName());
		Reservation.setReservationPhone(Reservations.getReservationPhone());
		Reservation.setReservationEmail(Reservations.getReservationEmail());
		Session.update(Reservation);
		Session.getTransaction().commit();
		SessionFactory.close();
		ReservationList = ReservationDAO.readReservation();
		return ReservationList;
	}

	// 刪除訂位
	public static List<Reservation> deleteReservation(int id) {
		List<Reservation> ReservationList = null;
		SessionFactory SessionFactory = null;
		try {
			SessionFactory = new Configuration().configure().buildSessionFactory();
		} catch (Exception ex) {
			System.out.println("SessionFactory error " + ex.getMessage());
			return null;
		}
		Session Session = SessionFactory.openSession();
		Session.getTransaction().begin();
		Reservation r = Session.get(Reservation.class, id);
		Session.delete(r);
		Session.getTransaction().commit();
		SessionFactory.close();
		ReservationList = ReservationDAO.readReservation();
		return ReservationList;
	}

	// 查詢全部訂位
	public static List<Reservation> readReservation() {
		SessionFactory SessionFactory = null;
		try {
			SessionFactory = new Configuration().configure().buildSessionFactory();
		} catch (Exception ex) {
			System.out.println("SessionFactory error " + ex.getMessage());
			return null;
		}
		Session Session = SessionFactory.openSession();
		Session.getTransaction().begin();
		TypedQuery<Reservation> query = Session.createQuery("from Reservation", Reservation.class);
		List<Reservation> ReservationList = query.getResultList();
		Session.getTransaction().commit();
		SessionFactory.close();
		return ReservationList;
	}

	// 查詢單筆訂位
	public static Reservation readOneReservation(Integer reservationID) {
		SessionFactory SessionFactory = null;
		try {
			SessionFactory = new Configuration().configure().buildSessionFactory();
		} catch (Exception ex) {
			System.out.println("SessionFactory error " + ex.getMessage());
			return null;
		}
		Session Session = SessionFactory.openSession();
		Session.getTransaction().begin();
		Reservation reservation = Session.get(Reservation.class, reservationID);
		Session.getTransaction().commit();
		SessionFactory.close();
		return reservation;
	}
}
