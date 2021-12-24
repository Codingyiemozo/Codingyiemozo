package com.kh.mvc.review.model.service;

import static com.kh.mvc.common.jdbc.JDBCTemplate.close;
import static com.kh.mvc.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.kh.mvc.review.model.dao.CommentDao;
import com.kh.mvc.review.model.vo.Comment;
import com.kh.mvc.review.model.vo.Review;

public class CommentService {
	
	private CommentDao dao = new CommentDao();

	
	public Comment findCommentByNo(int no, boolean hasRead) {
		Comment comment = null;
		Connection connection = getConnection();
		
		comment = dao.findCommentByNo(connection, no);
		
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
		
		return comment;
	}

}