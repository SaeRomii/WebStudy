/*===========================
	ScoreDAO.java
============================*/


package com.test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.util.DBConn;

public class ScoreDAO
{
	private Connection conn;
	
	public ScoreDAO() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
	}
	
	// 입력
	public int add(ScoreDTO dto) throws SQLException
	{
		int result=0;
		
		// 객체 생성
		Statement stmt = conn.createStatement();
		
		// 쿼리문 준비
		String sql = String.format("INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, '%s', %s, %s, %s)", dto.getNAME(), dto.getKOR(), dto.getENG(), dto.getMAT());
		
		result = stmt.executeUpdate(sql);
		
		stmt.close();
		
		return result;
	}
	
	// 전체 조회
	public ArrayList<ScoreDTO>lists() throws SQLException
	{
		ArrayList<ScoreDTO> result = new ArrayList<ScoreDTO>();
		
		// 객체 생성
		Statement stmt = conn.createStatement();
		
		// 쿼리문 준비
		String sql = "SELECT SID, NAME, KOR, ENG, MAT, (KOR+ENG+MAT) AS TOT, ROUND(((KOR+ENG+MAT)/3.0),1) AS AVG FROM TBL_SCORE ORDER BY SID ASC";
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next())
		{
			ScoreDTO dto = new ScoreDTO();
			dto.setSID(rs.getString("SID"));
			dto.setNAME(rs.getString("NAME"));
			dto.setKOR(rs.getString("KOR"));
			dto.setENG(rs.getString("ENG"));
			dto.setMAT(rs.getString("MAT"));
			dto.setTOT(rs.getString("TOT"));
			//dto.setAVG(rs.getString("AVG"));
			dto.setAVG(rs.getDouble("AVG"));
			
			result.add(dto);
		}
		
		rs.close();
		stmt.close();
		
		return result;
	}
	
	// 인원 수
	public int count() throws SQLException
	{
		int result = 0;
		
		// 객체 생성
		Statement stmt = conn.createStatement();
		
		// 쿼리문 준비
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_SCORE";
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next())
		{
			result = rs.getInt("COUNT");
		}
		
		rs.close();
		stmt.close();
		
		return result;
		
	}
	
	// 닫기
	public void close()
	{
		DBConn.close();
	}
}
