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
								
	
	// 응답하는 데이터에 대한 인코딩 방식 지정
	@RequestMapping(value="/trash", method=RequestMethod.GET, produces = "application/text; charset=UTF-8") // 콘솔창의 네트워크에서 본 경로로 설정
	public @ResponseBody String trashList() throws JsonProcessingException {
		System.out.println(1);
		List<recycle> list = service.trashList();
		System.out.println(2);
		// ***** 게시물 정보를 가지고 있는 list 데이터를 응답 (xml, json** {key:value})
		// JAVA 객체 -> JSON 형태의 문자열로 변환 => Jackson 라이브러리 (디펜던시에 설치함)
		ObjectMapper om = new ObjectMapper(); //Jackson 에서 지원하는 도구
		System.out.println(3);
		String jsonString = om.writeValueAsString(list); //변환하고 싶은 객체를 () 안에 넘겨주면 됨
		System.out.println(4);
		
		return jsonString;
	}
	
	

}
