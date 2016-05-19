package com.cts.event.controller;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cts.event.bean.Event;
import com.cts.event.bean.Register;
import com.cts.event.service.EventService;
import com.cts.event.service.RegisterService;

@Controller
public class RegistrationController {
	
	@Autowired
	private EventService eventService;
	
	@Autowired
	private RegisterService registerService;
	
	/**
	 * ------------------------------------------------------------------------
	 * Function name : displayRegistration
	 * Description : This method is used to display registration page 
	 * @author :
	 * @return : registerDefn	
	 * @exception : 
	 * --------------------------------------------------------------
	 */
	@RequestMapping(method = RequestMethod.GET, value="displayRegistration")
	public String displayRegistration(Model model,HttpServletRequest request, HttpServletResponse response) {
		List<Event> eventList = null;
		try{
			eventList = eventService.fetchEvent(new Event());}catch(Exception e){
			model.addAttribute("error", "Something went Wrong.");
			e.printStackTrace();
		}
		model.addAttribute("eventList", eventList);
		model.addAttribute("register", new Register());		
		return "registerDefn";		
	}

	/**
	 * ------------------------------------------------------------------------
	 * Function name : processRegistration
	 * Description : This method is used to process registration 
	 * @author :
	 * @return : registerDefn	
	 * @exception : 
	 * --------------------------------------------------------------
	 */
	@RequestMapping(method = RequestMethod.POST, value="processRegistration")
	public String processRegistration(HttpServletRequest request, HttpServletResponse response,Model model,@Valid Register command,BindingResult result) {
		List<Event> eventList = null;
		Register register  = (Register)command;		
		String msg = null;
		boolean registered = false;
		try{
			/*fetch events list*/
			eventList = eventService.fetchEvent(new Event());
			//validation check			
			if(result.hasErrors()==false){
			/*register user*/			
			registered = registerService.registerUser(register);
			if(registered){
				register = new Register();
				msg = "Registered Successfully";
			}else{
				register.setUserId(null);
				msg = "User already registered for this event";
			}
			
			}
			
		}catch(Exception e){
			model.addAttribute("error", "Something Went wrong.");
			register=new Register();
			e.printStackTrace();
		}
		model.addAttribute("msg", msg);
		model.addAttribute("eventList", eventList);
		model.addAttribute("register", register);
		return "registerDefn";		
	}
	
	/**
	 * ------------------------------------------------------------------------
	 * Function name : onEventChange
	 * Description : This method is used to fetch event details on event Id 
	 * @author :
	 * @return : registerDefn	
	 * @exception : 
	 * --------------------------------------------------------------
	 */
	@RequestMapping(method = RequestMethod.POST, value="onEventChange")
	@ResponseBody
	public Event onEventChange(HttpServletRequest request, HttpServletResponse response,Model model,@Valid Register command,BindingResult result) {
		List<Event> eventList = null;
		Register register  = (Register)command;	
		Event event = new Event();
		try{
			/*fetch event detail*/			
			event.setEventId(register.getEventId());
			event.setAdminFlag("true");
			eventList = eventService.fetchEvent(event);						
			if(eventList!=null && eventList.size()==1){
			event = eventList.get(0);}
			
			/*fetch ticket detail*/
			registerService.fetchTicketCount(event);
			/*event.setTicketCount(event.getNoOfParticipants()-event.getTicketCount());*/			
		}catch(Exception e){
			model.addAttribute("error", "Something Went wrong.");
			register=new Register();
			e.printStackTrace();
		}		
		return event;		
	}
	
}
	