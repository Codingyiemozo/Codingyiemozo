package com.kh.mvc.review.model.dao;

import static com.kh.mvc.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.mvc.review.model.vo.Comment;

public class CommentDao {
	
	public List<Comment> getRepliesByNo(Connection connection, int cm_no) {
		List<Comment> comments = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = null;
		
		try {
			query = 
				  "SELECT CM_NO, RV_NO, MEM_NO, MEM_NM, CM_DATE, CM_CONTENT "
				+ "FROM TB_COMMENT C "
				+ "JOIN TB_REVIEW R "
				+ "ON(C.RV_NO = R.RV_NO) "
				+ "JOIN TB_MEM M "
				+ "ON(C.MEM_NO = M.NO) "
				+ "WHERE BOARD_NO=? "
				+ "ORDER BY R.NO DESC";
			
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, cm_no);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Comment comment = new Comment();
				
				comment.setCm_no(rs.getInt("CM_NO"));
				comment.setRv_no(rs.getInt("RV_NO"));
				comment.setMem_no(rs.getInt("MEM_NO"));
				comment.setMem_nm(rs.getString("MEM_NM"));
				comment.setCm_date(rs.getDate("CM_DATE"));
				comment.setCm_content(rs.getString("CM_CONTENT"));
				
				comments.add(comment);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}		
		
		return comments;
	}
	

	public int insertComment(Connection connection, Comment comment) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO TB_COMMENT(CM_NO, RV_NO, MEM_NO, CM_DATE, CM_CONTENT) "
				+ "		VALUES(SEQ_COMMENT_NO.NEXTVAL,?, ?, SYSDATE, ?)";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, comment.getCm_no());
			pstmt.setInt(2, comment.getRv_no());
			pstmt.setString(3, comment.getCm_content());
			
			result = pstmt.executeUpdate();	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	
}