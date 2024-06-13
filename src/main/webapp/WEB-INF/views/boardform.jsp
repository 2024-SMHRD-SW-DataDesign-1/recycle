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
 
<div class="container">
  <h2>데이터디자인반 게시판😎😎</h2>
  <div class="panel panel-default">
    <div class="panel-heading">게시판</div>
    <div class="panel-body">
    <!-- localhost:8089/board/form/write , insert 작업은 거의 post 라고 생각하면 됨 -->
    <!-- enctype (인코딩 타입) 기본 타입 : application/x-www-form-urlencoded
    지금은 파일도 보낼 거니까 multipart/form-data로 지정한 것임 -->
    	  <form action="form/write" method="post" enctype="multipart/form-data" class="form-horizontal">
		    <div class="form-group">
		      <label class="control-label col-sm-2" for="title">제목:</label>
		      <div class="col-sm-10">
		      <!-- 클래스의 필드와 name을 정확하게 일치 시켜야함 -->
		        <input type="text" name="title" class="form-control" id="title" placeholder="Enter title">
		      </div>
		    </div>
		    <div class="form-group">
		      <label class="control-label col-sm-2" for="content">내용:</label>
		      <div class="col-sm-10">          
		        <textarea name="content" rows="10" class="form-control"></textarea>
		      </div>
		    </div>
		    <div class="form-group">
		      <label class="control-label col-sm-2" for="writer">작성자:</label>
		      <div class="col-sm-10">          
		        <input type="text" name="writer" class="form-control">
		      </div>
		    </div>
		    <div class="form-group">
		      <label class="control-label col-sm-2" for="photo">Photo:</label>
		      <div class="col-sm-10">
		      <!-- 이놈 인코딩 방식은 multipart/form-data라서 텍스트 따로 파일 따로 받을 수 있음 -> 필드와 이름 맞출 필요 없음
		      맞추면 model 어트리뷰트 쪽에서 맞추려고 하다가 오류 난다??????
		      고냥 이름 알아볼 수 있게만 하게 포트로 바꿈 -->          
		         <input type="file" name="photo" class="form-control" id="photo">
		      </div>
		     
		    </div>
		    <div class="form-group">        
		      <div class="col-sm-offset-2 col-sm-10">
		        <button type="submit" class="btn btn-success btn-default">작성</button>
		        <button type="reset" class="btn btn-warning btn-default">리셋</button>
		      </div>
		    </div>
		  </form>
    
    </div>
    <div class="panel-footer">데이터디자인 엔지니어 양성과정 (담임 : 강예진)</div>
  </div>
</div>
</body>
</html>
