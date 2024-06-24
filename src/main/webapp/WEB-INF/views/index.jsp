<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>
<head>
<title>RE+ECO</title>
<meta charset="UTF-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/css/main.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>

</head>
<body class="is-preload">
   <div id="page-wrapper">

      <!-- Header -->
      <jsp:include page="header.jsp"></jsp:include>
      
      <!-- Banner -->
      <img src="resources/images/noah.jpg" style="width: 100%; height: 775px;">
              
      <!-- Highlights -->
            <section class="wrapper style1">
               <div class="container">
                  <div class="row gtr-200">
                     <section class="col-4 col-12-narrower">
                        <div class="box highlight">
                           <i class="icon solid major fa-recycle"></i>
                           <h3>정확한 분리 배출법</h3>
                           <p>누구나 쉽게 알아볼 수 있는<br>재질별•품목별 분리 배출법 제공</p>
                        </div>
                     </section>
                     <section class="col-4 col-12-narrower">
                        <div class="box highlight">
                           <i class="icon solid major fa-trash"></i>
                           <h3>올바른 처리 방법</h3>
                           <p>재밌는 퀴즈를 통해<br>올바른 처리 방법 제공</p>
                        </div>
                     </section>
                     <section class="col-4 col-12-narrower">
                        <div class="box highlight">
                           <i class="icon solid major fa-map"></i>
                           <h3>수거함 위치 제공</h3>
                           <p>API를 이용하여 전국적으로<br>다양한 수거함 위치 제공</p>
                        </div>
                     </section>
                  </div>
               </div>
            </section>      
         
      <!-- 문구 -->
      <section class="wrapper style1">
               <div class="container">
                  <div class="row gtr-200">
                     <section class="col-4 col-12-narrower">
                        <div class="box highlight">
                           
                        </div>
                     </section>
                     <section class="col-4 col-12-narrower">
                        <div class="box highlight">
                           <h3>"플라스틱 없이 사는 건 불가능해요"</h3>
                           <h3>"일회용품을 하나도 안 쓸 순 없어요"</h3>
                           <p>&nbsp;</p>
                           <h3>당신의 친환경 생활,</h3>
                           <h3>생각처럼 쉽지 않나요?</h3>
                           <p>&nbsp;</p>
                           <h3>잘 버리는 일부터</h3>
                           <h3>시작 해보는 건 어떨까요?</h3>
                           <h3>잘 버리기만 해도 쓰레기는</h3>
                           <h3>훌륭한 자원이 된답니다</h3>
                        </div>
                     </section>
                  </div>
               </div>
            </section>
            
            <!-- UpDownBtn-->
			<div class="upBtns">
				<div class="moveTopBtn">↑</div>
			</div>

			<div class="downBtns">
				<div class="moveBottomBtn">↓</div>
			</div>	
			
			<script type="text/javascript">
				const topBtn = document.querySelector(".moveTopBtn");
				
				// 버튼 클릭 시 맨 위로 이동
				 topBtn.onclick = () => {
				
				  window.scrollTo({ top: 0, behavior: "smooth" });  
				}
	
				const bottomBtn = document.querySelector(".moveBottomBtn");
	
				// 버튼 클릭 시 페이지 하단으로 이동
				 bottomBtn.onclick = () => {
					 
				  window.scrollTo({ top: document.body.scrollHeight, behavior: "smooth" });
				};
			</script>
               
         <!-- Footer -->
      <jsp:include page="footer.jsp"></jsp:include>

   </div>

   <!-- Scripts -->
   <script src="resources/js/jquery.min.js"></script>
   <script src="resources/js/jquery.dropotron.min.js"></script>
   <script src="resources/js/browser.min.js"></script>
   <script src="resources/js/breakpoints.min.js"></script>
   <script src="resources/js/util.js"></script>
   <script src="resources/js/main.js"></script>
   

</body>
</html>