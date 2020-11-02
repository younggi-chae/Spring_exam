package mvc.mapper;

import java.util.List;

import mvc.model.Board;
import mvc.model.Pagination;
import mvc.model.Reply;


public interface BoardMapper {
	int insertBoard(Board board);	
	List<Board> listBoard(Pagination pagination);
	Board detailBoard(int seq);
	int updateBoard(Board board);
	int deleteBoard(int seq);
	int countHit(int seq);
	
	int listBoardCnt();

	int insertReply(Reply reply);
	List<Reply> listReply(int seq);	
	int updateReply(Reply reply);
	int deleteReply(int r_no);
}