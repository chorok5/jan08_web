<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- jstl을 쓰기 위한 코어태그 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>🍮 푸딩 페이지 🍮</title>
<link href="./css/index.css" rel="stylesheet">
<link href="./css/menu.css" rel="stylesheet">
<script type="text/javascript" src="./js/menu.js"></script>

    <style>
        @keyframes sparkle {
            0%, 100% {
                color: #ef6295; /* 시작과 끝 색상 */
            }
            50% {
                color: #FADC17; /* 가운데 색상 */
            }
        }

        h2 {
            font-size: 40px;
            text-align: center;
            animation: sparkle 1s infinite; /* 반짝임 애니메이션, 2초 간격으로 반복 */
        }
        h3 {
            font-size: 30px;
            text-align: center;
            animation: sparkle 1s infinite; /* 반짝임 애니메이션, 2초 간격으로 반복 */
        }
        
        
        
        
    </style>



    
</head>
<body>
	<header>
		<%@ include file="menu.jsp"%>
	</header><br><br><br>
	<h1 class="h1" style="text-align: center;">
	    <img src="./img/pudding.png" style="width: 300px; height: 300px; display: block; margin: 0 auto;">
	</h1><br>
	<h2>🍮🍮🍮  환영합니다  🍮🍮🍮<br><br></h2>
<img src="./img/burger.png" style="width: 100px; height: 100px; display: flex; justify-content: center;">
<img src="./img/burger.png" style="width: 100px; height: 100px; display: flex; justify-content: center;">

	<h3>🍰🍩🍖  방문해주신 당신 환영합니다.  🍟🍔🍕<br>
	🧀🍭🍋    게시판에 글 남겨주세요.    🍪☕🧁</h3><br>
	<div class="main">
		<footer>
		<c:import url="footer.jsp"/>
		</footer>
	</div>

</body>
</html>