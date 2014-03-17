package com.macine.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="protocol_type")
public class ProtocolType {

	@Id
	@GeneratedValue
	@Column(name="PRO_TYPE_ID")
	private int proTypeId;
	
	@Column(name="DESC")
	private String desc;
	

	public int getProTypeId() {
		return proTypeId;
	}

	public void setProTypeId(int proTypeId) {
		this.proTypeId = proTypeId;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}
	
}
