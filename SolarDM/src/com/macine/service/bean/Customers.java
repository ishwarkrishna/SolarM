package com.macine.service.bean;

import java.util.Collection;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import com.macine.service.bean.CustomerDetails;

@XmlRootElement(name="Customers")
public class Customers { 
	
	private Collection<CustomerDetails> customers;

	public Collection<CustomerDetails> getCustomers() {
		return customers;
	}

	@XmlElement(name="Customer")
	public void setCustomers(Collection<CustomerDetails> customers) {
		this.customers = customers;
	}
	
}
