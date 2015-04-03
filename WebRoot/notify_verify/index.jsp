<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.alipay.config.*"%>
<%@ page import="com.alipay.util.*"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="com.benson.config.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>查询timestamp接口</title>
	</head>
	<%
		
        String notify_url = BensonConfig.NotifyServer + "/notify_verify/notify_url.jsp";
	
		//把请求参数打包成数组
		Map<String, String> sParaTemp = new HashMap<String, String>();
		sParaTemp.put("service", "notify_verify");
        sParaTemp.put("partner", AlipayConfig.partner);
        //sParaTemp.put("_input_charset", AlipayConfig.input_charset);
        
        //此接口此参数无效
        sParaTemp.put("notify_url", notify_url);
        
        sParaTemp.put("notify_id", request.getParameter("notify_id"));
        
        
		//建立请求
		String sHtmlText = AlipaySubmit.buildRequest("", "", sParaTemp);
		out.println(sHtmlText);
	%>
	<body>
	</body>
</html>
