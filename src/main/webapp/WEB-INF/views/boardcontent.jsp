<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<!--  model 저장되어 있는 값을 jsp에서 꺼내 쓸 때는 request에서 가져와야 함! -->
<div class="container">
  <h2>데이터디자인반 게시판😎😎</h2>
  <div class="panel panel-default">
    <div class="panel-heading">게시판</div>
    <div class="panel-body">
    	<table class="table table-bordered">
    		<tr>
    			<td>번호</td>
    			<td>${board.idx }</td>
    		</tr>
    		<tr>
    			<td>제목</td>
    			<td>${board.title }</td>
    		</tr>
    		<tr>
    			<td>내용</td>
    			<td>${board.content }</td>
    		</tr>
    		<tr>
    			<td>작성자</td>
    			<td>${board.writer }</td>
    		</tr>
    		<tr>
    			<td>작성일</td>
    			<td>${board.indate }</td>
    		</tr>
    		<tr>
    			<td>이미지</td>
    			<td><img src="data:image/jpg;base64,${board.img }" width="300px" height="300px"></td>
    		</tr>
    		<tr>
    			<td colspan="2" align="center">
    				<button class="btn btn-sm btn-success">리스트</button>    			
    			</td>
    		</tr>
    	</table>
    
    </div>
    <div class="panel-footer">데이터디자인 엔지니어 양성과정 (담임 : 강예진)</div>
  </div>
</div>

</body>
</html>
