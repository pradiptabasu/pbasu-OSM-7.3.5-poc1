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
		
		<xsl:variable name="outboundMessageProperty" select="java:setStringProperty($outboundMessage, '_wls_mimehdrContent_Type', 'text/xml; charset=&quot;utf-8&quot;')" />
		<xsl:variable name="outboundMessageProperty" select="java:setStringProperty($outboundMessage, 'URI', '/osm/wsapi')" />
		<xsl:variable name="outboundMessageProperty" select="java:setStringProperty($outboundMessage, 'Ora_OSM_COM_OrderId', /oms:GetOrder.Response/oms:OrderID)" />
		
		<xsl:variable name="void" select="java:setJMSCorrelationID($outboundMessage, concat($selfOrderID,''))" />
		
		
		<xsl:call-template name="sendSomOrder">
			<xsl:with-param name="orderXML" select = "$orderXML" />
			<xsl:with-param name="selfOrderID" select = "$selfOrderID" />
		</xsl:call-template>
		
		<xsl:variable name="generallog" select="java:info($log, concat('Hello ','is it me you are looking for'))" />
		
		<!-- <xsl:variable name="context" select="java:completeTaskOnExit($context,'success')"/>  -->
	
	</xsl:template>
	
	<xsl:template name="sendSomOrder">
		<xsl:param name = "orderXML" />
		<xsl:param name = "selfOrderID" />
		<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
			xmlns:ord="http://xmlns.oracle.com/communications/ordermanagement">
			<soapenv:Header>
				<wsse:Security
					xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd"
					soapenv:mustUnderstand="1">
					<wsse:UsernameToken
						xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd"
						wsu:Id="UsernameToken-4799946">
						<wsse:Username>demo</wsse:Username>
						<wsse:Password
							Type="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText">passw0rd</wsse:Password>
					</wsse:UsernameToken>
				</wsse:Security>
			</soapenv:Header>
			<soapenv:Body>
				<ord:CreateOrder>
					<provord:ProcessProvisioningOrderEBM
						xmlns:provord="http://xmlns.oracle.com/EnterpriseObjects/Core/provord/ProvisioningOrder/V1">
						<provord:DataArea>
							<provord:Process
								xmlns="http://xmlns.oracle.com/EnterpriseObjects/Core/provord/ProvisioningOrder/V1"
								xmlns:oms="urn:com:metasolv:oms:xmlapi:1"/>
							<provord:ProcessProvisioningOrder
								xmlns="http://xmlns.oracle.com/EnterpriseObjects/Core/provord/ProvisioningOrder/V1"
								xmlns:oms="urn:com:metasolv:oms:xmlapi:1"
								xmlns:provord="http://xmlns.oracle.com/EnterpriseObjects/Core/provord/ProvisioningOrder/V1">
								<provord:SalesOrderReference>
									<provord:SalesOrderXML>
										<xsl:copy-of select="$orderXML/oms:_root"/>
									</provord:SalesOrderXML>
									<provord:GetOrderResponse>
										<xsl:copy-of select="$orderXML"/>
									</provord:GetOrderResponse>
								</provord:SalesOrderReference>
								<provord:CustomXML>
									<provord:MySOMTestOrderID><xsl:value-of select="$selfOrderID"/></provord:MySOMTestOrderID>
									<provord:Field1><xsl:value-of select="$orderXML/oms:_root/oms:TestData1"/></provord:Field1>
									<provord:Field2><xsl:value-of select="$orderXML/oms:_root/oms:TestData2"/></provord:Field2>
								</provord:CustomXML>
							</provord:ProcessProvisioningOrder>
						</provord:DataArea>
					</provord:ProcessProvisioningOrderEBM>
				</ord:CreateOrder>
			</soapenv:Body>
		</soapenv:Envelope>
	</xsl:template>
	
</xsl:stylesheet>
