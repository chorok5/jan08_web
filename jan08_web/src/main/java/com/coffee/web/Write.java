package com.coffee.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.coffee.dao.BoardDAO;
import com.coffee.dto.BoardDTO;
import com.coffee.util.Util;

@WebServlet("/write")
public class Write extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Write() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 세션 검사
		HttpSession session = request.getSession();

		if (session.getAttribute("mname") == null) {
			response.sendRedirect("./login"); // url까지 변경해서 화면 보여주기
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("write.jsp"); // url고정, 화면만 표시 : 로그인했으면 write 페이지로.
			rd.forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 한글처리
		request.setCharacterEncoding("UTF-8");

		// 세션에 들어있는 mid 가져오기 24-01-15
		HttpSession session = request.getSession();
		System.out.println("mid ::::::::::::::::"+session.getAttribute("mid"));

		// if문으로 로그인 되어있는(=세션이 있는) 사람만 아래 로직 수행하도록 변경
		if (session.getAttribute("mid") == null || session.getAttribute("mname") == null) {
			// 로그인하지 않았다면 login 으로 전송
			response.sendRedirect("./login?login=nologin");
		} else {
			// 로그인했다면 아래 로직을 수행하도록
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			// HTML 태그를 특수기호로 변경하기
			title = Util.removeTag(title);

			// DAO에 write 메소드 만들기
			BoardDTO dto = new BoardDTO();
			dto.setTitle(title);
			dto.setContent(content); // dto에 title, content를 담음.
			dto.setMid((String) session.getAttribute("mid")); // session은 무조건 object 처리함.
			dto.setIp(Util.getIP(request));

			BoardDAO dao = new BoardDAO();
			int result = dao.write(dto); // 위에서 dto에 담은 두개를 dto로 모두 던짐.
			System.out.println("글쓰기 결과는 : " + result + session.getAttribute("mid"));

			// 페이지 이동하기 = url값과 화면 모두 이동하기 (디스패쳐는 url은 그대로고 화면만 바뀜)
			if (result == 1) {
				response.sendRedirect("./board"); // 글쓰기 정상작동이면 board로 이동
			} else {
				response.sendRedirect("./error.jsp");
			}

		}
	}

}
