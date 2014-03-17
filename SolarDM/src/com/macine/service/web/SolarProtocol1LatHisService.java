package com.macine.service.web;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.macine.service.bean.SolarProtocol1LatHisList;
import com.macine.service.bean.SolarProtocol1LatestHistory;
import com.macine.util.HibernateUtil;

@Controller
@RequestMapping("/history/machines")
public class SolarProtocol1LatHisService {

	@RequestMapping(method = RequestMethod.GET, value = "/{machineId}/last/{noRecord}")
	public SolarProtocol1LatHisList getLatHisByMachineId(
			@PathVariable String machineId, @PathVariable int noRecord) {
		SolarProtocol1LatHisList solarProtocol1LatHisList = new SolarProtocol1LatHisList();
		solarProtocol1LatHisList.setSolarProtocol1LatestHistory(getLatHisData(
				machineId, noRecord));
		return solarProtocol1LatHisList;
	}

	public List<SolarProtocol1LatestHistory> getLatHisData(String imeiNo,
			int noRecord) {
		List<SolarProtocol1LatestHistory> solarProtocol1LatestHistoryList = null;
		Session session = null;
		try {
			session = HibernateUtil.getSession();
			StringBuilder stringBuilder = new StringBuilder();
			stringBuilder.setLength(0);
			stringBuilder
					.append("select HISTORY_ID, hd.IMEI_NO, md.name, DATA_TIMESTAMP, DATA1, DATA2, DATA3, DATA4, DATA5, DATA6, DATA7, DATA8, DATA9, DATA10, DATA11, DATA12, DATA13, DATA14, DATA15, DATA16, DATA17, DATA18, DATA19, hd.CURRENT_TIME_STAMP from history_details hd"
							+ " inner join machine_details md on hd.imei_no=md.imei_no "
							+ "where hd.imei_no="
							+ imeiNo
							+ " order by hd.data_timestamp desc limit "
							+ noRecord);
			// System.out.println("query........."+stringBuilder.toString());
			List liveDatas = session.createSQLQuery(stringBuilder.toString())
					.list();
			SolarProtocol1LatestHistory solarProtocol1LatestHistory = null;
			solarProtocol1LatestHistoryList = new ArrayList();
			for (Object object : liveDatas) {
				Object data[] = (Object[]) object;
				solarProtocol1LatestHistory = new SolarProtocol1LatestHistory();
				solarProtocol1LatestHistory.setHistoryId(Long.parseLong(data[0]
						.toString()));
				solarProtocol1LatestHistory.setImeiNo(data[1].toString());
				solarProtocol1LatestHistory.setName(data[2].toString());
				solarProtocol1LatestHistory
						.setDataTimestamp(data[3].toString());
				solarProtocol1LatestHistory.setData1(Double.parseDouble(data[4]
						.toString()));
				solarProtocol1LatestHistory.setData2(Double.parseDouble(data[5]
						.toString()));
				solarProtocol1LatestHistory.setData3(Double.parseDouble(data[6]
						.toString()));
				solarProtocol1LatestHistory.setData4(Double.parseDouble(data[7]
						.toString()));
				solarProtocol1LatestHistory.setData5(Double.parseDouble(data[8]
						.toString()));
				solarProtocol1LatestHistory.setData6(Double.parseDouble(data[9]
						.toString()));
				solarProtocol1LatestHistory.setData7(Double
						.parseDouble(data[10].toString()));
				solarProtocol1LatestHistory.setData8(Double
						.parseDouble(data[11].toString()));
				solarProtocol1LatestHistory.setData9(Double
						.parseDouble(data[12].toString()));
				solarProtocol1LatestHistory.setData10(Double
						.parseDouble(data[13].toString()));
				solarProtocol1LatestHistory.setData11(Double
						.parseDouble(data[14].toString()));
				solarProtocol1LatestHistory.setData12(Double
						.parseDouble(data[15].toString()));
				solarProtocol1LatestHistory.setData13(Double
						.parseDouble(data[16].toString()));

				System.out.println("Values...." + data[0] + " :" + data[1]
						+ " : " + data[2] + " : " + data[3] + " : " + data[4]
						+ "...");
				solarProtocol1LatestHistoryList
						.add(solarProtocol1LatestHistory);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Exception in solarProtocol1LatestHistory "
					+ e.getMessage());
		}

		return solarProtocol1LatestHistoryList;
	}

	public static void main(String[] args) {
		SolarProtocol1LatHisService dataService = new SolarProtocol1LatHisService();
		System.out.println(dataService.getLatHisByMachineId("00000001", 10));
	}
}
