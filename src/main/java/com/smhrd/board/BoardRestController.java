package com.smhrd.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.smhrd.board.model.Board;
import com.smhrd.board.service.BoardService;

// @controller : view 반환 (화면 전환)
// spring3 => 비동기 통신 @Controller + @ResponseBody (data만 반환) 지금 이거 함
// spring4 => 비동기통신 @RestController (data 반환)

@Controller
public class BoardRestController {
	
	@Autowired
	BoardService service;
																// 응답하는 데이터에 대한 인코딩 방식 지정
	@RequestMapping(value="/list", method=RequestMethod.GET, produces = "application/text; charset=UTF-8") // 콘솔창의 네트워크에서 본 경로로 설정
	public @ResponseBody String boardList() throws JsonProcessingException {
		
		List<Board> list = service.boardList();
		
		// ***** 게시물 정보를 가지고 있는 list 데이터를 응답 (xml, json** {key:value})
		// JAVA 객체 -> JSON 형태의 문자열로 변환 => Jackson 라이브러리 (디펜던시에 설치함)
		ObjectMapper om = new ObjectMapper(); //Jackson 에서 지원하는 도구
		String jsonString = om.writeValueAsString(list); //변환하고 싶은 객체를 () 안에 넘겨주면 됨
		
		return jsonString;
	}
	
	
	@RequestMapping(value="/delete/{idx}", method=RequestMethod.GET)
	public @ResponseBody String delete(@PathVariable("idx") int idx) {
		
		int res = service.boardDelete(idx);
		
		if(res>0) {
			return "success";
		} else {
			return "fail";
		}
		
	}

}
