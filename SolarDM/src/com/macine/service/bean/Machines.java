package com.macine.service.bean;

import java.util.Collection;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="Machines")
public class Machines { 
	
	private Collection<MachineDetails> machines;

	public Collection<MachineDetails> getMachines() {
		return machines;
	}

	@XmlElement(name="MachineDetails")
	public void setMachines(Collection<MachineDetails> machines) {
		this.machines = machines;
	}
	
	
}
