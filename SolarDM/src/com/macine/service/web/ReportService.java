package com.macine.service.web;

import java.util.List;

import org.hibernate.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.macine.service.bean.Report;
import com.macine.util.HibernateUtil;

@Controller
@RequestMapping("/report/machines")
public class ReportService {
	@RequestMapping(method = RequestMethod.GET, value="/{imeiNo}")
	public Report getReportData(@PathVariable String imeiNo) {
		Session session = null;
		StringBuffer dataBuffer = null;
		Report report = null;
		try {
			session = HibernateUtil.getSession();
			StringBuilder stringBuilder = new StringBuilder();
			stringBuilder.setLength(0);
			stringBuilder
					.append("SELECT hour,report_data1,report_data2,report_data3 FROM report_data where imei_no='"+imeiNo+"' order by report_id desc limit 24");
			System.out.println("query string:" + stringBuilder.toString());
			List reportDataList = session.createSQLQuery(
					stringBuilder.toString()).list();
			dataBuffer = new StringBuffer();
			dataBuffer.append("Hour,Data1,Data2,Data3\n");
			for (int i = reportDataList.size()-1; i>=0; i--) {
				Object data[] = (Object[]) reportDataList.get(i);
				dataBuffer.append(data[0]+","+data[1]+","+data[2]+","+data[3]+"\n");
			}
			report = new Report();
			report.setData(dataBuffer.toString());
			System.out.println(dataBuffer.toString());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null && session.isOpen()) {
				session.close();
			}
		}
		return report;
	}
	
	public static void main(String arg[]){
		ReportService reportService = new ReportService();
		reportService.getReportData("00000002");
	}
}
