package com.macine.service.web;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.macine.service.bean.LiveParamData;
import com.macine.service.bean.MachineDetails;
import com.macine.service.bean.Machines;
import com.macine.service.bean.SolarProtocol1LatestView;

import com.macine.util.HibernateUtil;

import com.macine.service.bean.LiveMachineData;
import com.macine.service.bean.LiveParamData;

@Controller
@RequestMapping("/live/machines")
public class LiveDataService {

	@RequestMapping(method = RequestMethod.GET, value="/{machineId}")
	public LiveMachineData getLiveByMachineId(@PathVariable String machineId) 
	{
		LiveMachineData liveMachineData = new LiveMachineData();
		liveMachineData.setParamData(getLatestDataDetails(machineId));
		return liveMachineData;
	}

	@RequestMapping(method = RequestMethod.GET, value="/row/{machineId}")
	public SolarProtocol1LatestView getLatestRowData(String machineId){
		SolarProtocol1LatestView solarProtocol1LatestView = null;
		Session session = null;
		try{			
			session = HibernateUtil.getSession();
			StringBuilder stringBuilder = new StringBuilder();
			stringBuilder.setLength(0);
			stringBuilder.append("select ldv.IMEI_NO, ldv.name, DATA1, DATA2, DATA3, DATA4, DATA5, DATA6, DATA7, DATA8, DATA9, DATA10, DATA11, DATA12, DATA13 from latest_data_view ldv"
					+ " where ldv.imei_no="+machineId);
			//System.out.println("query........."+stringBuilder.toString());
			List liveDatas = session.createSQLQuery(stringBuilder.toString()).list();
			for(Object object : liveDatas){
				Object data[] = (Object[]) object;
				solarProtocol1LatestView = new SolarProtocol1LatestView();
				solarProtocol1LatestView.setImeiNo(data[0].toString());
				solarProtocol1LatestView.setName(data[1].toString());
				solarProtocol1LatestView.setData1(Double.parseDouble(data[2].toString()));
				solarProtocol1LatestView.setData2(Double.parseDouble(data[3].toString()));
				solarProtocol1LatestView.setData3(Double.parseDouble(data[4].toString()));
				solarProtocol1LatestView.setData4(Double.parseDouble(data[5].toString()));
				solarProtocol1LatestView.setData5(Double.parseDouble(data[6].toString()));
				solarProtocol1LatestView.setData6(Double.parseDouble(data[7].toString()));
				solarProtocol1LatestView.setData7(Double.parseDouble(data[8].toString()));
				solarProtocol1LatestView.setData8(Double.parseDouble(data[9].toString()));
				solarProtocol1LatestView.setData9(Double.parseDouble(data[10].toString()));
				solarProtocol1LatestView.setData10(Double.parseDouble(data[11].toString()));
				solarProtocol1LatestView.setData11(Double.parseDouble(data[12].toString()));
				solarProtocol1LatestView.setData12(Double.parseDouble(data[13].toString()));
				solarProtocol1LatestView.setData13(Double.parseDouble(data[14].toString()));

				System.out.println("Values...."+data[0] +" :"+data[1] +" : "+data[2]);
			}
		}catch (Exception e) {
			// TODO: handle exception
		//	System.out.println("Exception in solarProtocol1LatestView "+e.getMessage());
		}
		
		return solarProtocol1LatestView;
	}

	
	public List<LiveParamData> getLatestDataDetails(String imeiNo){
		List<LiveParamData> latestDataList = null;
		Session session = null;
		try{			
			session = HibernateUtil.getSession();
			StringBuilder stringBuilder = new StringBuilder();
			stringBuilder.setLength(0);
			stringBuilder.append("select d.display_name,l.data_timestamp,l.value from latest_data l"
								+ " inner join data_details d on d.data_id = l.data_id " 
								+ "where l.imei_no="+imeiNo);
			//System.out.println("query........."+stringBuilder.toString());
			List liveDatas = session.createSQLQuery(stringBuilder.toString()).list();
			LiveParamData dataDetailsBean = null;
			latestDataList = new ArrayList();
			for(Object object : liveDatas){
				Object data[] = (Object[]) object;
				dataDetailsBean = new LiveParamData();
				dataDetailsBean.setDisplayName(data[0].toString());
				dataDetailsBean.setDataTimestamp(data[1].toString());
				dataDetailsBean.setValue(data[2].toString());
				System.out.println("Values...."+data[0] +" :"+data[1] +" : "+data[2]);
				latestDataList.add(dataDetailsBean);
			}
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println("Exception in getLatestDataDetails "+e.getMessage());
		}
		
		return latestDataList;
	}


	
	public static void main(String[] args) {
		LiveDataService dataService = new LiveDataService();
		//System.out.println(dataService.getLiveByMachineId("00000001"));
		System.out.println(dataService.getLatestRowData("00000001"));
	}
}
