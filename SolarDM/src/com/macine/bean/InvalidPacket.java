package com.macine.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="invalid_packet")
public class InvalidPacket {

	@Id
	@Column(name ="PACK_ID")
	private long dataPacketId;
	
	@Column(name ="DATA")
	private String data;

	public long getDataPacketId() {
		return dataPacketId;
	}

	public void setDataPacketId(long dataPacketId) {
		this.dataPacketId = dataPacketId;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}	
		
}
