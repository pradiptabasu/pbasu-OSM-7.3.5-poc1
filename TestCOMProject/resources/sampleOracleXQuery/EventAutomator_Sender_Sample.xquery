declare namespace saxon="http://saxon.sf.net/";
declare namespace xsl="http://www.w3.org/1999/XSL/Transform";
declare namespace log = "java:org.apache.commons.logging.Log";
declare namespace outboundMessage = "java:javax.jms.TextMessage";
declare namespace oms="urn:com:metasolv:oms:xmlapi:1";
declare namespace osm="http://xmlns.oracle.com/communications/ordermanagement/model";
declare namespace context = "java:com.mslv.oms.automation.OrderNotificationContext";
 
declare variable $context external;
declare variable $log external;
declare variable $outboundMessage external;
 
let $taskData := fn:root(.)/oms:GetOrder.Response
let $correlationId := $taskData/oms:_root/oms:Id/text() 
let $controlDataArea := if (fn:exists($taskData/oms:_root/oms:ControlData)) 
                            then $taskData/oms:_root/oms:ControlData 
                            else ()
 
return
(
log:info($log, fn:concat('COMCartridge: Invoking orderCompletionNotification for order[',$taskData/oms:OrderID/text(),'] with correlation [', $correlationId,']')),
context:ackNotificationOnExit($context),
outboundMessage:setStringProperty($outboundMessage, "COMCorrelationID", $correlationId),
outboundMessage:setStringProperty($outboundMessage, "SUB_FOLDER_NAME", $taskData/oms:_root/oms:OrderNumber/text()),
outboundMessage:setStringProperty($outboundMessage, "COMMilestone", "COMOrderCompleteEvent"),
<orderNotification xmlns="http://xmlns.oracle.com/communications/sce/dictionary/CommonResourcesCartridge/Notifications"
 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <OSMOrderId>{$taskData/oms:OrderID/text()}</OSMOrderId>
    <Id>{$correlationId}</Id>
    <OrderNumber>{$taskData/oms:_root/oms:OrderNumber/text()}</OrderNumber>
    {
    for $serviceInstance in $controlDataArea/oms:OrderItem
    return
        <Instance>
            <InstanceID>{$serviceInstance/oms:instanceID/text()}</InstanceID>
            <OrderLineId>{$serviceInstance/oms:orderLineId/text()}</OrderLineId>
            <Status>{$serviceInstance/oms:status/text()}</Status>
        </Instance>
    }
</orderNotification>
)