package com.coffee.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.coffee.dao.MemberDAO;
import com.coffee.dto.BoardDTO;
import com.coffee.dto.MemberDTO;
import com.coffee.util.Util;

@WebServlet("/join")
public class Join extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Join() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("join.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		MemberDTO dto = new MemberDTO();
		
		// 값 잡기 id name pw
		dto.setMid(request.getParameter("id"));      
	    dto.setMname(request.getParameter("name"));      
	    dto.setMpw(request.getParameter("pw1"));    
        
        // db에 보내기
        MemberDAO dao = new MemberDAO();
        
        // MemberDAO를 사용하여 회원 정보를 데이터베이스에 저장하고 결과를 받아옴
        int result = dao.join(dto);
        
        // 정상적으로 데이터입력을 완료했다면 로그인 페이지로, 비정상이면 에러 페이지로 전송
		if(result == 1) {
			response.sendRedirect("./login");
		} else {
			response.sendRedirect("./error");
		}
	}
}
