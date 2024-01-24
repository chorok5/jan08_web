<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- jstl을 쓰기 위한 코어태그 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> ----- 내 정보 보기 -----</title>
<link href="./css/index.css" rel="stylesheet">
<link href="./css/menu.css" rel="stylesheet">
<script type="text/javascript" src="./js/menu.js"></script>

<style type="text/css">
#newpw_button {
  width: 100px;
  padding: 7px;
  border: none;
  border-radius: 5px;
  color: white;
  font-weight: bold;
  background-color: #8E44EC;
  cursor: pointer;
  outline: none;
  margin: 10px;
}

#newPW {
	width: 200px; /* 변경 가능한 비밀번호 길이에 맞게 조절 */
	padding: 5px;
	margin-bottom: 10px;
}
        
        
</style>
</head>
<body>
<% 
// 로그인 검사하기
if(session.getAttribute("mid") == null) {
	response.sendRedirect("./login");
}
%>
	<div class="container">
	<header>
		<%@ include file="menu.jsp"%>
	</header>
		<div class="mainStyle">
		<div>
			<article>
				<h1>마이페이지</h1>
				${myInfo.mname } / ${myInfo.mid } 
			
			<div>
				<form action="./myInfo" method="post" onsubmit="return check()">
					<input type="password" name="newPW" id="newPW" placeholder="변경할 암호를 입력하세요.">
					<button type="submit" id="newpw_button" name="newpw_button">수정하기</button>
				</form>
			</div>
			</article>
			<article>
				<h2>방문 흔적 찾아가기</h2>
				
				<table>
					<thead>
						<tr>
							<td>번호</td>
							<td>글번호</td>
							<td>글제목</td>
							<td>날짜</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${readData}" var="d">
						<tr>
							<td onclick="location.href='./detail?no=${d.board_no}'">${d.board_title }</td>
							<td>
								<fmt:parseDate value="${d.vdate }" var="date" pattern="yyyy-MM-dd HH:mm:ss"/>
								<fmt:formatDate value="${date }" pattern="yyyy년 MM월 dd일 HH시 mm분 ss초"/>
							</td>
						</tr>
						</c:forEach>	
					</tbody>
				</table>
				<!-- 2024-01-23 10:09:00 to data -->
			</article>			
		</div>
	</div>
</div>
	
<footer>
	<c:import url="footer.jsp"/>
</footer>

<script type="text/javascript">
	function check(){
		var pw = document.querySelector("#newPW");
        if (pw.value.length < 4) {
            alert("패스워드는 4글자 이상이어야 합니다.");
            return false;
        }
    }

</script>

	<a href="./board">- 게시판으로 넘어가기 -</a>
</body>
</html>