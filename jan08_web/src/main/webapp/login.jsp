<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <!-- 선언문 core태그 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지입니다.</title>

<link href="./css/index.css" rel="stylesheet">
<link href="./css/menu.css" rel="stylesheet">
<script type="text/javascript" src="./js/menu.js"></script>

<style type="text/css">

html, body {
	height: 100%;
	margin: 60px auto;

}
body {
	align-items: center;
}

#name_field, #pw_field{
	width: 400px;
	height: 30px;
	text-align: left;
	border-collapse: collapse;
	border-bottom: 1px solid black;
	border-left-style: none;
	border-right-style: none;
	border-top-style: none;
	margin: 0 autopx;
	padding-top: 10px;
	display: flex;
	align-items: center;
}

.h1{
	text-align: center;
	color : #8E44EC;
	font-size: 50px;
	
}

#login_form, #reset_form{
  width: 100%;
  padding: 7px;
  border: none;
  border-radius: 5px;
  color: white;
  font-weight: bold;
  background-color: #8E44EC;
  cursor: pointer;
  outline: none;
}



</style>
<script type="text/javascript">
function err(){
	let errBox = document.querySelector("#errorMSG");
	errBox.innerText="\n올바른 id와 pw를 입력하세요.";
	errBox.style.color="#E84636";
	errBox.style.fontSize="10pt"
}
</script>
</head>
<body>
	
	<header>
		<%@ include file="menu.jsp"%>
	</header>
	<div class="main">
		<div class="mainStyle">
			<article>	
				<h1 class="h1"><img src="./img/testing.png" style="width: 100px; height: 100px; margin: 0 auto;"><br>
				Login<br></h1>
					<c:if test="${param.error ne null}">
						<script type="text/javascript">
							alert("올바른 암호와 아이디를 입력하세요.");
							</script> 
					</c:if>
				<div class="login">
					<form action="./login" method="post" style="width: 400px; margin: 0 auto;">
						<input type="text" id="name_field" name="id" placeholder="아이디를 입력하세요."><br>
						<input type="password" id="pw_field" name="pw" placeholder="암호를 입력하세요."><br><br>
						<button type="reset" id="reset_form" style="width: 49%;"> 지우기 </button>
						<button type="submit" id="login_form" style="width: 49%;">로그인</button>
						<div id="errorMSG"></div>
					</form>
					<div class = "join_button">
					<a href="./join">회원가입</a>
					</div>
				</div>
			</article>
		</div>
		<footer>
		<c:import url="footer.jsp"/>
		</footer>
	</div>
	<c:if test="${param.error ne null }">
		<script type="text/javascript">
			err();
		</script>
	</c:if>				
					
</body>
</html>