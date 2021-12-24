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
				+	"RV_TYPE "
				+   "RV_TITLE, "
				+   "RV_IMG_PATH, "
				+   "RV_DATE, "
				+   "RV_COMMENT, "
				+   "RV_HITS, "
				+   "MEM_NO, "
				+   "RV_CONTENT, "
				+ "FROM TB_REVIEW "
				+ "WHERE RV_NO = ?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				review = new Review();
				
				review.setRv_no(rs.getInt("RV_NO"));
				review.setRv_type(rs.getString("RV_TYPE"));
				review.setRv_title(rs.getString("RV_TITLE"));
				review.setRv_img_path(rs.getString("RV_IMG_PATH"));
				review.setRv_date(rs.getString("RV_DATE"));
				review.setRv_comment(rs.getString("RV_COMMENT"));
				review.setRv_hits(rs.getInt("RV_HITS"));
				review.setMem_no(rs.getInt("MEM_NO"));
				review.setRv_content(rs.getString("RV_CONTENT"));
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