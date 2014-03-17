package com.macine.bean;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="latest_data")
public class LatestData {
	
	@Id
	@Column(name="LATEST_DATA_ID")
	private long dataId;
	
	@Column(name="DATA_TIMESTAMP")
	private Timestamp dataTimestamp;
	
	@Column(name="CURRENT_TIME_STAMP")
	private Timestamp currentTimestamp;
	
	@ManyToOne
	@JoinColumn(name="IMEI_NO")
				//insertable=false, updatable=false, 
				//nullable=false)
	private MachineDetails machineDetails;
	
	@ManyToOne
	@JoinColumn(name="DATA_ID")
				//insertable=false, updatable=false, 
				//nullable=false)
	private DataDetails dataDetails;
	
	@Column(name="VALUE")
	private double value;

	public long getDataId() {
		return dataId;
	}

	public void setDataId(long dataId) {
		this.dataId = dataId;
	}

	public Timestamp getDataTimestamp() {
		return dataTimestamp;
	}

	public void setDataTimestamp(Timestamp dataTimestamp) {
		this.dataTimestamp = dataTimestamp;
	}

	public MachineDetails getMachineDetails() {
		return machineDetails;
	}

	public void setMachineDetails(MachineDetails machineDetails) {
		this.machineDetails = machineDetails;
	}

	public DataDetails getDataDetails() {
		return dataDetails;
	}

	public void setDataDetails(DataDetails dataDetails) {
		this.dataDetails = dataDetails;
	}

	public double getValue() {
		return value;
	}

	public void setValue(double value) {
		this.value = value;
	}	

	public Timestamp getCurrentTimestamp() {
		return currentTimestamp;
	}

	public void setCurrentTimestamp(Timestamp currentTimestamp) {
		this.currentTimestamp = currentTimestamp;
	}

	@Override
	public String toString() {
		return "LatestData [dataId=" + dataId + ", currentTimestamp="
				+ dataTimestamp + ", machineDetails=" + machineDetails.toString()
				+ ", dataDetails=" + dataDetails.toString() + ", value=" + value + "]";
	}
	
}
