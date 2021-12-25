package com.kh.mvc.review.model.dao;

import static com.kh.mvc.common.jdbc.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.mvc.review.model.vo.Review;

public class ReviewDao {
	public Review findReviewByNo(Connection connection, int no) {
		Review review = null; 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = 
				"SELECT "
				+ 	"RV_NO, "
				+	"RV_TYPE, "
				+   "RV_TITLE, "
				+   "RV_DATE, "
				+   "RV_CONTENT, "
				+	"RV_IMG_PATH, "
				+   "RV_HITS, "
				+   "MEM_NM, "
				+   "MEM_NO "
				+ "FROM TB_REVIEW R "
				+ "JOIN TB_MEM M "
				+ "ON R.MEM_NO = M.NO "
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
				review.setRv_date(rs.getDate("RV_DATE"));
				review.setRv_content(rs.getString("RV_CONTENT"));
				review.setRv_img_path(rs.getString("RV_IMG_PATH"));
				review.setRv_hits(rs.getInt("RV_HITS"));
				review.setMem_nm(rs.getString("MEM_NM"));
				review.setMem_no(rs.getInt("MEM_NO"));
				
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return review;
	}

	public int updateReadCount(Connection connection, Review review) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE TB_REVIEW SET RV_HITS=? WHERE NO=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			review.setRv_hits(review.getRv_hits() + 1);
			
			pstmt.setInt(1, review.getRv_hits());
			pstmt.setInt(2, review.getRv_no());
			
			result = pstmt.executeUpdate();			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}		
		
		return result;
	}
	
	// 게시글 수정
	public int updateReview(Connection connection, Review review) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE TB_REVIEW SET TITLE=?,CONTENT=? WHERE NO=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, review.getRv_title());
			pstmt.setString(2, review.getRv_content());
			pstmt.setInt(3, review.getRv_no());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// 게시글 등록
	public int insertBoard(Connection connection, Review review) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO TB_REVIEW(RV_NO, RV_TYPE, RV_TITLE, RV_DATE, RV_CONTENT, RV_HITS, MEM_NO) "
						+ "VALUES(SEQ_TB_REVIEW_NO.NEXTVAL,?,?,DEFAULT,?,DEFAULT,?)";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, review.getRv_type());
			pstmt.setString(2, review.getRv_title());
			pstmt.setString(3, review.getRv_content());
			pstmt.setInt(4, review.getMem_no());
			
			System.out.println(result);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	
	
	
	// 썸네일용 리스트 생성
	// 여행지 리스트 작성
	public List<Review> getspotList(Connection connection, String spotType) {
		List<Review> spotList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = 
				"SELECT RV_NO, RV_TYPE, RV_IMG_PATH, RV_CONTENT "
						+ "FROM TB_REVIEW "
						+ "WHERE RV_TYPE=?";

		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, spotType);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Review spotListData = new Review();
				spotListData.setRv_no(rs.getInt("RV_NO"));
				spotListData.setRv_type(rs.getString("RV_TYPE"));
				spotListData.setRv_img_path(rs.getString("RV_IMG_PATH"));
				spotListData.setRv_content(rs.getString("RV_CONTENT"));
				spotList.add(spotListData);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return spotList;
	}
	// 맛집 리스트 생성
	public List<Review> getRestList(Connection connection, String restType) {
		List<Review> restList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = 
				"SELECT RV_NO, RV_TYPE, RV_IMG_PATH, RV_CONTENT "
				+ "FROM TB_REVIEW "
				+ "WHERE RV_TYPE=?";

		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, restType);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Review restListData = new Review();
				restListData.setRv_no(rs.getInt("RV_NO"));
				restListData.setRv_type(rs.getString("RV_TYPE"));
				restListData.setRv_img_path(rs.getString("RV_IMG_PATH"));
				restListData.setRv_content(rs.getString("RV_CONTENT"));
				restList.add(restListData);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return restList;
	}
	
	// 숙소 리스트 생성
	public List<Review> getstayList(Connection connection, String stayType) {
		List<Review> stayList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = 
				"SELECT RV_NO, RV_TYPE, RV_IMG_PATH, RV_CONTENT "
						+ "FROM TB_REVIEW "
						+ "WHERE RV_TYPE=?";

		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, stayType);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Review stayListData = new Review();
				stayListData.setRv_no(rs.getInt("RV_NO"));
				stayListData.setRv_type(rs.getString("RV_TYPE"));
				stayListData.setRv_img_path(rs.getString("RV_IMG_PATH"));
				stayListData.setRv_content(rs.getString("RV_CONTENT"));
				stayList.add(stayListData);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return stayList;
	}
	

	
}