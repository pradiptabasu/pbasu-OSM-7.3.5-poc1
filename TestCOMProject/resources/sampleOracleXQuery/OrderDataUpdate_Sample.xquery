declare namespace oms="urn:com:metasolv:oms:xmlapi:1";
declare namespace automator = "java:oracle.communications.ordermanagement.automation.plugin.ScriptReceiverContextInvocation";
declare namespace context = "java:com.mslv.oms.automation.TaskContext";
declare namespace log = "java:org.apache.commons.logging.Log";
declare namespace su="http://StatusUpdate";
declare namespace so="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/SalesOrder/V2";
declare namespace corecom="http://xmlns.oracle.com/EnterpriseObjects/Core/Common/V2";
 
declare variable $automator external;
declare variable $context external;
declare variable $log external;
 
let $response := fn:root()/su:StatusUpdate (: fn:root(.) :)
let $items := fn:root()/su:StatusUpdate/su:OrderItem
 
let $taskData := fn:root(automator:getOrderAsDOM($automator))/oms:GetOrder.Response
let $component := if (fn:exists($taskData/oms:_root/oms:ControlData/oms:Functions/*/oms:componentKey)) then $taskData/oms:_root/oms:ControlData/oms:Functions/*[fn:position()=1] else ()
 
return (
if($response/su:status/text()='SOM_Completed') then (
    log:info($log,concat('Received SOM Status Update: SOM_Completed; ', $response/su:status/text())),
    automator:setUpdateOrder($automator,"true"),
    context:completeTaskOnExit($context,"success"),
    (
        <OrderDataUpdate xmlns="http://www.metasolv.com/OMS/OrderDataUpdate/2002/10/25">
            {
            for $item in $items
            for $parent in $item/su:ParentLineId
            for $orderComponentItem in $component/oms:orderItem[oms:orderItemRef/oms:LineXmlData/so:SalesOrderLine/corecom:Identification/corecom:ApplicationObjectKey/corecom:ID/text() = $parent/text()]
            return (
                    <Update path="{fn:concat("/ControlData/Functions/Provision/orderItem[@index='",fn:data($orderComponentItem/@index),"']")}">
                       <ExternalFulfillmentState>{$item/su:Status/text()}</ExternalFulfillmentState>
                    </Update>    
              )
                 
            }
        </OrderDataUpdate>
    )
) else if($response/su:status/text()='SOM_Failed') then (
 
    log:info($log,concat('Received SOM Status Update: SOM_Failed; ', $response/su:status/text())),
    automator:setUpdateOrder($automator,"true"),
    context:completeTaskOnExit($context,"failure"),
    (
        <OrderDataUpdate xmlns="http://www.metasolv.com/OMS/OrderDataUpdate/2002/10/25">
            {
            for $item in $items
            for $parent in $item/su:ParentLineId
            for $orderComponentItem in $component/oms:orderItem[oms:orderItemRef/oms:LineXmlData/so:SalesOrderLine/corecom:Identification/corecom:ApplicationObjectKey/corecom:ID/text() = $parent/text()]
            return (
                    <Update path="{fn:concat("/ControlData/Functions/Provision/orderItem[@index='",fn:data($orderComponentItem/@index),"']")}">
                       <ExternalFulfillmentState>{$item/su:Status/text()}</ExternalFulfillmentState>
                    </Update>    
              )
                 
            }
        </OrderDataUpdate>
    )
) else (
    log:info($log,concat('Received SOM Status Update: SOM_InProgress or SOM_Canceled; ', $response/su:status/text())),
    automator:setUpdateOrder($automator,"true"),
    (
        <OrderDataUpdate xmlns="http://www.metasolv.com/OMS/OrderDataUpdate/2002/10/25">
            {
            for $item in $items
            for $parent in $item/su:ParentLineId
            for $orderComponentItem in $component/oms:orderItem[oms:orderItemRef/oms:LineXmlData/so:SalesOrderLine/corecom:Identification/corecom:ApplicationObjectKey/corecom:ID/text() = $parent/text()]
            return (
                    <Update path="{fn:concat("/ControlData/Functions/Provision/orderItem[@index='",fn:data($orderComponentItem/@index),"']")}">
                       <ExternalFulfillmentState>{$item/su:Status/text()}</ExternalFulfillmentState>
                    </Update>    
              )
                 
            }
        </OrderDataUpdate>
    )
)
)