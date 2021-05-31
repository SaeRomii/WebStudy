/*==============================
    MemberDAO.java
==============================*/

package com.test.mvc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import com.util.mvc.DBConn;

public class MemberDAO 
{
	private Connection conn;
	
	public Connection connection() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
		
		return conn;
	}
	
	// 데이터 입력 
	public int add(MemberDTO dto) throws SQLException
	{
		int result = 0;
		
		String sql = "INSERT INTO TBL_MEMBERLIST(ID, PW, NAME, TEL, EMAIL) VALUES(?, ?, ?, ?, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, dto.getId());
		pstmt.setString(2, dto.getPw());
		pstmt.setString(3, dto.getName());
		pstmt.setString(4, dto.getTel());
		pstmt.setString(5, dto.getEmail());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		
		return result;
	}
	
	// 전체 조회
	public ArrayList<MemberDTO> lists() throws SQLException
	{
		ArrayList<MemberDTO> lists = new ArrayList<MemberDTO>();
		
		String sql = "SELECT ID, PW, NAME, TEL, EMAIL FROM TBL_MEMBERLIST";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			MemberDTO dto = new MemberDTO();
			
			dto.setId(rs.getString("ID"));
			dto.setPw(rs.getString("PW"));
			dto.setName(rs.getString("NAME"));
			dto.setTel(rs.getString("TEL"));
			dto.setEmail(rs.getString("EMAIL"));
			
			lists.add(dto);
		}
		
		rs.close();
		pstmt.close();
		
		return lists;
	}
	
	/*
	 * // 아이디 조회 public int idCheck(String id) throws SQLException { int result = 0;
	 * 
	 * String sql = "SELECT COUNT(*) AS COUNT FROM TBL_MEMBERLIST WHERE ID=?";
	 * 
	 * PreparedStatement pstmt = conn.prepareStatement(sql); pstmt.setString(1, id);
	 * ResultSet rs = pstmt.executeQuery();
	 * 
	 * if(rs.next()) result = rs.getInt("COUNT");
	 * 
	 * rs.close(); pstmt.close();
	 * 
	 * return result; }
	 * 
	 * // 이메일 조회 public int emailCheck(String email) throws SQLException { int
	 * result = 0;
	 * 
	 * String sql = "SELECT COUNT(*) AS COUNT FROM TBL_MEMBERLIST WHERE EMAIL=?";
	 * 
	 * PreparedStatement pstmt = conn.prepareStatement(sql); pstmt.setString(1,
	 * email); ResultSet rs = pstmt.executeQuery();
	 * 
	 * if(rs.next()) result = rs.getInt("COUNT");
	 * 
	 * rs.close(); pstmt.close();
	 * 
	 * return result; }
	 */
	
	 public void close() throws SQLException 
     {
        DBConn.close();
     }

	
	
}
