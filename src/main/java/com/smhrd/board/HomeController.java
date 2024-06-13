package com.smhrd.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.smhrd.board.model.Board;
import com.smhrd.board.service.BoardService;

@Controller
public class HomeController {
	
	@Autowired
	BoardService service;
	
	
	// localhost:8089/board/   => board 뒤에 오는 값을 value에 다 적어야 한다고 생각하면 됨
	@RequestMapping(value="/", method = RequestMethod.GET)
	public String boardList(Model model) {
		
		List<Board> list = service.boardList();
//		System.out.println(list.size()); 그냥 잘 들어오나 확인 용
		
		model.addAttribute("list", list); //모델 사용해서 ... 흠냥 값 넣는 건가?
		
		return "boardlist";
	}
	
	// localhost:8089/board/form
	@RequestMapping(value="/form", method=RequestMethod.GET)
	public String boardForm() {
		return "boardform";
	}
	
	
}
