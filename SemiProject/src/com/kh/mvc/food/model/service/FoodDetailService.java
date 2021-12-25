package com.kh.mvc.food.model.service;

import static com.kh.mvc.common.jdbc.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.mvc.food.model.dao.FoodDetailDao;
import com.kh.mvc.food.model.vo.FoodDetailVo;

public class FoodDetailService {

	private FoodDetailDao dao  =new FoodDetailDao();
	
	public FoodDetailVo findByNo(int no) {
		
		FoodDetailVo detailVo = null;
		Connection connection = getConnection();
		
		detailVo = dao.findByNo(connection, no);
		
		close(connection);
		
		
		return detailVo;
	}

}
