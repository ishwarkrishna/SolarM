package com.macine.service.web;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.macine.service.bean.CustomerDetails;
import com.macine.service.bean.CustomerNavList;
import com.macine.service.bean.Customers;
import com.macine.service.bean.CustomersMachineDetails;
import com.macine.service.bean.CustomersMachines;
import com.macine.service.bean.CustomersNavMachines;
import com.macine.service.bean.MachineDetails;
import com.macine.service.bean.MachineNavDetails;
import com.macine.service.bean.Machines;
import com.macine.util.HibernateUtil;

@Controller
@RequestMapping("/masters/customers")
public class CustomerServices {

	@RequestMapping(method = RequestMethod.GET)
	public Customers getAllCustomers() 
	{
		return getCustomerDetailsByUser(""); //not sending user name as we need to get all customers
	}

	@RequestMapping(method = RequestMethod.GET, value="/users/{userId}")	
	public Customers getCustomerDetailsByUser(@PathVariable String userId)
	{
		return getCustomerDetails(getCustByUserQuery(userId));
	}


	@RequestMapping(method = RequestMethod.GET, value="/{custId}")	
	public Customers getCustomerDetailsById(@PathVariable String custId)
	{
		StringBuilder stringBuilder = new StringBuilder();
		stringBuilder.setLength(0);
		stringBuilder.append("select cd.CUSTOMER_ID,cd.NAME,cd.ADDRESS1,cd.ADDRESS2,cd.CITY,cd.CONTACT_NO1,cd.CONTACT_NO2,cd.LOGO from customer_details cd");
		stringBuilder.append(" where cd.CUSTOMER_ID='"+custId+"'");	
		return getCustomerDetails(stringBuilder);
	}
	
	@RequestMapping(method = RequestMethod.GET, value="/machines/users/{userId}")	
	public CustomersMachines getCustomerMachinesByUser(@PathVariable String userId)
	{
		List<CustomersMachineDetails> customerMachineDetailsList = null;
		Customers customers = getCustomerDetails(getCustByUserQuery(userId));

		MachineServices machineServices = new MachineServices();
		CustomersMachineDetails customersMachineDetails = null;
		customerMachineDetailsList = new ArrayList();
		for(CustomerDetails customerBean : customers.getCustomers()){
			long customerId=customerBean.getCustomerId();
			customersMachineDetails = new CustomersMachineDetails();
			customersMachineDetails.setCustomerDetails(customerBean);

	System.out.println("query string:"+customerId);	

			customersMachineDetails.setMachines(machineServices.getMachineByCustomer(customerId));
   			customerMachineDetailsList.add(customersMachineDetails);
	
		}
		CustomersMachines customersMachines = new CustomersMachines();
		customersMachines.setCustomerMachines(customerMachineDetailsList);
		
		return customersMachines;
		
	}
	

	@RequestMapping(method = RequestMethod.GET, value="/machines/nav/users/{userId}")	
	public CustomerNavList getMachinesNavByUser(@PathVariable String userId)
	{
		List<CustomersNavMachines> customersNavMachinesList = null;
		List<MachineNavDetails> machineNavDetailsList = null;

		CustomersNavMachines customersNavMachines = null;
		MachineNavDetails machineNavDetails = null;
		Machines machines = null;
		customersNavMachinesList = new ArrayList();

		MachineServices machineServices = new MachineServices();
		Customers customers = getCustomerDetails(getCustByUserQuery(userId));

		for(CustomerDetails customerBean : customers.getCustomers()){
			long customerId=customerBean.getCustomerId();
			customersNavMachines = new CustomersNavMachines();
			customersNavMachines.setCustomerName(customerBean.getName());

	System.out.println("query string:"+customerId);
			machines = machineServices.getMachineByCustomer(customerId);
			machineNavDetailsList = new ArrayList();			
			for(MachineDetails machineDetails : machines.getMachines() ){
				machineNavDetails = new MachineNavDetails();
				machineNavDetails.setName(machineDetails.getName());
				machineNavDetails.setMachineId(machineDetails.getImeiNo());
				machineNavDetailsList.add(machineNavDetails);
			}

			customersNavMachines.setMachines(machineNavDetailsList);

			customersNavMachinesList.add(customersNavMachines);
	
		}
		CustomerNavList customerNavList = new CustomerNavList();
		customerNavList.setCustomerNavMachines(customersNavMachinesList);
		
		return customerNavList;
	}

	
	
	public Customers getCustomerDetails(StringBuilder queryString)
	{
		List<CustomerDetails> customerList = null;
		Session session = null;
		try{			
			 session = HibernateUtil.getSession();
	System.out.println("query string:"+queryString.toString());			
			List customerDetails = session.createSQLQuery(queryString.toString()).list();
			CustomerDetails detailsBean = null;
			customerList = new ArrayList();
			for(Object object : customerDetails){
				Object data[] = (Object[]) object;
				detailsBean = new CustomerDetails();
				detailsBean.setCustomerId(Long.parseLong(data[0].toString()));
				detailsBean.setName(data[1].toString());
				detailsBean.setAddress1(data[2].toString());
				detailsBean.setAddress2(data[3].toString());
				detailsBean.setCity(data[4].toString());
				detailsBean.setContactNo1(data[5].toString());
				detailsBean.setContactNo2(data[6].toString());
				detailsBean.setLogo(data[7].toString());

				System.out.println("customer..."+data[0]+":"+data[1]+":"+data[2]+":"+data[3]+":"+data[4]+":"+data[5]);
				customerList.add(detailsBean);
			}
			
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println("Exception in getCustomerDetails..."+e.getMessage());
			e.printStackTrace();
		}
		Customers customers = new Customers();
		customers.setCustomers(customerList);
		return customers;
	}

	public StringBuilder getCustByUserQuery(String userId)
	{
		StringBuilder stringBuilder = new StringBuilder();
		stringBuilder.setLength(0);
		stringBuilder.append("select cd.CUSTOMER_ID,cd.NAME,cd.ADDRESS1,cd.ADDRESS2,cd.CITY,cd.CONTACT_NO1,cd.CONTACT_NO2,cd.LOGO from customer_details cd");
		if (userId != null && !("null".equalsIgnoreCase(userId)) && (userId.trim()).length()>0){
			stringBuilder.append(" ,user_details ud where cd.CUSTOMER_ID=ud.CUSTOMER_ID and ud.name='"+userId+"'");	
		}
		return stringBuilder;
	}


	
	public static void main(String[] args) {
		CustomerServices customerService = new CustomerServices();
		String userName=null;
		
		System.out.println("Customers By user");
		System.out.println(customerService.getCustomerDetailsByUser(userName));
		
		System.out.println("Customers By customer id");
		System.out.println(customerService.getCustomerDetailsById("1"));

		System.out.println("Customers machines By user id");
		System.out.println(customerService.getCustomerMachinesByUser(userName));

		System.out.println("Customers Nav machines By user id");
		System.out.println(customerService.getMachinesNavByUser(userName));

	}
	
}
