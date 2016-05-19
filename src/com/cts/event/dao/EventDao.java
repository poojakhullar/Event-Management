package com.cts.event.dao;

import java.util.List;

import com.cts.event.entity.EventPO;
import com.cts.event.entity.RegisterPO;

public interface EventDao {
	
	/**
	 * This method is used to create new event
	 * @param eventPO
	 * @return boolean 
	 */
	public boolean createEvent(EventPO eventPO)throws Exception;
	
	/**
	 * This method is used to fetch event details
	 * @param eventPO
	 * @return List<eventPO> 
	 */
	public List<EventPO> fetchEvent(EventPO eventPO)throws Exception;
	/**
	 * This method is used to fetch participant details
	 * @param 
	 * @return List<RegisterPO> 
	 */
	public List<RegisterPO> fetchParticipants()throws Exception;

}
