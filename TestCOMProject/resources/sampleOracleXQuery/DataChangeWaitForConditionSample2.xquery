(: The following example returns true when at least one blocking item is completed. :)
declare namespace oms="urn:com:metasolv:oms:xmlapi:1";
declare variable $blockingIndexes as xs:integer* external;
let $component := //ControlData/Functions/NetworkProvisionFunction
let $lineItem := $component/orderItem/orderItemRef[fn:index-of($blockingIndexes, xs:integer(@referencedIndex)) != 0]
return
     if (fn:exists($lineItem))
     then
        let $statusValue := $lineItem/OrderItemStatus/text() = "completed"
        return
        if (fn:count($statusValue)>0) 
        then 
            fn:true()
        else 
            fn:false()
     else 
        fn:false() 