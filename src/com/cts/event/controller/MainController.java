package com.cts.event.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/")
public class MainController {
	
	@RequestMapping(method = RequestMethod.GET)
	public String eventHome(Model model) {		
		return "landingPage";		
	}

}
