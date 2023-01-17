package model;

import javax.persistence.*;

@Entity
@Table(name = "reservation")
public class Reservation implements java.io.Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "RESERVATION_ID")
	private Integer reservationID;

	@Column(name = "RESERVATION_DATE")
	private String reservationDate;

	@Column(name = "RESERVATION_TIME")
	private String reservationTime;

	@Column(name = "RESERVATION_PERSON")
	private String reservationPerson;

	@Column(name = "RESERVATION_NAME")
	private String reservationName;

	@Column(name = "RESERVATION_PHONE")
	private String reservationPhone;

	@Column(name = "RESERVATION_EMAIL")
	private String reservationEmail;

	public Reservation() {
	}

	public Reservation(Integer reservationID, String reservationDate, String reservationTime, String reservationPerson,
			String reservationName, String reservationPhone, String reservationEmail) {
		super();
		this.reservationID = reservationID;
		this.reservationDate = reservationDate;
		this.reservationTime = reservationTime;
		this.reservationPerson = reservationPerson;
		this.reservationName = reservationName;
		this.reservationPhone = reservationPhone;
		this.reservationEmail = reservationEmail;
	}

	public Integer getReservationID() {
		return reservationID;
	}

	public void setReservationID(Integer reservationID) {
		this.reservationID = reservationID;
	}

	public String getReservationDate() {
		return reservationDate;
	}

	public void setReservationDate(String reservationDate) {
		this.reservationDate = reservationDate;
	}

	public String getReservationTime() {
		return reservationTime;
	}

	public void setReservationTime(String reservationTime) {
		this.reservationTime = reservationTime;
	}

	public String getReservationPerson() {
		return reservationPerson;
	}

	public void setReservationPerson(String reservationPerson) {
		this.reservationPerson = reservationPerson;
	}

	public String getReservationName() {
		return reservationName;
	}

	public void setReservationName(String reservationName) {
		this.reservationName = reservationName;
	}

	public String getReservationPhone() {
		return reservationPhone;
	}

	public void setReservationPhone(String reservationPhone) {
		this.reservationPhone = reservationPhone;
	}

	public String getReservationEmail() {
		return reservationEmail;
	}

	public void setReservationEmail(String reservationEmail) {
		this.reservationEmail = reservationEmail;
	}

	@Override
	public String toString() {
		return "Reservation [reservationID=" + reservationID + ", reservationDate=" + reservationDate
				+ ", reservationTime=" + reservationTime + ", reservationPerson=" + reservationPerson
				+ ", reservationName=" + reservationName + ", reservationPhone=" + reservationPhone
				+ ", reservationEmail=" + reservationEmail + "]";
	}

}