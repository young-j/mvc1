package com.multi.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.multi.common.UtilDB;
import com.multi.dto.MemberDto;


public class MemberDao {
	public MemberDao()
	{
		try {
			Class.forName(UtilDB.driverClass);
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public void insert(MemberDto memberDto)
	{
		Connection conn = null;
		PreparedStatement stmt = null;
		PreparedStatement stmt2 = null;
		ResultSet rs = null;
		
		String sql = "select nvl(max(member_id), 0)+1 from tb_member";
		StringBuffer buffer = new StringBuffer();
		//1.쿼리 
		/*
		insert into TB_MEMBER(
			MEMBER_ID, USERID, PASSWORD, EMAIL, USERNAME, ZIPCODE, ADDRESS1, ADDRESS2, PHONE, REGDATE,
			) values (?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate);
			*/
		buffer.append("insert into TB_MEMBER(");
		buffer.append("MEMBER_ID, USERID, PASSWORD, EMAIL, USERNAME, ZIPCODE,");
		buffer.append("ADDRESS1, ADDRESS2, PHONE, REGDATE)");
		buffer.append(" values (?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)");
		
		//디버깅하는법
		System.out.println(buffer);
		System.out.println("member_id : " + memberDto.getMember_id());
		System.out.println("userid : " + memberDto.getUserid());
		System.out.println("password : " + memberDto.getPassword());
		System.out.println("email : " + memberDto.getEmail());
		System.out.println("zipcode : " + memberDto.getZipcode());
		System.out.println("address1 : " + memberDto.getAddress1());
		System.out.println("address2 : " + memberDto.getAddress2());
		System.out.println("phone : " + memberDto.getPhone());
		System.out.println("usename : " + memberDto.getUsername());
		
		//프로그램상의 쿼리에 ;붙이면 오류 난다
		
		try
		{
			conn = DriverManager.getConnection(UtilDB.url, UtilDB.id, UtilDB.pwd);
			//새로 추가할 아이디 가져오기
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			int member_id=1;
			
			if(rs.next())
				member_id = rs.getInt(1); //첫번째 항목 데이터를 가져온다
			System.out.println("member_id :" + member_id);
			
			stmt2 = conn.prepareStatement(buffer.toString());
			
			int pos = 1;
			stmt2.setString(pos++, member_id+"");
			stmt2.setString(pos++, memberDto.getUserid());
			stmt2.setString(pos++, memberDto.getPassword());
			stmt2.setString(pos++, memberDto.getEmail());
			stmt2.setString(pos++, memberDto.getUsername());
			stmt2.setString(pos++, memberDto.getZipcode());
			stmt2.setString(pos++, memberDto.getAddress1());
			stmt2.setString(pos++, memberDto.getAddress2());
			stmt2.setString(pos++, memberDto.getPhone());
			
			stmt2.execute();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		 finally {
	         try {
	        	 if(rs != null) rs.close();
	        	 if(stmt != null) stmt.close();
	        	 if(stmt2 != null) stmt2.close();
	        	 if(conn != null) conn.close();
	         } catch(SQLException s) {
	            s.printStackTrace();
	         }   
		 }
	}//insert 함수 종료
	
	
	public MemberDto logon(String userid, String password)
	{
		MemberDto dto=null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		StringBuffer buffer = new StringBuffer();
		buffer.append("");
		
		buffer.append(" select member_id, userid, username, phone, email ");
		buffer.append(" from tb_member ");
		buffer.append(" where userid=? and password=?  ");
		
		System.out.println(buffer.toString());
		System.out.println("userid : " + userid);
		System.out.println("password : " + password);
		
		
		try
		{
			conn = DriverManager.getConnection(UtilDB.url, UtilDB.id, UtilDB.pwd);
			stmt = conn.prepareStatement(buffer.toString());
			int pos = 1;
			stmt.setString(pos++, userid);
			stmt.setString(pos++, password);
			
			rs = stmt.executeQuery();
			if(rs.next()) //해당데이터가 있다면
			{
				dto = new MemberDto();
				dto.setUserid(rs.getString("userid"));
				dto.setUsername(rs.getString("username"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone(rs.getString("phone"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		finally {
	         try {
	        	 if(rs != null) rs.close();
	        	 if(stmt != null) stmt.close();
	        	 if(conn != null) conn.close();
	         } catch(SQLException s) {
	            s.printStackTrace();
	         }   
		}
		
		return dto;
	}
	
	public boolean idCheck(String userid)
	{
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		StringBuffer buffer = new StringBuffer();
		
		//select count(*) from tb_member where userid='test';
		buffer.append(" select count(*)  ");
		buffer.append(" from tb_member   ");
		buffer.append(" where userid=?   ");
		
		System.out.println(buffer.toString());
		System.out.println("userid : " + userid);
			
		try
		{
			conn = DriverManager.getConnection(UtilDB.url, UtilDB.id, UtilDB.pwd);
			stmt = conn.prepareStatement(buffer.toString());
			int pos = 1;
			stmt.setString(pos++, userid);
			
			rs = stmt.executeQuery();
			if(rs.next()) //해당데이터가 있다면
			{
				if(rs.getInt(1) == 0)
					return true; //사용자가 한명도 없으므로 아이디를 사용할 수 있다
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		finally {
	         try {
	        	 if(rs != null) rs.close();
	        	 if(stmt != null) stmt.close();
	        	 if(conn != null) conn.close();
	         } catch(SQLException s) {
	            s.printStackTrace();
	         }   
		}
		
		return false;
	}
	
	//이메일과 전화번호를 가지고 와서 아이디를 찾아준다
	public String findId(String email, String phone)
	{
		MemberDto dto=null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		StringBuffer buffer = new StringBuffer();
		buffer.append("");
		
		buffer.append(" select userid ");
		buffer.append(" from tb_member ");
		buffer.append(" where email=? and phone=?  ");
		
		System.out.println(buffer.toString());
		System.out.println("email : " + email);
		System.out.println("phone : " + phone);
		
		
		try
		{
			conn = DriverManager.getConnection(UtilDB.url, UtilDB.id, UtilDB.pwd);
			stmt = conn.prepareStatement(buffer.toString());
			int pos = 1;
			stmt.setString(pos++, email);
			stmt.setString(pos++, phone);
			
			rs = stmt.executeQuery();
			if(rs.next()) //해당데이터가 있다면
			{
				
				return rs.getString("userid");
				//여기서 함수가 중단된다

			}
		}catch(Exception e){
			e.printStackTrace();
		}
		finally {
	         try {
	        	 if(rs != null) rs.close();
	        	 if(stmt != null) stmt.close();
	        	 if(conn != null) conn.close();
	         } catch(SQLException s) {
	            s.printStackTrace();
	         }   
		}
		
		return "";//못 찾았을때는 ""가 반환된다
	}
	
	public String findPwd(String email, String userid)
	{
		MemberDto dto=null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		StringBuffer buffer = new StringBuffer();
		buffer.append("");
		
		buffer.append(" select password ");
		buffer.append(" from tb_member ");
		buffer.append(" where email=? and userid=?  ");
		
		System.out.println(buffer.toString());
		System.out.println("email : " + email);
		System.out.println("userid : " + userid);
		
		
		try
		{
			conn = DriverManager.getConnection(UtilDB.url, UtilDB.id, UtilDB.pwd);
			stmt = conn.prepareStatement(buffer.toString());
			int pos = 1;
			stmt.setString(pos++, email);
			stmt.setString(pos++, userid);
			
			rs = stmt.executeQuery();
			if(rs.next()) //해당데이터가 있다면
			{
				
				return rs.getString("password");
				//여기서 함수가 중단된다

			}
		}catch(Exception e){
			e.printStackTrace();
		}
		finally {
	         try {
	        	 if(rs != null) rs.close();
	        	 if(stmt != null) stmt.close();
	        	 if(conn != null) conn.close();
	         } catch(SQLException s) {
	            s.printStackTrace();
	         }   
		}
		
		return "";//못 찾았을때는 ""가 반환된다
	}
	
}//클래스 종료
