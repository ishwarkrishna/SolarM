package com.macine.bean;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="history_details_today")
public class HistoryDetailsToday {
	
	@Id
	@Column(name="HISTORY_ID")
	private long historyId;
	
	@Column(name="CURRENT_TIME_STAMP")
	private Timestamp currentTimestamp;
	
	@Column(name="DATA_TIMESTAMP")
	private Timestamp dataTimestamp;
	
	@ManyToOne
	@JoinColumn(name="IMEI_NO")
				//insertable=false, updatable=false, 
				//nullable=false)
	private MachineDetails machineDetails;
	
	@Column(name="DATA1")
	private double data1;
	
	@Column(name="DATA2")
	private double data2;
	
	@Column(name="DATA3")
	private double data3;
	
	@Column(name="DATA4")
	private double data4;
	
	@Column(name="DATA5")
	private double data5;
	
	@Column(name="DATA6")
	private double data6;
	
	@Column(name="DATA7")
	private double data7;
	
	@Column(name="DATA8")
	private double data8;
	
	@Column(name="DATA9")
	private double data9;
	
	@Column(name="DATA10")
	private double data10;
	
	@Column(name="DATA11")
	private double data11;
	
	@Column(name="DATA12")
	private double data12;
	
	@Column(name="DATA13")
	private double data13;
	
	@Column(name="DATA14")
	private double data14;
	
	@Column(name="DATA15")
	private double data15;
	
	@Column(name="DATA16")
	private double data16;
	
	@Column(name="DATA17")
	private double data17;
	
	@Column(name="DATA18")
	private double data18;
	
	@Column(name="DATA19")
	private double data19;
	
	@Column(name="DATA20")
	private double data20;
	
	@Column(name="DATA21")
	private double data21;
	
	@Column(name="DATA22")
	private double data22;
	
	@Column(name="DATA23")
	private double data23;
	
	@Column(name="DATA24")
	private double data24;
	
	@Column(name="DATA25")
	private double data25;
	
	@Column(name="DATA26")
	private double data26;
	
	@Column(name="DATA27")
	private double data27;
	
	@Column(name="DATA28")
	private double data28;
	
	@Column(name="DATA29")
	private double data29;
	
	@Column(name="DATA30")
	private double data30;
	
	@Column(name="DATA31")
	private double data31;
	
	@Column(name="DATA32")
	private double data32;
	
	@Column(name="DATA33")
	private double data33;
	
	@Column(name="DATA34")
	private double data34;
	
	@Column(name="DATA35")
	private double data35;
	
	@Column(name="DATA36")
	private double data36;
	
	@Column(name="DATA37")
	private double data37;
	
	@Column(name="DATA38")
	private double data38;
	
	@Column(name="DATA39")
	private double data39;
	
	@Column(name="DATA40")
	private double data40;
	
	public long getHistoryId() {
		return historyId;
	}

	public void setHistoryId(long historyId) {
		this.historyId = historyId;
	}

	public Timestamp getCurrentTimestamp() {
		return currentTimestamp;
	}

	public void setCurrentTimestamp(Timestamp currentTimestamp) {
		this.currentTimestamp = currentTimestamp;
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

	public double getData20() {
		return data20;
	}

	public void setData20(double data20) {
		this.data20 = data20;
	}

	public double getData21() {
		return data21;
	}

	public void setData21(double data21) {
		this.data21 = data21;
	}

	public double getData22() {
		return data22;
	}

	public void setData22(double data22) {
		this.data22 = data22;
	}

	public double getData23() {
		return data23;
	}

	public void setData23(double data23) {
		this.data23 = data23;
	}

	public double getData24() {
		return data24;
	}

	public void setData24(double data24) {
		this.data24 = data24;
	}

	public double getData25() {
		return data25;
	}

	public void setData25(double data25) {
		this.data25 = data25;
	}

	public double getData26() {
		return data26;
	}

	public void setData26(double data26) {
		this.data26 = data26;
	}

	public double getData27() {
		return data27;
	}

	public void setData27(double data27) {
		this.data27 = data27;
	}

	public double getData28() {
		return data28;
	}

	public void setData28(double data28) {
		this.data28 = data28;
	}

	public double getData29() {
		return data29;
	}

	public void setData29(double data29) {
		this.data29 = data29;
	}

	public double getData30() {
		return data30;
	}

	public void setData30(double data30) {
		this.data30 = data30;
	}

	public double getData31() {
		return data31;
	}

	public void setData31(double data31) {
		this.data31 = data31;
	}

	public double getData32() {
		return data32;
	}

	public void setData32(double data32) {
		this.data32 = data32;
	}

	public double getData33() {
		return data33;
	}

	public void setData33(double data33) {
		this.data33 = data33;
	}

	public double getData34() {
		return data34;
	}

	public void setData34(double data34) {
		this.data34 = data34;
	}

	public double getData35() {
		return data35;
	}

	public void setData35(double data35) {
		this.data35 = data35;
	}

	public double getData36() {
		return data36;
	}

	public void setData36(double data36) {
		this.data36 = data36;
	}

	public double getData37() {
		return data37;
	}

	public void setData37(double data37) {
		this.data37 = data37;
	}

	public double getData38() {
		return data38;
	}

	public void setData38(double data38) {
		this.data38 = data38;
	}

	public double getData39() {
		return data39;
	}

	public void setData39(double data39) {
		this.data39 = data39;
	}

	public double getData40() {
		return data40;
	}

	public void setData40(double data40) {
		this.data40 = data40;
	}

	@Override
	public String toString() {
		return "HistoryDetails [historyId=" + historyId + ", currentTimestamp="
				+ currentTimestamp + ", dataTimestamp=" + dataTimestamp
				+ ", machineDetails=" + machineDetails + ", data1=" + data1
				+ ", data2=" + data2 + ", data3=" + data3 + ", data4=" + data4
				+ ", data5=" + data5 + ", data6=" + data6 + ", data7=" + data7
				+ ", data8=" + data8 + ", data9=" + data9 + ", data10="
				+ data10 + ", data11=" + data11 + ", data12=" + data12
				+ ", data13=" + data13 + ", data14=" + data14 + ", data15="
				+ data15 + ", data16=" + data16 + ", data17=" + data17
				+ ", data18=" + data18 + ", data19=" + data19 + ", data20="
				+ data20 + ", data21=" + data21 + ", data22=" + data22
				+ ", data23=" + data23 + ", data24=" + data24 + ", data25="
				+ data25 + ", data26=" + data26 + ", data27=" + data27
				+ ", data28=" + data28 + ", data29=" + data29 + ", data30="
				+ data30 + ", data31=" + data31 + ", data32=" + data32
				+ ", data33=" + data33 + ", data34=" + data34 + ", data35="
				+ data35 + ", data36=" + data36 + ", data37=" + data37
				+ ", data38=" + data38 + ", data39=" + data39 + ", data40="
				+ data40 + "]";
	}
}
