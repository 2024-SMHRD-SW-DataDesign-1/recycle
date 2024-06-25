package com.smhrd.recycle.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smhrd.recycle.mapper.recycleMapper;
import com.smhrd.recycle.model.recycle;

@Service
public class recycleService {
	
	@Autowired
	recycleMapper mapper;

	// recyle 객체를 list 형태로 만들어 trashlist를 생성하고 mapper에 trashlist 리턴
	public List<recycle> trashList() {
		return mapper.trashList();
	}
	
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
