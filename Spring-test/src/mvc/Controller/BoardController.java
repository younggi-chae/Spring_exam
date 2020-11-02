package mvc.Controller;

import java.util.List;

import javax.jws.WebParam.Mode;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import mvc.model.Board;
import mvc.model.Pagination;
import mvc.model.Reply;
import mvc.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	private BoardService service;
	
	@RequestMapping(value="/board_insert", method=RequestMethod.GET)
	public String insertBoard(@ModelAttribute("boardCommand") Board board){
		return "insert_form";		
	}
	
	@RequestMapping(value="/board_insert", method=RequestMethod.POST)
	public String board_insert(@ModelAttribute("boardCommand") @Valid Board board, 
					BindingResult error){
		if(error.hasErrors()){
			System.out.println("에러발생");
			return "insert_form";
		}		
		service.insertBoardService(board);
		return "redirect:board_list";
	}
	
	@RequestMapping("/board_list")
	public String board_list(@RequestParam(required=false, defaultValue ="1") int page,
							 @RequestParam(required=false, defaultValue ="1") int range, Model model){
		
		int listCnt = service.listBoardCntService();
		
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);		
		
		model.addAttribute("list", service.listBoardService(pagination));
		model.addAttribute("pagination", pagination);
		return "list";
	}
	
	@RequestMapping("/board_detail{seq}")
	public String board_detail(Model model, @PathVariable("seq") int seq){
		Board board = service.detailBoardService(seq);
		List<Reply> reply = service.listReply(seq);		
		model.addAttribute("board", board);
		model.addAttribute("replys", reply);
		return "detail";
	}
	
	@RequestMapping(value="/board_update{seq}", method=RequestMethod.GET)
	public String board_update(Model model, @ModelAttribute("boardCommand") Board board,
						@PathVariable("seq") int seq){
		board = service.detailBoardService(seq);
		model.addAttribute("board", board);		
		return "updateForm";
	}
	
	@RequestMapping(value="/board_update", method=RequestMethod.POST)
	public String board_update(@ModelAttribute("boardCommand") Board board){
		service.updateBoardService(board);
		return "redirect:board_list";
	}
	
	@RequestMapping("/board_delete{seq}")
	public String board_delete(@PathVariable("seq") int seq){
		service.deleteBoardService(seq);
		return "redirect:board_list";
	}
		
	/*@RequestMapping(value="/reply_insert", method=RequestMethod.POST)	
	public String reply_insert(Reply reply, @RequestParam("seq") int seq){
		service.insertReplyService(reply);			
		return "redirect:board_detail" + seq;
	}*/
}
