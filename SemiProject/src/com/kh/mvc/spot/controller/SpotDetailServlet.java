package com.kh.mvc.spot.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.spot.model.service.BoardService;
import com.kh.mvc.spot.model.vo.BoardList;

@WebServlet("/spot/spotDetail")
public class SpotDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private BoardService service = new BoardService();
       
    public SpotDetailServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int no = Integer.parseInt(request.getParameter("no"));
    	BoardList board = service.findBoardByNo(no);
    	
    	System.out.println(board);
    	
    	request.setAttribute("board", board);
    	
    	request.getRequestDispatcher("/views/spot/spotDetail.jsp").forward(request, response);
	}
}
