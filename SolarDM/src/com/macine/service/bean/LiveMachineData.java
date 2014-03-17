package com.macine.service.bean;

import java.util.Collection;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="MachineData")
public class LiveMachineData { 
	
	private Collection<LiveParamData> paramData;

	public Collection<LiveParamData> getParamData() {
		return paramData;
	}

	@XmlElement(name="ParamData")
	public void setParamData(Collection<LiveParamData> paramData) {
		this.paramData = paramData;
	}
	
	
}
