package com.coffee.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coffee.dao.BoardDAO;
import com.coffee.dto.BoardDTO;

@WebServlet("/bootstrap")
public class Bootstrap extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Bootstrap() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		BoardDAO dao = new BoardDAO();
		List<BoardDTO> list = dao.boardList(1);
		
		request.setAttribute("list", list);
		
		RequestDispatcher rd = request.getRequestDispatcher("bootstrap.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
