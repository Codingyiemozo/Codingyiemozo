package com.kh.mvc.spot.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.spot.model.service.BoardService;
import com.kh.mvc.spot.model.vo.BoardList;
	

@WebServlet("/spot/spotList")
public class SpotListSerlvet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private BoardService service = new BoardService();
	
    public SpotListSerlvet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String spotType = "관광명소";
    	String expirenceType = "체험";
    	String shoppingType = "쇼핑";
    	
    	// --------- 유일님 여기 추가 했어요 ----------- 
    	// int localType1 = 1; // 추자도
    	// int localType2 = 2; // 차귀도
    	
    	int localType1 = 14; // 서귀포시
    	int localType2 = 11; // 성산
    	
    	List<BoardList> localList1 = null;
    	List<BoardList> localList2 = null;
    	
    	localList1 = service.getLocalList1(localType1);
    	localList1 = service.getLocalList2(localType2);
    	
    	request.setAttribute("localList1", localList1);
    	request.setAttribute("localList2", localList2);
    	// --------- 유일님 여기 추가 했어요 -----------

    	List<BoardList> spotList = null;
    	List<BoardList> experienceList = null;
    	List<BoardList> shoppingList = null;
    	
    	spotList = service.getSpotList(spotType);
    	experienceList = service.getExperienceList(expirenceType);
    	shoppingList = service.getShoppingList(shoppingType);
		
    	request.setAttribute("spotList", spotList);
    	request.setAttribute("experienceList", experienceList);
    	request.setAttribute("shoppingList", shoppingList);
    	request.setAttribute("localList1", localList1);
    	request.setAttribute("localList2", localList2);
    	
    	request.getRequestDispatcher("/views/spot/spotList.jsp").forward(request, response);
	}
    
    

}
