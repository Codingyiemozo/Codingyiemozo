package com.kh.mvc.review.model.service;

import static com.kh.mvc.common.jdbc.JDBCTemplate.close;
import static com.kh.mvc.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.kh.mvc.review.model.dao.ReviewDao;
import com.kh.mvc.review.model.vo.Review;

public class ReviewService {
	
	private ReviewDao dao = new ReviewDao();

	
	public Review findReviewByNo(int no, boolean hasRead) {
		Review review = null;
		Connection connection = getConnection();
		
		review = dao.findReviewByNo(connection, no);
		
		// 게시글 조회수를 증가시키는 로직
//		if(review != null && !hasRead) {
//			int result = dao.updateReadCount(connection, review);
//			
//			if(result > 0) {
//				commit(connection);
//			} else {
//				rollback(connection);
//			}
//		}
		
		close(connection);		
		
		return review;
	}

}