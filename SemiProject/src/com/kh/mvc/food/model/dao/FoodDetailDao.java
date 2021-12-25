package com.kh.mvc.food.model.dao;

import static com.kh.mvc.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.kh.mvc.food.model.vo.FoodDetailVo;

public class FoodDetailDao {

	public FoodDetailVo findByNo(Connection connection, int no) {

		FoodDetailVo detailVo = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = 
				"SELECT "
				+ 	"RS_NO, "
				+ 	"RS_TYPE, "
				+ 	"RS_NAME, "
				+ 	"RS_MENU, "
				+ 	"RS_IMG_PATH, "
				+ 	"RS_ADDR, "
				+ 	"RS_PHONE, "
				+ 	"RS_PRICE, "
				+ 	"RS_OFFDAY, "
				+ 	"RS_CONTENT, "
				+ 	"RS_LAT, "
				+ 	"RS_LONG "
				+ "FROM TB_REST "
				+ "WHERE SP_NO=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				detailVo = new FoodDetailVo();
				
				detailVo.setNo(rs.getInt("RS_NO"));
				detailVo.setType(rs.getString("RS_TYPE"));
				detailVo.setName(rs.getString("RS_NAME"));
				detailVo.setMenu(rs.getString("RS_MENU"));
				detailVo.setImgPath(rs.getString("RS_IMG_PATH"));
				detailVo.setAddr(rs.getString("RS_ADDR"));
				detailVo.setPhone(rs.getString("RS_PHONE"));
				detailVo.setPrice(rs.getString("RS_PRICE"));
				detailVo.setOffday(rs.getString("RS_OFFDAY"));
				detailVo.setContent(rs.getString("RS_CONTENT"));
				detailVo.setXlat(rs.getString("RS_LAT"));
				detailVo.setYlong(rs.getString("RS_LONG"));
				
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return detailVo;
	}

}
