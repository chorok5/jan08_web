package com.coffee.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.coffee.dao.CommentDAO;
import com.coffee.dto.CommentDTO;
import com.coffee.util.Util;

@WebServlet("/comment")
public class Comment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Comment() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// 오는 값 받기
		String commentcontent = request.getParameter("commentcontent"); // 댓글 내용
		
		// HTML에서 특수기호 <> 변경하기 + 줄바꿈 처리하기
		commentcontent = Util.removeTag(commentcontent);
		
		// 엔터가 가능하도록 (\r, \n, \nr 을 엔터로 변경)
		commentcontent = Util.addBR(commentcontent);
		
		String bno = request.getParameter("bno"); // 글 번호
		System.out.println(commentcontent + " : " + bno);
		
		// 저장하기
		CommentDTO dto = new CommentDTO();
		dto.setComment(commentcontent);
		dto.setBoard_no(Util.str2Int(bno));
		
		HttpSession session = request.getSession();
		dto.setMid((String)session.getAttribute("mid"));
		dto.setIp(Util.getIP(request));
		
		CommentDAO dao = new CommentDAO();
		int result = dao.commentWrite(dto);
		System.out.println("처리결과 : " + result);
		
		response.sendRedirect("./detail?no="+bno);
	}
	

}
