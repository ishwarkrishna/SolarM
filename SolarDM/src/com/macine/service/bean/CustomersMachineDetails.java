package com.macine.service.bean;

import java.util.Collection;

import javax.persistence.Column;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import com.macine.service.bean.CustomerDetails;

@XmlRootElement(name="CustomerMachines")
public class CustomersMachineDetails {

	CustomerDetails customerDetails;
	
	Machines machines;

	public CustomerDetails getCustomerDetails() {
		return customerDetails;
	}
	
	@XmlElement(name="CustomerDetails")
	public void setCustomerDetails(CustomerDetails customerDetails) {
		this.customerDetails = customerDetails;
	}

	public Machines getMachines() {
		return machines;
	}

	@XmlElement(name="Machines")
	public void setMachines(Machines machines) {
		this.machines = machines;
	}
	
}
