package com.smhrd.recycle;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

// 요청 파라미터 받아주기, 뷰(결과 페이지)를 리턴
@Controller
public class PageController {
	
	@RequestMapping(value = "/list", method=RequestMethod.GET)
	public String list() {
		return "list";
	}
	

}
