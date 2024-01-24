<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- jstl을 쓰기 위한 코어태그 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>-- info --</title>
<link href="./css/index.css" rel="stylesheet">
<link href="./css/menu.css" rel="stylesheet">
<script type="text/javascript" src="./js/menu.js"></script>
</head>
<body>
	<header>
		<%@ include file="menu.jsp"%>
	</header>
	<div class="container">
		<div>
			<article>
				<h1>앞으로 배워야 할 내용</h1>
				<h2>2024-01-23</h2>
				<ul>
					<li>프레임워크 프로그래밍 + 정처기 시험 접수<br></li>
					<li>----------------------------------------------</li>
					<li>xml / json</li>
					<li>관리자 페이지</li>
					<li>파일 업로드</li>
					<li>MVC 패턴</li>
					<li>스프링-레거시</li>
					<li>lombok</li>
					<li>mybaris</li>
					<li>스프링부트</li>
					<li>thymeleaf</li>
					<li>jpa</li>
					<li>리눅스</li>
					<li>aws</li>
					<li>vue</li>
				</ul>
				<h1>배운 내용</h1>	
				<h2>2024-01-22</h2>
				<ul>
					<li>남은 프로젝트 : <br>
					------------------ (1) jsp (2) spring (3) 기업프로젝트(spring)</li><br>
					<li>댓글달기</li>
					<li>댓글달기 - 동적생성하기</li>
					<li>관리자 모드- 회원 관리</li>
					<li>관리자 모드- 글 관리</li>
				</ul>
				<h2>2024-01-19</h2>
				<ul>
					<li>postman</li>
					<li>database development</li>
					<li>dbeaver</li>
					<li>aquerytool</li>
					<li>댓글달기, 관계도 그리기</li>
					<li>댓글 테이블 만들기</li>

				</ul>
				
				<h2>2024-01-17</h2>
				<ul></ul>
					
				<h2>2024-01-16</h2>
				<ul>
					<li>다른 사용자의 글 수정 삭제 막아두기</li>
				</ul>
				<h2>2024-01-15</h2>
				<ul>
					<li>세션으로 로그인 만들기</li>
				</ul>
					
				<h2>2024-01-10</h2>
				<ul>
					<li>글 보기 (=detail.jsp)</li>
					<li>각각 게시판 서블릿(문의사항,공지사항,로그인)</li>
					<li>글쓰기</li>
					<li>삭제하기</li>
					<li>수정하기</li>
					<li></li>
				</ul>
			</article>

		</div>
		<footer>
		<c:import url="footer.jsp"/>
		</footer>
	</div>

	<a href="./board">Board</a>
</body>
</html>