package model;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import javax.persistence.*;

@Entity
@Table(name = "order_main")
public class OrderMain implements java.io.Serializable {
	@Id
	@Column(name = "ORDER_ID")
	String orderID;
	@Column(name = "ORDER_DATE")
	String orderDate;
	@Column(name = "ORDER_TIME")
	String orderTime;
	@Column(name = "TOTAL_PRICE")
	Integer totalPrice;
	@Column(name = "PAID_STATUS")
	Integer paidStatus;

	public OrderMain() {
		Date dateTime = new Date();
		// 處理ID格式
		SimpleDateFormat idDate = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat idTime = new SimpleDateFormat("HHmmss");
		String dateForID = idDate.format(dateTime);
		String timeForID = idTime.format(dateTime);
		this.orderID = dateForID + timeForID;
		// 處理Date + Time
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
		String date = dateFormat.format(dateTime);
		String time = timeFormat.format(dateTime);
		this.orderDate = date;
		this.orderTime = time;
		this.totalPrice = 0;
		this.paidStatus = 0;
	}

	public OrderMain(String orderID, String orderDate, String orderTime, Integer totalPrice, Integer paidStatus) {
		super();
		this.orderID = orderID;
		this.orderDate = orderDate;
		this.orderTime = orderTime;
		this.totalPrice = totalPrice;
		this.paidStatus = paidStatus;
	}

	public String getOrderID() {
		return orderID;
	}

	public void setOrderID(String orderID) {
		this.orderID = orderID;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public String getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(String orderTime) {
		this.orderTime = orderTime;
	}

	public Integer getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Integer totalPrice) {
		this.totalPrice = totalPrice;
	}

	public Integer getPaidStatus() {
		return paidStatus;
	}

	public void setPaidStatus(Integer paidStatus) {
		this.paidStatus = paidStatus;
	}

	@Override
	public String toString() {
		return "OrderMain [orderID=" + orderID + ", orderDate=" + orderDate + ", orderTime=" + orderTime
				+ ", totalPrice=" + totalPrice + ", paidStatus=" + paidStatus + "]";
	}

}
