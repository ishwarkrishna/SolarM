package com.macine.service.web;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.macine.service.bean.MachineDetails;
import com.macine.service.bean.Machines;
import com.macine.util.HibernateUtil;

@Controller
@RequestMapping("/masters/machines")
public class MachineServices {

	@RequestMapping(method = RequestMethod.GET)
	public Machines getAllMachines() 
	{
		Machines machines = null;
		machines = getMachineByCustomer(1);
	
		return machines;
	}

	@RequestMapping(method = RequestMethod.GET, value="/{id}")
	public MachineDetails getMachineById(@PathVariable String id) 
	{
		MachineDetails detailsBean = null;
		Session session = null;
		try{			
			 session = HibernateUtil.getSession();
			StringBuilder stringBuilder = new StringBuilder();
			stringBuilder.setLength(0);
			stringBuilder.append("select m.imei_no,m.name,m.area,m.city,m.state,m.sim_no from machine_details m"
                                 +" where m.imei_no='"+id+"'");
System.out.println("query string:"+stringBuilder.toString());			
			List machineDetails = session.createSQLQuery(stringBuilder.toString()).list();
			for(Object object : machineDetails){
				Object data[] = (Object[]) object;
				detailsBean = new MachineDetails();
				detailsBean.setImeiNo(data[0].toString());
				detailsBean.setName(data[1].toString());
				detailsBean.setArea(data[2].toString());
				detailsBean.setCity(data[3].toString());
				detailsBean.setState(data[4].toString());
				detailsBean.setSimNo(data[5].toString());
				System.out.println("machine..."+data[0]+":"+data[1]+":"+data[2]+":"+data[3]+":"+data[4]+":"+data[5]);
			}
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println("Exception in getMachineDetails.."+e.getMessage());
			e.printStackTrace();
		}
		return detailsBean;
	}
	
	public Machines getMachineByCustomer(long cusId){
System.out.println("Inside get machineDetails");		
		List<MachineDetails> machineList = null;
		Session session = null;
		try{			
			 session = HibernateUtil.getSession();
			StringBuilder stringBuilder = new StringBuilder();
			stringBuilder.setLength(0);
			stringBuilder.append("select m.imei_no,m.name,m.area,m.city,m.state,m.sim_no from machine_details m"
                                 +" where m.customer_id='"+cusId+"'");
System.out.println("query string:"+stringBuilder.toString());			
			List machineDetails = session.createSQLQuery(stringBuilder.toString()).list();
			MachineDetails detailsBean = null;
			machineList = new ArrayList();
			for(Object object : machineDetails){
				Object data[] = (Object[]) object;
				detailsBean = new MachineDetails();
				detailsBean.setImeiNo(data[0].toString());
				detailsBean.setName(data[1].toString());
				detailsBean.setArea(data[2].toString());
				detailsBean.setCity(data[3].toString());
				detailsBean.setState(data[4].toString());
				detailsBean.setSimNo(data[5].toString());
				System.out.println("machine..."+data[0]+":"+data[1]+":"+data[2]+":"+data[3]+":"+data[4]+":"+data[5]);
				machineList.add(detailsBean);
			}
			
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println("Exception in getMachineDetails.."+e.getMessage());
			e.printStackTrace();
		}
		Machines machines = new Machines();
		machines.setMachines(machineList);
		return machines;
	}
	
	public static void main(String[] args) {
		MachineServices machineService = new MachineServices();
		System.out.println(machineService.getMachineByCustomer(1));
	}
	
}
