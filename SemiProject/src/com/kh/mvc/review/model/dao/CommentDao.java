package com.kh.mvc.review.model.dao;

import static com.kh.mvc.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.kh.mvc.review.model.vo.Comment;

public class CommentDao {
	public Comment findCommentByNo(Connection connection, int no) {
		Comment comment = null; 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = 
				"SELECT "
				+ 	"CM_NO, "
				+   "CM_WRITER, "
				+   "CM_SUBMITDATE, "
				+   "CM_CONTENT "
				+ "FROM TB_COMMENT "
				+ "WHERE CM_NO = ?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				comment = new Comment();
				
				comment.setCm_no(rs.getInt("CM_NO"));
				comment.setCm_submitdate(rs.getDate("CM_SUBMITDATE"));
				comment.setCm_content(rs.getString("CM_CONTENT"));
				comment.setCm_writer(rs.getString("CM_WRITER"));
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return comment;
	}

	
}