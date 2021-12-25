package com.kh.mvc.spot.model.dao;

import static com.kh.mvc.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.mvc.spot.model.vo.BoardList;

public class BoardDao {
	// 여행지 : 관광명소 조회
	public List<BoardList> findSpotList(Connection connection, String spotType) {
		List<BoardList> spotList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = 
				"SELECT SP_NO, SP_TITLE, SP_TYPE, SP_IMG_PATH, SP_CONTENT "
				+ "FROM TB_SPOT "
				+ "WHERE SP_TYPE=?";

		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, spotType);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardList spotListData = new BoardList();
				spotListData.setNo(rs.getInt("SP_NO"));
				spotListData.setTitle(rs.getString("SP_TITLE"));
				spotListData.setType(rs.getString("SP_TYPE"));
				spotListData.setImgPath(rs.getString("SP_IMG_PATH"));
				spotListData.setContent(rs.getString("SP_CONTENT"));
				spotList.add(spotListData);
				System.out.println(spotListData);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return spotList;
	}

	// 여행지 : 체험 조회
	public List<BoardList> findExperienceList(Connection connection, String experienceType) {
		List<BoardList> experienceList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = 
					"SELECT SP_NO, SP_TITLE, SP_TYPE, SP_IMG_PATH, SP_CONTENT "
						+ "FROM TB_SPOT "
						+ "WHERE SP_TYPE=?";

		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, experienceType);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardList experienceListData = new BoardList();
				experienceListData.setNo(rs.getInt("SP_NO"));
				experienceListData.setTitle(rs.getString("SP_TITLE"));
				experienceListData.setType(rs.getString("SP_TYPE"));
				experienceListData.setImgPath(rs.getString("SP_IMG_PATH"));
				experienceListData.setContent(rs.getString("SP_CONTENT"));
				experienceList.add(experienceListData);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return experienceList;
	}
	
	// 여행지 : 쇼핑 조회
	public List<BoardList> findShoppingList(Connection connection, String shoppingType) {
		List<BoardList> shoppingList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = 
					"SELECT SP_NO, SP_TITLE, SP_TYPE, SP_IMG_PATH, SP_CONTENT "
						+ "FROM TB_SPOT "
						+ "WHERE SP_TYPE=?";

		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, shoppingType);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardList shoppingListData = new BoardList();
				shoppingListData.setNo(rs.getInt("SP_NO"));
				shoppingListData.setTitle(rs.getString("SP_TITLE"));
				shoppingListData.setType(rs.getString("SP_TYPE"));
				shoppingListData.setImgPath(rs.getString("SP_IMG_PATH"));
				shoppingListData.setContent(rs.getString("SP_CONTENT"));
				
				shoppingList.add(shoppingListData);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return shoppingList;
	}

	// 게시글 상세 열기
	public BoardList findBoardByNo(Connection connection, int no) {
		BoardList board = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = 
				"SELECT SP_NO, SP_TITLE, SP_TYPE, SP_IMG_PATH, SP_ADDR, SP_PHONE, SP_PRICE, SP_OFFDAY, SP_CONTENT, SP_LAT, SP_LONG, LOCAL "
						+ "FROM TB_SPOT "
						+ "WHERE SP_NO=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				board = new BoardList();
				
				board.setNo(rs.getInt("SP_NO"));
				board.setTitle(rs.getString("SP_TITLE"));
				board.setType(rs.getString("SP_TYPE"));
				board.setImgPath(rs.getString("SP_IMG_PATH"));
				board.setAddr(rs.getString("SP_ADDR"));
				board.setPrice(rs.getString("SP_PRICE"));
				board.setOffday(rs.getString("SP_OFFDAY"));
				board.setContent(rs.getString("SP_CONTENT"));
				board.setXlat(rs.getString("SP_LAT"));
				board.setYlong(rs.getString("SP_LONG"));
				board.setLocal(rs.getString("LOCAL"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return board;
	}
	
}












