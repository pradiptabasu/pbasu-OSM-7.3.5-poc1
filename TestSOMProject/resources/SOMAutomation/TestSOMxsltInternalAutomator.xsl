<?xml version="1.0" encoding="UTF-8"?>
<!-- xmlns:log="java:org.apache.commons.logging.Log"
	 -->
<xsl:stylesheet version="2.0"
	xmlns="http://www.metasolv.com/OMS/OrderDataUpdate" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:java="http://xml.apache.org/xslt/java" 
	xmlns:xalan="http://xml.apache.org/xslt"
	xmlns:oms="urn:com:metasolv:oms:xmlapi:1"
	xmlns:automator="java:oracle.communications.ordermanagement.automation.plugin.ScriptSenderContextInvocation"
	xmlns:context="java:com.mslv.oms.automation.TaskContext" 
	xmlns:log="java:org.apache.commons.logging.Log"
	xmlns:provord="http://xmlns.oracle.com/EnterpriseObjects/Core/provord/ProvisioningOrder/V1"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:fn="http://www.w3.org/2005/02/xpath-functions"
	exclude-result-prefixes="xsl java xalan oms xsi">

	<!-- * -->
	<xsl:param name="automator" />
	<xsl:param name="log" />
	<xsl:param name="context" />
	<!-- * -->

	<xsl:output method="xml" indent="yes" omit-xml-declaration="no" xalan:indent-amount="5" />
	
	<xsl:template match="/">
		<xsl:variable name="generallog" select="java:info($log, concat('Hello ','is it me you are looking for'))" />
		
		<xsl:variable name="orderXML" select="/oms:GetOrder.Response" />
		<xsl:variable name="selfOrderID" select="$orderXML/oms:OrderID/text()" />
		
		<xsl:variable name="generallog" select="java:info($log,'***   Hello is it me you are looking for    ****')"/>
		
     	<xsl:variable name="automator" select="java:setUpdateOrder($automator, true())"/>
     	<xsl:variable name="context" select="java:completeTaskOnExit($context, 'success')"/>
		<OrderDataUpdate xmlns="http://www.metasolv.com/OMS/OrderDataUpdate/2002/10/25">
			<xsl:choose>
    			<xsl:when test="$orderXML/oms:_root/oms:SelfOrderID">
					<Update path="/SelfOrderID"><xsl:value-of select="$selfOrderID"/></Update>
    			</xsl:when>
    			<xsl:otherwise>
    				<Add path="/">
            			<SelfOrderID><xsl:value-of select="$selfOrderID"/></SelfOrderID>
            		</Add>
    			</xsl:otherwise>
  			</xsl:choose>
  			<xsl:choose>
    			<xsl:when test="$orderXML/oms:_root/oms:GetOrderData">
    				<Update path="/GetOrderData"><xsl:copy-of select="$orderXML"/></Update>
    			</xsl:when>
    			<xsl:otherwise>
      				<Add path="/">
            			<GetOrderData><xsl:copy-of select="$orderXML"/></GetOrderData>
            		</Add>    			
				</xsl:otherwise>
  			</xsl:choose>
  			<xsl:choose>
    			<xsl:when test="$orderXML/oms:_root/oms:TaskName">
    				<Update path="/TaskName">UpdatedByTestSOMAutomationInternalAutomationTask1</Update>
    			</xsl:when>
    			<xsl:otherwise>
      				<Add path="/">
            			<TaskName>UpdatedByTestSOMAutomationInternalAutomationTask1</TaskName>
            		</Add>    			
				</xsl:otherwise>
  			</xsl:choose>
  			<Update path="/TestData1">Hello I am updated</Update>
		</OrderDataUpdate>
        
        <!--
        	
        	<OrderDataUpdate> 
				<Add path="/"> 
					<ProvisioningOrderResponse> 
						<OrderInformation> 
							<OrderNumber>1238723</OrderNumber> 
						</OrderInformation> 
					</ProvisioningOrderResponse> 
				</Add> 
			</OrderDataUpdate>


 			<OrderDataUpdate> 
				<Update path="/a_group_1/a_text">This line is updated by Update request</Update> 
				<Delete path="/client_info/address[@index='80132']" /> 
				<Update path="/client_info/address[@index='76579']/city">Newark</Update> 
			</OrderDataUpdate>
			
			
			<OrderDataUpdate> 
				<Delete path="/client_info/address[@index='80132']/city" /> 
				<Update path="/client_info/address[@index='76579']/city">Newark</Update> 
				<Update path="/customer_details/service_address/street">55 Updated St</Update>" 
				<Delete path="/service_details/current_account_number"></Delete> 
			</OrderDataUpdate>
			
			
			Scenario 1: You have a field named "color" and it is assigned with the value "blue". Now you want to UPDATE this value to "green" using "UpdatedNodes". Then you can use following format

				<ord:UpdatedNodes>
					<_root>    
						<color>green</color>
					</_root>
				</ord:UpdatedNodes>


			Scenario 2: You have a field named "color" and is assigned with value "blue". Now you want to ADD another instance of "color" and assign the value "green" to it using "UpdatedNodes". Then you can use following format

				<ord:UpdatedNodes>
					<_root>    
						<color>blue</color>            
						<color>green</color>
					</_root>
				</ord:UpdatedNodes>


			Scenario 3: You have two instances of a field "color" and are assigned with values "blue" & "green" respectively. Now you want to ADD another instance of "color" and assign the value "yellow" to it using "UpdatedNodes". Then you can use following format. You can also UPDATE first two instances of "color" to some other values using this format.

				<ord:UpdatedNodes>
					<_root>    
						<color>blue</color>            
						<color>green</color>
						<color>yellow</color>
					</_root>
				</ord:UpdatedNodes>

         -->
	</xsl:template>
	
</xsl:stylesheet>
