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
				+ 	"RV_NO, "
				+ 	"MEM_NO, "
				+   "MEM_NM, "
				+   "CM_DATE, "
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
				comment.setRv_no(rs.getInt("RV_NO"));
				comment.setMem_no(rs.getInt("MEM_NO"));
				comment.setCm_date(rs.getDate("CM_DATE"));
				comment.setCm_content(rs.getString("CM_CONTENT"));
				comment.setMem_nm(rs.getString("MEM_NM"));
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return comment;
	}

	public int insertComment(Connection connection, Comment c	omment) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO REPLY VALUES(SEQ_COMMENT_NO.NEXTVAL, ?, ?, ?, DEFAULT, DEFAULT, DEFAULT)";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, reply.getCm_no());
			pstmt.setInt(2, reply.getMem_no());
			pstmt.setString(3, reply.getCm_content());
			
			result = pstmt.executeUpdate();	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	
}