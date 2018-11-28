package com.pradipta.osm;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.mslv.oms.automation.AutomationContext;
import com.mslv.oms.automation.AutomationException;
import com.mslv.oms.automation.OrderNotificationContext;
import com.mslv.oms.automation.plugin.AbstractAutomator;

public class PrintOrderXML extends AbstractAutomator {

	/**
	 * 
	 */
	private static final long serialVersionUID = -498455091918009232L;
	public static final Log logger = LogFactory.getLog(PrintOrderXML.class);
	@Override
	public void run(String arg0, AutomationContext arg1) throws AutomationException {
		// TODO Auto-generated method stub
		OrderNotificationContext orderNotificationContext = (OrderNotificationContext)arg1;
		logger.info("Input to run :" + arg0);
		logger.info("GetOrder :" + orderNotificationContext.getOrder());
		logger.info("GetOrderAsDom :" + orderNotificationContext.getOrderAsDom());
	}

}
