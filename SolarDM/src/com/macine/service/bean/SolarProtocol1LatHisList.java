package com.macine.service.bean;

import java.util.Collection;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="SolarProtocol1LatHisList")
public class SolarProtocol1LatHisList { 

	private Collection<SolarProtocol1LatestHistory> solarProtocol1LatestHistory;

	public Collection<SolarProtocol1LatestHistory> getSolarProtocol1LatestHistory() {
		return solarProtocol1LatestHistory;
	}

	@XmlElement(name="SolarProtocol1LatestHistory")
	public void setSolarProtocol1LatestHistory(
			Collection<SolarProtocol1LatestHistory> solarProtocol1LatestHistory) {
		this.solarProtocol1LatestHistory = solarProtocol1LatestHistory;
	}
}
