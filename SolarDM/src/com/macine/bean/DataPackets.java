package com.macine.bean;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import net.sf.cglib.core.TinyBitSet;

@Entity
@Table(name="data_packets")
public class DataPackets {

	@Id
	@Column(name ="DATA_PACKET_ID")
	private long dataPacketId;
	
	@Column(name ="PACKET")
	private String packet;
		
	@Column(name ="CURRENT_TIME_STAMP")
	private Timestamp currentTimestamp;
	
	@Column(name="RECEIVED_TIMESTSMP")
	private Timestamp receivedTimestamp;
	
	@ManyToOne
	@JoinColumn(name="IMEI_NO")
				//insertable=false, updatable=false, 
				//nullable=false)
	private MachineDetails machineDetails;

	public long getDataPacketId() {
		return dataPacketId;
	}

	public void setDataPacketId(long dataPacketId) {
		this.dataPacketId = dataPacketId;
	}

	public String getPacket() {
		return packet;
	}

	public void setPacket(String packet) {
		this.packet = packet;
	}

	public Timestamp getCurrentTimestamp() {
		return currentTimestamp;
	}

	public void setCurrentTimestamp(Timestamp currentTimestamp) {
		this.currentTimestamp = currentTimestamp;
	}
	
	public MachineDetails getMachineDetails() {
		return machineDetails;
	}

	public void setMachineDetails(MachineDetails machineDetails) {
		this.machineDetails = machineDetails;
	}	
	
	public Timestamp getReceivedTimestamp() {
		return receivedTimestamp;
	}

	public void setReceivedTimestamp(Timestamp receivedTimestamp) {
		this.receivedTimestamp = receivedTimestamp;
	}

	@Override
	public String toString() {
		return "DataPackets [dataPacketId=" + dataPacketId + ", packet="
				+ packet + ", currentTimestamp=" + currentTimestamp + "]";
	}
	
}
