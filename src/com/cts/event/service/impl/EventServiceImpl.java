package com.cts.event.service.impl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cts.event.bean.Event;
import com.cts.event.bean.Register;
import com.cts.event.dao.EventDao;
import com.cts.event.entity.EventPO;
import com.cts.event.entity.RegisterPO;
import com.cts.event.service.EventService;

@Service
public class EventServiceImpl implements EventService {

	
	@Autowired
	private EventDao eventDao;
	
	DateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm");
	
	/**
	 * ------------------------------------------------------------------------
	 * Function name : createEvent
	 * Description : This method is used to create new event 
	 * @author :
	 * @return : boolean
	 * --------------------------------------------------------------
	 */
	@Override
	public boolean createEvent(Event event) throws Exception {	
		
		EventPO eventPO = new EventPO();		
		eventPO.setEventName(event.getEventName());
		eventPO.setEventType(event.getEventType());		
		eventPO.setParticipants(event.getNoOfParticipants());
		eventPO.setEventStartDate(format.parse(event.getEventStartDate()));
		eventPO.setEventEndDate(format.parse(event.getEventEndDate()));
		eventPO.setApproved("N");
		eventPO.setHost(event.getHost());
		return eventDao.createEvent(eventPO);		
	}


	/**
	 * ------------------------------------------------------------------------
	 * Function name : fetchEvent
	 * Description : This method is used to event details 
	 * @author :
	 * @return : Event List
	 * --------------------------------------------------------------
	 */
	@Override
	public List<Event> fetchEvent(Event event) throws Exception {
		EventPO eventPO = new EventPO();
		if(event!=null){
		eventPO.setEventId(event.getEventId());
		eventPO.setAdminFlag(event.getAdminFlag());
		}
		List<Event> eventList = new ArrayList<Event>();
		List<EventPO> eventListPO = eventDao.fetchEvent(eventPO);
		String startDate = null;
		String endDate = null;
		for(EventPO events:eventListPO){
			Event eventVO = new Event();
			eventVO.setEventId(events.getEventId());
			eventVO.setEventName(events.getEventName());
			eventVO.setEventType(events.getEventType());
			
			if(events.getEventStartDate()!=null){
			startDate = format.format(events.getEventStartDate());}			
			eventVO.setEventStartDate(startDate);
			
			if(events.getEventEndDate()!=null){
				endDate = format.format(events.getEventEndDate());
			}
			eventVO.setEventEndDate(endDate);
			eventVO.setHost(events.getHost());
			eventVO.setNoOfParticipants(events.getParticipants());
			eventList.add(eventVO);
		}
		return eventList;
	}

	/**
	 * ------------------------------------------------------------------------
	 * Function name : fetchParticipants
	 * Description : This method is used to participants details 
	 * @author :
	 * @return : list.
	 * --------------------------------------------------------------
	 */
	@Override
	public List<Register> fetchParticipants() throws Exception {
		List<RegisterPO> list = eventDao.fetchParticipants();
		List<Register> participantList = new ArrayList<Register>();
		Register register = null;
		for(RegisterPO registerPO:list){
			register = new Register();
			register.setEmail(registerPO.getEmailId());
			register.setFirstName(registerPO.getFirstName());
			register.setLastName(registerPO.getLastName());
			register.setPhone(registerPO.getPhone());
			register.setUserId(registerPO.getUserId());
			register.setEventName(registerPO.getEventPO().getEventName());
			register.setEventType(registerPO.getEventPO().getEventType());
			participantList.add(register);			
		}
		return participantList;
	}

}
