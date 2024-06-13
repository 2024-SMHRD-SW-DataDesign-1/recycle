package com.smhrd.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.smhrd.board.model.Board;

@Mapper
public interface BoardMapper {
	
	// 필요한 메서드 작성
	public int boardWrite(Board board);
	
	// 게시판 글 전체 보여주는 메서드,
	@Select("select * from board")
	public List<Board> boardList(); // board 객체를 하나로 묶어주는 리스트임
	
	
	public Board boardContent(int idx); //3. 서비스에서 받은 거 xml에서 쿼리문 실행하게 도와줌

	@Delete("delete from board where idx=#{idx}")
	public int boardDelete(int idx);
}
