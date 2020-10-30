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
			/*ModelAndView mav = new ModelAndView();		
			mav.setViewName("hello");
			mav.addObject("message", service.getMessage());*/
			model.addAttribute("message", service.getMessage());
			
			return "hello";
		}

		/*public void setService(HelloService service) {
			this.service = service;
		}*/		
		
	}

