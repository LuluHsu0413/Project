package model;

import javax.persistence.*;

@Entity
@Table(name = "product_type")
public class ProductType {

	@Id
	@Column(name = "TYPE_ID")
	private String typeID;

	@Column(name = "TYPE_DESCRIBE_ENG")
	private String engtypeDes;

	@Column(name = "TYPE_DESCRIBE_CHI")
	private String chitypeDes;

	public ProductType() {

	}

	public ProductType(String typeID, String engTypeDes, String chiTypeDes) {
		this.typeID = typeID;
		this.engtypeDes = engTypeDes;
		this.chitypeDes = chiTypeDes;
	}

	public String getTypeID() {
		return typeID;
	}

	public void setTypeID(String typeID) {
		this.typeID = typeID;
	}

	public String getEngTypeDes() {
		return engtypeDes;
	}

	public void setEngTypeDes(String engTypeDes) {
		this.engtypeDes = engTypeDes;
	}

	public String getChiTypeDes() {
		return chitypeDes;
	}

	public void setChiTypeDes(String chiTypeDes) {
		this.chitypeDes = chiTypeDes;
	}

	@Override
	public String toString() {
		return "ProductType [typeID=" + typeID + ", engTypeDes=" + engtypeDes + ", chiTypeDes=" + chitypeDes + "]";
	}

}
