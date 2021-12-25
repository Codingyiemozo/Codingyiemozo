package com.kh.mvc.review.model.service;

import static com.kh.mvc.common.jdbc.JDBCTemplate.*;
import static com.kh.mvc.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.kh.mvc.review.model.dao.ReviewDao;
import com.kh.mvc.review.model.vo.Review;

public class ReviewService {
	
	private ReviewDao dao = new ReviewDao();

	
	public Review findReviewByNo(int no, boolean hasRead) {
		Review review = null;
		Connection connection = getConnection();
		
		review = dao.findReviewByNo(connection, no);
		
		// 게시글 조회수를 증가시키는 로직
		if(review != null && !hasRead) {
			int result = dao.updateReadCount(connection, review);
			
			if(result > 0) {
				commit(connection);
			} else {
				rollback(connection);
			}
		}
		
		close(connection);		
		
		return review;
	}


	public int save(Review review) {
		int result = 0;
		Connection connection = getConnection();
		
		if (review.getRv_no() != 0 ) {
			result = dao.updateReview(connection, review);
		} else {
			result = dao.insertBoard(connection, review);
		}
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);		
		
		return result;
	}	
	

	// 여행지 목록 조회
	public List<Review> getSpotList(String spotType) {
		List<Review> spotList = null;
		Connection connection = getConnection();
		
		spotList = dao.getspotList(connection, spotType);
		
		close(connection);
		return spotList;
	}

	// 맛집 목록 조회
	public List<Review> getRestList(String restType) {
		List<Review> restList = null;
		Connection connection = getConnection();
		
		restList = dao.getRestList(connection, restType);
		
		close(connection);
		return restList;
	}
	// 숙소 목록 조회
	public List<Review> getStayList(String stayType) {
		List<Review> stayList = null;
		Connection connection = getConnection();
		
		stayList = dao.getstayList(connection, stayType);
		
		close(connection);
		return stayList;
	}

}