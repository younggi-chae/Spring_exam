package kosta.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kosta.service.HelloService;

@Controller
	public class HelloController {
		
		@Autowired
		private HelloService service;
		
		@RequestMapping("/hello")
		public String hello(Model model){			
			model.addAttribute("message", service.getMessage());			
			return "hello";
		}
		
		/*ModelAndView mav = new ModelAndView();		
		mav.setViewName("hello");
		mav.addObject("message", service.getMessage());*/

		/*public void setService(HelloService service) {
			this.service = service;
		}*/		
		
	}

