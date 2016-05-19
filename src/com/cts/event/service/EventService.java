package com.cts.event.service;

import java.util.List;

import com.cts.event.bean.Event;
import com.cts.event.bean.Register;

public interface EventService {
	
	
	/**
	 * This method is used to create new event
	 * @param Event
	 * @return boolean 
	 */
	public boolean createEvent(Event event)throws Exception;
	
	/**
	 * This method is used to fetch event details
	 * @param eventPO
	 * @return List<eventPO> 
	 */
	public List<Event> fetchEvent(Event event)throws Exception;
	/**
	 * This method is used to fetch participant details
	 * @param 
	 * @return List<Register> 
	 */
	public List<Register> fetchParticipants()throws Exception;

}
