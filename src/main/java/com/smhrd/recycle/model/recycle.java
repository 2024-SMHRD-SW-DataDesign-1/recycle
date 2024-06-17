package com.smhrd.recycle.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@NoArgsConstructor
@Getter
public class recycle {
	
	// 테이블 만들고 model 패키지 만든 후 테이블에 있는 컬럼에 똑같이 맞춰 필드 작성
	// 만들고 getter, setter, 기본 생성자 lombok import 하고 outline에서 확인 필수 !!!
	
	private String address;
	private double latitude;
	private double longitude;
	private String cr_day;
//	public Object model;


}
