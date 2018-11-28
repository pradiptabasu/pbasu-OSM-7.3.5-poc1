declare namespace oms="urn:com:metasolv:oms:xmlapi:1";
declare namespace automator = "java:oracle.communications.ordermanagement.automation.plugin.ScriptReceiverContextInvocation";
declare namespace context = "java:com.mslv.oms.automation.OrderNotificationContext";
declare namespace log = "java:org.apache.commons.logging.Log";
 
declare option saxon:output "method=xml";
declare option saxon:output "saxon:indent-spaces=2";
 
declare variable $automator external;
declare variable $context external;
declare variable $log external;
 
declare variable $exitStatus := "success";
 
let $thisOrderId := context:getOrderId($context)
(: let $taskMnemonic := context:getTaskMnemonic($context) :)
let $notificationName := context:getNotificationName($context)
let $notificationType := context:getNotificationType($context)
let $orderId := fn:root(.)/oms:GetOrder.Response/oms:_root/oms:orderId
let $xmlRequest := '<Notifications.Request xmlns="urn:com:metasolv:oms:xmlapi:1" />'
let $notifications := context:processXMLRequest($context, $xmlRequest)
return (
  log:info($log, fn:concat("XQuery jeopardy: order[", $thisOrderId, 
    "], notificationContext [", context:getClass($context), 
    "], notificationName[", $notificationName, 
    "], notificationType[", $notificationType, 
    "], notifications[", $notifications, 
    "] entered order ID [", $orderId/text(), "]")),
  <placeholder/>
)