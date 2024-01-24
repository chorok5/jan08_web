package com.coffee.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.coffee.dao.BoardDAO;
import com.coffee.dao.LogDAO;
import com.coffee.dto.BoardDTO;
import com.coffee.dto.CommentDTO;
import com.coffee.util.Util;

@WebServlet("/detail")
public class Detail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Detail() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 오는 no 잡기
		int no = Util.str2Int(request.getParameter("no"));
		
		// log 20240123
		LogDAO log = new LogDAO();
		log.logwrite(Util.getIP(request), "./detail", "no="+no);
		
		// 데이터베이스에 질의하기
		BoardDAO dao = new BoardDAO();
		
		// 로그인한 회원이라면 조회수 올리기 2024-01-19
		HttpSession session = request.getSession();
		if(session.getAttribute("mid") != null) {
			//bno, mno
			dao.countUp(no,(String) session.getAttribute("mid"));
		}
		
		BoardDTO dto = dao.detail(no);
		
		if(no == 0 || dto.getContent() == null) { // null인 경우 -> error
			response.sendRedirect("error.jsp");
		} else {	 
			
		// 정상 출력
		// 내용 가져오기
			request.setAttribute("detail", dto);
			
		// 댓글이 있다면 List 출력
			List<CommentDTO> commentList = dao.commentList(no);
			
			if(commentList.size() > 0) {
				request.setAttribute("commentList", commentList);
			}
		
		// 리퀘스트 디스패치 호출 = url은 그대로고 화면만 바뀜 (response.sendRedirect = url과 화면 모두 이동)
		RequestDispatcher rd = request.getRequestDispatcher("detail.jsp");
		rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
	
	}

}
