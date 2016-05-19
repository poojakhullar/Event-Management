package com.cts.event.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cts.event.bean.Event;
import com.cts.event.bean.Register;
import com.cts.event.service.EventService;

@Controller
public class EventController {
	
	@Autowired
	private EventService eventService;
	/**
	 * ------------------------------------------------------------------------
	 * Function name : displayEvents
	 * Description : This method is used to display event page 
	 * @author :
	 * @return : eventDefn
	 * @throws :
	 * @exception : 
	 * --------------------------------------------------------------
	 */
	@RequestMapping(method = RequestMethod.GET, value="displayEvents")
	public String displayEvents(Model model,HttpServletRequest request) {
		try{
		List<Event> eventList = eventService.fetchEvent(new Event());
		model.addAttribute("eventList", eventList);
		}catch(Exception e){
			model.addAttribute("error","Error occured while fetching Event details");
			e.printStackTrace();}
		return "eventDefn";		
	}
	
	/**
	 * ------------------------------------------------------------------------
	 * Function name : manageEvents
	 * Description : This method is used display manage events page 
	 * @author :
	 * @return : manageEventDefn
	 * @throws :
	 * @exception : 
	 * --------------------------------------------------------------
	 */
	@RequestMapping(method = RequestMethod.GET, value="manageEvents")
	public String manageEvents(Model model,HttpServletRequest request) {
		
		List<Event> eventsList = null;
		try{
			Event event=new Event();
			/*to fetch all events for admin*/
			event.setAdminFlag("true");
			eventsList = eventService.fetchEvent(event);}catch(Exception e){
			model.addAttribute("error","Something went wrong.");
			e.printStackTrace();}		
		model.addAttribute("eventList", eventsList);
		return "manageEventDefn";		
	}
	
	/**
	 * ------------------------------------------------------------------------
	 * Function name : displayCreateEvent
	 * Description : This method is used to open create event popup 
	 * @author :
	 * @return : createEvent
	 * @throws :
	 * @exception : 
	 * --------------------------------------------------------------
	 */
	@RequestMapping(method = RequestMethod.GET, value="displayCreateEvent")
	public String displayCreateEvent(Model model,HttpServletRequest request) {		
		model.addAttribute("event",new Event());
		return "createEvent";		
	}
	
	/**
	 * ------------------------------------------------------------------------
	 * Function name : createEvent
	 * Description : This method is used to create new event 
	 * @author :
	 * @return : manageEventDefn
	 * @throws :
	 * @exception : 
	 * --------------------------------------------------------------
	 */
	@RequestMapping(method = RequestMethod.POST, value="processCreateEvent")
	public String createEvent(Model model,HttpServletRequest request,HttpServletResponse response,@Valid Event command,BindingResult result) {
		Event event = (Event)command;		
		try{						
			boolean validDate = validateDate(event,model);
			if(result.hasErrors() || !validDate){				
				
				if(validDate==true){
					
				model.addAttribute("error","Enter all the fields.");
				
				if(result.getErrorCount()==1 && result.hasFieldErrors("noOfParticipants")){					
					event.setNoOfParticipants(null);
					model.addAttribute("error","Enter valid input for participants");
				}				
				}								
				model.addAttribute("event",event);
				return "createEvent";
			}
		eventService.createEvent(event);
		/*fetch event details*/
		event.setAdminFlag("true");
		List<Event> eventList = eventService.fetchEvent(event);
		model.addAttribute("eventList", eventList);
		}catch(Exception e){
			model.addAttribute("error","Something went wrong.");
			e.printStackTrace();
			return "createEvent";}
		return "manageEventDefn";		
	}
	
	/**
	 * ------------------------------------------------------------------------
	 * Function name : manageEvents
	 * Description : This method is used display manage events page 
	 * @author :
	 * @return : manageEventDefn
	 * @throws :
	 * @exception : 
	 * --------------------------------------------------------------
	 */
	@RequestMapping(method = RequestMethod.GET, value="fetchParticipants")
	public String fetchParticipants(Model model,HttpServletRequest request) {
		
		List<Register> participantList = null;
		try{
		participantList = eventService.fetchParticipants();}catch(Exception e){
			model.addAttribute("error","Something went wrong.");
			e.printStackTrace();}		
		model.addAttribute("participantList", participantList);
		return "manageEventDefn";		
	}	

	/**
	 * ------------------------------------------------------------------------
	 * Function name : validateDate
	 * Description : This method is used to validate event start and end time 
	 * @author :
	 * @return : boolean
	 * @throws : ParseException
	 * --------------------------------------------------------------
	 */
	public boolean validateDate(Event event,Model model) throws ParseException{
		DateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		
		if(StringUtils.isBlank(event.getEventEndDate()) || StringUtils.isBlank(event.getEventStartDate())){
			model.addAttribute("error","Enter all the fields.");
			return false;
		}		
		Date startTime = format.parse(event.getEventStartDate());
		Date endTime = format.parse(event.getEventEndDate());
		
		if(startTime.before(new Date()) || startTime.after(endTime)){
			model.addAttribute("error", "Enter valid event dates");
			event.setEventEndDate(null);
			event.setEventStartDate(null);
			return false;
		}
		
		return true;
	}
	
	
}
