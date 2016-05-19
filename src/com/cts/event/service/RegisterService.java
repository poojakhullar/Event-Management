package com.cts.event.service;

import com.cts.event.bean.Event;
import com.cts.event.bean.Register;

public interface RegisterService {
	
	/**
	 * This method is used to register participants 
	 * @param Register
	 * @return boolean
	 */
	public boolean registerUser(Register register)throws Exception;
	/**
	 * This method is used to fetch remaining tickets 
	 * @param Event
	 * @return Event 
	 */
	public Event fetchTicketCount(Event event)throws Exception;
}
