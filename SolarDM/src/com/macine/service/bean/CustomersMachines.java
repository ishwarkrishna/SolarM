package com.macine.service.bean;

import java.util.Collection;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="CustomersMachines")
public class CustomersMachines { 
	
	private Collection<CustomersMachineDetails> customerMachines;

	public Collection<CustomersMachineDetails> getCustomerMachines() {
		return customerMachines;
	}

	@XmlElement(name="Customers")
	public void setCustomerMachines(Collection<CustomersMachineDetails> customerMachines) {
		this.customerMachines = customerMachines;
	}
}
