(: The following example shows the XQuery that evaluates the data change. The dependency is met when all blocking order items have reached a state of PROVISION STARTED.: :)
(:   The $blockingIndexes variable contains data element indexes for all blocking order items:   :)
declare variable $blockingIndexes as xs:integer* external;
(:   Specify "PROVISION STARTED" as the data value that must be met:   :)
let $expectedMilestoneCode := "PROVISION STARTED"
(:   $milestoneValues contains a set of milestones for all blocking order items:   :)
let $milestoneValues := 
     /GetOrder.Response/_root/ControlData/Functions/ProvisioningFunction/orderItem/orderItemRef[
     fn:index-of($blockingIndexes, xs:integer(@referencedIndex)) !=
     0]/milestone[text() eq $expectedMilestoneCode]
(:   Return true only if all the milestones in ProvisioningFunction/orderItem/orderItemRef are PROVISION STARTED:   :)
return fn:count($milestoneValues) eq fn:count($blockingIndexes)