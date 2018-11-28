declare namespace oms="urn:com:metasolv:oms:xmlapi:1";
declare namespace automator = "java:oracle.communications.ordermanagement.automation.plugin.ScriptReceiverContextInvocation";
declare namespace context = "java:com.mslv.oms.automation.TaskContext";
declare namespace log = "java:org.apache.commons.logging.Log";
declare namespace su="http://StatusUpdate";
declare namespace so="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/SalesOrder/V2";
declare namespace corecom="http://xmlns.oracle.com/EnterpriseObjects/Core/Common/V2";
declare namespace provordResp="http://xmlns.oracle.com/EnterpriseObjects/Core/provord/ProvisioningOrder/V1/resp";

 
declare variable $automator external;
declare variable $context external;
declare variable $log external;

declare function local:createUpdateRequest($orderXML, $responseMessage, $requestMessage) 
{
  
	if ($orderXML/oms:_root/oms:STATUS) 
	then
	(
    	<OrderDataUpdate xmlns="http://www.metasolv.com/OMS/OrderDataUpdate/2002/10/25">
     		<Update path="/STATUS">{$responseMessage/provordResp:ResponseMessage/provordResp:ResponseXML/provordResp:status/text()}</Update>
		  	<Update path="/XMLSentOutsideJMSCorrID">{$requestMessage}</Update>
		  	<Update path="/XMLSentReceivedJMSCorrID">{$responseMessage}</Update>
      		<Update path="/TaskName">TestSOMXqueryAutomationReceiverOnlyJMSCorrIDTask1</Update>
		  	<Update path="/TestData1">{$responseMessage/provordResp:ResponseMessage/provordResp:ResponseXML/provordResp:data1/text()}</Update>
		  	<Update path="/TestData2">{$responseMessage/provordResp:ResponseMessage/provordResp:ResponseXML/provordResp:data2/text()}</Update>
		  	<Update path="/GetOrderData">{$orderXML}</Update>
	  	</OrderDataUpdate>
	)
	else
	(
		<OrderDataUpdate xmlns="http://www.metasolv.com/OMS/OrderDataUpdate/2002/10/25">
      		<Add path="/">
				<STATUS>{$responseMessage/provordResp:ResponseMessage/provordResp:ResponseXML/provordResp:status/text()}</STATUS>
				<XMLSentOutsideJMSCorrID>{$requestMessage}</XMLSentOutsideJMSCorrID>
				<XMLSentReceivedJMSCorrID>{$responseMessage}</XMLSentReceivedJMSCorrID>
			</Add>
     		<Update path="/TaskName">TestSOMXqueryAutomationReceiverOnlyJMSCorrIDTask1</Update>
		  	<Update path="/TestData1">{$responseMessage/provordResp:ResponseMessage/provordResp:ResponseXML/provordResp:data1/text()}</Update>
		  	<Update path="/TestData2">{$responseMessage/provordResp:ResponseMessage/provordResp:ResponseXML/provordResp:data2/text()}</Update>
		  	<Update path="/GetOrderData">{$orderXML}</Update>
	  	</OrderDataUpdate>
	)	
 };

let $orderXML :=automator:getOrderAsDOM($automator)/oms:GetOrder.Response
let $selfOrderID :=$orderXML/oms:OrderID/text()
let $responseMessage := fn:root()
let $requestMessage :=$responseMessage/provordResp:ResponseMessage/provordResp:RequestXML

return 
(
	if($responseMessage/provordResp:ResponseMessage/provordResp:ResponseXML/provordResp:status) 
  	then
  	(
  		log:info($log,concat('Processing received response in if case for Order : ', $selfOrderID)),
		context:completeTaskOnExit( $context, "success"),
		local:createUpdateRequest($orderXML, $responseMessage, $requestMessage)
  	)
  	else
	(
		log:info($log,concat('Processing received response in else case for Order : ', $selfOrderID)),
		context:completeTaskOnExit( $context, "failure"),
		local:createUpdateRequest($orderXML, $responseMessage, $requestMessage)
	)
)