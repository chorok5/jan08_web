package com.coffee.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Logout() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*
		 *   < 세션 쿠키 >
		 *   ----- 세션 ----- 	| 		----- 쿠키 -----
		 *   서버에 저장됨. 	|	클라이언트에 저장(브라우저)
		 *   로그인 정보 		|	쇼핑 정보, 장바구니, 방문정보 등
		 *   자바				|	스크립트
		 */
		
		// 세션 종료
		HttpSession session = request.getSession();
		if (session.getAttribute("mname") != null) {
			session.setMaxInactiveInterval(3600); // 시간 연장
//			System.out.println("세션 유효시간 : " + session.getMaxInactiveInterval());
//			System.out.println("mname : " + session.getAttribute("mname"));
			session.removeAttribute("mname");
		}
		if(session.getAttribute("mid") != null){
//			System.out.println("mid : " + session.getAttribute("mid"));
			session.removeAttribute("mid");
		}
		session.invalidate(); // 위의 removeAttribute를 따로 할 필요없이, 세션 모두 삭제
		// invalidate()는 세션 자체를 무효화 및 제거
		// removeAttribute()는 현재 세션에서 특정 key-value만 제거
		// removeAttribute()로 키만 제거하면 httpSession 인스턴스가 남아있어 invalidate() 하는 것이 좋음.
		
		// login 페이지로 전송
//		response.sendRedirect("./logout.jsp");
		RequestDispatcher rd = request.getRequestDispatcher("logout.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
