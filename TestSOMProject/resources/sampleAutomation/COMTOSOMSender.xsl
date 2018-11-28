<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns="http://www.metasolv.com/OMS/OrderDataUpdate" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:java="http://xml.apache.org/xslt/java" 
	xmlns:xalan="http://xml.apache.org/xslt"
	xmlns:oms="urn:com:metasolv:oms:xmlapi:1"
	xmlns:automator="java:oracle.communications.ordermanagement.automation.plugin.ScriptSenderContextInvocation"
	xmlns:context="java:com.mslv.oms.automation.TaskContext" xmlns:log="java:org.apache.commons.logging.Log"
	xmlns:outboundMessage="java:javax.jms.TextMessage" xmlns:to="http://TechnicalOrder"
	xmlns:provord="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/ProvisioningOrder/V1"
	xmlns:corecom="http://xmlns.oracle.com/EnterpriseObjects/Core/Common/V2"
	xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
	xmlns:ebo="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/SalesOrder/V2"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	exclude-result-prefixes="xsl java xalan oms com ser soapenv xsi"
	xmlns:fn="http://www.w3.org/2005/02/xpath-functions">

	<!-- * -->
	<xsl:param name="automator" />
	<xsl:param name="log" />
	<xsl:param name="context" />
	<xsl:param name="outboundMessage" />

	<!-- * -->

	<xsl:output method="xml" indent="yes" omit-xml-declaration="no"
		xalan:indent-amount="5" />
	<xsl:template match="/">
		<xsl:variable name="order" select="oms:GetOrder.Response" />
		<xsl:variable name="technicalActions"
			select="$order/oms:_root/oms:TechnicalActions" />
		<xsl:variable name="ebm" select="$order/oms:_root/oms:messageXmlData" />
		<xsl:variable name="bi"
			select="$order/oms:_root/oms:CaptureInteractionResponse" />
		<xsl:variable name="outboundMessage"
			select="java:setStringProperty($outboundMessage, '_wls_mimehdrContent_Type', 'text/xml; charset=&quot;utf-8&quot;')" />
		<xsl:variable name="outboundMessage"
			select="java:setStringProperty($outboundMessage, 'URI', '/osm/wsapi')" />
		<xsl:variable name="outboundMessage"
			select="java:setStringProperty($outboundMessage, 'Ora_OSM_COM_OrderId', /oms:GetOrder.Response/oms:OrderID)" />
		<xsl:variable name="void"
			select="java:setJMSCorrelationID($outboundMessage, concat($order/oms:_root/oms:messageXmlData/ebo:ProcessSalesOrderFulfillmentEBM/ebo:DataArea/ebo:ProcessSalesOrderFulfillment/corecom:Identification/corecom:ID/text(),'-COM'))" />
		<xsl:variable name="log" select=java:info($log,concat( 'Sending Service Order for COM order: ' order / oms:OrderID ) />
		<xsl:call-template name="sendSomOrder" />
	</xsl:template>
	<!-- ================================== Create the SOAP message for the 
		sendSomOrder call ==================================== -->
	<xsl:template name="sendSomOrder">

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
					<ebo:ProcessProvisioningOrderEBM
						xmlns:ebo="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/ProvisioningOrder/V1">
						<ebo:DataArea>
							<corecom:Process
								xmlns="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/ProvisioningOrder/V1"
								xmlns:corecom="http://xmlns.oracle.com/EnterpriseObjects/Core/Common/V2"
								xmlns:aia="http://www.oracle.com/XSL/Transform/java/oracle.apps.aia.core.xpath.AIAFunctions"
								xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
								xmlns:oms="urn:com:metasolv:oms:xmlapi:1"
								xmlns:provord="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/ProvisioningOrder/V1" />
							<provord:ProcessProvisioningOrder
								xmlns="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/ProvisioningOrder/V1"
								xmlns:aia="http://www.oracle.com/XSL/Transform/java/oracle.apps.aia.core.xpath.AIAFunctions"
								xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
								xmlns:oms="urn:com:metasolv:oms:xmlapi:1"
								xmlns:provord="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/ProvisioningOrder/V1">
								<corecom:SalesOrderReference>
									<corecom:SalesOrderIdentification>
										{$order/oms:_root/oms:ServiceOrder/cord:Order/cord:CustomerDetails/cord:OrderNumber/corecom:Identification/*}
									</corecom:SalesOrderIdentification>
								</corecom:SalesOrderReference>
								<provord:RequestedDeliveryDateTime>2010-07-16T08:24:38Z
								</provord:RequestedDeliveryDateTime>
								<provord:TypeCode>SALES ORDER</provord:TypeCode>
								<provord:FulfillmentPriorityCode>5
								</provord:FulfillmentPriorityCode>
								<provord:FulfillmentSuccessCode>DEFAULT
								</provord:FulfillmentSuccessCode>
								<provord:FulfillmentModeCode>DELIVER
								</provord:FulfillmentModeCode>
								<provord:ProcessingNumber />
								<provord:ProcessingTypeCode />
								<corecom:Status
									xmlns:corecom="http://xmlns.oracle.com/EnterpriseObjects/Core/Common/V2">
									<corecom:Code>IN PROGRESS</corecom:Code>
								</corecom:Status>
								<corecom:BusinessUnitReference
									xmlns:corecom="http://xmlns.oracle.com/EnterpriseObjects/Core/Common/V2">
									<corecom:BusinessUnitIdentification>
										<corecom:ID schemeID="ORGANIZATION_ID"
											schemeAgencyID="SEBL_01">0-R9NH</corecom:ID>
									</corecom:BusinessUnitIdentification>
								</corecom:BusinessUnitReference>
								{$order/oms:_root/oms:ServiceOrder/cord:Order/cord:CustomerDetails/cord:CustomerParty/corecom:CustomerPartyReference}
								<corecom:ParentProvisioningOrderReference
									xmlns:corecom="http://xmlns.oracle.com/EnterpriseObjects/Core/Common/V2">
									<corecom:ProvisioningOrderIdentification>
										<corecom:BusinessComponentID
											schemeID="SALESORDER_ID" schemeAgencyID="COMMON" />
									</corecom:ProvisioningOrderIdentification>
								</corecom:ParentProvisioningOrderReference>
								{
								for $x in
								$order/oms:_root/oms:ServiceOrder/cord:Order/cord:ServiceOrderLine
								return
								<provord:ProvisioningOrderLine>
									<corecom:Identification
										xmlns:corecom="http://xmlns.oracle.com/EnterpriseObjects/Core/Common/V2">
										<corecom:BusinessComponentID>{concat($x/@id,'')}
										</corecom:BusinessComponentID>
										<corecom:ID schemeID="SALESORDER_LINEID"
											schemeAgencyID="SEBL_01">{concat($x/@id,'')}</corecom:ID>
										<corecom:ApplicationObjectKey>
											<corecom:ID schemeID="SALESORDER_LINEID"
												schemeAgencyID="SEBL_01">{concat($x/@id,'')}</corecom:ID>
										</corecom:ApplicationObjectKey>
									</corecom:Identification>
									<provord:OrderQuantity>1</provord:OrderQuantity>
									<provord:ServiceActionCode>{$x/cord:Action/text()}
									</provord:ServiceActionCode>
									<provord:ServicePointCode />
									<corecom:Status
										xmlns:corecom="http://xmlns.oracle.com/EnterpriseObjects/Core/Common/V2">
										<corecom:Code>IN PROGRESS</corecom:Code>
									</corecom:Status>
									<corecom:ServiceAddress
										xmlns:corecom="http://xmlns.oracle.com/EnterpriseObjects/Core/Common/V2">
										<corecom:Identification>
											<corecom:BusinessComponentID
												schemeAgencyID="COMMON" schemeID="CUSTOMERPARTY_ADDRESSID">2d323733323231313531313836313331
											</corecom:BusinessComponentID>
											<corecom:ApplicationObjectKey>
												<corecom:ID schemeAgencyID="SEBL_01"
													schemeID="CUSTOMERPARTY_ADDRESSID">88-2KKNH</corecom:ID>
											</corecom:ApplicationObjectKey>
										</corecom:Identification>
										<corecom:LineOne>{$x/cord:Address/cord:LineOne/text()}
										</corecom:LineOne>
										<corecom:CityName>{$x/cord:Address/cord:CityName/text()}
										</corecom:CityName>
										<corecom:StateName>{$x/cord:Address/cord:StateName/text()}
										</corecom:StateName>
										<corecom:ProvinceName>{$x/cord:Address/cord:ProvinceName/
											text()}</corecom:ProvinceName>
										<corecom:CountryCode>{$x/cord:Address/cord:CountryCode
											/text()}</corecom:CountryCode>
										<corecom:PostalCode>{$x/cord:Address/cord:PostalCode /text()}
										</corecom:PostalCode>
									</corecom:ServiceAddress>
									<corecom:ItemReference
										xmlns:corecom="http://xmlns.oracle.com/EnterpriseObjects/Core/Common/V2">
										<corecom:ItemIdentification>
											<corecom:BusinessComponentID
												schemeAgencyID="COMMON" schemeID="ITEM_ITEMID" />
											<corecom:ApplicationObjectKey>
												<corecom:ID schemeID="ITEM_ITEMID"
													schemeAgencyID="SEBL_01">{concat($x/cord:InstanceID/text(),'')}
												</corecom:ID>
											</corecom:ApplicationObjectKey>
											<corecom:AlternateObjectKey>
												<corecom:ContextID />
											</corecom:AlternateObjectKey>
											<corecom:SupplierItemID />
										</corecom:ItemIdentification>
										<corecom:Name>{concat($x/@name,'')}</corecom:Name>
										<corecom:ClassificationCode listID="PermittedTypeCode"></corecom:ClassificationCode>
										<corecom:ClassificationCode listID="BillingProductTypeCode" />
										<corecom:ClassificationCode listID="FulfillmentItemCode">
											{concat($x/@name,'')}</corecom:ClassificationCode>
										<corecom:ServiceIndicator>false</corecom:ServiceIndicator>
										<corecom:TypeCode>SERVICE</corecom:TypeCode>
										<corecom:Description />
										<corecom:SpecificationGroup>
											<corecom:Name>ExtensibleAttributes</corecom:Name>
											{
											for $y in $x/cord:Attribute
											return
											<corecom:Specification>
												<corecom:ServiceActionCode>
												</corecom:ServiceActionCode>
												<corecom:Name>{concat($y/@name,'')} </corecom:Name>
												<corecom:DataTypeCode>Text</corecom:DataTypeCode>
												<corecom:Value>{$y/cord:Value/cord:value/text()}
												</corecom:Value>
											</corecom:Specification>
											}
										</corecom:SpecificationGroup>
										<corecom:PrimaryClassificationCode>{concat($x/@name,'')}
										</corecom:PrimaryClassificationCode>
										<corecom:ServiceInstanceIndicator>true
										</corecom:ServiceInstanceIndicator>
									</corecom:ItemReference>
									<provord:ProvisioningOrderLineSpecificationGroup>
										<corecom:SpecificationGroup>
											<corecom:Name>ExtensibleAttributes</corecom:Name>
											<corecom:Specification>
												<corecom:Name>ParentSalesOrderLine</corecom:Name>
												<corecom:Value>{$x/cord:primaryMapping/text()}
												</corecom:Value>
											</corecom:Specification>
											{
											for $z in $x/cord:secondaryMapping
											return
											<corecom:Specification>
												<corecom:Name>ParentSalesOrderLine</corecom:Name>
												<corecom:Value>{$z/text()}</corecom:Value>
											</corecom:Specification>
											}
										</corecom:SpecificationGroup>
									</provord:ProvisioningOrderLineSpecificationGroup>
								</provord:ProvisioningOrderLine>
								}
							</provord:ProcessProvisioningOrder>
						</ebo:DataArea>
					</ebo:ProcessProvisioningOrderEBM>
				</ord:CreateOrder>
			</soapenv:Body>
		</soapenv:Envelope>
	</xsl:template>
	<!-- * -->
	<xsl:template match="* | @* | text()">
		<!-- do nothing -->
		<xsl:apply-templates />
	</xsl:template>
</xsl:stylesheet>
