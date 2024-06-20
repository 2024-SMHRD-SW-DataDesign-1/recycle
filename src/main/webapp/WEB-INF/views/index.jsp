<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>
<head>
<title>Recycle Map</title>
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
                           <p>재질별, 품목별 분리 배출법을 제공해준다.</p>
                           <p>정확하고 편리한 재질별, 품목별 분리 배출법 제공</p>
                        </div>
                     </section>
                     <section class="col-4 col-12-narrower">
                        <div class="box highlight">
                           <i class="icon solid major fa-trash"></i>
                           <h3>올바른 처리 방법</h3>
                           <p>퀴즈를 통해 올바른 처리 방법을 풀어볼 수 있다.</p>
                           <p>퀴즈를 통한 올바른 처리 방법 제공 </p>
                        </div>
                     </section>
                     <section class="col-4 col-12-narrower">
                        <div class="box highlight">
                           <i class="icon solid major fa-map"></i>
                           <h3>수거함 위치 제공</h3>
                           <p>폐형광등, 폐건전지, 폐의약품 등 다양한 수거함 위치를 제공해준다.
                           <p>다양한 분리 수거함 위치 제공</p>
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
                           <h3>"일회용품을 하나도 안쓸 순 없어요"</h3>
                           <p>&nbsp;</p>
                           <h3>당신의 친환경 생활,</h3>
                           <h3>생각처럼 쉽지 않나요?</h3>
                           <p>&nbsp;</p>
                           <h3>잘 버리는 일부터</h3>
                           <h3>시작해보는건 어떨까요?</h3>
                           <h3>잘 버리기만 해도 쓰레기는</h3>
                           <h3>훌륭한 자원이 된답니다</h3>
                        </div>
                     </section>
                  </div>
               </div>
            </section>   
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