<%
	/* *
	 *功能：支付宝批量付款到支付宝账户有密接口调试入口页面
	 *版本：3.3
	 *日期：2012-08-17
	 *说明：
	 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
	 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.alipay.config.*"%>
<%@ page import="com.alipay.util.*"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
	<title>支付宝批量付款到支付宝账户有密接口</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/alipay.css" />
<style>

</style>
</head>
<body text=#000000 bgColor="#ffffff" leftMargin=0 topMargin=4>
	<div id="main">
		<div id="head">
            <dl class="alipay_link">
                <a target="_blank" href="http://www.alipay.com/"><span>支付宝首页</span></a>|
                <a target="_blank" href="https://b.alipay.com/home.htm"><span>商家服务</span></a>|
                <a target="_blank" href="http://help.alipay.com/support/index_sh.htm"><span>帮助中心</span></a>
            </dl>
            <span class="title">支付宝批量付款到支付宝账户有密接口快速通道</span>
		</div>
        <div class="cashier-nav">
            <ol>
				<li class="current">1、确认信息 →</li>
				<li>2、点击确认 →</li>
				<li class="last">3、确认完成</li>
            </ol>
        </div>
        <form name=alipayment action=alipayapi.jsp method=post target="_blank">
            <div id="body" style="clear:left">
                <dl class="content">
					<dt>付款账号：</dt>
					<dd>
						<span class="null-star">*</span>
						<input size="30" name="WIDemail" value="youkufencheng@126.com" />
						<span>必填</span>
					</dd>
					<dt>付款账户名：</dt>
					<dd>
						<span class="null-star">*</span>
						<input size="30" name="WIDaccount_name" value="合一信息技术（北京）有限公司" />
						<span>必填，个人支付宝账号是真实姓名公司支付宝账号是公司名称</span>
					</dd>
					<dt>付款当天日期：</dt>
					<dd>
						<span class="null-star">*</span>
						<input size="30" name="WIDpay_date" value="<%=UtilDate.getDate()%>" />
						<span>必填，格式：年[4位]月[2位]日[2位]，如：20100801</span>
					</dd>
					<dt>批次号：</dt>
					<dd>
						<span class="null-star">*</span>
						<input size="30" name="WIDbatch_no" value="<%=UtilDate.getOrderNum()%>" />
						<span>必填，格式：当天日期[8位]+序列号[3至16位]，如：201008010000001</span>
					</dd>
					<dt>付款总金额：</dt>
					<dd>
						<span class="null-star">*</span>
						<input size="30" name="WIDbatch_fee" />
						<span>必填，即参数detail_data的值中所有金额的总和</span>
					</dd>
					<dt>付款笔数：</dt>
					<dd>
						<span class="null-star">*</span>
						<input size="30" name="WIDbatch_num" />
						<span>必填，即参数detail_data的值中，“|”字符出现的数量加1，最大支持1000笔（即“|”字符出现的数量999个）</span>
					</dd>
					<dt>付款详细数据：</dt>
					<dd>
						<span class="null-star">*</span>
						<input size="30" name="WIDdetail_data" />
						<span>必填，格式：流水号1^收款方帐号1^真实姓名^付款金额1^备注说明1|流水号2^收款方帐号2^真实姓名^付款金额2^备注说明2....</span>
					</dd>
                    <dt></dt>
                    <dd>
                        <span class="new-btn-login-sp">
                            <button class="new-btn-login" type="submit" style="text-align:center;">确 认</button>
                        </span>
                    </dd>
                </dl>
            </div>
		</form>
        <div id="foot">
			<ul class="foot-ul">
				<li><font class="note-help">如果您点击“确认”按钮，即表示您同意该次的执行操作。 </font></li>
				<li>
					支付宝版权所有 2011-2015 ALIPAY.COM 
				</li>
			</ul>
		</div>
	</div>
</body>
</html>