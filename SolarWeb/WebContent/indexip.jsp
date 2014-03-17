<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<%
System.out.println("calling all machine data");
	String serverIpAndPort = "180.179.36.118:8080";
	String userId = "gokul";
	//MachineDetailServices machineDetailServices = new MachineDetailServices();
	//machineDetailServices.getAllMachines();
    //userLocId = request.getSession().getAttribute("userLocId").toString();
	//int customerId = Integer.parseInt(request.getSession().getAttribute("cusId").toString());
	//int locationId = Integer.parseInt(request.getSession().getAttribute("locationId").toString());
	
%>
<body>
	<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
	codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0"
	width="100%" height="100%" id="URLvariables" align="middle">
	<param name="allowScriptAccess" value="sameDomain" />
	<param name="movie" value='SolarHome.swf'/>
	<param name="quality" value="high" />
	<param name="bgcolor" value="#ffffff" />
	<param name="allowScriptAccess" value="sameDomain" />
	<param name="wmode" value="opaque"/>
	<param name="FlashVars" value="serverIpAndPort=<%=serverIpAndPort%>&userId=<%=userId%>"/>
	<embed src='SolarHome.swf' wmode="opaque"
		flashVars="serverIpAndPort=<%=serverIpAndPort%>&userId=<%=userId%>"
		quality="high" bgcolor="#ffffff" width="100%" height="700"
		name="BrakeShoeCount" align="middle"
		type="application/x-shockwave-flash"
		pluginspage="http://www.macromedia.com/go/getflashplayer">
	</embed> </object>
</body>
</html>
