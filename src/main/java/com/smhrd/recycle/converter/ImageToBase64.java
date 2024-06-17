package com.smhrd.recycle.converter;

import java.io.File;
import java.io.IOException;
import java.util.Base64;

import org.apache.commons.io.FileUtils;

public class ImageToBase64 {
	
	// 이미지 파일을 base64로 인코딩한 문자열로 변경해주는 메서드
	public String convert(File file) throws IOException {
		byte[] fileContent = FileUtils.readFileToByteArray(file);
		// 정수가 들어가있는 배열로 변환한다는 뜻 그걸 byte[]에 담겠다는 뜻
		
		return Base64.getEncoder().encodeToString(fileContent);
		// btye[]을 인코딩해서 문자열로 변환한 걸 리턴해줄 거임
		
	}

}
