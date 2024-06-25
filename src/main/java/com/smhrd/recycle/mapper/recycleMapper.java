package com.smhrd.recycle.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.smhrd.recycle.model.recycle;

@Mapper
public interface recycleMapper {
	
	// 1. 분리수거함 데이터
	// trash 컬럼이 가지고 있는 모든 데이터를 출력
	@Select("select * from trash")
	public List<recycle> trashList();
	
	// 2. 폐형광등 데이터
	@Select("select * from lamp")
	public List<recycle> lampList();
	
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
