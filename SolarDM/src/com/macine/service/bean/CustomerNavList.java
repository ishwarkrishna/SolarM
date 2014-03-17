package com.macine.service.bean;

import java.util.Collection;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="CustomerNavList")
public class CustomerNavList { 
	
	private Collection<CustomersNavMachines> customerNavMachines;

	public Collection<CustomersNavMachines> getCustomerNavMachines() {
		return customerNavMachines;
	}

	@XmlElement(name="Customer")
	public void setCustomerNavMachines(
			Collection<CustomersNavMachines> customerNavMachines) {
		this.customerNavMachines = customerNavMachines;
	}

}
