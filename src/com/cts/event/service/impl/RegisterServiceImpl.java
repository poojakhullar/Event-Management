package com.cts.event.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cts.event.bean.Event;
import com.cts.event.bean.Register;
import com.cts.event.dao.RegisterDao;
import com.cts.event.entity.RegisterPO;
import com.cts.event.service.RegisterService;

@Service
public class RegisterServiceImpl implements RegisterService{

	@Autowired
	private RegisterDao registerDao;
	/**
	 * ------------------------------------------------------------------------
	 * Function name : registerUser
	 * Description : This method is used to register a user for event 
	 * @author :
	 * @return : boolean	
	 * @exception : 
	 * --------------------------------------------------------------
	 */
	@Override
	public boolean registerUser(Register register)throws Exception {
		
		RegisterPO registerPO = new RegisterPO();
		registerPO.setEmailId(register.getEmail());
		registerPO.setEventId(register.getEventId());		
		registerPO.setFirstName(register.getFirstName());
		registerPO.setLastName(register.getLastName());
		registerPO.setPhone(register.getPhone());
		registerPO.setUserId(register.getUserId());
		
		return registerDao.registerUser(registerPO);		
	}
	
	/**
	 * ------------------------------------------------------------------------
	 * Function name : fetchTickets
	 * Description : This method is used to fetch ticket count 
	 * @author : event
	 * @return : Event	
	 * @exception : 
	 * --------------------------------------------------------------
	 */
	@Override
	public Event fetchTicketCount(Event event) throws Exception {
		return registerDao.fetchTicketCount(event);
		
	}

	

}
