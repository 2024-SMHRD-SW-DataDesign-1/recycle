<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
  <h2>데이터디자인반 게시판😎😎</h2>
  <div class="panel panel-default">
    <div class="panel-heading">게시판</div>
    <div class="panel-body">
    	  <table class="table table-bordered">
		    <thead>
		      <tr>
		        <th>번호</th>
		        <th>제목</th>
		        <th>작성자</th>
		        <th>작성일</th>
		      </tr>
		    </thead>
		    <tbody>
			  <!--게시물 리스트 출력-->
			  <!-- 변수 이름은 b, foreach 문 사용하는 거고 list를 반복시킬 겨 -->
			  <c:forEach var="b" items="${list}"> <!-- 이 친구도 foreach 문 -->
		      	<tr>
		      		<td>${b.idx}</td>
		      		<!-- board.content/?idx=게시물 번호 (idx) => get방법 @RequestParam, @ModelAttribute -->
		      		<!-- board.content/게시물 번호 (idx) => @PathVariable -->
		      		<!-- 글 누르면 그 게시판 내용에 가게 인덱스 번호로 링크 걸어놓은 거임 -->
		      		<td><a href="content/${b.idx}">${b.title }</a></td>
		      		<td>${b.writer }</td>
		      		<td>${b.indate }</td>
		      	</tr>
		      </c:forEach>
		      
		      <tr>
		      	<td colspan="4">
		      				<!-- location 객체 사용해 링크 (href) 연결 -> form으로 이동 -->
		      				<!-- btn은 부트스트랩 버튼 모양.  -->
		      		<button class="btn btn-sm btn-success" onclick="location.href='form'">글작성</button>
		      	</td>
		      </tr>
		    </tbody>
		  </table>
    
    </div>
    
        <div class="panel-body">
    	  <table class="table table-bordered">
		    <thead>
		      <tr>
		        <th>번호</th>
		        <th>제목</th>
		        <th>작성자</th>
		        <th>작성일</th>
		      </tr>
		    </thead>
		    <tbody id="list">
			  
		    </tbody>
		  </table>
    
    </div>
    
    <div class="panel-footer">데이터디자인 엔지니어 양성과정 (담임 : 강예진)</div>
  </div>
</div>

<script src="resources/static/js/main.js"></script>
<script>
	// boardlist.jsp 가 로딩이 되었을 때 (화면이 출력되었을 때)
	// loadlist() 함수를 바로 실행하는 방법임
	$(document).ready(function(){
		loadList()
	})
	// resources - static - js - main.js로 함수 옮겨놨음!
	// 외부 자바 스크립트 가져오기 위해 경로 지정 필수!! -> 위에 경로 지정 했슴둥~~
</script>

</body>
</html>
