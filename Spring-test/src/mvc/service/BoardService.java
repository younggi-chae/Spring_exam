package mvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mvc.dao.BoardDAO;
import mvc.model.Board;
import mvc.model.Pagination;
import mvc.model.Reply;

@Service
public class BoardService {

	@Autowired
	private BoardDAO dao;
	
	public void insertBoardService(Board board){
		dao.insertBoard(board);
	}	
	public List<Board> listBoardService(Pagination pagination){
		return dao.listBoard(pagination);
	}	
	
	public int listBoardCntService(){
		return dao.listBoardCnt();
	}
	
	public Board detailBoardService(int seq){
		dao.countHit(seq);
		return dao.detailBoard(seq);
	}	
	public void updateBoardService(Board board){
		dao.updateBoard(board);
	}	
	public void deleteBoardService(int seq){
		dao.deleteBoard(seq);
	}
	
	public void insertReplyService(Reply reply){
		dao.insertReply(reply);
	}
	
	public List<Reply> listReply(int seq){
		return dao.listReply(seq);
	}
	
	public void updateReplyService(Reply reply){
		dao.updateReply(reply);
		System.out.println(reply);
	}
	
	public void deleteReplyService(int r_no){
		dao.deleteReply(r_no);
	}
}

