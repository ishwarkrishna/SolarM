package com.macine.service.bean;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="SolarProtocol1LatestView")
public class SolarProtocol1LatestView {

	private String imeiNo="";
	private String name="";

	private String dataTimestamp;

	private double data1=0.0;
	private double data2=0.0;
	private double data3=0.0;
	private double data4=0.0;
	private double data5=0.0;
	private double data6=0.0;
	private double data7=0.0;
	private double data8=0.0;
	private double data9=0.0;
	private double data10=0.0;
	private double data11=0.0;
	private double data12=0.0;
	private double data13=0.0;
	private double data14=0.0;
	private double data15=0.0;
	private double data16=0.0;
	private double data17=0.0;
	private double data18=0.0;
	private double data19=0.0;

	public String getImeiNo() {
		return imeiNo;
	}
	@XmlElement(name="IMEIno")
	public void setImeiNo(String imeiNo) {
		this.imeiNo = imeiNo;
	}

	public String getName() {
		return name;
	}
	@XmlElement(name="Name")
	public void setName(String name) {
		this.name = name;
	}

	public String getDataTimestamp() {
		return dataTimestamp;
	}
	@XmlElement(name="Timestamp")
	public void setDataTimestamp(String dataTimestamp) {
		this.dataTimestamp = dataTimestamp;
	}

	public double getData1() {
		return data1;
	}

	public void setData1(double data1) {
		this.data1 = data1;
	}

	public double getData2() {
		return data2;
	}
	public void setData2(double data2) {
		this.data2 = data2;
	}
	
	public double getData3() {
		return data3;
	}
	public void setData3(double data3) {
		this.data3 = data3;
	}
	
	public double getData4() {
		return data4;
	}
	public void setData4(double data4) {
		this.data4 = data4;
	}
	
	public double getData5() {
		return data5;
	}
	public void setData5(double data5) {
		this.data5 = data5;
	}

	public double getData6() {
		return data6;
	}
	public void setData6(double data6) {
		this.data6 = data6;
	}
	
	public double getData7() {
		return data7;
	}
	public void setData7(double data7) {
		this.data7 = data7;
	}
	
	public double getData8() {
		return data8;
	}
	public void setData8(double data8) {
		this.data8 = data8;
	}
	
	public double getData9() {
		return data9;
	}
	public void setData9(double data9) {
		this.data9 = data9;
	}
	
	public double getData10() {
		return data10;
	}
	public void setData10(double data10) {
		this.data10 = data10;
	}
	
	public double getData11() {
		return data11;
	}
	public void setData11(double data11) {
		this.data11 = data11;
	}
	
	public double getData12() {
		return data12;
	}
	public void setData12(double data12) {
		this.data12 = data12;
	}
	
	public double getData13() {
		return data13;
	}
	public void setData13(double data13) {
		this.data13 = data13;
	}
	public double getData14() {
		return data14;
	}
	public void setData14(double data14) {
		this.data14 = data14;
	}
	public double getData15() {
		return data15;
	}
	public void setData15(double data15) {
		this.data15 = data15;
	}
	public double getData16() {
		return data16;
	}
	public void setData16(double data16) {
		this.data16 = data16;
	}
	public double getData17() {
		return data17;
	}
	public void setData17(double data17) {
		this.data17 = data17;
	}
	public double getData18() {
		return data18;
	}
	public void setData18(double data18) {
		this.data18 = data18;
	}
	public double getData19() {
		return data19;
	}
	public void setData19(double data19) {
		this.data19 = data19;
	}

}
