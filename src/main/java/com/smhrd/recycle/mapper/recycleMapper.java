package com.smhrd.recycle.mapper;



import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.smhrd.recycle.model.recycle;

@Mapper
public interface recycleMapper {
	
	// 필요한 메서드 작성
//	public int boardWrite(Board board);
//	
	// 1. 분리수거,
	@Select("select * from trash")
	public List<recycle> trashList(); // board 객체를 하나로 묶어주는 리스트임
	
	//2. 폐형광등
	@Select("select * from lamp")
	public List<recycle> lampList(); // board 객체를 하나로 묶어주는 리스트임
	
	
//	public Board boardContent(int idx); //3. 서비스에서 받은 거 xml에서 쿼리문 실행하게 도와줌
//
//	@Delete("delete from board where idx=#{idx}")
//	public int boardDelete(int idx);
}
