package com.kh.mvc.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import static com.kh.mvc.common.jdbc.JDBCTemplate.*;
import com.kh.mvc.member.model.vo.Member;

public class MemberDao {

	public Member findMemberById(Connection connection, String id) {
		Member member = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String query = "SELECT * FROM TB_MEM WHERE MEM_ID=? AND STATUS='Y'";
		
		try {
			pstm = connection.prepareStatement(query);
			
			pstm.setString(1, id);
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				member = new Member();
				
				member.setNo(rs.getInt("NO"));
				member.setId(rs.getString("MEM_ID"));
				member.setPassword(rs.getString("PASSWORD"));
				member.setRole(rs.getString("ROLE"));
				member.setName(rs.getString("MEM_NM"));
				member.setPhone(rs.getString("PHONE"));
				member.setEmail(rs.getString("EMAIL"));
				member.setAddress(rs.getString("ADDR"));
				member.setStatus(rs.getString("STATUS"));
				member.setEnrollDate(rs.getDate("ENROLL_DATE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
		}
		return member;
	}

	public int insertMember(Connection connection, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO TB_MEM VALUES(SEQ_UNO.NEXTVAL,?,?,DEFAULT,?,?,?,?,DEFAULT,DEFAULT)";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getPhone());
			pstmt.setString(5, member.getEmail());
			pstmt.setString(6, member.getAddress());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateMember(Connection connection, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE TB_MEM SET NAME=?,PHONE=?,EMAIL=?,ADDRESS=? WHERE NO=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getPhone());
			pstmt.setString(3, member.getEmail());
			pstmt.setString(4, member.getAddress());
			pstmt.setInt(5, member.getNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// db 회원 status 관련
	public int updateMemberStatus(Connection connection, int no, String status) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query= "UPDATE MEMBER SET STATUS=? WHERE NO=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, query);
			pstmt.setInt(2, no);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	// 비밀번호 변경  
	public int updateMemberPassword(Connection connection, int no, String password) {
		int result = 0;
		PreparedStatement pstmt = null; 
		String query = "UPDATE MEMBER SET PASSWORD=? WHERE NO=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, password);
			pstmt.setInt(2, no);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	


}
