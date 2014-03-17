package com.macine.bean;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="report_data")
public class ReportData {
	
	@Id
	@Column(name="REPORT_ID")
	private long reportId;
	
	@Column(name="DATE")
	private Date date;
	
	@Column(name="HOUR")
	private int hour;
	
	@ManyToOne
	@JoinColumn(name="IMEI_NO")
				//insertable=false, updatable=false, 
				//nullable=false)
	private MachineDetails machineDetails;
	
	@Column(name="REPORT_DATA1")
	private double reportData1;
	
	@Column(name="REPORT_DATA2")
	private double reportData2;
	
	@Column(name="REPORT_DATA3")
	private double reportData3;

	public long getReportId() {
		return reportId;
	}

	public void setReportId(long reportId) {
		this.reportId = reportId;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getHour() {
		return hour;
	}

	public void setHour(int hour) {
		this.hour = hour;
	}

	public MachineDetails getMachineDetails() {
		return machineDetails;
	}

	public void setMachineDetails(MachineDetails machineDetails) {
		this.machineDetails = machineDetails;
	}

	public double getReportData1() {
		return reportData1;
	}

	public void setReportData1(double reportData1) {
		this.reportData1 = reportData1;
	}

	public double getReportData2() {
		return reportData2;
	}

	public void setReportData2(double reportData2) {
		this.reportData2 = reportData2;
	}

	public double getReportData3() {
		return reportData3;
	}

	public void setReportData3(double reportData3) {
		this.reportData3 = reportData3;
	}

	@Override
	public String toString() {
		return "ReportData [reportId=" + reportId + ", date=" + date
				+ ", hour=" + hour + ", machineDetails=" + machineDetails.toString()
				+ ", reportData1=" + reportData1 + ", reportData2="
				+ reportData2 + ", reportData3=" + reportData3 + "]";
	}
	
	
	
}
