package com.smhrd.recycle;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.smhrd.recycle.model.recycle;
import com.smhrd.recycle.service.recycleService;

@Controller
public class RecycleRestController {
	@Autowired
	recycleService service;
									
	// 비동기통신 이용, 경로는 recycle/trash. get 방식으로 요청하고 응답하는 데이터에 대한 인코딩 방식 지정
	@RequestMapping(value="/trash", method=RequestMethod.GET, produces = "application/text; charset=UTF-8")
	public @ResponseBody String trashList() throws JsonProcessingException {
		// service의 trashlist 가져옴
		List<recycle> list = service.trashList();
		// jackson 라이브러리의 클래스
		ObjectMapper om = new ObjectMapper(); 
		// String 타입으로 저장
		String jsonString = om.writeValueAsString(list); 
		
		// jsonString 리턴
		return jsonString;
	}
	
	@RequestMapping(value="/lamp", method=RequestMethod.GET, produces = "application/text; charset=UTF-8") 
	public @ResponseBody String lampList() throws JsonProcessingException {
		List<recycle> list = service.lampList();
		ObjectMapper om = new ObjectMapper();
		String jsonString = om.writeValueAsString(list); 
		
		return jsonString;
	}
	
	@RequestMapping(value="/battery", method=RequestMethod.GET, produces = "application/text; charset=UTF-8")
	public @ResponseBody String batteryList() throws JsonProcessingException {
		List<recycle> list = service.batteryList();
		ObjectMapper om = new ObjectMapper(); 
		String jsonString = om.writeValueAsString(list); 
		
		return jsonString;
	}
	
	@RequestMapping(value="/medicine", method=RequestMethod.GET, produces = "application/text; charset=UTF-8")
	public @ResponseBody String medicineList() throws JsonProcessingException {
		List<recycle> list = service.medicineList();
		ObjectMapper om = new ObjectMapper(); 
		String jsonString = om.writeValueAsString(list); 
		
		return jsonString;
	}
	
	@RequestMapping(value="/clothes", method=RequestMethod.GET, produces = "application/text; charset=UTF-8")
	public @ResponseBody String clothesList() throws JsonProcessingException {
		List<recycle> list = service.clothesList();
		ObjectMapper om = new ObjectMapper(); 
		String jsonString = om.writeValueAsString(list); 
		
		return jsonString;
	}
	
	

}
