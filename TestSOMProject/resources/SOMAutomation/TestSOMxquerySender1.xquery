declare namespace oms="urn:com:metasolv:oms:xmlapi:1";
declare namespace automator = "java:oracle.communications.ordermanagement.automation.plugin.ScriptReceiverContextInvocation";
declare namespace context = "java:com.mslv.oms.automation.TaskContext";
declare namespace log = "java:org.apache.commons.logging.Log";
declare namespace java="http://xml.apache.org/xslt/java";
declare namespace outboundMessage="java:javax.jms.TextMessage";
declare namespace provord="http://xmlns.oracle.com/EnterpriseObjects/Core/provord/ProvisioningOrder/V1";
declare namespace fn="http://www.w3.org/2005/02/xpath-functions";
declare namespace soapenv="http://schemas.xmlsoap.org/soap/envelope/";
declare namespace ord="http://xmlns.oracle.com/communications/ordermanagement";

declare variable $automator external;
declare variable $context external;
declare variable $log external;
declare variable $outboundMessage external;

declare function local:createUpdateRequest($orderXML, $selfOrderID) 
{
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
									{$orderXML/oms:_root}
								</provord:SalesOrderXML>
								<provord:GetOrderResponse>
									{$orderXML}
								</provord:GetOrderResponse>
							</provord:SalesOrderReference>
							<provord:CustomXML>
								<provord:MySOMTestOrderID>{$selfOrderID}</provord:MySOMTestOrderID>
								<provord:Field1>{$orderXML/oms:_root/oms:TestData1}</provord:Field1>
								<provord:Field2>{$orderXML/oms:_root/oms:TestData2}</provord:Field2>
							</provord:CustomXML>
						</provord:ProcessProvisioningOrder>
					</provord:DataArea>
				</provord:ProcessProvisioningOrderEBM>
			</ord:CreateOrder>
		</soapenv:Body>
	</soapenv:Envelope>
};

let $orderXML := /oms:GetOrder.Response
let $selfOrderID :=$orderXML/oms:OrderID/text()

return
(
	log:info($log,concat('Setting JMSProperty and JMSCorrelationID for Order : ', $selfOrderID)),
	outboundMessage:setStringProperty($outboundMessage, '_wls_mimehdrContent_Type', 'text/xml; charset=&quot;utf-8&quot;'),
	outboundMessage:setStringProperty($outboundMessage, 'URI', '/osm/wsapi'),
	outboundMessage:setStringProperty($outboundMessage, 'Ora_OSM_COM_OrderId', $selfOrderID),
	outboundMessage:setJMSCorrelationID($outboundMessage, concat($selfOrderID,'')),
	log:info($log,concat('Sending XML for Order : ', $selfOrderID)),
	(: context:completeTaskOnExit( $context, "success"), :)
	local:createUpdateRequest($orderXML, $selfOrderID)
)