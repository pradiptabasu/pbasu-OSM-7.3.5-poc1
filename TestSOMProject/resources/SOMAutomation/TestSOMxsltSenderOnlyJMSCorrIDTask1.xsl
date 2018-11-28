<?xml version="1.0" encoding="UTF-8"?>
<!-- xmlns:log="java:org.apache.commons.logging.Log"
	 -->
<xsl:stylesheet version="2.0"
	xmlns="http://www.metasolv.com/OMS/OrderDataUpdate" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:java="http://xml.apache.org/xslt/java" 
	xmlns:xalan="http://xml.apache.org/xslt"
	xmlns:oms="urn:com:metasolv:oms:xmlapi:1"
	xmlns:automator="java:oracle.communications.ordermanagement.automation.plugin.ScriptSenderContextInvocation"
	xmlns:context="java:com.mslv.oms.automation.TaskContext" 
	xmlns:log="java:org.apache.commons.logging.Log"
	xmlns:outboundMessage="java:javax.jms.TextMessage" 
	xmlns:provord="http://xmlns.oracle.com/EnterpriseObjects/Core/provord/ProvisioningOrder/V1"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:fn="http://www.w3.org/2005/02/xpath-functions"
	xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
	xmlns:ord="http://xmlns.oracle.com/communications/ordermanagement"
	exclude-result-prefixes="xsl java xalan oms xsi">

	<!-- * -->
	<xsl:param name="automator" />
	<xsl:param name="log" />
	<xsl:param name="context" />
	<xsl:param name="outboundMessage" />
	<!-- * -->

	<xsl:output method="xml" indent="yes" omit-xml-declaration="no" xalan:indent-amount="5" />
	
	<xsl:template match="/">
		<xsl:variable name="generallog" select="java:info($log, concat('Hello ','is it me you are looking for'))" />
		
		<xsl:variable name="orderXML" select="/oms:GetOrder.Response" />
		<xsl:variable name="selfOrderID" select="$orderXML/oms:OrderID/text()" />
		
		<xsl:variable name="outboundMessageProperty" select="java:setStringProperty($outboundMessage, 'myCustomProperty', 'PRADIPTA')" />
		
		<xsl:variable name="void" select="java:setJMSCorrelationID($outboundMessage, concat($selfOrderID,''))" />
		
		<xsl:call-template name="sendSomOrder">
			<xsl:with-param name="orderXML" select = "$orderXML" />
			<xsl:with-param name="selfOrderID" select = "$selfOrderID" />
		</xsl:call-template>
		
		<xsl:variable name="generallog" select="java:info($log, concat('Hello ','is it me you are looking for'))" />
		
		<xsl:variable name="context" select="java:completeTaskOnExit($context,'success')"/>
	
	</xsl:template>
	
	<xsl:template name="sendSomOrder">
		<xsl:param name = "orderXML" />
		<xsl:param name = "selfOrderID" />
		<provord:CustomXML>
			<provord:MySOMTestOrderID><xsl:value-of select="$selfOrderID"/></provord:MySOMTestOrderID>
			<provord:Field1><xsl:value-of select="$orderXML/oms:_root/oms:TestData1"/></provord:Field1>
			<provord:Field2><xsl:value-of select="$orderXML/oms:_root/oms:TestData2"/></provord:Field2>
			<provord:TaskName><xsl:value-of select="$orderXML/oms:_root/oms:TaskName"/></provord:TaskName>
			<provord:Status><xsl:value-of select="$orderXML/oms:_root/oms:STATUS"/></provord:Status>
		</provord:CustomXML>
	</xsl:template>
	
</xsl:stylesheet>
