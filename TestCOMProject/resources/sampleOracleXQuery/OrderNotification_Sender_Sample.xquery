declare namespace osm="urn:com:metasolv:oms:xmlapi:1";
declare namespace log = "java:org.apache.commons.logging.Log";
declare namespace to="http://TechnicalOrder";
declare namespace automator = "java:oracle.communications.ordermanagement.automation.plugin.ScriptSenderContextInvocation";
declare namespace su="http://StatusUpdate";
declare namespace context = "java:com.mslv.oms.automation.OrderDataChangeNotificationContext”;
declare namespace outboundMessage = "java:javax.jms.TextMessage";

declare variable $log external;
declare variable $outboundMessage external;

(: 
   This function is for indication purposes only.
   OSM Fulfillment State can be mapped according the expectation of Upstream 
:)
declare function local:getUpstreamFulfillmentState($fulfillmentState as xs:string) as xs:string {
    (: fn:concat('Order_Upstream_' , $fulfillmentState) :)
    fn:concat('' , $fulfillmentState)
};

(: 
   This function is for indication purposes only.
   OSM Fulfillment State can be mapped according the expectation of Upstream 
:)
declare function local:getUpstreamOrderItemFulfillmentState($fulfillmentState as xs:string) as xs:string {
    (: fn:concat('OrderItem_Upstream_' , $fulfillmentState) :)
    fn:concat('' , $fulfillmentState)
};

let $order := ..//osm:GetOrder.Response
let $orderFulfillmentState := $order/osm:_root/osm:ControlData/osm:OrderFulfillmentState
let $mappedUpstreamFulfillmentState := if(exists($orderFulfillmentState)) then local:getUpstreamFulfillmentState($orderFulfillmentState/text()) else ()

return
(
log:info($log,'Sending Upstream Fulfillment State'),
outboundMessage:setStringProperty($outboundMessage, "SOMTOMCorrelationHeader", concat($order/osm:_root/osm:messageXmlData/to:TechnicalOrder/to:SOMOrderId/text(),'-SOM')),
if (fn:count($order/osm:_root/osm:ControlData/osm:OrderItem)=0) then (
<StatusUpdate xmlns="http://StatusUpdate">
<numSalesOrder>{$order/osm:Reference/text()}</numSalesOrder>
<numOrder>{$order/osm:OrderID/text()}</numOrder>
<typeOrder>{$order//osm:OrderHeader/osm:typeOrder/text()}</typeOrder>
<errorCode>0</errorCode>
<status>cancelled</status>
</StatusUpdate>
) else (
<StatusUpdate xmlns="http://StatusUpdate">
<numSalesOrder>{$order/osm:Reference/text()}</numSalesOrder>
<numOrder>{$order/osm:OrderID/text()}</numOrder>
<typeOrder>{$order//osm:OrderHeader/osm:typeOrder/text()}</typeOrder>
<errorCode>0</errorCode>
<status>{$mappedUpstreamFulfillmentState}</status>
{
    for $orderItem in $order/osm:_root/osm:ControlData/osm:OrderItem
    where exists($orderItem/osm:OrderItemFulfillmentState)
    return 
        <OrderItem>
            <LineName>{$orderItem/osm:LineName/text()}</LineName>
            <LineId>{$orderItem/osm:LineId/text()}</LineId>
            <ParentLineId>{$orderItem/osm:ParentLineId/text()}</ParentLineId>
            <SpecificationName>{$orderItem/osm:TypeCode/text()}</SpecificationName>
            <Status>{local:getUpstreamOrderItemFulfillmentState($orderItem/osm:OrderItemFulfillmentState/text())}</Status>
        </OrderItem>
    }
</StatusUpdate>
)
)