declare namespace oms="urn:com:metasolv:oms:xmlapi:1";
declare namespace automator = "java:oracle.communications.ordermanagement.automation.plugin.ScriptReceiverContextInvocation";
declare namespace context = "java:com.mslv.oms.automation.TaskContext";
declare namespace log = "java:org.apache.commons.logging.Log";
declare namespace java="http://xml.apache.org/xslt/java";
 
declare variable $automator external;
declare variable $context external;
declare variable $log external;
 
let $orderXML := /oms:GetOrder.Response
let $selfOrderID :=$orderXML/oms:OrderID/text()

let $SelfOrderIDNode := 	if ($orderXML/oms:_root/oms:SelfOrderID) 
							then 
							(
								<Update path="/SelfOrderID">{$selfOrderID}</Update>
							)
							else 
							(
								<Add path="/">
            						<SelfOrderID>{$selfOrderID}</SelfOrderID>
            					</Add>
							)
						
let $GetOrderDataNode := 	if($orderXML/oms:_root/oms:GetOrderData) 
							then 
							(
								<Update path="/GetOrderData">{$orderXML}</Update>
							)
							else 
							(
								<Add path="/">
            						<GetOrderData>{$orderXML}</GetOrderData>
            					</Add>
							)
							
let $TaskNameNode :=  		if($orderXML/oms:_root/oms:TaskName) 
							then 
							(
								<Update path="/TaskName">UpdatedByTestSOMxqueryAutomationInternalAutomationTask1</Update>
							)
							else 
							(
								<Add path="/">
            						<TaskName>UpdatedByTestSOMxqueryAutomationInternalAutomationTask1</TaskName>
            					</Add>
							)
 
return 
(
    log:info($log,concat('************************************************  PRADIPTA ##############################  TestSOMxqueryInternalAutomator ', $selfOrderID)),
    automator:setUpdateOrder($automator,"true"),
    context:completeTaskOnExit($context,"success"),
    (
        <OrderDataUpdate xmlns="http://www.metasolv.com/OMS/OrderDataUpdate/2002/10/25">
			{$SelfOrderIDNode}
    		{$GetOrderDataNode}
			{$TaskNameNode}
  			<Update path="/TestData1">Hello I am updated</Update>
		</OrderDataUpdate>
    )
)