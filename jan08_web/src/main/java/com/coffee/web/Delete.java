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

@WebServlet("/delete")
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Delete() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 2024-01-16 로그인한 사용자 + 내 글
		
		// 2024-01-11 글 삭제하기
		HttpSession session = request.getSession();
		
		// no가 숫자인지 & 로그인 여부를 if문으로 확인 
		// (숫자인 경우: 삭제 - board로 이동 / 숫자 아닌 경우: 에러 표시) 
		
	      if(Util.intCheck(request.getParameter("no")) && session.getAttribute("mid") != null ) {
	    	  
	    	  // 파라미터로 오는 번호 잡기 -> 자바 변수로 저장 (여러개 보낼때는 &를 씀)
	    	  int no = Util.str2Int(request.getParameter("no"));
	    	  
	    	  // DAO에게 일 시키기
	    	  BoardDAO dao = new BoardDAO();
	    	  
//	    	   board_no 와 mid가 같이 있는 클래스 = BoardDTO
	    	  BoardDTO dto = new BoardDTO();
	    	  dto.setNo(no);
	    	  dto.setMid((String) session.getAttribute("mid"));
	    	  
	    	  // 잘 삭제되었는지 값 받기
	    	  int result = dao.delete(dto);
	    	  if(result == 1) {
	    		  // 값이 1이면 여기로
	    		  response.sendRedirect("./board");
	    	  } else {
	    		  // 값이 0이면 여기로
	    		  response.sendRedirect("./error.jsp");
	    	  }
	       } else {
	    	  response.sendRedirect("./error.jsp");
	       }
	      
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
