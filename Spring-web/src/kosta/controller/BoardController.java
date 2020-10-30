package kosta.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kosta.model.Board;
import kosta.model.BoardDAO;

@Controller
public class BoardController {
	
	@Autowired
	private BoardDAO dao;
	
	@RequestMapping(value="/board_insert", method=RequestMethod.GET)
	public String insertBoard(@ModelAttribute("boardCommand") Board board){
		return "insert_form";
	}
	
	@RequestMapping(value="/board_insert", method=RequestMethod.POST)
	public String board_insert(@ModelAttribute("boardCommand") @Valid Board board, BindingResult errors){
		if(errors.hasErrors()){
			System.out.println("에러발생");
			return "insert_form";
		}
		
		dao.insertBoard(board);
		System.out.println("Controller : " + board);		
		return "";
	}
	
}
