<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns="http://www.metasolv.com/OMS/OrderDataUpdate" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:java="http://xml.apache.org/xslt/java" xmlns:xalan="http://xml.apache.org/xslt"
	xmlns:oms="urn:com:metasolv:oms:xmlapi:1"
	xmlns:correlator="java:com.mslv.oms.automation.Correlator"
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
	<xsl:param name="context" />
	<!-- * -->

	<xsl:output method="xml" indent="yes" omit-xml-declaration="no" xalan:indent-amount="5" />

	<xsl:template match="/">
		
		<xsl:variable name="generallog"	select="java:info($log, concat('Hello ','is it me you are looking for'))" />
		
		<xsl:variable name="orderXML" select="/oms:GetOrder.Response" />
		<xsl:variable name="selfOrderID" select="$orderXML/oms:OrderID/text()" />
		
		<!-- <xsl:variable name="correlator" select="automator:getCorrelator($automator, $context)"/> -->
		<xsl:variable name="correlatorVar" select="java:getCorrelator($automator, $context)"/>
		
		<xsl:variable name="injectCorrelation" select="correlator:add($correlatorVar,$selfOrderID)"/>

		<!-- <xsl:variable name="context" select="java:completeTaskOnExit($context, 'success')" /> -->
	
	</xsl:template>

</xsl:stylesheet>