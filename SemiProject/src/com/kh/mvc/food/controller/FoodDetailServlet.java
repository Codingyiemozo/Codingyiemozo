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
       
	private FoodDetailService service = new FoodDetailService();

    public FoodDetailServlet() {

    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	int no = Integer.parseInt(request.getParameter("no"));
		
		System.out.println("NO : " + no);
		
		FoodDetailVo detailVo = service.findByNo(no);
    	
		System.out.println(detailVo);
    	
		request.setAttribute("detailVo", detailVo);
    	request.getRequestDispatcher("/views/food/foodDetail.jsp").forward(request, response);
	}

}
