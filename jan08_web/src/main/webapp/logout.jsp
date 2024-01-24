<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <!-- 선언문 core태그 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃 페이지입니다.</title>

<link href="./css/index.css" rel="stylesheet">
<link href="./css/menu.css" rel="stylesheet">
<script type="text/javascript" src="./js/menu.js"></script>

</head>
<body>
	<header>
		<%@ include file="menu.jsp"%>
	</header>
	<div class="main">
		<div class="mainStyle">
			<article>
				<h1 style="text-align: center">정상적으로 로그아웃 되었습니다.</h1>
			</article>
		</div>
	</div>
		<footer>
		<c:import url="footer.jsp"/>
		</footer>
</body>
</html>