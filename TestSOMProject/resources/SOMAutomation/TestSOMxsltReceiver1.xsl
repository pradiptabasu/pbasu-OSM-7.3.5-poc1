<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns="http://www.metasolv.com/OMS/OrderDataUpdate" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:java="http://xml.apache.org/xslt/java" xmlns:xalan="http://xml.apache.org/xslt"
	xmlns:oms="urn:com:metasolv:oms:xmlapi:1"
	xmlns:automator="java:oracle.communications.ordermanagement.automation.plugin.ScriptReceiverContextInvocation"
	xmlns:context="java:com.mslv.oms.automation.TaskContext" xmlns:log="java:org.apache.commons.logging.Log"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
	xmlns:provordResp="http://xmlns.oracle.com/EnterpriseObjects/Core/provord/ProvisioningOrder/V1/resp"
	xmlns:provord="http://xmlns.oracle.com/EnterpriseObjects/Core/provord/ProvisioningOrder/V1"
	xmlns:ord="http://xmlns.oracle.com/communications/ordermanagement"
	xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd"
	xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd"
	xmlns:fn="http://www.w3.org/2005/02/xpath-functions"
	exclude-result-prefixes="xsl java xalan oms xsi">

	<!-- * -->
	<xsl:param name="automator" />
	<xsl:param name="log" />
	<xsl:param name="context" />
	<!-- * -->

	<xsl:variable name="orderXML" select="java:getOrderAsDOM($automator)/oms:GetOrder.Response" />
	<xsl:variable name="responseMessage" select="." />
	<xsl:variable name="requestMessage" select="$responseMessage/provordResp:ResponseMessage/provordResp:RequestXML" />

	<xsl:output method="xml" indent="yes" omit-xml-declaration="no" xalan:indent-amount="5" />

	<xsl:template match="/">
		<xsl:apply-templates />
	</xsl:template>

	<!-- Match the status SUCCESS from external system -->
	<xsl:template
		match="/provordResp:ResponseMessage[provordResp:ResponseXML/provordResp:status/text() = 'SUCCESS']">
		<xsl:variable name="generallog"	select="java:info($log, concat('Hello ','is it me you are looking for'))" />
		<xsl:variable name="automator" select="java:setUpdateOrder($automator, true())" />
		<xsl:variable name="context" select="java:completeTaskOnExit($context, 'success')" />
		<OrderDataUpdate
			xmlns="http://www.metasolv.com/OMS/OrderDataUpdate/2002/10/25">
			<xsl:choose>
				<xsl:when test="$orderXML/oms:_root/oms:STATUS">
					<Update path="/STATUS"><xsl:value-of select="$responseMessage/provordResp:ResponseMessage/provordResp:ResponseXML/provordResp:status" /></Update>
					<Update path="/XMLSentOutsideJMSCorrID"><xsl:copy-of select="$requestMessage" /></Update>
					<Update path="/XMLSentReceivedJMSCorrID"><xsl:copy-of select="$responseMessage" /></Update>
				</xsl:when>
				<xsl:otherwise>
					<Add path="/">
						<STATUS><xsl:value-of select="$responseMessage/provordResp:ResponseMessage/provordResp:ResponseXML/provordResp:status" /></STATUS>
						<XMLSentOutsideJMSCorrID><xsl:copy-of select="$requestMessage" /></XMLSentOutsideJMSCorrID>
						<XMLSentReceivedJMSCorrID><xsl:copy-of select="$responseMessage" /></XMLSentReceivedJMSCorrID>
					</Add>
				</xsl:otherwise>
			</xsl:choose>
			<Update path="/TaskName">UpdatedByTestSOMAutomationSenderReceiverJMSCorrIDTask1</Update>
			<Update path="/TestData1"><xsl:value-of	select="$responseMessage/provordResp:ResponseMessage/provordResp:ResponseXML/provordResp:data1" /></Update>
			<Update path="/TestData2"><xsl:value-of	select="$responseMessage/provordResp:ResponseMessage/provordResp:ResponseXML/provordResp:data2" /></Update>
			<Update path="/GetOrderData"><xsl:copy-of select="$orderXML" /></Update>
		</OrderDataUpdate>
	</xsl:template>

	<!-- Match the status FAILURE from external system -->
	<xsl:template
		match="/provordResp:ResponseMessage[provordResp:ResponseXML/provordResp:status/text() = 'FAILURE']">
		<xsl:variable name="generallog"	select="java:info($log, concat('Hello ','is it me you are looking for'))" />
		<xsl:variable name="automator" select="java:setUpdateOrder($automator, true())" />
		<xsl:variable name="context" select="java:completeTaskOnExit($context, 'failure')" />
		<OrderDataUpdate
			xmlns="http://www.metasolv.com/OMS/OrderDataUpdate/2002/10/25">
			<xsl:choose>
				<xsl:when test="$orderXML/oms:_root/oms:STATUS">
					<Update path="/STATUS"><xsl:value-of select="$responseMessage/provordResp:ResponseMessage/provordResp:ResponseXML/provordResp:status" /></Update>
					<Update path="/XMLSentOutsideJMSCorrID"><xsl:copy-of select="$requestMessage" /></Update>
					<Update path="/XMLSentReceivedJMSCorrID"><xsl:copy-of select="$responseMessage" /></Update>
				</xsl:when>
				<xsl:otherwise>
					<Add path="/">
						<STATUS><xsl:value-of select="$responseMessage/provordResp:ResponseMessage/provordResp:ResponseXML/provordResp:status" /></STATUS>
						<XMLSentOutsideJMSCorrID><xsl:copy-of select="$requestMessage" /></XMLSentOutsideJMSCorrID>
						<XMLSentReceivedJMSCorrID><xsl:copy-of select="$responseMessage" /></XMLSentReceivedJMSCorrID>
					</Add>
				</xsl:otherwise>
			</xsl:choose>
			<Update path="/TaskName">UpdatedByTestSOMAutomationSenderReceiverJMSCorrIDTask1</Update>
			<Update path="/TestData1"><xsl:value-of	select="$responseMessage/provordResp:ResponseMessage/provordResp:ResponseXML/provordResp:data1" /></Update>
			<Update path="/TestData2"><xsl:value-of	select="$responseMessage/provordResp:ResponseMessage/provordResp:ResponseXML/provordResp:data2" /></Update>
			<Update path="/GetOrderData"><xsl:copy-of select="$orderXML" /></Update>
		</OrderDataUpdate>
	</xsl:template>

	<!-- * -->
	<xsl:template match="* | @* | text()">
		<!-- do nothing -->
		<xsl:apply-templates />
	</xsl:template>
</xsl:stylesheet>