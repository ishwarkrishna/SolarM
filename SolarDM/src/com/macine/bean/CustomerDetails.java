package com.macine.bean;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="customer_details")
public class CustomerDetails {

	@Id
	@GeneratedValue
	@Column(name="CUSTOMER_ID")
	private Long customerId;
	
	@Column(name="NAME")
	private String name;
	
	@Column(name="ADDRESS1")
	private String address1;
	
	@Column(name="ADDRESS2")
	private String address2;
	
	@Column(name="CITY")
	private String city;
	
	@Column(name="CONTACT_NO1")
	private String contactNo1;
	
	@Column(name="CONTACT_NO2")
	private String contactNo2;
	
	@Column(name="LOGO")
	private String logo;
	
	@Column(name="CURRENT_TIME_STAMP")
	private Timestamp currentTimestamp;

		
	public CustomerDetails() {
		
	}


	public Long getCustomerId() {
		return customerId;
	}


	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getAddress1() {
		return address1;
	}


	public void setAddress1(String address1) {
		this.address1 = address1;
	}


	public String getAddress2() {
		return address2;
	}


	public void setAddress2(String address2) {
		this.address2 = address2;
	}


	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
	}


	public String getContactNo1() {
		return contactNo1;
	}


	public void setContactNo1(String contactNo1) {
		this.contactNo1 = contactNo1;
	}


	public String getContactNo2() {
		return contactNo2;
	}


	public void setContactNo2(String contactNo2) {
		this.contactNo2 = contactNo2;
	}


	public String getLogo() {
		return logo;
	}


	public void setLogo(String logo) {
		this.logo = logo;
	}


	public Timestamp getCurrentTimestamp() {
		return currentTimestamp;
	}


	public void setCurrentTimestamp(Timestamp currentTimestamp) {
		this.currentTimestamp = currentTimestamp;
	}


	@Override
	public String toString() {
		return "CustomerDetails [customerId=" + customerId + ", name=" + name
				+ ", address1=" + address1 + ", address2=" + address2
				+ ", city=" + city + ", contactNo1=" + contactNo1
				+ ", contactNo2=" + contactNo2 + ", logo=" + logo
				+ ", currentTimestamp=" + currentTimestamp + "]";
	}		
	
}
