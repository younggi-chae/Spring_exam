package kosta.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kosta.model.Board;
import kosta.model.BoardDAO;
import kosta.model.Reply;

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
		return "redirect:board_list";
	}
	
	@RequestMapping("/board_list")
	public String board_list(Model model){		
		List<Board> list = dao.listBoard();
		model.addAttribute("list", list);
		return "list";		
	}
	
	@RequestMapping("/board_detail{seq}")
	public String board_detail(@PathVariable int seq, Model model){
		Board board = dao.detailBoard(seq);
		List<Reply> reply = dao.listReply(seq);
		model.addAttribute("replys", reply);
		model.addAttribute("board", board);
		return "detail";
	}
	
	@RequestMapping(value="/board_update{seq}", method=RequestMethod.GET)
	public String board_update(@ModelAttribute("boardCommand") Board board,
								@PathVariable int seq, Model model){	
		board = dao.detailBoard(seq);
		model.addAttribute("board", board);
		return "updateForm";
	}
	
	@RequestMapping(value="/board_update", method=RequestMethod.POST)
	public String board_update(@ModelAttribute("boardCommand") Board board){		
	  
		dao.updateBoard(board);	  
		return "redirect:board_list";
	}
	
	@RequestMapping("/board_delete{seq}")
	public String board_delete(@PathVariable int seq){
		dao.deleteBoard(seq);
		return "redirect:board_list";
	}
	
	@RequestMapping(value="/reply_insert", method=RequestMethod.POST)
	public String reply_insert(@RequestParam("seq") int seq,  Reply reply){
		dao.insertReply(reply);
		return "redirect:board_detail" + seq;
	}	
	
}
