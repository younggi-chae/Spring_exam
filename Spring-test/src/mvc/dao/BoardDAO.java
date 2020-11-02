package mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mvc.mapper.BoardMapper;
import mvc.model.Board;
import mvc.model.Pagination;
import mvc.model.Reply;

@Repository
public class BoardDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void insertBoard(Board board){
		sqlSessionTemplate.getMapper(BoardMapper.class).insertBoard(board);
	}
	
	public List<Board> listBoard(Pagination pagination){
		return sqlSessionTemplate.getMapper(BoardMapper.class).listBoard(pagination);
	}
	
	public int listBoardCnt() {
		return sqlSessionTemplate.getMapper(BoardMapper.class).listBoardCnt();
	}
	
	public Board detailBoard(int seq){
		return sqlSessionTemplate.getMapper(BoardMapper.class).detailBoard(seq);
	}
	
	public void updateBoard(Board board){
		sqlSessionTemplate.getMapper(BoardMapper.class).updateBoard(board);
	}
	
	public void deleteBoard(int seq){
		sqlSessionTemplate.getMapper(BoardMapper.class).deleteBoard(seq);
	}
	
	public void insertReply(Reply reply){
		sqlSessionTemplate.getMapper(BoardMapper.class).insertReply(reply);
	}
	
	public List<Reply> listReply(int seq){
		return sqlSessionTemplate.getMapper(BoardMapper.class).listReply(seq);
	}
	
	public void updateReply(Reply reply){
		sqlSessionTemplate.getMapper(BoardMapper.class).updateReply(reply);
	}
	
	public void deleteReply(int r_no){
		sqlSessionTemplate.getMapper(BoardMapper.class).deleteReply(r_no);
	}
	
	public void countHit(int seq){
		sqlSessionTemplate.getMapper(BoardMapper.class).countHit(seq);
	}
}
