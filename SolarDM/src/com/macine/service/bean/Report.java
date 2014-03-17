package com.macine.service.bean;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="report")
public class Report { 
	
	private String data;

	public String getData() {
		return data;
	}

	@XmlElement(name="data")
	public void setData(String data) {
		this.data = data;
	}
	
	
}
