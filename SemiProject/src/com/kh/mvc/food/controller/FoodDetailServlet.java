package com.kh.mvc.food.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.food.model.service.FoodDetailService;
import com.kh.mvc.food.model.vo.FoodDetailVo;


@WebServlet("/food/foodDetail")
public class FoodDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	// 1. service 클래스 및 객체 생성
	private FoodDetailService service = new FoodDetailService();

    public FoodDetailServlet() {

    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
		/* 2. 
		 *   1) 사용자로부터 받은 no(파란글)값을 request.getParameter() 메소드로 받음
		 *   2) 
		 */    	int no = Integer.parseInt(request.getParameter("no"));
		
		System.out.println("NO : " + no);
		
		FoodDetailVo detailVo = service.findByNo(no);
    	
		System.out.println(detailVo);
    	
		request.setAttribute("detailVo", detailVo);
    	request.getRequestDispatcher("/views/food/foodDetail.jsp").forward(request, response);
	}

}
