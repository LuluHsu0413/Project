package model;

import javax.persistence.*;

@Entity
@Table(name = "product")
public class Products implements java.io.Serializable {
	@Id
	@Column(name = "PRODUCT_ID")
	private Integer productID;
	@Column(name = "PRODUCT_CATAGORY")
	private String productCatagory;
	@Column(name = "PRODUCT_NAME")
	private String productName;
	@Column(name = "PRODUCT_NAME_CHI")
	private String productNameChi;
	@Column(name = "PRODUCT_PRICE")
	private Integer productPrice;
	@Column(name = "PRODUCT_IMAGE_PATH")
	private String productImagePath;
	@Column(name = "PRODUCT_DESCRIBE")
	private String productDescribe;

	public Products() {
	}

	public Products(Integer productID, String productCatagory, String productName, String productNameChi,
			Integer productPrice, String productImagePath, String productDescribe) {
		super();
		this.productID = productID;
		this.productCatagory = productCatagory;
		this.productName = productName;
		this.productNameChi = productNameChi;
		this.productPrice = productPrice;
		this.productImagePath = productImagePath;
		this.productDescribe = productDescribe;
	}

	public Integer getProductID() {
		return productID;
	}

	public void setProductID(Integer productID) {
		this.productID = productID;
	}

	public String getProductCatagory() {
		return productCatagory;
	}

	public void setProductCatagory(String productCatagory) {
		this.productCatagory = productCatagory;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductNameChi() {
		return productNameChi;
	}

	public void setProductNameChi(String productNameChi) {
		this.productNameChi = productNameChi;
	}

	public Integer getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(Integer productPrice) {
		this.productPrice = productPrice;
	}

	public String getProductImagePath() {
		return productImagePath;
	}

	public void setProductImagePath(String productImagePath) {
		this.productImagePath = productImagePath;
	}

	public String getProductDescribe() {
		return productDescribe;
	}

	public void setProductDescribe(String productDescribe) {
		this.productDescribe = productDescribe;
	}

	@Override
	public String toString() {
		return "Products [productID=" + productID + ", productCatagory=" + productCatagory + ", productName="
				+ productName + ", productNameChi=" + productNameChi + ", productPrice=" + productPrice
				+ ", productImagePath=" + productImagePath + ", productDescribe=" + productDescribe + "]";
	}

}
