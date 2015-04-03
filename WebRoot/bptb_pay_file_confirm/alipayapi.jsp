<%
/* *
 *功能：批量付款到银行账户-上传付款文件有密接口接入页
 *版本：3.3
 *日期：2012-08-14
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。

 *************************注意*****************
 *如果您在接口集成过程中遇到问题，可以按照下面的途径来解决
 *1、商户服务中心（https://b.alipay.com/support/helperApply.htm?action=consultationApply），提交申请集成协助，我们会有专业的技术工程师主动联系您协助解决
 *2、商户帮助中心（http://help.alipay.com/support/232511-16307/0-16307.htm?sh=Y&info_type=9）
 *3、支付宝论坛（http://club.alipay.com/read-htm-tid-8681712.html）
 *如果不想使用扩展功能请把扩展功能参数赋空值。
 **********************************************
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.alipay.config.*"%>
<%@ page import="com.alipay.util.*"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="com.benson.config.*"%>
<%@ page import="com.benson.logger.*"%>
<%@ page import="com.benson.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>支付宝批量付款到银行账户-上传付款文件有密接口</title>
	</head>
	<%
		////////////////////////////////////请求参数//////////////////////////////////////

		
		//上传付款文件
		String bptb_pay_file = new String(request.getParameter("WIDbptb_pay_file").getBytes("ISO-8859-1"),"UTF-8");
		//必须是绝对路径，文件名不允许重复

		//文件摘要算法,MD5或SHA
		String file_digest_type = "MD5";
		
		//文件摘要
		String digest_bptb_pay_file = AlipayCore.getAbstract(bptb_pay_file,file_digest_type);
		
		//////////////////////////////////////////////////////////////////////////////////
		
		//把请求参数打包成数组
		Map<String, String> sParaTemp = new HashMap<String, String>();
		sParaTemp.put("service", "bptb_pay_file_confirm");
        sParaTemp.put("partner", AlipayConfig.partner);
        sParaTemp.put("_input_charset", AlipayConfig.input_charset);
		sParaTemp.put("file_digest_type", file_digest_type);
		sParaTemp.put("digest_bptb_pay_file", digest_bptb_pay_file);
		
		String notify_url = BensonConfig.NotifyServer + "/batch_trans_notify_no_pwd/notify_url.jsp";
		sParaTemp.put("notify_url", notify_url);
		
		sParaTemp.put("bussiness_type", "T0");//T0或T1，大小写不限，不填则默认为T1。T0：当天到账 T1：隔天到账
		
		//建立请求
		String sHtmlText = AlipaySubmit.buildRequest("bptb_pay_file", bptb_pay_file, sParaTemp);
		out.println(sHtmlText);
	%>
	<body>
	</body>
</html>
