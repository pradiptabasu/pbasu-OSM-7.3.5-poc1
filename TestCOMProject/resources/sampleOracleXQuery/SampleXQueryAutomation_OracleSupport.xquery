Sample1
This sample shows plugin will change single instance node /Message/Name's value into 'none' and complete the task with 'success' status.
=======
declare namespace oms = "urn:com:metasolv:oms:xmlapi:1";
declare namespace context = "java:com.mslv.oms.automation.TaskContext";
declare variable $context external;

declare function local:resetSIP(){
<UpdateOrder.Request xmlns="urn:com:metasolv:oms:xmlapi:1">
<Update path="/">
<Message3>
<Name>none</Name>
</Message3>
</Update>
</UpdateOrder.Request>
};

local:resetSIP(),context:completeTaskOnExit($context,'success') 

Sample2
In this example, plugin will update multi-instance node  /ControlData/Functions/ShipCPE/orderItem's single child node orderItemRef/PonrStatus with value 'true' and complete the task with 'success' status.
=======
declare namespace context = "java:com.mslv.oms.automation.TaskContext";

declare namespace oms = "urn:com:metasolv:oms:xmlapi:1";

declare variable $context external;

declare function local:createPonrUpdateEntry($index) {
<Update path="/ControlData/Functions/ShipCPE/orderItem[@index='{$index}']/orderItemRef"><PonrStatus>true</PonrStatus></Update>
};


declare function local:createUpdateRequest($order) {
<UpdateOrder.Request xmlns="urn:com:metasolv:oms:xmlapi:1" xmlns:oms="urn:com:metasolv:oms:xmlapi:1">
<Update path="/OrderStatus"><ShippingStatus>true</ShippingStatus></Update>
{for $lineItem in $order/oms:GetOrder.Response/oms:_root/oms:ControlData/oms:Functions/oms:ShipCPE/oms:orderItem
let $index := $lineItem/@index
return local:createPonrUpdateEntry($index)
}
</UpdateOrder.Request>
};

let $order := fn:root(.)/oms:GetOrder.Response/oms:_root/oms:Order

return local:createUpdateRequest($order),context:completeTaskOnExit( $context, "success")
