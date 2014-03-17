package com.macine.service.bean;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="ParamData")
public class LiveParamData {

	private String displayName= "";
	private String dataTimestamp ="";
	private String value="";
	
	/**
	 * @return the displayName
	 */
	public String getDisplayName() {
		return displayName;
	}
	/**
	 * @param displayName the displayName to set
	 */
	@XmlElement(name="ParamName")
	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}

	/**
	 * @return the dataTimestamp
	 */
	public String getDataTimestamp() {
		return dataTimestamp;
	}
	/**
	 * @param dataTimestamp the dataTimestamp to set
	 */
	@XmlElement(name="TimeStamp")
	public void setDataTimestamp(String dataTimestamp) {
		this.dataTimestamp = dataTimestamp;
	}
	/**
	 * @return the value
	 */
	public String getValue() {
		return value;
	}
	/**
	 * @param value the value to set
	 */
	@XmlElement(name="Value")
	public void setValue(String value) {
		this.value = value;
	}
	
	
}
