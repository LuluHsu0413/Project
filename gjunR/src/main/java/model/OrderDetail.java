package model;

import javax.persistence.*;

@Entity
@Table(name = "order_detail")
public class OrderDetail implements java.io.Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ORDER_DETAIL_ID")
	Integer orderDetailID;
	@Column(name = "ORDER_ID")
	String orderID;
	@Column(name = "PRODUCT_ID")
	Integer productID;
	@Column(name = "QUANTITY")
	Integer quantity;
	@Column(name = "PRICE_EACH")
	Integer priceEach;

	public OrderDetail() {

	}

	public OrderDetail(Integer productID, Integer quantity) {
		this.productID = productID;
		this.quantity = quantity;
	}

	public OrderDetail(Integer orderDetailID, Integer productID, Integer quantity) {
		this.orderDetailID = orderDetailID;
		this.productID = productID;
		this.quantity = quantity;
	}

	public Integer getOrderDetailID() {
		return orderDetailID;
	}

	public void setOrderDetailID(Integer orderDetailID) {
		this.orderDetailID = orderDetailID;
	}

	public String getOrderID() {
		return orderID;
	}

	public void setOrderID(String orderID) {
		this.orderID = orderID;
	}

	public Integer getProductID() {
		return productID;
	}

	public void setProductID(Integer productID) {
		this.productID = productID;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Integer getPriceEach() {
		return priceEach;
	}

	public void setPriceEach(Integer priceEach) {
		this.priceEach = priceEach;
	}

	@Override
	public String toString() {
		return "OrderDetail [orderDetailID=" + orderDetailID + ", orderID=" + orderID + ", productID=" + productID
				+ ", quantity=" + quantity + ", priceEach=" + priceEach + "]";
	}

}
