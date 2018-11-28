declare namespace oms="urn:com:metasolv:oms:xmlapi:1";
declare namespace xsl="http://www.w3.org/1999/XSL/Transform";
declare namespace automator = "java:oracle.communications.ordermanagement.automation.plugin.ScriptReceiverContextInvocation";
declare namespace context = "java:com.mslv.oms.automation.OrderNotificationContext";
declare namespace log = "java:org.apache.commons.logging.Log";

declare option saxon:output "method=xml";
declare option saxon:output "saxon:indent-spaces=2";
 
declare variable $automator external;
declare variable $context external;
declare variable $log external;

declare function local:createUpdateRequest($component) 
{
  <OrderDataUpdate xmlns="http://www.metasolv.com/OMS/OrderDataUpdate/2002/10/25">
  {
    for $orderComponentItem in $component/oms:orderItem[oms:orderItemRef/oms:ProductSpec/text() = 'Broadband.Product.Spec']
    return
    (
      <Update path="{fn:concat("/ControlData/OrderItem[@index='",fn:data($orderComponentItem/oms:orderItemRef/@referencedIndex),"']")}">
        <ProductDesc>BROADBAND INSTALL IN PROGRESS</ProductDesc>
      </Update>    
    )
   }
   </OrderDataUpdate>       
};

let $orderId := fn:root(.)/oms:GetOrder.Response/oms:OrderID
let $xmlRequest := '<Notifications.Request xmlns="urn:com:metasolv:oms:xmlapi:1" />'
let $notifications := context:processXMLRequest($context, $xmlRequest)
let $taskData := fn:root(automator:getOrderAsDOM($automator))/oms:GetOrder.Response
let $taskDataStr := if (fn:exists($taskData))
                	then
                		saxon:serialize($taskData, <xsl:output method='xml' omit-xml-declaration='yes' indent='yes' saxon:indent-spaces='4'/>)
                	else ""
let $component := 	if (fn:exists($taskData/oms:_root/oms:ControlData/oms:Functions/oms:InstallOrderFunction/oms:componentKey)) 
					then 
						$taskData/oms:_root/oms:ControlData/oms:Functions/oms:InstallOrderFunction 
					else ()
let $orderUpdateXml :=	local:createUpdateRequest($component)
let $orderUpdateXmlStr :=	if (fn:exists($orderUpdateXml))
                			then
                				saxon:serialize($orderUpdateXml, <xsl:output method='xml' omit-xml-declaration='yes' indent='yes' saxon:indent-spaces='4'/>)
                			else ""			
					
return (
  log:info($log, fn:concat("XQuery Install Process Jeopardy: order[",$orderId,"]")),
  log:info($log, $taskDataStr),
  log:info($log, $orderUpdateXmlStr),
  context:ackNotificationOnExit($context),
  local:createUpdateRequest($component)
)