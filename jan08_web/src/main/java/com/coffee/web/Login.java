package com.coffee.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.coffee.dao.LogDAO;
import com.coffee.dao.MemberDAO;
import com.coffee.dto.MemberDTO;
import com.coffee.util.Util;

@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Login() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String url = "";
		if(session.getAttribute("mname") != null ) {
			url = "alreadylogin.jsp";
		} else {
			url = "login.jsp";
		}
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}
	
// 아래의 방법도 가능!
//		RequestDispatcher rd = null;
//		if (session.getAttribute("mname") != null) {
//			rd = request.getRequestDispatcher("alreadylogin.jsp");
//		} else {
//			rd = request.getRequestDispatcher("login.jsp");
//		}
//		rd.forward(request, response);
//	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// 2024-01-12 웹 서버 프로그래밍 구현
		if(request.getParameter("id") != null && request.getParameter("pw") != null) {
			MemberDTO dto = new MemberDTO();
			dto.setMid(request.getParameter("id"));
			dto.setMpw(request.getParameter("pw"));
			
			MemberDAO dao = new MemberDAO();
			dto = dao.login(dto);
			
			// IP 저장 20240123
			Map<String, Object> log = new HashMap<String, Object>();
			log.put("ip", Util.getIP(request));
			log.put("url", "./login");
			log.put("data", "id:"+dto.getMid()+", pw:"+dto.getMpw() + " 결과 : " + dto.getCount());
			
			LogDAO logDAO = new LogDAO();
			logDAO.write(log);
			
			
			if(dto.getCount() == 1) {
				System.out.println("정상 로그인");
				// 세션 만들기 (★★★ 매우 중요함! 외워~ ★★★)
				HttpSession session = request.getSession();
				session.setAttribute("mname", dto.getMname()); // mname이라는 이름으로 세션 생성
				session.setAttribute("mid", dto.getMid()); // mid라는 이름으로 세션 생성
				
				// 페이지 이동 = board
				response.sendRedirect("./board");
				
			} else {
				System.out.println("로그인 불가 오류");
				// 페이지 이동 = login?error=4567
				response.sendRedirect("./login?error=4567");
			}
		} else {
		}
	}
}
