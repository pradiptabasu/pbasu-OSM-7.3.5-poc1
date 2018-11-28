<?xml version="1.0" encoding="UTF-8"?>
<!-- xmlns:log="java:org.apache.commons.logging.Log"
	 -->
<xsl:stylesheet version="2.0"
	xmlns="http://www.metasolv.com/OMS/OrderDataUpdate" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:java="http://xml.apache.org/xslt/java" 
	xmlns:xalan="http://xml.apache.org/xslt"
	xmlns:automator="java:oracle.communications.ordermanagement.automation.plugin.ScriptSenderContextInvocation"
	xmlns:context="java:com.mslv.oms.automation.TaskContext" 
	xmlns:log="java:oracle.communications.ordermanagement.log.LogOrderActivity"
	xmlns:outboundMessage="java:javax.jms.TextMessage" 
	xmlns:HelloWorld="java:com.pradipta.osm.poc.som.HelloWorld"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:fn="http://www.w3.org/2005/02/xpath-functions"
	exclude-result-prefixes="xsl java xalan xsi">

	<!-- * -->
	<xsl:param name="automator" />
	<xsl:param name="log" />
	<xsl:param name="context" />
	<xsl:param name="outboundMessage" />
	<xsl:param name="HelloWorld" />
	<!-- * -->

	<xsl:template match="/">
		<xsl:variable name="generallog" select="java:info($log, concat('Hello ','is it me you are looking for'))" />
		
		<xsl:variable name="customJavaCall" select="java:greetings($HelloWorld)" />
		
		<xsl:variable name="generallog" select="java:info($log, concat('Hello ','is it me you are looking for'))" />
		
		<xsl:variable name="context" select="java:completeTaskOnExit($context,'success')"/>
	
	</xsl:template>
	
</xsl:stylesheet>
