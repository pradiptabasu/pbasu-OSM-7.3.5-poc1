<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns="http://www.metasolv.com/OMS/OrderDataUpdate" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:java="http://xml.apache.org/xslt/java" 
    xmlns:xalan="http://xml.apache.org/xslt"
    xmlns:oms="urn:com:metasolv:oms:xmlapi:1"
    xmlns:automator="java:oracle.communications.ordermanagement.automation.plugin.ScriptReceiverContextInvocation"
    xmlns:context="java:com.mslv.oms.automation.TaskContext"
    xmlns:log="java:org.apache.commons.logging.Log"
    xmlns:su="http://StatusUpdate"
    xmlns:so="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/SalesOrder/V2"
    xmlns:corecom="http://xmlns.oracle.com/EnterpriseObjects/Core/Common/V2"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    exclude-result-prefixes="xsl java xalan oms soapenv xsi">
 
    <!-- * -->
    <xsl:param name="automator"/>
    <xsl:param name="log"/>
    <xsl:param name="context"/>
 
    <!-- * -->
    <xsl:output method="xml" indent="yes" omit-xml-declaration="no" xalan:indent-amount="5"/>

    <xsl:template match="/">
     <xsl:variable name="taskData" select="fn:root(java:getOrderAsDOM($automator))/oms:GetOrder.Response"/>
     <xsl:variable name="response" select="fn:root()/su:StatusUpdate (: fn:root(.) :)"/>
     <xsl:variable name="items" select="fn:root()/su:StatusUpdate/su:OrderItem"/>
    <xsl:variable name="component" select="if (fn:exists($taskData/oms:_root/oms:ControlData/oms:Functions/*/oms:componentKey)) then $taskData/oms:_root/oms:ControlData/oms:Functions/*[fn:position()=1] else ()"/>
        <xsl:apply-templates/>
</xsl:template>

<!-- Match the status SOM_Complete -->
    <xsl:template match="$response[su:status/text()='SOM_Completed']">
     <xsl:variable name="log" select="java:info($log,concat('Received SOM Status Update: SOM_Completed; ', $response/su:status/text()))"/>
     <xsl:variable name="automator" select="java:setUpdateOrder($automator, true())"/>
     <xsl:variable name="context" select="java:completeTaskOnExit($context, success())"/>
     <OrderDataUpdate xmlns="http://www.metasolv.com/OMS/OrderDataUpdate/2002/10/25">
        <xsl:for-each select="su:ParentLineId">
            <xsl:variable name="parent" select="."/>
            <xsl:for-each select="$component/oms:orderItem[oms:orderItemRef/oms:LineXmlData/so:SalesOrderLine/corecom:Identification/corecom:ApplicationObjectKey/corecom:ID/text() = $parent/text()]">
                 <xsl:variable name="index" select="@index"/>
                     <Update path="{fn:concat("/ControlData/Functions/Provision/orderItem[@index='",fn:data($orderComponentItem/@index),"']")}>
                      <ExternalFulfillmentState>{$item/su:Status/text()}</ExternalFulfillmentState>
                    </Update> 
            </xsl:for-each>
        </xsl:for-each>                      
     </OrderDataUpdate>
    </xsl:template>
 
<!-- Match the status SOM_Failed -->
    <xsl:template match="$response[su:status/text()='SOM_Failed']">
     <xsl:variable name="log" select="java:info($log,concat('Received SOM Status Update: SOM_Failed; ', $response/su:status/text()))"/>
     <xsl:variable name="automator" select="java:setUpdateOrder($automator, true())"/>
     <xsl:variable name="context" select="java:completeTaskOnExit($context, success())"/>
     <OrderDataUpdate xmlns="http://www.metasolv.com/OMS/OrderDataUpdate/2002/10/25">
        <xsl:for-each select="su:ParentLineId">
            <xsl:variable name="parent" select="."/>
            <xsl:for-each select="$component/oms:orderItem[oms:orderItemRef/oms:LineXmlData/so:SalesOrderLine/corecom:Identification/corecom:ApplicationObjectKey/corecom:ID/text() = $parent/text()]">
                 <xsl:variable name="index" select="@index"/>
                     <Update path="{fn:concat("/ControlData/Functions/Provision/orderItem[@index='",fn:data($orderComponentItem/@index),"']")}>
                      <ExternalFulfillmentState>{$item/su:Status/text()}</ExternalFulfillmentState>
                     </Update> 
            </xsl:for-each>
        </xsl:for-each>
     /OrderDataUpdate>
    </xsl:template>
 
    <xsl:template match="$response[su:status/text()='']">
     <xsl:variable name="log" select="java:info($log,concat('Received SOM Status Update: SOM_InProgress or SOM_Canceled; ', $response/su:status/text()))"/>
     <xsl:variable name="automator" select="java:setUpdateOrder($automator, false())"/>
     <xsl:variable name="context" select="java:completeTaskOnExit($context, success())"/>
     <OrderDataUpdate xmlns="http://www.metasolv.com/OMS/OrderDataUpdate/2002/10/25">
        <xsl:for-each select="su:ParentLineId">
            <xsl:variable name="parent" select="."/>
            <xsl:for-each select="$component/oms:orderItem[oms:orderItemRef/oms:LineXmlData/so:SalesOrderLine/corecom:Identification/corecom:ApplicationObjectKey/corecom:ID/text() = $parent/text()]">
                 <xsl:variable name="index" select="@index"/>
                     <Update path="{fn:concat("/ControlData/Functions/Provision/orderItem[@index='",fn:data($orderComponentItem/@index),"']")}>
                      <ExternalFulfillmentState>{$item/su:Status/text()}</ExternalFulfillmentState>
                     </Update> 
            </xsl:for-each>
        </xsl:for-each>
     </OrderDataUpdate>
    </xsl:template>
 
<!-- * -->
    <xsl:template match="* | @* | text()">
        <!-- do nothing -->
        <xsl:apply-templates/>
    </xsl:template>
</xsl:stylesheet>