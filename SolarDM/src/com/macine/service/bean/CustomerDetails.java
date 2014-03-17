package com.macine.service.bean;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="CustomerDetails")
public class CustomerDetails {

	private Long customerId;
	private String name;
	private String address1;
	private String address2;
	private String city;
	private String contactNo1;
	private String contactNo2;
	private String logo;
		
	public Long getCustomerId() {
		return customerId;
	}


	@XmlElement()
	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}


	public String getName() {
		return name;
	}


	@XmlElement()
	public void setName(String name) {
		this.name = name;
	}


	public String getAddress1() {
		return address1;
	}


	@XmlElement()
	public void setAddress1(String address1) {
		this.address1 = address1;
	}


	public String getAddress2() {
		return address2;
	}


	@XmlElement()
	public void setAddress2(String address2) {
		this.address2 = address2;
	}


	public String getCity() {
		return city;
	}


	@XmlElement()
	public void setCity(String city) {
		this.city = city;
	}


	public String getContactNo1() {
		return contactNo1;
	}


	@XmlElement()
	public void setContactNo1(String contactNo1) {
		this.contactNo1 = contactNo1;
	}


	public String getContactNo2() {
		return contactNo2;
	}


	@XmlElement()
	public void setContactNo2(String contactNo2) {
		this.contactNo2 = contactNo2;
	}


	public String getLogo() {
		return logo;
	}


	@XmlElement()
	public void setLogo(String logo) {
		this.logo = logo;
	}
	
}
