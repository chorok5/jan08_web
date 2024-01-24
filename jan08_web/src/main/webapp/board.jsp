<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <!-- 선언문 core태그 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>-- 게시판 --</title>
<link href="./css/menu.css" rel="stylesheet">
<link href="./css/index.css" rel="stylesheet">
<link href="./css/board.css" rel="stylesheet" />
<script type="text/javascript" src="./js/menu.js"></script>

</head>
<body>

	<div class="container">
<header>
	<%@ include file="menu.jsp"%>
</header>
	<div class="main">
		<div style="width: 1200px; margin: 0 auto; padding-top: 5px;">
				<article>
					<c:choose>
						<c:when test="${fn:length(list) gt 0 }">
							<table><br>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>글쓴이</th>
							<th>날짜</th>
							<th>조회수</th>
						</tr>
						<c:forEach items="${list}" var="row">
							<tr>
								<td class="w1">${row.no}</td>
								<td class="title">
									<a href="./detail?page=${page }&no=${row.no}"> ${row.title}
									
									<c:if test="${row.comment ne 0}">&ensp;
									<span>${row.comment }</span></c:if></a>
									
									</td>
									
									
								<td class="w2">${row.write}</td>
								<td class="w1">${row.date}</td>
								<td class="w1">${row.count}</td>
							</tr>
						</c:forEach>
					</table>
					<!--  페이지 수 : ${totalCount / 10 } 이렇게 쓰면 계산이 안됨 , jstl 로 써서 java 문 입력하자-->
                    <!-- 파스넘버: 소수점을 정수로 처리 -->
                    <!-- 나머지 값이 있다면 +1 시켜줘 -->

					전체 글 : ${totalCount }개 /
					
					페이지 수 : <c:set var="totalPage" value="${totalCount / 10 }"/>
					<fmt:parseNumber integerOnly="true" value="${totalPage }" var="totalPage"/>
					<c:if test="${totalCount % 5 gt 0 }">
					  <c:set var="totalPage" value="${totalPage + 1 }"/>
					</c:if>
					<c:out value="${totalPage }"/>
					
					/ startPage : <c:set var="startPage" value="1"/>
					<c:if test="${page gt 2 }">
					  <c:set var="startPage" value="${page - 1 }"/>
					</c:if>
					${startPage }
					
					/ endPage : <c:set var="endPage" value="${startPage + 4 }"/> 
					
					<div class="paging">
					  <button onclick="paging(1)">👈</button>
					
					  <button
					    <c:if test="${page - 1 lt 1 }">disabled="disabled"</c:if>
					    onclick="paging(${page - 1})">🦕🦕🦕</button>
					
					  <c:forEach begin="${startPage}" end="${endPage}" var="p">
					    <button
					      <c:if test="${page eq p }">class="currentBtn"</c:if>
					      onclick="paging(${p})">${p}</button>
					  </c:forEach>
					
						  <button
						    <c:if test="${page eq totalPage}">disabled="disabled"</c:if>
						    onclick="paging(${page + 1})">🐌🐌🐌</button>
						
						  <button  onclick="paging(${totalPage})">👉</button>
						</div>

					<!--  ////////////////////////////////////////////////////////////-->
						</c:when>
						<c:otherwise>
							<h1>출력할 값이 없읍니다..</h1>
						</c:otherwise>
					</c:choose>
					
					


					<c:if test="${sessionScope.mname ne null}"> <!-- (null이 아니면) login했으면 글쓰기버튼 보이도록  -->
						<button onclick="url('./write')" id="board_button" name="board_button">글쓰기</button>
					</c:if>
				</article>
			</div>
		</div>
		
		
		
		<footer>
		<c:import url="footer.jsp"/>
		</footer>
	</div>
<script type="text/javascript">
	function paging(no) {
		location.href="./board?page="+no;
	}
</script>

</body>
</html>