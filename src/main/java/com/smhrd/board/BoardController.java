package com.smhrd.board;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.smhrd.board.converter.ImageToBase64;
import com.smhrd.board.model.Board;
import com.smhrd.board.service.BoardService;

@Controller // 역할 부여...
public class BoardController {
	
	@Autowired
	BoardService service;
	
	
	
	@RequestMapping(value="/form/write", method=RequestMethod.POST)
	public String boardWrite(@ModelAttribute Board board //텍스트 board에 받는다   //throws는 예외처리 (tyr/cacth 같은 것)
							,@RequestPart("photo") MultipartFile file ) throws IllegalStateException, IOException {
							// @RequestPart는 파일 받기 위한 놈 photo를 받을 거고 형식은 멀티파트파일 변수명은 파일
		
//		System.out.println(board.getWriter()); 값 잘 들어가는지 확인용
//		System.out.println(board.getTitle());
//		System.out.println(board.getContent());
//		System.out.println(file.getOriginalFilename()); //파일명 확인하는 거
		
		// 이런식으로 동작을 한다 정도 확인..
//		Board b = new Board();
//		b.setTitle("테스트");
//		b.setWriter("테스트");
//		b.setContent("테스트");
//		b.setIdx(0); //기본 값이 int라 0임
		// 값을 안 보냈으니 img => null
		// indate => null //now() 현재 시간
		
		
		String uploadFolder = "C://img"; //파일 저장 경로 지정
		
		// UUID : 랜덤 문자열 생성 (겹치지 않도록 생성)
		String fileName = UUID.randomUUID().toString()+file.getOriginalFilename();
		file.transferTo(new File(uploadFolder, fileName)); 
		// transferTo : 파일 객체 생성해서 파일 지정 가능 , (경로, 파일 이름)
		
		board.setImg(fileName); //초기화 할 때 사용
		
		//service 에 있는 놈 호출
		int res = service.boardWrite(board);
		
		if (res>0) {
			return "redirect:/";
		} else {
			return "redirect:/form";
		}
		
	}
	
	
	@RequestMapping(value="/content/{idx}", method=RequestMethod.GET)
	public String boardContent(@PathVariable("idx") int idx
							, Model model) throws IOException {
		System.out.println(idx);
		// 인덱스 번호를 가진 친구의 게시물을 다 가져옴
		
		Board board = service.boardContent(idx); //1. 결과를 위해 서비스 호출
		
		// board list에서 제목을 선택했을 때 그에 해당하는 값들을 콘솔창에 출력
//		System.out.println(board.getIdx());
//	    System.out.println(board.getTitle());
//	    System.out.println(board.getContent());
//	    System.out.println(board.getWriter());
//	    System.out.println(board.getIndate());
//	    System.out.println(board.getImg());
	    
		
		// 1.  img => 제목 ~~> C://img 폴더 안에서 해당 제목을 가진 파일 가져오기
		// 2. Base64 인코딩 방식 (이미지 -> 텍스트, 텍스트 -> 이미지로 변환 가능)
		
		String imgPath = "C:\\img\\"+board.getImg();
		// 이미지 경로에 있는 이미지 제목까지 저장 가능?
		File imgFile = new File(imgPath);
		
		ImageToBase64 convert = new ImageToBase64();
		String imgBase64String = convert.convert(imgFile);
		
//		System.out.println(imgBase64String); 이미지의 이름과 확장자만 가져오는 것
		board.setImg(imgBase64String); //이미지 자체를 반환
		
		model.addAttribute("board", board);
		
		return "boardcontent";
		
		
	}
	

}
