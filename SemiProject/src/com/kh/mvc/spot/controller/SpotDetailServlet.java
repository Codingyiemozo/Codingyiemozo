package com.kh.mvc.spot.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.member.model.service.MemberService;
import com.kh.mvc.spot.model.service.SpotDetailService;


@WebServlet("/spot/spotDetail")
public class SpotDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private SpotDetailService service = new SpotDetailService();

    public SpotDetailServlet() {
       
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/spot/spotDetail.jsp").forward(request, response);
	}

	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
