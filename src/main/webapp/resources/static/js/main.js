// 함수 생성
	function loadList(){
		// 게시물 전체 데이처 요청하는 함수 (비동기 통신)
		$.ajax({
			url:"list", //요청 경로
			type:"get", //요청 방식 (get/post)
			dataType:"json", // 서버에서 반환받는 데이터 형식 json 형태로 데이터 받을 거양... BoardRestController 확인
			success : listView,
				//성공했을 때 응답이 일어나는 데이터를 함수()에 임의적으로 지정
				// 즉 data는 서버에서 응답한 데이터임
				// data에는 테이블 형태의 html를 넣겠다 라고 한 listView 함수를 호출한 거임

			error : function(){
				alert("통신 실패")
			}
			// 콘솔창에 network 들어가서 Request URL 확인해야함! why? 비동기 통신이라!!!
		
		})
	}
	
	function listView(data){
		// 테이블 구조(텍스트)로 게시물 데이터를 출력
		var result = ""
			var cnt = 1 // 화면에 출력되는 게시물 번호 (그냥 단순 변수 지정, 인덱스 번호 아님!)
			// $.each => foreach 문
		    $.each(data, (index,vo)=> { //data : boardlist / vo : Board (배열 안에서 각각 꺼내온 게시물을 vo라는 이름으로 쓰겠다 선언)
		        result += "<tr>";
		        result += "<td>"+ cnt++ +"</td>";
		        									// 배열인 게시물의 idx ...
		        result += "<td><a href='board/content/"+vo.idx+"'>"+vo.title+"</a></td>";
		        result += "<td>"+vo.writer+"</td>";
		        result += "<td>"+vo.indate+"</td>";
		        result += "<td><button class='btn btn-warning btn-sm' onclick='goDelete("+vo.idx+")'>삭제</button></td>"
		        result += "</tr>";
		      })
		      $("#list").html(result) //id가 list인 곳에 html 구조인 result를 추가하겠다 라는 의미
	}
	
	
	// 저 위에 온클릭하면 삭제되는 함수
	function goDelete(idx){
		$.ajax({
			url:"delete/"+idx,  //delete/1
			type:"get",
			success:loadList,   // 삭제가 성공하면 바로 게시물 요청하는 함수 호출
			error:function(){
				alert("삭제 실패")
			}
		})
		
	}