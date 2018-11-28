<provordResp:ResponseMessage
	xmlns:automator="java:oracle.communications.ordermanagement.automation.plugin.ScriptSenderContextInvocation"
	xmlns:context="java:com.mslv.oms.automation.TaskContext" xmlns:fn="http://www.w3.org/2005/02/xpath-functions"
	xmlns:log="java:oracle.communications.ordermanagement.log.LogOrderActivity"
	xmlns:ord="http://xmlns.oracle.com/communications/ordermanagement"
	xmlns:outboundMessage="java:javax.jms.TextMessage"
	xmlns:provord="http://xmlns.oracle.com/EnterpriseObjects/Core/provord/ProvisioningOrder/V1"
	xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
	xmlns:provordResp="http://xmlns.oracle.com/EnterpriseObjects/Core/provord/ProvisioningOrder/V1/resp">
	<provordResp:RequestXML>
		<provordResp:MessageHeader>
			<Ora_OSM_COM_OrderId></Ora_OSM_COM_OrderId>
			<JMSCorrelationID></JMSCorrelationID>
		</provordResp:MessageHeader>
		<provordResp:MessageBody>
			<soapenv:Envelope xmlns="http://www.metasolv.com/OMS/OrderDataUpdate"
				xmlns:automator="java:oracle.communications.ordermanagement.automation.plugin.ScriptSenderContextInvocation"
				xmlns:context="java:com.mslv.oms.automation.TaskContext" xmlns:fn="http://www.w3.org/2005/02/xpath-functions"
				xmlns:log="java:oracle.communications.ordermanagement.log.LogOrderActivity"
				xmlns:ord="http://xmlns.oracle.com/communications/ordermanagement"
				xmlns:outboundMessage="java:javax.jms.TextMessage"
				xmlns:provord="http://xmlns.oracle.com/EnterpriseObjects/Core/provord/ProvisioningOrder/V1"
				xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/">
				<soapenv:Header>
					<wsse:Security soapenv:mustUnderstand="1"
						xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd">
						<wsse:UsernameToken wsu:Id="UsernameToken-4799946"
							xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd">
							<wsse:Username>demo</wsse:Username>
							<wsse:Password
								Type="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText">passw0rd</wsse:Password>
						</wsse:UsernameToken>
					</wsse:Security>
				</soapenv:Header>
				<soapenv:Body>
					<ord:CreateOrder>
						<provord:ProcessProvisioningOrderEBM>
							<provord:DataArea>
								<provord:Process
									xmlns="http://xmlns.oracle.com/EnterpriseObjects/Core/provord/ProvisioningOrder/V1" />
								<provord:ProcessProvisioningOrder
									xmlns="http://xmlns.oracle.com/EnterpriseObjects/Core/provord/ProvisioningOrder/V1">
									<provord:SalesOrderReference>
										<provord:SalesOrderXML>
											<_root index="0" xmlns="urn:com:metasolv:oms:xmlapi:1"
												xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
												<TestData1 index="1449741785198">Hello I am updated</TestData1>
												<TestData2 index="1449741785199">12312312</TestData2>
												<GetOrderData index="1449741785218">
													<GetOrder.Response>
														<OrderID>10</OrderID>
														<OrderHistID>2728</OrderHistID>
														<Task>TestSOMAutomationInternalAutomationTask1</Task>
														<OrderSource>TestSOMOrder</OrderSource>
														<OrderType>TestSOMOrder</OrderType>
														<Workgroups>
															<Workgroup>TestSOMRole1</Workgroup>
														</Workgroups>
														<OrderState>open.running.in_progress</OrderState>
														<State>accepted</State>
														<ExecutionMode>do</ExecutionMode>
														<AcceptedUserName>oms-automation</AcceptedUserName>
														<Reference>TestInternalAuto3</Reference>
														<ExpectedDuration>P1D</ExpectedDuration>
														<ExpectedOrderCompletionDate>2015-12-11T15:33:05 IST
														</ExpectedOrderCompletionDate>
														<Priority>5</Priority>
														<Namespace>TestSOMProject</Namespace>
														<Version>1.0.0.0.0</Version>
														<ProcessStatus>n/a</ProcessStatus>
														<_root index="0">
															<TestData1 index="1449741785198">Hello I am updated</TestData1>
															<TestData2 index="1449741785199">12312312</TestData2>
															<GetOrderData index="1449741785218">
																<GetOrder.Response>
																	<OrderID>10</OrderID>
																	<OrderHistID>2021</OrderHistID>
																	<Task>TestSOMAutomationInternalAutomationTask1</Task>
																	<OrderSource>TestSOMOrder</OrderSource>
																	<OrderType>TestSOMOrder</OrderType>
																	<Workgroups>
																		<Workgroup>TestSOMRole1</Workgroup>
																	</Workgroups>
																	<OrderState>open.running.in_progress</OrderState>
																	<State>accepted</State>
																	<ExecutionMode>do</ExecutionMode>
																	<AcceptedUserName>oms-automation</AcceptedUserName>
																	<Reference>TestInternalAuto3</Reference>
																	<ExpectedDuration>P1D</ExpectedDuration>
																	<ExpectedOrderCompletionDate>2015-12-11T15:33:05 IST
																	</ExpectedOrderCompletionDate>
																	<Priority>5</Priority>
																	<Namespace>TestSOMProject</Namespace>
																	<Version>1.0.0.0.0</Version>
																	<ProcessStatus>n/a</ProcessStatus>
																	<_root index="0">
																		<TestData1 index="1449741785198">dsdasdas</TestData1>
																		<TestData2 index="1449741785199">12312312</TestData2>
																		<SelfOrderID index="1449741785205">10</SelfOrderID>
																		<TaskName index="1449741785207">UpdatedByTestSOMAutomationSenderReceiverJMSCorrIDTask1
																		</TaskName>
																	</_root>
																</GetOrder.Response>
															</GetOrderData>
															<SelfOrderID index="1449741785205">10</SelfOrderID>
															<TaskName index="1449741785207">UpdatedByTestSOMAutomationInternalAutomationTask1
															</TaskName>
														</_root>
													</GetOrder.Response>
												</GetOrderData>
												<SelfOrderID index="1449741785205">10</SelfOrderID>
												<XMLSentOutsideJMSCorrID index="1449741785209">
													<provordResp:RequestXML
														xmlns:provordResp="http://xmlns.oracle.com/EnterpriseObjects/Core/provord/ProvisioningOrder/V1/resp">
														<provordResp:MessageHeader>
															<Ora_OSM_COM_OrderId
																xmlns="http://www.metasolv.com/OMS/OrderDataUpdate/2002/10/25">9</Ora_OSM_COM_OrderId>
															<JMSCorrelationID
																xmlns="http://www.metasolv.com/OMS/OrderDataUpdate/2002/10/25">9</JMSCorrelationID>
														</provordResp:MessageHeader>
														<provordResp:MessageBody>
															<soapenv:Envelope
																xmlns="http://www.metasolv.com/OMS/OrderDataUpdate">
																<soapenv:Header>
																	<wsse:Security soapenv:mustUnderstand="1"
																		xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd">
																		<wsse:UsernameToken wsu:Id="UsernameToken-4799946"
																			xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd">
																			<wsse:Username>demo</wsse:Username>
																			<wsse:Password
																				Type="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText">passw0rd</wsse:Password>
																		</wsse:UsernameToken>
																	</wsse:Security>
																</soapenv:Header>
																<soapenv:Body>
																	<ord:CreateOrder>
																		<provord:ProcessProvisioningOrderEBM>
																			<provord:DataArea>
																				<provord:Process
																					xmlns="http://xmlns.oracle.com/EnterpriseObjects/Core/provord/ProvisioningOrder/V1" />
																				<provord:ProcessProvisioningOrder
																					xmlns="http://xmlns.oracle.com/EnterpriseObjects/Core/provord/ProvisioningOrder/V1">
																					<provord:SalesOrderReference>
																						<provord:SalesOrderXML>
																							<_root index="0"
																								xmlns="urn:com:metasolv:oms:xmlapi:1">
																								<TestData1 index="1449741785198">Hello I am updated
																								</TestData1>
																								<TestData2 index="1449741785199">1212</TestData2>
																								<GetOrderData index="1449741785206">
																									<GetOrder.Response>
																										<OrderID>10</OrderID>
																										<OrderHistID>607</OrderHistID>
																										<Task>TestSOMAutomationInternalAutomationTask1
																										</Task>
																										<OrderSource>TestSOMOrder</OrderSource>
																										<OrderType>TestSOMOrder</OrderType>
																										<Workgroups>
																											<Workgroup>TestSOMRole1</Workgroup>
																										</Workgroups>
																										<OrderState>open.running.in_progress
																										</OrderState>
																										<State>accepted</State>
																										<ExecutionMode>do</ExecutionMode>
																										<AcceptedUserName>oms-automation
																										</AcceptedUserName>
																										<Reference>TestInternalAuto3</Reference>
																										<ExpectedDuration>P1D</ExpectedDuration>
																										<ExpectedOrderCompletionDate>2015-12-11T15:33:05
																											IST</ExpectedOrderCompletionDate>
																										<Priority>5</Priority>
																										<Namespace>TestSOMProject</Namespace>
																										<Version>1.0.0.0.0</Version>
																										<ProcessStatus>n/a</ProcessStatus>
																										<_root index="0">
																											<TestData1 index="1449741785198">asdsada
																											</TestData1>
																											<TestData2 index="1449741785199">1212</TestData2>
																										</_root>
																									</GetOrder.Response>
																								</GetOrderData>
																								<SelfOrderID index="1449741785205">10</SelfOrderID>
																								<TaskName index="1449741785207">UpdatedByTestSOMAutomationInternalAutomationTask1
																								</TaskName>
																							</_root>
																						</provord:SalesOrderXML>
																						<provord:GetOrderResponse>
																							<GetOrder.Response
																								xmlns="urn:com:metasolv:oms:xmlapi:1">
																								<OrderID>10</OrderID>
																								<OrderHistID>809</OrderHistID>
																								<Task>TestSOMAutomationSenderReceiverJMSCorrIDTask1
																								</Task>
																								<OrderSource>TestSOMOrder</OrderSource>
																								<OrderType>TestSOMOrder</OrderType>
																								<Workgroups>
																									<Workgroup>TestSOMRole1</Workgroup>
																								</Workgroups>
																								<OrderState>open.running.in_progress
																								</OrderState>
																								<State>accepted</State>
																								<ExecutionMode>do</ExecutionMode>
																								<AcceptedUserName>oms-automation
																								</AcceptedUserName>
																								<Reference>TestInternalAuto3</Reference>
																								<ExpectedDuration>P1D</ExpectedDuration>
																								<ExpectedOrderCompletionDate>2015-12-11T15:33:05
																									IST</ExpectedOrderCompletionDate>
																								<Priority>5</Priority>
																								<Namespace>TestSOMProject</Namespace>
																								<Version>1.0.0.0.0</Version>
																								<ProcessStatus>n/a</ProcessStatus>
																								<_root index="0">
																									<TestData1 index="1449741785198">Hello I am updated
																									</TestData1>
																									<TestData2 index="1449741785199">1212</TestData2>
																									<GetOrderData index="1449741785206">
																										<GetOrder.Response>
																											<OrderID>10</OrderID>
																											<OrderHistID>607</OrderHistID>
																											<Task>TestSOMAutomationInternalAutomationTask1
																											</Task>
																											<OrderSource>TestSOMOrder</OrderSource>
																											<OrderType>TestSOMOrder</OrderType>
																											<Workgroups>
																												<Workgroup>TestSOMRole1</Workgroup>
																											</Workgroups>
																											<OrderState>open.running.in_progress
																											</OrderState>
																											<State>accepted</State>
																											<ExecutionMode>do</ExecutionMode>
																											<AcceptedUserName>oms-automation
																											</AcceptedUserName>
																											<Reference>TestInternalAuto3</Reference>
																											<ExpectedDuration>P1D</ExpectedDuration>
																											<ExpectedOrderCompletionDate>2015-12-11T15:33:05
																												IST</ExpectedOrderCompletionDate>
																											<Priority>5</Priority>
																											<Namespace>TestSOMProject</Namespace>
																											<Version>1.0.0.0.0</Version>
																											<ProcessStatus>n/a</ProcessStatus>
																											<_root index="0">
																												<TestData1 index="1449741785198">asdsada
																												</TestData1>
																												<TestData2 index="1449741785199">1212</TestData2>
																											</_root>
																										</GetOrder.Response>
																									</GetOrderData>
																									<SelfOrderID index="1449741785205">10</SelfOrderID>
																									<TaskName index="1449741785207">UpdatedByTestSOMAutomationInternalAutomationTask1
																									</TaskName>
																								</_root>
																							</GetOrder.Response>
																						</provord:GetOrderResponse>
																					</provord:SalesOrderReference>
																					<provord:CustomXML>
																						<provord:MySOMTestOrderID>10
																						</provord:MySOMTestOrderID>
																						<provord:Field1>Hello I am updated
																						</provord:Field1>
																						<provord:Field2>1212</provord:Field2>
																					</provord:CustomXML>
																				</provord:ProcessProvisioningOrder>
																			</provord:DataArea>
																		</provord:ProcessProvisioningOrderEBM>
																	</ord:CreateOrder>
																</soapenv:Body>
															</soapenv:Envelope>
														</provordResp:MessageBody>
													</provordResp:RequestXML>
												</XMLSentOutsideJMSCorrID>
												<XMLSentReceivedJMSCorrID index="1449741785210">
													<provordResp:ResponseMessage
														xmlns:provordResp="http://xmlns.oracle.com/EnterpriseObjects/Core/provord/ProvisioningOrder/V1/resp">
														<provordResp:RequestXML>
															<provordResp:MessageHeader>
																<Ora_OSM_COM_OrderId
																	xmlns="http://www.metasolv.com/OMS/OrderDataUpdate/2002/10/25">9</Ora_OSM_COM_OrderId>
																<JMSCorrelationID
																	xmlns="http://www.metasolv.com/OMS/OrderDataUpdate/2002/10/25">9</JMSCorrelationID>
															</provordResp:MessageHeader>
															<provordResp:MessageBody>
																<soapenv:Envelope
																	xmlns="http://www.metasolv.com/OMS/OrderDataUpdate">
																	<soapenv:Header>
																		<wsse:Security soapenv:mustUnderstand="1"
																			xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd">
																			<wsse:UsernameToken wsu:Id="UsernameToken-4799946"
																				xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd">
																				<wsse:Username>demo</wsse:Username>
																				<wsse:Password
																					Type="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText">passw0rd</wsse:Password>
																			</wsse:UsernameToken>
																		</wsse:Security>
																	</soapenv:Header>
																	<soapenv:Body>
																		<ord:CreateOrder>
																			<provord:ProcessProvisioningOrderEBM>
																				<provord:DataArea>
																					<provord:Process
																						xmlns="http://xmlns.oracle.com/EnterpriseObjects/Core/provord/ProvisioningOrder/V1" />
																					<provord:ProcessProvisioningOrder
																						xmlns="http://xmlns.oracle.com/EnterpriseObjects/Core/provord/ProvisioningOrder/V1">
																						<provord:SalesOrderReference>
																							<provord:SalesOrderXML>
																								<_root index="0"
																									xmlns="urn:com:metasolv:oms:xmlapi:1">
																									<TestData1 index="1449741785198">Hello I am updated
																									</TestData1>
																									<TestData2 index="1449741785199">1212</TestData2>
																									<GetOrderData index="1449741785206">
																										<GetOrder.Response>
																											<OrderID>10</OrderID>
																											<OrderHistID>607</OrderHistID>
																											<Task>TestSOMAutomationInternalAutomationTask1
																											</Task>
																											<OrderSource>TestSOMOrder</OrderSource>
																											<OrderType>TestSOMOrder</OrderType>
																											<Workgroups>
																												<Workgroup>TestSOMRole1</Workgroup>
																											</Workgroups>
																											<OrderState>open.running.in_progress
																											</OrderState>
																											<State>accepted</State>
																											<ExecutionMode>do</ExecutionMode>
																											<AcceptedUserName>oms-automation
																											</AcceptedUserName>
																											<Reference>TestInternalAuto3</Reference>
																											<ExpectedDuration>P1D</ExpectedDuration>
																											<ExpectedOrderCompletionDate>2015-12-11T15:33:05
																												IST</ExpectedOrderCompletionDate>
																											<Priority>5</Priority>
																											<Namespace>TestSOMProject</Namespace>
																											<Version>1.0.0.0.0</Version>
																											<ProcessStatus>n/a</ProcessStatus>
																											<_root index="0">
																												<TestData1 index="1449741785198">asdsada
																												</TestData1>
																												<TestData2 index="1449741785199">1212</TestData2>
																											</_root>
																										</GetOrder.Response>
																									</GetOrderData>
																									<SelfOrderID index="1449741785205">10</SelfOrderID>
																									<TaskName index="1449741785207">UpdatedByTestSOMAutomationInternalAutomationTask1
																									</TaskName>
																								</_root>
																							</provord:SalesOrderXML>
																							<provord:GetOrderResponse>
																								<GetOrder.Response
																									xmlns="urn:com:metasolv:oms:xmlapi:1">
																									<OrderID>10</OrderID>
																									<OrderHistID>809</OrderHistID>
																									<Task>TestSOMAutomationSenderReceiverJMSCorrIDTask1
																									</Task>
																									<OrderSource>TestSOMOrder</OrderSource>
																									<OrderType>TestSOMOrder</OrderType>
																									<Workgroups>
																										<Workgroup>TestSOMRole1</Workgroup>
																									</Workgroups>
																									<OrderState>open.running.in_progress
																									</OrderState>
																									<State>accepted</State>
																									<ExecutionMode>do</ExecutionMode>
																									<AcceptedUserName>oms-automation
																									</AcceptedUserName>
																									<Reference>TestInternalAuto3</Reference>
																									<ExpectedDuration>P1D</ExpectedDuration>
																									<ExpectedOrderCompletionDate>2015-12-11T15:33:05
																										IST</ExpectedOrderCompletionDate>
																									<Priority>5</Priority>
																									<Namespace>TestSOMProject</Namespace>
																									<Version>1.0.0.0.0</Version>
																									<ProcessStatus>n/a</ProcessStatus>
																									<_root index="0">
																										<TestData1 index="1449741785198">Hello I am updated
																										</TestData1>
																										<TestData2 index="1449741785199">1212</TestData2>
																										<GetOrderData index="1449741785206">
																											<GetOrder.Response>
																												<OrderID>10</OrderID>
																												<OrderHistID>607</OrderHistID>
																												<Task>TestSOMAutomationInternalAutomationTask1
																												</Task>
																												<OrderSource>TestSOMOrder</OrderSource>
																												<OrderType>TestSOMOrder</OrderType>
																												<Workgroups>
																													<Workgroup>TestSOMRole1</Workgroup>
																												</Workgroups>
																												<OrderState>open.running.in_progress
																												</OrderState>
																												<State>accepted</State>
																												<ExecutionMode>do</ExecutionMode>
																												<AcceptedUserName>oms-automation
																												</AcceptedUserName>
																												<Reference>TestInternalAuto3</Reference>
																												<ExpectedDuration>P1D</ExpectedDuration>
																												<ExpectedOrderCompletionDate>2015-12-11T15:33:05
																													IST</ExpectedOrderCompletionDate>
																												<Priority>5</Priority>
																												<Namespace>TestSOMProject</Namespace>
																												<Version>1.0.0.0.0</Version>
																												<ProcessStatus>n/a</ProcessStatus>
																												<_root index="0">

																													<TestData1 index="1449741785198">asdsada
																													</TestData1>

																													<TestData2 index="1449741785199">1212</TestData2>
																												</_root>
																											</GetOrder.Response>
																										</GetOrderData>
																										<SelfOrderID index="1449741785205">10
																										</SelfOrderID>
																										<TaskName index="1449741785207">UpdatedByTestSOMAutomationInternalAutomationTask1
																										</TaskName>
																									</_root>
																								</GetOrder.Response>
																							</provord:GetOrderResponse>
																						</provord:SalesOrderReference>
																						<provord:CustomXML>
																							<provord:MySOMTestOrderID>10
																							</provord:MySOMTestOrderID>
																							<provord:Field1>Hello I am updated
																							</provord:Field1>
																							<provord:Field2>1212</provord:Field2>
																						</provord:CustomXML>
																					</provord:ProcessProvisioningOrder>
																				</provord:DataArea>
																			</provord:ProcessProvisioningOrderEBM>
																		</ord:CreateOrder>
																	</soapenv:Body>
																</soapenv:Envelope>
															</provordResp:MessageBody>
														</provordResp:RequestXML>
														<provordResp:ResponseXML>
															<provordResp:status>SUCCESS</provordResp:status>
															<provordResp:data1>dsdasdas</provordResp:data1>
															<provordResp:data2>12312312</provordResp:data2>
														</provordResp:ResponseXML>
													</provordResp:ResponseMessage>
												</XMLSentReceivedJMSCorrID>
												<STATUS index="1449741785208">SUCCESS</STATUS>
												<TaskName index="1449741785207">UpdatedByTestSOMAutomationInternalAutomationTask1
												</TaskName>
											</_root>
										</provord:SalesOrderXML>
										<provord:GetOrderResponse>
											<GetOrder.Response xmlns="urn:com:metasolv:oms:xmlapi:1">
												<OrderID>10</OrderID>
												<OrderHistID>2930</OrderHistID>
												<Task>TestSOMAutomationSenderReceiverJMSCorrIDTask1</Task>
												<OrderSource>TestSOMOrder</OrderSource>
												<OrderType>TestSOMOrder</OrderType>
												<Workgroups>
													<Workgroup>TestSOMRole1</Workgroup>
												</Workgroups>
												<OrderState>open.running.in_progress</OrderState>
												<State>accepted</State>
												<ExecutionMode>do</ExecutionMode>
												<AcceptedUserName>oms-automation</AcceptedUserName>
												<Reference>TestInternalAuto3</Reference>
												<ExpectedDuration>P1D</ExpectedDuration>
												<ExpectedOrderCompletionDate>2015-12-11T15:33:05 IST
												</ExpectedOrderCompletionDate>
												<Priority>5</Priority>
												<Namespace>TestSOMProject</Namespace>
												<Version>1.0.0.0.0</Version>
												<ProcessStatus>n/a</ProcessStatus>
												<_root index="0"
													xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
													<TestData1 index="1449741785198">Hello I am updated</TestData1>
													<TestData2 index="1449741785199">12312312</TestData2>
													<GetOrderData index="1449741785218">
														<GetOrder.Response>
															<OrderID>10</OrderID>
															<OrderHistID>2728</OrderHistID>
															<Task>TestSOMAutomationInternalAutomationTask1</Task>
															<OrderSource>TestSOMOrder</OrderSource>
															<OrderType>TestSOMOrder</OrderType>
															<Workgroups>
																<Workgroup>TestSOMRole1</Workgroup>
															</Workgroups>
															<OrderState>open.running.in_progress</OrderState>
															<State>accepted</State>
															<ExecutionMode>do</ExecutionMode>
															<AcceptedUserName>oms-automation</AcceptedUserName>
															<Reference>TestInternalAuto3</Reference>
															<ExpectedDuration>P1D</ExpectedDuration>
															<ExpectedOrderCompletionDate>2015-12-11T15:33:05 IST
															</ExpectedOrderCompletionDate>
															<Priority>5</Priority>
															<Namespace>TestSOMProject</Namespace>
															<Version>1.0.0.0.0</Version>
															<ProcessStatus>n/a</ProcessStatus>
															<_root index="0">
																<TestData1 index="1449741785198">Hello I am updated
																</TestData1>
																<TestData2 index="1449741785199">12312312</TestData2>
																<GetOrderData index="1449741785218">
																	<GetOrder.Response>
																		<OrderID>10</OrderID>
																		<OrderHistID>2021</OrderHistID>
																		<Task>TestSOMAutomationInternalAutomationTask1</Task>
																		<OrderSource>TestSOMOrder</OrderSource>
																		<OrderType>TestSOMOrder</OrderType>
																		<Workgroups>
																			<Workgroup>TestSOMRole1</Workgroup>
																		</Workgroups>
																		<OrderState>open.running.in_progress</OrderState>
																		<State>accepted</State>
																		<ExecutionMode>do</ExecutionMode>
																		<AcceptedUserName>oms-automation</AcceptedUserName>
																		<Reference>TestInternalAuto3</Reference>
																		<ExpectedDuration>P1D</ExpectedDuration>
																		<ExpectedOrderCompletionDate>2015-12-11T15:33:05 IST
																		</ExpectedOrderCompletionDate>
																		<Priority>5</Priority>
																		<Namespace>TestSOMProject</Namespace>
																		<Version>1.0.0.0.0</Version>
																		<ProcessStatus>n/a</ProcessStatus>
																		<_root index="0">
																			<TestData1 index="1449741785198">dsdasdas</TestData1>
																			<TestData2 index="1449741785199">12312312</TestData2>
																			<SelfOrderID index="1449741785205">10</SelfOrderID>
																			<TaskName index="1449741785207">UpdatedByTestSOMAutomationSenderReceiverJMSCorrIDTask1
																			</TaskName>
																		</_root>
																	</GetOrder.Response>
																</GetOrderData>
																<SelfOrderID index="1449741785205">10</SelfOrderID>
																<TaskName index="1449741785207">UpdatedByTestSOMAutomationInternalAutomationTask1
																</TaskName>
															</_root>
														</GetOrder.Response>
													</GetOrderData>
													<SelfOrderID index="1449741785205">10</SelfOrderID>
													<XMLSentOutsideJMSCorrID index="1449741785209">
														<provordResp:RequestXML
															xmlns:provordResp="http://xmlns.oracle.com/EnterpriseObjects/Core/provord/ProvisioningOrder/V1/resp">
															<provordResp:MessageHeader>
																<Ora_OSM_COM_OrderId
																	xmlns="http://www.metasolv.com/OMS/OrderDataUpdate/2002/10/25">9</Ora_OSM_COM_OrderId>
																<JMSCorrelationID
																	xmlns="http://www.metasolv.com/OMS/OrderDataUpdate/2002/10/25">9</JMSCorrelationID>
															</provordResp:MessageHeader>
															<provordResp:MessageBody>
																<soapenv:Envelope
																	xmlns="http://www.metasolv.com/OMS/OrderDataUpdate">
																	<soapenv:Header>
																		<wsse:Security soapenv:mustUnderstand="1"
																			xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd">
																			<wsse:UsernameToken wsu:Id="UsernameToken-4799946"
																				xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd">
																				<wsse:Username>demo</wsse:Username>
																				<wsse:Password
																					Type="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText">passw0rd</wsse:Password>
																			</wsse:UsernameToken>
																		</wsse:Security>
																	</soapenv:Header>
																	<soapenv:Body>
																		<ord:CreateOrder>
																			<provord:ProcessProvisioningOrderEBM>
																				<provord:DataArea>
																					<provord:Process
																						xmlns="http://xmlns.oracle.com/EnterpriseObjects/Core/provord/ProvisioningOrder/V1" />
																					<provord:ProcessProvisioningOrder
																						xmlns="http://xmlns.oracle.com/EnterpriseObjects/Core/provord/ProvisioningOrder/V1">
																						<provord:SalesOrderReference>
																							<provord:SalesOrderXML>
																								<_root index="0"
																									xmlns="urn:com:metasolv:oms:xmlapi:1">
																									<TestData1 index="1449741785198">Hello I am updated
																									</TestData1>
																									<TestData2 index="1449741785199">1212</TestData2>
																									<GetOrderData index="1449741785206">
																										<GetOrder.Response>
																											<OrderID>10</OrderID>
																											<OrderHistID>607</OrderHistID>
																											<Task>TestSOMAutomationInternalAutomationTask1
																											</Task>
																											<OrderSource>TestSOMOrder</OrderSource>
																											<OrderType>TestSOMOrder</OrderType>
																											<Workgroups>
																												<Workgroup>TestSOMRole1</Workgroup>
																											</Workgroups>
																											<OrderState>open.running.in_progress
																											</OrderState>
																											<State>accepted</State>
																											<ExecutionMode>do</ExecutionMode>
																											<AcceptedUserName>oms-automation
																											</AcceptedUserName>
																											<Reference>TestInternalAuto3</Reference>
																											<ExpectedDuration>P1D</ExpectedDuration>
																											<ExpectedOrderCompletionDate>2015-12-11T15:33:05
																												IST</ExpectedOrderCompletionDate>
																											<Priority>5</Priority>
																											<Namespace>TestSOMProject</Namespace>
																											<Version>1.0.0.0.0</Version>
																											<ProcessStatus>n/a</ProcessStatus>
																											<_root index="0">
																												<TestData1 index="1449741785198">asdsada
																												</TestData1>
																												<TestData2 index="1449741785199">1212</TestData2>
																											</_root>
																										</GetOrder.Response>
																									</GetOrderData>
																									<SelfOrderID index="1449741785205">10</SelfOrderID>
																									<TaskName index="1449741785207">UpdatedByTestSOMAutomationInternalAutomationTask1
																									</TaskName>
																								</_root>
																							</provord:SalesOrderXML>
																							<provord:GetOrderResponse>
																								<GetOrder.Response
																									xmlns="urn:com:metasolv:oms:xmlapi:1">
																									<OrderID>10</OrderID>
																									<OrderHistID>809</OrderHistID>
																									<Task>TestSOMAutomationSenderReceiverJMSCorrIDTask1
																									</Task>
																									<OrderSource>TestSOMOrder</OrderSource>
																									<OrderType>TestSOMOrder</OrderType>
																									<Workgroups>
																										<Workgroup>TestSOMRole1</Workgroup>
																									</Workgroups>
																									<OrderState>open.running.in_progress
																									</OrderState>
																									<State>accepted</State>
																									<ExecutionMode>do</ExecutionMode>
																									<AcceptedUserName>oms-automation
																									</AcceptedUserName>
																									<Reference>TestInternalAuto3</Reference>
																									<ExpectedDuration>P1D</ExpectedDuration>
																									<ExpectedOrderCompletionDate>2015-12-11T15:33:05
																										IST</ExpectedOrderCompletionDate>
																									<Priority>5</Priority>
																									<Namespace>TestSOMProject</Namespace>
																									<Version>1.0.0.0.0</Version>
																									<ProcessStatus>n/a</ProcessStatus>
																									<_root index="0">
																										<TestData1 index="1449741785198">Hello I am updated
																										</TestData1>
																										<TestData2 index="1449741785199">1212</TestData2>
																										<GetOrderData index="1449741785206">
																											<GetOrder.Response>
																												<OrderID>10</OrderID>
																												<OrderHistID>607</OrderHistID>
																												<Task>TestSOMAutomationInternalAutomationTask1
																												</Task>
																												<OrderSource>TestSOMOrder</OrderSource>
																												<OrderType>TestSOMOrder</OrderType>
																												<Workgroups>
																													<Workgroup>TestSOMRole1</Workgroup>
																												</Workgroups>
																												<OrderState>open.running.in_progress
																												</OrderState>
																												<State>accepted</State>
																												<ExecutionMode>do</ExecutionMode>
																												<AcceptedUserName>oms-automation
																												</AcceptedUserName>
																												<Reference>TestInternalAuto3</Reference>
																												<ExpectedDuration>P1D</ExpectedDuration>
																												<ExpectedOrderCompletionDate>2015-12-11T15:33:05
																													IST</ExpectedOrderCompletionDate>
																												<Priority>5</Priority>
																												<Namespace>TestSOMProject</Namespace>
																												<Version>1.0.0.0.0</Version>
																												<ProcessStatus>n/a</ProcessStatus>
																												<_root index="0">
																													<TestData1 index="1449741785198">asdsada
																													</TestData1>
																													<TestData2 index="1449741785199">1212</TestData2>
																												</_root>
																											</GetOrder.Response>
																										</GetOrderData>
																										<SelfOrderID index="1449741785205">10
																										</SelfOrderID>
																										<TaskName index="1449741785207">UpdatedByTestSOMAutomationInternalAutomationTask1
																										</TaskName>
																									</_root>
																								</GetOrder.Response>
																							</provord:GetOrderResponse>
																						</provord:SalesOrderReference>
																						<provord:CustomXML>
																							<provord:MySOMTestOrderID>10
																							</provord:MySOMTestOrderID>
																							<provord:Field1>Hello I am updated
																							</provord:Field1>
																							<provord:Field2>1212</provord:Field2>
																						</provord:CustomXML>
																					</provord:ProcessProvisioningOrder>
																				</provord:DataArea>
																			</provord:ProcessProvisioningOrderEBM>
																		</ord:CreateOrder>
																	</soapenv:Body>
																</soapenv:Envelope>
															</provordResp:MessageBody>
														</provordResp:RequestXML>
													</XMLSentOutsideJMSCorrID>
													<XMLSentReceivedJMSCorrID index="1449741785210">
														<provordResp:ResponseMessage
															xmlns:provordResp="http://xmlns.oracle.com/EnterpriseObjects/Core/provord/ProvisioningOrder/V1/resp">
															<provordResp:RequestXML>
																<provordResp:MessageHeader>
																	<Ora_OSM_COM_OrderId
																		xmlns="http://www.metasolv.com/OMS/OrderDataUpdate/2002/10/25">9</Ora_OSM_COM_OrderId>
																	<JMSCorrelationID
																		xmlns="http://www.metasolv.com/OMS/OrderDataUpdate/2002/10/25">9</JMSCorrelationID>
																</provordResp:MessageHeader>
																<provordResp:MessageBody>
																	<soapenv:Envelope
																		xmlns="http://www.metasolv.com/OMS/OrderDataUpdate">
																		<soapenv:Header>
																			<wsse:Security soapenv:mustUnderstand="1"
																				xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd">
																				<wsse:UsernameToken wsu:Id="UsernameToken-4799946"
																					xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd">
																					<wsse:Username>demo</wsse:Username>
																					<wsse:Password
																						Type="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText">passw0rd</wsse:Password>
																				</wsse:UsernameToken>
																			</wsse:Security>
																		</soapenv:Header>
																		<soapenv:Body>
																			<ord:CreateOrder>
																				<provord:ProcessProvisioningOrderEBM>
																					<provord:DataArea>
																						<provord:Process
																							xmlns="http://xmlns.oracle.com/EnterpriseObjects/Core/provord/ProvisioningOrder/V1" />
																						<provord:ProcessProvisioningOrder
																							xmlns="http://xmlns.oracle.com/EnterpriseObjects/Core/provord/ProvisioningOrder/V1">
																							<provord:SalesOrderReference>
																								<provord:SalesOrderXML>
																									<_root index="0"
																										xmlns="urn:com:metasolv:oms:xmlapi:1">
																										<TestData1 index="1449741785198">Hello I am updated
																										</TestData1>
																										<TestData2 index="1449741785199">1212</TestData2>
																										<GetOrderData index="1449741785206">
																											<GetOrder.Response>
																												<OrderID>10</OrderID>
																												<OrderHistID>607</OrderHistID>
																												<Task>TestSOMAutomationInternalAutomationTask1
																												</Task>
																												<OrderSource>TestSOMOrder</OrderSource>
																												<OrderType>TestSOMOrder</OrderType>
																												<Workgroups>
																													<Workgroup>TestSOMRole1</Workgroup>
																												</Workgroups>
																												<OrderState>open.running.in_progress
																												</OrderState>
																												<State>accepted</State>
																												<ExecutionMode>do</ExecutionMode>
																												<AcceptedUserName>oms-automation
																												</AcceptedUserName>
																												<Reference>TestInternalAuto3</Reference>
																												<ExpectedDuration>P1D</ExpectedDuration>
																												<ExpectedOrderCompletionDate>2015-12-11T15:33:05
																													IST</ExpectedOrderCompletionDate>
																												<Priority>5</Priority>
																												<Namespace>TestSOMProject</Namespace>
																												<Version>1.0.0.0.0</Version>
																												<ProcessStatus>n/a</ProcessStatus>
																												<_root index="0">
																													<TestData1 index="1449741785198">asdsada
																													</TestData1>
																													<TestData2 index="1449741785199">1212</TestData2>
																												</_root>
																											</GetOrder.Response>
																										</GetOrderData>
																										<SelfOrderID index="1449741785205">10
																										</SelfOrderID>
																										<TaskName index="1449741785207">UpdatedByTestSOMAutomationInternalAutomationTask1
																										</TaskName>
																									</_root>
																								</provord:SalesOrderXML>
																								<provord:GetOrderResponse>
																									<GetOrder.Response
																										xmlns="urn:com:metasolv:oms:xmlapi:1">
																										<OrderID>10</OrderID>
																										<OrderHistID>809</OrderHistID>
																										<Task>TestSOMAutomationSenderReceiverJMSCorrIDTask1
																										</Task>
																										<OrderSource>TestSOMOrder</OrderSource>
																										<OrderType>TestSOMOrder</OrderType>
																										<Workgroups>
																											<Workgroup>TestSOMRole1</Workgroup>
																										</Workgroups>
																										<OrderState>open.running.in_progress
																										</OrderState>
																										<State>accepted</State>
																										<ExecutionMode>do</ExecutionMode>
																										<AcceptedUserName>oms-automation
																										</AcceptedUserName>
																										<Reference>TestInternalAuto3</Reference>
																										<ExpectedDuration>P1D</ExpectedDuration>
																										<ExpectedOrderCompletionDate>2015-12-11T15:33:05
																											IST</ExpectedOrderCompletionDate>
																										<Priority>5</Priority>
																										<Namespace>TestSOMProject</Namespace>
																										<Version>1.0.0.0.0</Version>
																										<ProcessStatus>n/a</ProcessStatus>
																										<_root index="0">
																											<TestData1 index="1449741785198">Hello I am updated
																											</TestData1>
																											<TestData2 index="1449741785199">1212</TestData2>
																											<GetOrderData index="1449741785206">
																												<GetOrder.Response>
																													<OrderID>10</OrderID>
																													<OrderHistID>607</OrderHistID>
																													<Task>TestSOMAutomationInternalAutomationTask1
																													</Task>
																													<OrderSource>TestSOMOrder</OrderSource>
																													<OrderType>TestSOMOrder</OrderType>
																													<Workgroups>
																														<Workgroup>TestSOMRole1</Workgroup>
																													</Workgroups>
																													<OrderState>open.running.in_progress
																													</OrderState>
																													<State>accepted</State>
																													<ExecutionMode>do</ExecutionMode>
																													<AcceptedUserName>oms-automation
																													</AcceptedUserName>
																													<Reference>TestInternalAuto3</Reference>
																													<ExpectedDuration>P1D</ExpectedDuration>
																													<ExpectedOrderCompletionDate>2015-12-11T15:33:05
																														IST</ExpectedOrderCompletionDate>
																													<Priority>5</Priority>
																													<Namespace>TestSOMProject</Namespace>
																													<Version>1.0.0.0.0</Version>
																													<ProcessStatus>n/a</ProcessStatus>
																													<_root index="0">

																														<TestData1 index="1449741785198">asdsada
																														</TestData1>

																														<TestData2 index="1449741785199">1212
																														</TestData2>
																													</_root>
																												</GetOrder.Response>
																											</GetOrderData>
																											<SelfOrderID index="1449741785205">10
																											</SelfOrderID>
																											<TaskName index="1449741785207">UpdatedByTestSOMAutomationInternalAutomationTask1
																											</TaskName>
																										</_root>
																									</GetOrder.Response>
																								</provord:GetOrderResponse>
																							</provord:SalesOrderReference>
																							<provord:CustomXML>
																								<provord:MySOMTestOrderID>10
																								</provord:MySOMTestOrderID>
																								<provord:Field1>Hello I am updated
																								</provord:Field1>
																								<provord:Field2>1212</provord:Field2>
																							</provord:CustomXML>
																						</provord:ProcessProvisioningOrder>
																					</provord:DataArea>
																				</provord:ProcessProvisioningOrderEBM>
																			</ord:CreateOrder>
																		</soapenv:Body>
																	</soapenv:Envelope>
																</provordResp:MessageBody>
															</provordResp:RequestXML>
															<provordResp:ResponseXML>
																<provordResp:status>SUCCESS</provordResp:status>
																<provordResp:data1>dsdasdas</provordResp:data1>
																<provordResp:data2>12312312</provordResp:data2>
															</provordResp:ResponseXML>
														</provordResp:ResponseMessage>
													</XMLSentReceivedJMSCorrID>
													<STATUS index="1449741785208">SUCCESS</STATUS>
													<TaskName index="1449741785207">UpdatedByTestSOMAutomationInternalAutomationTask1
													</TaskName>
												</_root>
											</GetOrder.Response>
										</provord:GetOrderResponse>
									</provord:SalesOrderReference>
									<provord:CustomXML>
										<provord:MySOMTestOrderID>10</provord:MySOMTestOrderID>
										<provord:Field1>Hello I am updated</provord:Field1>
										<provord:Field2>12312312</provord:Field2>
									</provord:CustomXML>
								</provord:ProcessProvisioningOrder>
							</provord:DataArea>
						</provord:ProcessProvisioningOrderEBM>
					</ord:CreateOrder>
				</soapenv:Body>
			</soapenv:Envelope>
		</provordResp:MessageBody>
	</provordResp:RequestXML>
	<provordResp:ResponseXML>
		<provordResp:status>SUCCESS</provordResp:status>
		<provordResp:data1>Updated by external system</provordResp:data1>
		<provordResp:data2>12312312</provordResp:data2>
	</provordResp:ResponseXML>
</provordResp:ResponseMessage>