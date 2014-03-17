package com.macine.bean;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="machine_details")
public class MachineDetails {

	@Id
	@Column(name ="IMEI_NO")
	private String imeiNo;
	
	@Column(name ="NAME")
	private String name;
	
	@Column(name ="AREA")
	private String area;
	
	@Column(name ="CITY")
	private String city;
	
	@Column(name ="STATE")
	private String state;
	
	@Column(name ="SIM_NO")
	private long simNo;
	
	@Column(name ="CURRENT_TIME_STAMP")
	private Timestamp currentTimestamp;
	
	@Column(name ="VAR_DATA1")
	private Double capacity;
	
	
	@Column(name ="VAR_DATA2")
	private Double type;
	
	@Column(name ="VAR_DATA3")
	private Double varData;
	
	@ManyToOne
	@JoinColumn(name="CUSTOMER_ID")
				//insertable=false, updatable=false, 
				//nullable=false)
	private CustomerDetails customerDetails;
	
	
	@ManyToOne
	@JoinColumn(name="PRO_TYPE_ID")
	private ProtocolType protocolType;
	
	public String getImeiNo() {
		return imeiNo;
	}

	public void setImeiNo(String imeiNo) {
		this.imeiNo = imeiNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public long getSimNo() {
		return simNo;
	}

	public void setSimNo(long simNo) {
		this.simNo = simNo;
	}

	public Timestamp getCurrentTimestamp() {
		return currentTimestamp;
	}

	public void setCurrentTimestamp(Timestamp currentTimestamp) {
		this.currentTimestamp = currentTimestamp;
	}

	public CustomerDetails getCustomerDetails() {
		return customerDetails;
	}

	public void setCustomerDetails(CustomerDetails customerDetails) {
		this.customerDetails = customerDetails;
	}
	
	public Double getType() {
		return type;
	}
	public void setType(Double type) {
		this.type = type;
	}
	public Double getCapacity() {
		return capacity;
	}
	public void setCapacity(Double capacity) {
		this.capacity = capacity;
	}
		
	public Double getVarData() {
		return varData;
	}
	
	public void setVarData(Double varData) {
		this.varData = varData;
	}	

	public ProtocolType getProtocolType() {
		return protocolType;
	}

	public void setProtocolType(ProtocolType protocolType) {
		this.protocolType = protocolType;
	}

	@Override
	public String toString() {
		return "MachineDetails [imeiNo=" + imeiNo + ", name=" + name
				+ ", area=" + area + ", city=" + city
				+ ", state=" + state + ", simNo=" + simNo
				+ ", currentTimestamp=" + currentTimestamp
				+ ", customerDetails=" + customerDetails.toString() 
				+ ", type = "+type+",capacity = "+capacity+"]";
	}
		
}
