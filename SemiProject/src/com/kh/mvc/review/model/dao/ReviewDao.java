package com.kh.mvc.review.model.dao;

import static com.kh.mvc.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.kh.mvc.review.model.vo.Review;

public class ReviewDao {
	public Review findReviewByNo(Connection connection, int no) {
		Review review = null; 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = 
				"SELECT "
				+ 	"RV_NO, "
				+   "RV_TITLE, "
				+   "RV_DATE, "
				+   "RV_CONTENT, "
				+   "RV_HITS, "
				+	"RV_GROUP "
				+ "FROM TB_REVIEW "
				+ "WHERE RV_NO = ?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				review = new Review();
				
				review.setRv_no(rs.getInt("RV_NO"));
				review.setRv_title(rs.getString("RV_TITLE"));
				review.setRv_date(rs.getString("RV_DATE"));
				review.setRv_content(rs.getString("RV_CONTENT"));
				review.setRv_hits(rs.getInt("RV_HITS"));
				review.setRv_group(rs.getString("RV_GROUP"));
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return review;
	}

	
}