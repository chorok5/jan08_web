<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 페이지입니다.</title>
<link href="./css/index.css" rel="stylesheet">
<link href="./css/menu.css" rel="stylesheet">
<script type="text/javascript" src="./js/menu.js"></script>


    <style>
        @keyframes sparkle {
            0%, 100% {
                color: #b338d5; /* 시작과 끝 색상 */
            }
            50% {
                color: #45e3ff; /* 가운데 색상 */
            }
        }

        h1 {
        	margin-left: 10px;
            font-size: 40px;
            text-align: left;
            animation: sparkle 1s infinite; /* 반짝임 애니메이션, 2초 간격으로 반복 */
        }
        
.h1 {
	margin: 0 auto;
}


    </style>
</head>
<body>
	<header>
		<%@ include file="menu.jsp"%>
	</header>
	<div class="main">
		<div class="mainStyle">
			<article>	
				<h1 class="h1">문의사항이 있으시면 제 자리로 직접 와서 문의해주세요. <br>감사합니다.</h1><br>
			</article>
		</div>
		<footer>
		<c:import url="footer.jsp"/>
		</footer>
	<img src="https://pbs.twimg.com/media/E4tDwL8VIAM5Ago.jpg" width="300" height="300">
	</div>
	

</body>
</html>