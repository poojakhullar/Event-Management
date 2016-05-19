package com.cts.event.controller;

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
import com.cts.event.bean.User;
import com.cts.event.service.EventService;
import com.cts.event.service.LoginService;

@Controller
public class LoginController {
	
	
	@Autowired
	private LoginService loginService;
	
	@Autowired
	private EventService eventService;
	
	/**
	 * ------------------------------------------------------------------------
	 * Function name : displayLogin
	 * Description : This method is used to display login popup 
	 * @author :
	 * @return : loginDefn
	 * @throws :
	 * @exception : 
	 * --------------------------------------------------------------
	 */
	@RequestMapping(method = RequestMethod.GET, value="displayLogin")
	public String displayLogin(Model model,HttpServletRequest request, HttpServletResponse response) {
		return "loginDefn";		
	}
	
	
	/**
	 * ------------------------------------------------------------------------
	 * Function name : displayLogin
	 * Description : This method is used to validate login credentials 
	 * @author :
	 * @return : loginDefn
	 * @throws :
	 * @exception : 
	 * --------------------------------------------------------------
	 */
	@RequestMapping(method = RequestMethod.POST, value="processLogin")
	public String processLogin(Model model, HttpServletRequest request,
			HttpServletResponse response, @Valid User command,
			BindingResult result) {

		User user = (User) command;
		
		try {

			if (result.hasErrors() == false) {

				User userProfile = loginService.getUserDetails(user);

				if (user != null
						&& userProfile != null
						&& StringUtils.equalsIgnoreCase(user.getUserId(),
								userProfile.getUserId())
						&& StringUtils.equals(user.getPassword(),
								userProfile.getPassword())) {
					/*set user details in */
					request.getSession().setAttribute("userSession", userProfile);
					
					/*fetch event details.*/
					Event event = new Event();
					event.setAdminFlag("true");
					List<Event> eventsList = eventService.fetchEvent(event);
					model.addAttribute("eventList", eventsList);
					
					return "manageEventDefn";
					
				}else{model.addAttribute("error", "Invalid login");}
			}else{model.addAttribute("error", "Enter valid credentials");}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", "Error in login");			
		}
		return "loginDefn";
	}
}
