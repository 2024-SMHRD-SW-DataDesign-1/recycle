<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>
	<head>
		<title>품목별 분리배출</title>
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
									<header>
										<h2>품목별분리배출</h2>
									</header>

									<span class="image featured"><img src="resources/images/대형가전.PNG" alt="" /></span>
									<span class="image featured"><img src="resources/images/소형가전.PNG" alt="" /></span>
									<span class="image featured"><img src="resources/images/전지.PNG" alt="" /></span>
									<span class="image featured"><img src="resources/images/대형폐기물.PNG" alt="" /></span>
									<span class="image featured"><img src="resources/images/의류.PNG" alt="" /></span>
									<span class="image featured"><img src="resources/images/폐의약품.PNG" alt="" /></span>
									
								</article>

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