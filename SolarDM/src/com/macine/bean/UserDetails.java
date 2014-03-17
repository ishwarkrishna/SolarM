package com.macine.bean;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="user_details")
public class UserDetails {
	
	@Id
	@Column(name="NAME")
	private String name;
	
	@Column(name="CURRENT_TIME_STAMP")
	private Timestamp currentTimestamp;
	
	@ManyToOne
	@JoinColumn(name="CUSTOMER_ID")
				//insertable=false, updatable=false, 
				//nullable=false)
	private CustomerDetails customerDetails;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	@Override
	public String toString() {
		return "UserDetails [name=" + name + ", currentTimestamp="
				+ currentTimestamp + ", customerDetails=" + customerDetails
				+ "]";
	}	
	
}
