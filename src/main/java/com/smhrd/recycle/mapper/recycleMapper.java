package com.smhrd.recycle.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.smhrd.recycle.model.recycle;

@Mapper
public interface recycleMapper {
	
	// 1. 분리수거함 데이터
	@Select("select * from trash")
	public List<recycle> trashList(); // board 객체를 하나로 묶어주는 리스트임
	
	// 2. 폐형광등 데이터
	@Select("select * from lamp")
	public List<recycle> lampList(); // board 객체를 하나로 묶어주는 리스트임
	
	// 3. 폐건전지 데이터
	@Select("select * from battery")
	public List<recycle> batteryList();
	
	// 4. 폐의약품 데이터
	@Select("select * from medicine")
	public List<recycle> medicineList();
	
	// 5. 의류수거함 데이터
	@Select("select * from clothes")
	public List<recycle> clothesList();
	
}
