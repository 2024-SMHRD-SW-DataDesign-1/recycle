package com.smhrd.recycle.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smhrd.recycle.mapper.recycleMapper;
import com.smhrd.recycle.model.recycle;

@Service
public class recycleService {
	
	@Autowired //의존성 주입 : 외부에서 객체를 생성하고 싶어서...
	recycleMapper mapper;

	//homecontroller에서 리스트 만들어서 게시판에 작성된 거 다 보이게,.
	public List<recycle> trashList() {
		return mapper.trashList();
	}
	
	//homecontroller에서 리스트 만들어서 게시판에 작성된 거 다 보이게,.
	public List<recycle> lampList() {
		return mapper.lampList();
	}
	
	public List<recycle> batteryList() {
		return mapper.batteryList();
	}
	
	public List<recycle> medicineList() {
		return mapper.medicineList();
	}
	
	public List<recycle> clothesList() {
		return mapper.clothesList();
	}


}
