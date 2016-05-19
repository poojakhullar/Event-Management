package com.cts.event.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LogOutController {
	
	
	/**
	 * ------------------------------------------------------------------------
	 * Function name : processLogOut
	 * Description : This method is used to invalidate logged in user 
	 * @author :
	 * @return : landingpage
	 * @throws :
	 * @exception : 
	 * --------------------------------------------------------------
	 */
	@RequestMapping(method = RequestMethod.GET, value="processLogout")
	public String processLogOut(Model model, HttpServletRequest request) {		
		//removes user from session
		request.getSession().invalidate();		
		return "landingPage";
	}
}


