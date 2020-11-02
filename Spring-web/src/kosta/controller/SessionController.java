package kosta.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SessionController {
	
	@RequestMapping("/session_req")
	public String session_req(){
		return "session/session_req";
	}
	
	@RequestMapping("/session_do")
	public String session_do(HttpServletRequest request){
		return "session/session_success";
	}
	
	@RequestMapping("/session_add")
	public String session_add(){
		return "session/session_add";
	}
}
