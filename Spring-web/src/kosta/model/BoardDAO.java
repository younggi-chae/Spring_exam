package kosta.model;

import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {
	
	public void insertBoard(Board board){
		System.out.println("DAO : " + board);
	}
}
