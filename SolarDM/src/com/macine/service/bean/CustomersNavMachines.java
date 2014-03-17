package com.macine.service.bean;

import java.util.List;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import com.macine.service.bean.CustomerDetails;

@XmlRootElement(name="CustomersNavMachines")
public class CustomersNavMachines {

	String customerName = "";
	
	List<MachineNavDetails>  machines;

	@XmlAttribute(name="name")
	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	@XmlElement(name="machins")
	public List<MachineNavDetails> getMachines() {
		return machines;
	}

	public void setMachines(List<MachineNavDetails> machines) {
		this.machines = machines;
	}


}
