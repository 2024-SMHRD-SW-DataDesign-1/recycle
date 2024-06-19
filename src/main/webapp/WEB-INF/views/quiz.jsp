<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>
	<head>
		<title>Quiz</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="resources/css/main.css" />
	</head>
	<body class="is-preload">
		<div id="page-wrapper">

			<!-- Header -->
				<div id="header">

					<!-- Logo -->
						<h1><a href="index.html" id="logo">Recycle Map</a></h1>

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

			<!-- Main -->
			<section class="wrapper style1">
				<div class="container">
					<div id="content">
						
						<!-- Content -->
						
						<article>
							<div class="quiz">
								<h2>Quiz.1</h2>
								<h3>패스트푸드 음료컵의 뚜껑은 플라스틱에 포함된다.</h3>
								<span><img src="resources/images/뚜껑.jfif" width="300px" height="300px"></span>
				
								<br><br>
								<c> 
									<label><input type="radio" name="question1" class="answer" data-correct="true"> O</label>
									<span id="ans" style="display: none;">&nbsp&nbsp&nbsp&nbsp정답</span>
								</c>
								<br>
							
       							<label><input type="radio" name="question1" class="answer" data-correct="false"> X</label>
								   <p class="explanation" style="display: none;">해설 : 음료컵의 뚜껑은 플라스틱으로 배출해야 한다.</p>
							</div>

							<br><br><br><br><br>
							<div class="quiz">
								<h2>Quiz.2</h2>
								<p>칫솔은 플라스틱 재활용 쓰레기이다.</p>
								<span><img src="resources/images/칫솔.jfif"></span>

								<br><br>
								<label><input type="radio" name="question2" class="answer" data-correct="false"> O</label>
       	 						<label><input type="radio" name="question2" class="answer" data-correct="true"> X</label>
								<p class="explanation" style="display: none;">해설 : 칫솔은 플라스틱류가 아닌 일반 쓰레기로 분류해야 한다.
								<br><strong style="color:#A9A9A9">70% 이상이 플라스틱으로 이루어진 칫솔은 최근 서울특별시 강동구에서는 폐 칫솔을 모아 줄넘기, 플라스틱 화분 등으로 재활용하기 위해 
								<b style="color:#000080">'블루우체통'</b>을 만들어 친환경 프로젝트 캠페인을 진행하고 있다.</strong></p>
							</div>

							<br><br><br><br><br>
							<div class="quiz">
								<h2>Quiz.3</h2>
								<p>고추장, 간장, 쌈장 등 장류는 음식물 쓰레기이다.</p>
								<span><img src="resources/images/장독대.jpg" width="300px" height="300px"></span>
				
								<br><br>
								<label><input type="radio" name="question3"class="answer" data-correct="false"> O</label>
								<label><input type="radio" name="question3" class="answer" data-correct="true"> X</label>
								<p class="explanation" style="display: none;">해설 : 고추장, 간장, 쌈장 등의 장류는 염분이 높아 가축의 사료로 사용하기 어려워 일반 쓰레기로 배출해야 한다.</p>
							</div>

							<br><br><br><br><br>
							<div class="quiz">
								<h2>Quiz.4</h2>
								<p>깨진 유리병도 재활용이 가능하다.</p>
								<span><img src="resources/images/깨진유리병.jpg" width="300px" height="300px"></span>
				
								<br><br>
								<label><input type="radio" name="question4" class="answer" data-correct="false"> O</label>
								<label><input type="radio" name="question4" class="answer" data-correct="true"> X</label>
								<p class="explanation" style="display: none;">해설 : 깨진 유리는 신문지 등으로 충분히 감싼 후, 반드시 종량제 봉투에 배출해야 한다.
								<br>단, 유리병이 아닌 일반 유리는 깨지지 않더라도 재활용이 되지 않기에 꼭 일반 쓰레기로 배출해야 한다.</p>
							</div>

							<br><br><br><br><br>
							<div class="quiz">
								<h2>Quiz.5</h2>
								<p>감자칩의 통은 일반 쓰레기로 배출해야 한다.</p>
								<span><img src="resources/images/프링글스-통.jpg" width="300px" height="300px"></span>
							
								<br><br>
								<label><input type="radio" name="question5" class="answer" data-correct="true"> O</label>
								<label><input type="radio" name="question5" class="answer" data-correct="false"> X</label>
								<p class="explanation" style="display: none;">해설 : 감자칩 통은 부위별로 다른 재질로 구성되어 있어서 납작하게 눌러 부피를 최대한 줄인 다음 일반 쓰레기로 배출하는 것이 낫다.</p>
							</div>
							<br><br><br><br><br><br><br>

							<button id="checkAnswers" onclick="test()">정답확인</button>
                     
                  </article>

                </div>
            </div>
            <script type="text/javascript">
               function test()
               {

                   const labels = document.querySelectorAll('label');
                  const explanations = document.querySelectorAll('.explanation');
                  const answer = document.querySelectorAll('.answer');
                  const ans = document.querySelectorAll('#ans');
                  
                   labels.forEach(label => {
                       const radio = label.querySelector('input');
                       if (radio && radio.dataset.correct === "true") {
                           label.classList.add('correct', 'correct-border');
                           label.classList.remove('incorrect', 'incorrect-border');
                       } else if (radio && radio.dataset.correct === "false") {
                           label.classList.add('incorrect', 'incorrect-border');
                           label.classList.remove('correct', 'correct-border');
                       }
                   });

                  explanations.forEach(explanation => {
                       explanation.style.display = 'block';
                  }); 
                 
                  
                  answer.forEach(answer => {
                	  answer.style.display = 'inline';
                 }); 
                  
                  ans.forEach(ans => {
                	  ans.style.display = 'inline';
                 }); 
                  
                  $('c').addClass('newClass')
               }
               
       
               
            </script>
         </section>
                   $('#)  
         <!-- Footer -->
         <div id="footer">
            <div class="container">
                  <div class="row">
                     
                  </div>
               </div>

               <!-- Icons -->
                  <ul class="icons">
                     <li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
                     <li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
                     <li><a href="#" class="icon brands fa-github"><span class="label">GitHub</span></a></li>
                     <li><a href="#" class="icon brands fa-linkedin-in"><span class="label">LinkedIn</span></a></li>
                     <li><a href="#" class="icon brands fa-google-plus-g"><span class="label">Google+</span></a></li>
                  </ul>

               <!-- Copyright -->
                  <div class="copyright">
                     <ul class="menu">
                        <li>&copy; Untitled. All rights reserved</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
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


   </body>
</html>