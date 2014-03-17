package com.macine.service.bean;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="MachineDetails")
public class MachineDetails {

	private String imeiNo="";
	private String name="";
	private String area="";
	private String city="";
	private String state="";
	private String simNo="";
	private String customerName="";
	
	public String getImeiNo() {
		return imeiNo;
	}

	@XmlElement(name="IMEINo")
	public void setImeiNo(String imeiNo) {
		this.imeiNo = imeiNo;
	}

	public String getName() {
		return name;
	}

	@XmlElement()
	public void setName(String name) {
		this.name = name;
	}
	public String getArea() {
		return area;
	}
	
	@XmlElement()
	public void setArea(String area) {
		this.area = area;
	}
	public String getCity() {
		return city;
	}

	@XmlElement()
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	
	@XmlElement()
	public void setState(String state) {
		this.state = state;
	}
	
	public String getSimNo() {
		return simNo;
	}
	
	@XmlElement()
	public void setSimNo(String simNo) {
		this.simNo = simNo;
	}

	public String getCustomerName() {
		return customerName;
	}

	@XmlElement()
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	
}
