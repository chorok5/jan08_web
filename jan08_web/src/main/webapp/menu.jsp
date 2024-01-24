<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<nav>
				<ul>
					<li onclick="url('./')">홈</li>
					<li onclick="url('./board')">게시판</li>
					<li onclick="url('./qna')">문의글</li>
					<li onclick="url('./notice')">공지사항</li>
					<li onclick="url('./bootstrap')">부트스트랩</li>
					<li onclick="url('./myInfo')">${sessionScope.mname }님</li>
					<c:choose>
						<c:when test="${sessionScope.mname eq null }">
							<li onclick="url('./login')">로그인</li>
						</c:when>
						<c:otherwise>
							<li onclick="url('./logout')">로그아웃</li> <!-- 세션을 종료시키고 다시 로그인 페이지로 (서블릿만 필요함, jsp 필요없음) -->
						</c:otherwise>					
					</c:choose>

					<li onclick="url('./info')">info</li>
					<li onclick="url('./team')">팀</li>
					
				</ul>
			</nav>