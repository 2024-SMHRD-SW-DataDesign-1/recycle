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
      <div id="header">

         <!-- Logo -->
         <h1>
            <a href="index" id="logo">Recycle Map</a>
         </h1>

         <!-- Nav -->
         <nav id="nav">
            <ul>
               <li><a href="index">홈</a></li>
               <li><a href="list">지도</a></li>
               <li><a href="material">재질별 분리배출</a></li>
               <li><a href="item">품목별 분리배출</a></li>
               <li><a href="quiz">퀴즈</a></li>
            </ul>
         </nav>
      </div>
      <!-- Banner -->
            <section>
               <div class="swiper">
                  <!-- Additional required wrapper -->
                  <div class="swiper-wrapper">
                       <!-- Slides -->
                       <div class="swiper-slide">
                          <p align="center"><img src="resources/images/프링글스-통.jpg" width="300px" height="300px" ></p>
                       </div>
                       <div class="swiper-slide">
                          <img src="https://via.placeholder.com/300x300">
                        </div>
                       <div class="swiper-slide">
                          <img src="https://via.placeholder.com/300x300">
                      </div>
                       <div class="swiper-slide">
                          <img src="https://via.placeholder.com/300x300">
                       </div>  
                  </div>
                  <!-- If we need navigation buttons -->
                  <div class="swiper-button-next"></div>
                  <div class="swiper-button-prev"></div>
                  <!-- <div class="swiper-pagination"></div> -->
        
                  <!-- If we need scrollbar -->
                  <div class="swiper-scrollbar"></div>
                 </div>
            </section>     
            
         

      <!-- Footer -->
      <div id="footer">
         <div class="container">
            <div class="row">
               <section class="col-3 col-6-narrower col-12-mobilep"></section>
            </div>
         </div>

         <!-- Icons -->
         <ul class="icons">
            <li><a href="#" class="icon brands fa-twitter"><span
                  class="label">Twitter</span></a></li>
            <li><a href="#" class="icon brands fa-facebook-f"><span
                  class="label">Facebook</span></a></li>
            <li><a href="#" class="icon brands fa-github"><span
                  class="label">GitHub</span></a></li>
            <li><a href="#" class="icon brands fa-linkedin-in"><span
                  class="label">LinkedIn</span></a></li>
            <li><a href="#" class="icon brands fa-google-plus-g"><span
                  class="label">Google+</span></a></li>
         </ul>

         <!-- Copyright -->
         <div class="copyright">
            <ul class="menu">
               <li>&copy; Untitled. All rights reserved</li>
               <li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
            </ul>
         </div>

      </div>

   </div>

   <!-- Scripts -->
   <script src="resources/js/jquery.min.js"></script>
   <script src="resources/js/jquery.dropotron.min.js"></script>
   <script src="resources/js/browser.min.js"></script>
   <script src="resources/js/breakpoints.min.js"></script>
   <script src="resources/js/util.js"></script>
   <script src="resources/js/main.js"></script>
   <script>
            const swiper = new Swiper('.swiper', {
              // Optional parameters
              loop: true,
              slidesPerView: 1,
              // If we need pagination
              pagination: {
               el: '.swiper-pagination',
              },
            
              // Navigation arrows
              navigation: {
               nextEl: '.swiper-button-next',
               prevEl: '.swiper-button-prev',
              },
            
              // And if we need scrollbar
              scrollbar: {
               el: '.swiper-scrollbar',
              },
            });
         </script>

</body>
</html>