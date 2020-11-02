package kosta.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kosta.model.Board;
import kosta.model.BoardDAO;
import kosta.model.Member;

@RestController
public class JsonController {
	
	@Autowired
	private BoardDAO dao;
	
	@RequestMapping("/board_list_json")
	public List<Board> board_list_json(){
		List<Board> list = dao.listBoard();		
		return list;
	}	
	
	@RequestMapping("/spring_json")
	public List<Member> spring_json(){
		List<Member> list = new ArrayList<>();
		list.add(new Member("홍길동", "가산"));
		list.add(new Member("박길동", "강남"));
		
		return list;
	}
}
