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
      <jsp:include page="header.jsp"></jsp:include>

         <!-- Main -->
         <section class="wrapper style1">
            <div class="container">
               <div id="content">
                  
                  <!-- Content -->
                  
                  <article>
                     <div class="quiz">
                        <h3>[Quiz01]<br>칫솔은 플라스틱 재활용 쓰레기이다.</h3>
                        <span><img src="resources/images/toothbrush_img.png" width="300px" height="300px"></span>

                        <br><br>
                        
                           <label><input type="radio" name="question2" class="answer" data-correct="false"> O</label>
                        <br>
                        <c>
                            <label><input type="radio" name="question2" class="answer" data-correct="true"> X</label>
                            <span id="ans" style="display: none;">&nbsp&nbsp&nbsp&nbsp<strong>정답</strong></span>
                        </c>
                        <br>
                        <p class="explanation" style="display: none;">해설 : 칫솔은 플라스틱류가 아닌 일반 쓰레기로 분류해야 한다.
                        <br><strong style="color:#A9A9A9">70% 이상이 플라스틱으로 이루어진 칫솔은 최근 서울특별시 강동구에서 폐 칫솔을 모아 줄넘기, 플라스틱 화분 등으로 재활용하기 위해 
                        <b style="color:#000080"><br>'블루우체통'</b>을 만들어 친환경 프로젝트 캠페인을 진행하고 있다.</strong></p>
                     </div>
                     

                     <br><br><br><br><br>
                     <div class="quiz">
                        <h3>[Quiz02]<br>패스트푸드 음료컵의 뚜껑은 플라스틱에 포함된다.</h3>
                        <span><img src="resources/images/뚜껑.jfif" width="300px" height="300px"></span>
            
                        <br><br>
                        <c> 
                           <label><input type="radio" name="question1" class="answer" data-correct="true"> O</label>
                           <span id="ans" style="display: none;">&nbsp&nbsp&nbsp&nbsp<strong>정답</strong></span>
                        </c>
                        <br>
                     
                            <label><input type="radio" name="question1" class="answer" data-correct="false"> X</label>
                           <p class="explanation" style="display: none;">해설 : 음료컵의 뚜껑은 플라스틱으로 배출해야 한다.</p>
                     </div>
                     

                     <br><br><br><br><br>
                     <div class="quiz">
                        <h3>[Quiz03]<br>고추장, 간장, 쌈장 등 장류는 음식물 쓰레기이다.</h3>
                        <span><img src="resources/images/장독대.jpg" width="300px" height="300px"></span>
            
                        <br><br>
                        
                           <label><input type="radio" name="question3"class="answer" data-correct="false"> O</label>
                        <br>
                        <c>
                            <label><input type="radio" name="question3" class="answer" data-correct="true"> X</label>
                            <span id="ans" style="display: none;">&nbsp&nbsp&nbsp&nbsp<strong>정답</strong></span>
                        </c>
                        
                        <p class="explanation" style="display: none;">해설 : 고추장, 간장, 쌈장 등의 장류는 염분이 높아 가축의 사료로 사용하기 어려워 일반 쓰레기로 배출해야 한다.</p>
                     </div>


                     <br><br><br><br><br>
                     <div class="quiz">
                        <h3>[Quiz04]<br>깨진 유리병도 재활용이 가능하다.</h3>
                        <span><img src="resources/images/깨진유리병.jpg" width="300px" height="300px"></span>
            
                        <br><br>
                        
                           <label><input type="radio" name="question4" class="answer" data-correct="false"> O</label>
                        <br>
                        <c> 
                              <label><input type="radio" name="question4" class="answer" data-correct="true"> X</label>
                              <span id="ans" style="display: none;">&nbsp&nbsp&nbsp&nbsp<strong>정답</strong></span>
                        </c>
                        
                        <p class="explanation" style="display: none;">해설 : 깨진 유리는 신문지 등으로 충분히 감싼 후, 반드시 종량제 봉투에 배출해야 한다.
                        <br><strong style="color:#A9A9A9">단, 유리병이 아닌 일반 유리는 깨지지 않더라도 재활용이 되지 않기에 꼭 일반 쓰레기로 배출해야 한다.</strong></p>
                     </div>


                     <br><br><br><br><br>
                     <div class="quiz">
                        <h3>[Quiz05]<br>프링글스 통은 일반 쓰레기로 배출해야 한다.</h3>
                        <span><img src="resources/images/프링글스-통.jpg" width="300px" height="300px"></span>
                     
                        <br><br>
                        <c> 
                              <label><input type="radio" name="question5" class="answer" data-correct="true"> O</label>
                              <span id="ans" style="display: none;">&nbsp&nbsp&nbsp&nbsp<strong>정답</strong></span>
                        </c>
                        <br>
                           <label><input type="radio" name="question5" class="answer" data-correct="false"> X</label>
                        
                        <p class="explanation" style="display: none;">해설 : 프링글스 통은 부위별로 다른 재질로 구성되어 있어서 납작하게 눌러 부피를 최대한 줄인 다음 일반 쓰레기로 배출하는 것이 낫다.</p>
                     </div>
                     

                     <br><br><br><br><br>
                     <div class="quiz">
                        <h3>[Quiz06]<br>(무색 스티로폼과 같이) 유색 스티로폼은 분리 배출이 가능하다.</h3>
                        <span><img src="resources/images/styrofoam_img.png" width="300px" height="300px"></span>
            
                        <br><br>
                        
                           <label><input type="radio" name="question6" class="answer" data-correct="false"> O</label>
                        <br>
                        <c> 
                              <label><input type="radio" name="question6" class="answer" data-correct="true"> X</label>
                              <span id="ans" style="display: none;">&nbsp&nbsp&nbsp&nbsp<strong>정답</strong></span>
                        </c>
                        
                        <p class="explanation" style="display: none;">해설 : 스티로폼은 전체가 흰 색인 것만 분리 배출이 가능하다.
                        <br><strong style="color:#A9A9A9">유색 플라스틱이나 이물질이 묻어 있는 스티로폼, 무늬가 있거나 코팅된 스티로폼은 재활용이 어렵다.</strong></p>
                     </div>
                     
                     
                     <br><br><br><br><br>
                     <div class="quiz">
                        <h3>[Quiz07]<br>코팅된 전단지도 종이와 함께 재활용이 가능하다.</h3>
                        <span><img src="" width="300px" height="300px"></span>
            
                        <br><br>
                        
                           <label><input type="radio" name="question7" class="answer" data-correct="false"> O</label>
                        <br>
                        <c> 
                              <label><input type="radio" name="question7" class="answer" data-correct="true"> X</label>
                              <span id="ans" style="display: none;">&nbsp&nbsp&nbsp&nbsp<strong>정답</strong></span>
                        </c>
                        
                        <p class="explanation" style="display: none;">해설 : 전단지는 표면이 코팅되어 있어 재활용이 불가하므로 일반 쓰레기로 배출해야 한다.</p>
                     </div>
                     
                     
                     <br><br><br><br><br>
                     <div class="quiz">
                        <h3>[Quiz08]<br>포장용 뽁뽁이는 비닐로 분리 배출이 가능하다.</h3>
                        <span><img src="resources/images/bbogbbog_img.png" width="300px" height="300px"></span>
                     
                        <br><br>
                        <c> 
                              <label><input type="radio" name="question8" class="answer" data-correct="true"> O</label>
                              <span id="ans" style="display: none;">&nbsp&nbsp&nbsp&nbsp<strong>정답</strong></span>
                        </c>
                        <br>
                           <label><input type="radio" name="question8" class="answer" data-correct="false"> X</label>
                        
                        <p class="explanation" style="display: none;">해설 : 깨끗한 비닐류는 분리 배출 표시가 없다고 해도 재활용이 가능하다.
                        <br><strong style="color:#A9A9A9">일회용 봉투, 에어캡, 세탁소 비닐 같은 경우에도 비닐로 재활용이 가능하지만 식품포장용 '랩'은 종량제 봉투에 버려 일반 쓰레기로 배출해야 한다. </strong></p>
                     </div>
                     
                     
                     <br><br><br><br><br>
                     <div class="quiz">
                        <h3>[Quiz09]<br>거울과 유리병과 접시는 분리 배출이 가능하다.</h3>
                        <span><img src="resources/images/mirror_img.png" width="300px" height="300px"></span>
            
                        <br><br>
                        
                           <label><input type="radio" name="question9" class="answer" data-correct="false"> O</label>
                        <br>
                        <c> 
                              <label><input type="radio" name="question9" class="answer" data-correct="true"> X</label>
                              <span id="ans" style="display: none;">&nbsp&nbsp&nbsp&nbsp<strong>정답</strong></span>
                        </c>
                        
                        <p class="explanation" style="display: none;">해설 : 거울은 불에 타지 않는 쓰레기이기에 크기에 따라 불연성 쓰레기 봉투(마대)에 넣어서 버려야 한다.</p>
                     </div>
                     
                     
                     <br><br><br><br><br>
                     <div class="quiz">
                        <h3>[Quiz10]<br>페트병의 마개는 꼭 닫아서 분리 배출해야 한다.</h3>
                        <span><img src="resources/images/pet_img.png" width="300px" height="300px"></span>
                     
                        <br><br>
                        <c> 
                              <label><input type="radio" name="question8" class="answer" data-correct="true"> O</label>
                              <span id="ans" style="display: none;">&nbsp&nbsp&nbsp&nbsp<strong>정답</strong></span>
                        </c>
                        <br>
                           <label><input type="radio" name="question8" class="answer" data-correct="false"> X</label>
                        
                        <p class="explanation" style="display: none;">해설 : 페트병의 라벨을 제거하고 내용물을 씻어 압축시킨 후에 다시 마개를 닫아 배출해야 한다.
                        <br><strong style="color:#A9A9A9">마개는 크기가 작아 따로 떨어질 경우 발견되지 못한 채 환경을 파괴할 수도 있어, 본체와 따로 분리되지 않도록 하는 것이 중요하다.</strong></p>
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
                  /* const answer = document.querySelectorAll('.answer'); */
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
                 
                  
                  /* answer.forEach(answer => {
                     answer.style.display = 'inline';
                 }); */ 
                  
                  ans.forEach(ans => {
                     ans.style.display = 'inline';
                 }); 
                  
                  $('c').addClass('newClass')
               }
            </script>
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