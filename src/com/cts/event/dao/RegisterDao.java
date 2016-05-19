package com.cts.event.dao;

import com.cts.event.bean.Event;
import com.cts.event.entity.RegisterPO;

public interface RegisterDao {
	
	/**
	 * ------------------------------------------------------------------------
	 * Function name : registerUser
	 * Description : This method is used to register a user for event 
	 * @author :
	 * @return : String	
	 * @exception : 
	 * --------------------------------------------------------------
	 */
	public boolean registerUser(RegisterPO registerPO)throws Exception;
	
	/**
	 * ------------------------------------------------------------------------
	 * Function name : verifyUserId
	 * Description : This method is used to verify if already exits 
	 * @author :
	 * @return : boolean
	 * @exception : 
	 * --------------------------------------------------------------
	 */
	public boolean verifyUserId(RegisterPO registerPO)throws Exception;
	/**
	 * This method is used to fetch remaining tickets 
	 * @param Event
	 * @return Event 
	 */
	public Event fetchTicketCount(Event event)throws Exception;

}
