package com.macine.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="data_details")
public class DataDetails {

	@Id
	@Column(name ="DATA_ID")
	private String dataId;
	
	@Column(name ="DISPLAY_NAME")
	private String displayName;
	
	@Column(name ="UNIT")
	private String unit;	

	public String getDataId() {
		return dataId;
	}

	public void setDataId(String dataId) {
		this.dataId = dataId;
	}

	public String getDisplayName() {
		return displayName;
	}

	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	@Override
	public String toString() {
		return "DataDetails [id=" + dataId + ", displayName=" + displayName
				+", unit=" + unit + "]";
	}
	
	
}
