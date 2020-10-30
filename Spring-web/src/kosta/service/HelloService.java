package kosta.service;

import org.springframework.stereotype.Service;

@Service
public class HelloService {	
	
	public String getMessage(){
		return "오늘도 수고하셨습니다.";
	}
}
