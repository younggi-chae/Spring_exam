package kosta.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.mapper.BoardMapper;

@Repository
public class BoardDAO {
	
	@Autowired
	private SqlSessionTemplate sqlTemplate;
	
	public void insertBoard(Board board){
		sqlTemplate.getMapper(BoardMapper.class).insertBoard(board);
	}
	
	public List<Board> listBoard(){		
		return sqlTemplate.getMapper(BoardMapper.class).listBoard();	
	}
	
	public Board detailBoard(int seq){
		return sqlTemplate.getMapper(BoardMapper.class).detailBoard(seq);
	}
	
	public int updateBoard(Board board){
		return sqlTemplate.getMapper(BoardMapper.class).updateBoard(board);
	}
	
	public int deleteBoard(int seq){
		return sqlTemplate.getMapper(BoardMapper.class).deleteBoard(seq);
	}
	
	public void insertReply(Reply reply){
		sqlTemplate.getMapper(BoardMapper.class).insertReply(reply);
	}
	
	public List<Reply> listReply(int seq){
		return sqlTemplate.getMapper(BoardMapper.class).listReply(seq);
	}
}
