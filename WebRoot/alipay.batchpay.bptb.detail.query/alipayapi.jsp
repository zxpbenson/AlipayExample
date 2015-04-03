<%
/* *
 *功能：批量付款到银行账户-明细查询接口接入页
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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>支付宝批量付款到银行账户-明细查询接口</title>
	</head>
	<%
		////////////////////////////////////请求参数//////////////////////////////////////

		//要查询的文件名
		String file_name = new String(request.getParameter("WIDfile_name").getBytes("ISO-8859-1"),"UTF-8");
		//必填，含扩展名，如：20120711.csv
		//商户流水号
		String serial_no = new String(request.getParameter("WIDserial_no").getBytes("ISO-8859-1"),"UTF-8");
		//如果该值存在，则status、bank_account_no 两个查询条件无效
		//代发明细状态
		String status = new String(request.getParameter("WIDstatus").getBytes("ISO-8859-1"),"UTF-8");
		//取值参见接口技术文档
		//收款人银行账号
		String bank_account_no = new String(request.getParameter("WIDbank_account_no").getBytes("ISO-8859-1"),"UTF-8");
		//商户上传代发文件中的收款人银行账号
		
		
		//////////////////////////////////////////////////////////////////////////////////
		
		//把请求参数打包成数组
		Map<String, String> sParaTemp = new HashMap<String, String>();
		sParaTemp.put("service", "alipay.batchpay.bptb.detail.query");
        sParaTemp.put("partner", AlipayConfig.partner);
        sParaTemp.put("_input_charset", AlipayConfig.input_charset);
		sParaTemp.put("file_name", file_name);
		sParaTemp.put("serial_no", serial_no);
		sParaTemp.put("status", status);
		sParaTemp.put("bank_account_no", bank_account_no);
		
		//建立请求
		String sHtmlText = AlipaySubmit.buildRequest("", "", sParaTemp);
		out.println(sHtmlText);
	%>
	<body>
	</body>
</html>
