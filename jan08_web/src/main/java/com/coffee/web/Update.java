package com.coffee.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.coffee.dao.BoardDAO;
import com.coffee.dto.BoardDTO;
import com.coffee.util.Util;


@WebServlet("/update")
public class Update extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Update() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// no 잡기
		HttpSession session = request.getSession();
		
		// 세션이 있을 때 = 정상 작업하기
		if(session.getAttribute("mid") != null) {
			int no = Util.str2Int(request.getParameter("no")); // 정수로 바꾸기
			
			// DAO 질의하기
			BoardDAO dao = new BoardDAO();
			BoardDTO dto = dao.detail(no);
			
			//01.16 세션mid 랑 db 에서 불러온 mid랑 같아?를 if 문 조건부에 작성하기
			if (session.getAttribute("mid").equals(dto.getMid())) {
			// jsp로 보내기
				request.setAttribute("update", dto);
				RequestDispatcher rd = request.getRequestDispatcher("update.jsp");
				rd.forward(request, response);
			} else {
				response.sendRedirect("./error.jsp");
			}
		} else {
			response.sendRedirect("./login?login=nologin");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		if(request.getParameter("title") != null 
				&& request.getParameter("content") != null 
				&& Util.intCheck(request.getParameter("no"))
				&& session.getAttribute("mid") != null){
			
			// 진짜 수정 (수정 후에 보드로 갈지, 수정한 글을 다시 확인할지)
			BoardDTO dto = new BoardDTO();
			dto.setContent(request.getParameter("content"));
			dto.setTitle(request.getParameter("title"));
			dto.setNo(Util.str2Int(request.getParameter("no")));
			
			dto.setMid((String)session.getAttribute("mid"));
			
			BoardDAO dao = new BoardDAO();
			int result = dao.update(dto);
			response.sendRedirect("./detail?no=" + request.getParameter("no"));
		} else {
			response.sendRedirect("./error.jsp");
		}
		
//		String title = request.getParameter("title");
//		String content = request.getParameter("content");
//		String no = request.getParameter("no");
		
//		System.out.println("title");
//		System.out.println("content");
//		System.out.println("no");
	}

}
