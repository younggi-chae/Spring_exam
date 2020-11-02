package mvc.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import mvc.model.Reply;
import mvc.service.BoardService;

@RestController
@RequestMapping("/restBoard")
public class RestBoardController {
	
	//private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService service;
	
	@RequestMapping(value="/reply_list", method=RequestMethod.POST)
	public List<Reply> reply_list(@RequestParam("seq") int seq) {
		return service.listReply(seq);
	}
	
	@RequestMapping(value = "/reply_insert", method = RequestMethod.POST)
	public ResponseEntity<Reply> reply_insert(@RequestBody Reply reply){
		service.insertReplyService(reply);		
		if(reply == null){
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		    return new ResponseEntity<>(reply, HttpStatus.OK);
	}
	
	@RequestMapping(value="/reply_update", method={RequestMethod.GET, RequestMethod.POST})
	public ResponseEntity<Reply> reply_update(@RequestBody Reply reply){
		service.updateReplyService(reply);		
		if(reply == null){
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
			return new ResponseEntity<>(reply, HttpStatus.OK);
	}

	
	@RequestMapping(value="/reply_delete", method={RequestMethod.GET, RequestMethod.POST})
	public ResponseEntity<Integer> reply_delete(@RequestParam("r_no") int r_no){
		service.deleteReplyService(r_no);		
		if(r_no == 0){
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
			return new ResponseEntity<>(r_no, HttpStatus.OK);
	}
}
