package com.smhrd.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smhrd.board.mapper.BoardMapper;
import com.smhrd.board.model.Board;

@Service
public class BoardService {
	
	@Autowired //의존성 주입 : 외부에서 객체를 생성하고 싶어서...
	BoardMapper mapper;
	
	// mapper에 있는 놈에 대한 서비스 기능 작성
	// 게시물 작성되면,,,?
	public int boardWrite(Board board) {
		return mapper.boardWrite(board);
		
	}
	
	//homecontroller에서 리스트 만들어서 게시판에 작성된 거 다 보이게,.
	public List<Board> boardList() {
		return mapper.boardList();
	}

	public Board boardContent(int idx) {
		return mapper.boardContent(idx); 
		//2. service에서 mapper에게 보내줌, 서비스에서 호출한 걸 리턴함 이걸 다시 컨트롤러에 보냄?
	}
	
	public int boardDelete(int idx) {
		return mapper.boardDelete(idx);
	}
}
