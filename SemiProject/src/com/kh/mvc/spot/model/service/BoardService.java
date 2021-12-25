package com.kh.mvc.spot.model.service;

import static com.kh.mvc.common.jdbc.JDBCTemplate.close;
import static com.kh.mvc.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.kh.mvc.spot.model.dao.BoardDao;
import com.kh.mvc.spot.model.vo.BoardList;

public class BoardService {
	private BoardDao dao = new BoardDao();

	// 여행지 : 관광명소 목록 조회
	public List<BoardList> getSpotList(String spotType) {
		List<BoardList> spotList = null;
		Connection connection = getConnection();
		
		spotList = dao.findSpotList(connection, spotType);
		
		close(connection);
		return spotList;
	}

	// 여행지 : 체험 목록 조회
	public List<BoardList> getExperienceList(String experienceType) {
		List<BoardList> experienceList = null;
		Connection connection = getConnection();
		
		experienceList = dao.findExperienceList(connection, experienceType);
		
		close(connection);
		return experienceList;
	}
	
	// 여행지 : 쇼핑 목록 조회
	public List<BoardList> getShoppingList(String shoppingType) {
		List<BoardList> shoppingList = null;
		Connection connection = getConnection();
		
		shoppingList = dao.findShoppingList(connection, shoppingType);
		
		close(connection);
		return shoppingList;
	}
	
	// 게시글 번호 확인
	public BoardList findBoardByNo(int no) {
		BoardList board = null; // board 객체
		Connection connection = getConnection();
		
		//dao를 통해 데이터베이스에 접근
		board = dao.findBoardByNo(connection, no);
		
		close(connection);
		
		return board;
	}

	
	// -------------------------------- 유일님 여기 추가 했어요 ------------------------------------ 
	// 여행지 : 지역별 조회 (서귀포)
	public List<BoardList> getLocalList1(int localType1) {
		List<BoardList> localList1 = null;
		Connection connection = getConnection();
		
		localList1 = dao.findLocalList1(connection, localType1);
		
		close(connection);
		return localList1;
	}
	
	// 여행지 : 지역별 조회 (성산읍)
	public List<BoardList> getLocalList2(int localType2) {
		List<BoardList> localList2 = null;
		Connection connection = getConnection();
		
		localList2 = dao.findLocalList2(connection, localType2);
		
		close(connection);
		return localList2;
	}
	// -------------------------------- 유일님 여기 추가 했어요 ------------------------------------
}
