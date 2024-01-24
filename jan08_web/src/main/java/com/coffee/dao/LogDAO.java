package com.coffee.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Map;

import com.coffee.util.Util;

public class LogDAO extends AbstractDAO {
	
	// 오버로딩 기법 적용 (AbstractDAO에 적어서 상속받아도 됨.)
	
//	public void write(String ip, String url, String data) {
//		Connection con = db.getConnection();
//		PreparedStatement pstmt = null;
//		String sql = "INSERT INTO iplog(iip, iurl, idata) VALUES (?,?,?)";
//		
//		try {
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, ip);
//			pstmt.setString(2, url);
//			pstmt.setString(3, data);
//			
//			pstmt.execute();
//			  
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(null, pstmt, con);
//		}
//	}
	

	public void write(Map<String, Object> log) {
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO iplog(iip, iurl, idata) VALUES (?,?,?)";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, log.get("ip").toString());
			pstmt.setString(2, log.get("url").toString());
			pstmt.setString(3, log.get("data").toString());
			
			pstmt.execute();
			  
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(null, pstmt, con);
		}
	}
	
}
