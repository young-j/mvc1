package com.multi.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.multi.common.UtilDB;
import com.multi.dto.GuestbookDto;

public class GuestbookDao {
	
	public GuestbookDao()
	{
		try {
			Class.forName(UtilDB.driverClass);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public String getWhere(GuestbookDto dto)
	{
		String where ="";
		if( !dto.getKey().equals(""))
		{
			if(dto.getSel().equals("all"))
			{
				where = " where title like '%" + dto.getKey() +"%' "
						+ " or contents like '%" + dto.getKey() +"' "
						+ " or writer like '%" + dto.getKey() +"' ";
			}
			else if(dto.getSel().equals("1"))
			{
				where = " where title like '%" + dto.getKey() + "%' ";
			}
			else if(dto.getSel().equals("2"))
			{
				where = " where contents like '%" + dto.getKey() + "%' ";
			}
			else if(dto.getSel().equals("3"))
			{
				where = " where writer like '%" +  dto.getKey() + "%' ";
			}
		}
		
		System.out.println("where : " + where);
		return where;
	}
	public List<GuestbookDto> getList(GuestbookDto dto)
	{
		List<GuestbookDto> list 
		 	= new ArrayList<GuestbookDto>();
	
		//int start = (pg-1) * pgSize + 1
		//int end = pg*pgSize;
		
		int start=	(dto.getPg())*dto.getPgSize()+1;
		int end=	(dto.getPg()+1)*dto.getPgSize();
		
		System.out.println("pg : " + dto.getPg());
		System.out.println("pgSize : " + dto.getPgSize());
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		
		Connection conn=null;//디비연결
		PreparedStatement stmt=null;//쿼리실행객체
		ResultSet rs=null;//결과셋가져오는 객체
		
		
		
		StringBuffer buffer = new StringBuffer();
		buffer.append("select aa.num, to_char(aa.wdate, 'yyyy-mm-dd') wdate, username " ); 
		buffer.append(" ,aa.writer,  aa.title, aa.id, aa.group_id, aa.group_depth, aa.group_level, hit ");
		buffer.append(" ,nvl(aa.filename1, ' ')filename1,  nvl(aa.filename2, ' ')filename2,  nvl(aa.filename3,' ')filename3 ");
		buffer.append(" from                                          ");
		buffer.append(" (                                             ");
		buffer.append("   select rownum num, a.* from                 ");
		buffer.append("   (                                           ");
		buffer.append("     select id, title, wdate, writer, group_id, group_depth, group_level, hit, username ");
		buffer.append("     ,filename1, filename2, filename3         ");
		buffer.append("     from board A                              ");
		buffer.append("     left outer join tb_member B on A.writer=B.userid  ");
		buffer.append( getWhere(dto));
		buffer.append("     order by group_id desc, group_level asc   ");
		buffer.append("   )a where rownum<=?                          ");
		buffer.append("  )aa where num>=?                             ");
      
	    System.out.println(buffer.toString());
		try
		{
			conn = DriverManager.getConnection(UtilDB.url, UtilDB.id,UtilDB.pwd);
			stmt = conn.prepareStatement(buffer.toString());
			stmt.setInt(1, end );
			stmt.setInt(2, start);
			
			rs = stmt.executeQuery();
			
			//데이터 한건씩 읽을때마다 새로운 
			//dto 만들어서 list 에 추가 
			while(rs.next()) {
				GuestbookDto tempDto  = new GuestbookDto();
				
				tempDto.setNum(rs.getInt("num"));
				tempDto.setId(rs.getString("id"));
				tempDto.setTitle(rs.getString("title"));
				tempDto.setWriter(rs.getString("writer"));
				tempDto.setWdate(rs.getString("wdate"));
				tempDto.setHit(rs.getInt("hit"));
				
				tempDto.setGroup_id(rs.getInt("group_id"));
				tempDto.setGroup_depth(rs.getInt("group_depth"));
				tempDto.setGroup_level(rs.getInt("group_level"));
				tempDto.setFileName1(rs.getString("filename1"));
				tempDto.setFileName2(rs.getString("filename2"));
				tempDto.setFileName3(rs.getString("filename3"));

				tempDto.setUsername(rs.getString("username"));

				
				System.out.println(tempDto.getTitle());
				list.add(tempDto);
			}
			
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally {
			try {
				if(rs!=null)rs.close();
				if(stmt!=null)stmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}	
		}
		
		return list;
	}
	
	public int getId()
	{
		Connection conn=null;//디비연결
		PreparedStatement stmt=null;//쿼리실행객체
		ResultSet rs=null;//결과셋가져오는 객체
		int id=1;
		
		String sql = "(select nvl(max(id),0)+1 from board)";
		try
		{
			conn = DriverManager.getConnection(UtilDB.url, UtilDB.id, UtilDB.pwd);
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			if( rs.next())
				id = rs.getInt(1);
			
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally {
			try {
				if(rs!=null)rs.close();
				if(stmt!=null)stmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}	
		}
		return id;
	}
	
	public  void insert(GuestbookDto dto)
	{
		Connection conn=null;//디비연결
		PreparedStatement stmt=null;//쿼리실행객체
		ResultSet rs=null;//결과셋가져오는 객체
		
		String sql ="";
		int id = getId();
		sql="insert into board(id, title, contents, writer, group_id, group_depth, group_level, ";
		sql += " filename1, filename2, filename3, wdate, hit) values (";
		sql += " ?, ?,?,?, ?,?,?,?,?,?, sysdate, 0) ";
	
	    System.out.println(sql);
		try
		{
			conn = DriverManager.getConnection(	UtilDB.url, UtilDB.id,UtilDB.pwd);
			stmt = conn.prepareStatement(sql);
			
			int pos=1;
			stmt.setInt(pos++, id);
			stmt.setString(pos++, dto.getTitle());
			stmt.setString(pos++, dto.getContents());
			stmt.setString(pos++, dto.getWriter());
			stmt.setInt(pos++, id);
			stmt.setInt(pos++, 0);
			stmt.setInt(pos++, 1);
			stmt.setString(pos++, dto.getFileName1());
			stmt.setString(pos++, dto.getFileName2());
			stmt.setString(pos++, dto.getFileName3());
			
			stmt.execute();
		
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally {
			try {
				if(rs!=null)rs.close();
				if(stmt!=null)stmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}	
		}
	}
	
	//답글 달기 
	public  void reply(GuestbookDto dto)
	{
		Connection conn=null;//디비연결
		PreparedStatement stmt=null;//쿼리실행객체
		ResultSet rs=null;//결과셋가져오는 객체
		
		String sql ="";
		int id = getId();
		
	    System.out.println(sql);
		try
		{
			conn = DriverManager.getConnection(	UtilDB.url, UtilDB.id,UtilDB.pwd);
			
			sql = "update board set group_level=group_level+1 where group_id=? and group_level>?";
			stmt = conn.prepareStatement(sql);
			int pos=1;
			stmt.setInt(pos++, dto.getGroup_id());
			stmt.setInt(pos++, dto.getGroup_level());
			System.out.println(sql);
			System.out.println(dto.getGroup_id());
			System.out.println(dto.getGroup_level());
			
			stmt.execute();
			stmt.close();
			
			
			sql="insert into board(id, title, contents, writer, group_id, group_depth, group_level, ";
			sql += " filename1, filename2, filename3, wdate, hit) values (";
			sql += " ?, ?,?,?, ?,?,?,?,?,?, sysdate, 0) ";
		
			stmt = conn.prepareStatement(sql);

			pos=1;
			stmt.setInt(pos++, id);
			stmt.setString(pos++, dto.getTitle());
			stmt.setString(pos++, dto.getContents());
			stmt.setString(pos++, dto.getWriter());
			stmt.setInt(pos++, dto.getGroup_id());
			stmt.setInt(pos++, dto.getGroup_depth()+1); //부모글 깊이 +1 
			stmt.setInt(pos++, dto.getGroup_level()+1); //부모글 그룹 레벨 + 1
			stmt.setString(pos++, dto.getFileName1());
			stmt.setString(pos++, dto.getFileName2());
			stmt.setString(pos++, dto.getFileName3());
			
			stmt.execute();
		
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally {
			try {
				if(rs!=null)rs.close();
				if(stmt!=null)stmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}	
		}
	}
	
	
	//수정 
	public  void update(GuestbookDto dto)
	{
		Connection conn=null;//디비연결
		PreparedStatement stmt=null;//쿼리실행객체
		
		String sql ="";
		
		sql="update board set title =?, contents=?, filename1=?, filename2=?, filename3=? ";
		sql += " where id=?";
		System.out.println(sql);
		
		try
		{
			conn = DriverManager.getConnection(	UtilDB.url, UtilDB.id,UtilDB.pwd);
			stmt = conn.prepareStatement(sql);
	
			int pos=1;
			
			stmt.setString(pos++, dto.getTitle());
			stmt.setString(pos++, dto.getContents());
			stmt.setString(pos++, dto.getFileName1());
			stmt.setString(pos++, dto.getFileName2());
			stmt.setString(pos++, dto.getFileName3());
			stmt.setString(pos++, dto.getId());
			
			System.out.println("********************");
			stmt.execute();
			System.out.println("********************");
		
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally {
			try {
				if(stmt!=null)stmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}	
		}
	}
	
	public  void delete(String id)
	{
		Connection conn=null;//디비연결
		PreparedStatement stmt=null;//쿼리실행객체
		
		String sql ="";
		
		sql="delete from board ";
		sql += " where id=?";
		System.out.println(sql);
		
		try
		{
			conn = DriverManager.getConnection(	UtilDB.url, UtilDB.id,UtilDB.pwd);
			stmt = conn.prepareStatement(sql);
	
			int pos=1;
			
			stmt.setString(pos++, id);
			
			
			System.out.println("********************");
			stmt.execute();
			System.out.println("********************");
		
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally {
			try {
				if(stmt!=null)stmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}	
		}
	}
	
		
	public GuestbookDto getView(   String id)
	{
		GuestbookDto dto = null;
	
		Connection conn=null;//디비연결
		PreparedStatement stmt=null;//쿼리실행객체
		ResultSet rs=null;//결과셋가져오는 객체
		
		//조회수 증가하기 
		String updateSql="update board set hit=hit+1 where id=?";
		
		String sql="select id, title, writer, contents, to_char(wdate, 'yyyy-mm-dd') wdate, hit ";
		sql += ", nvl(filename1,' ') filename1, nvl(filename2, ' ') filename2, nvl(filename3, ' ') filename3 ";
		sql += ", group_id, group_depth, group_level, username ";
	    sql += " from board A ";
	    sql += " left outer join tb_member B on A.writer=B.userid ";
	    sql += " where id=? ";
	   	
	    System.out.println(sql);
		try
		{
			conn = DriverManager.getConnection(UtilDB.url, UtilDB.id,UtilDB.pwd);
			
			//조회수 증가하기 
			stmt = conn.prepareStatement(updateSql);
			stmt.setString(1,  id);
			stmt.execute();
			stmt.close();
			
			
			stmt = conn.prepareStatement(sql);
			stmt.setString(1,  id);
			
			rs = stmt.executeQuery();
		
			if(rs.next()) {
				dto = new GuestbookDto();
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setWriter(rs.getString("writer"));
				dto.setWdate(rs.getString("wdate"));
				dto.setContents(rs.getString("contents"));
				dto.setFileName1(rs.getString("filename1"));
				dto.setFileName2(rs.getString("filename2"));
				dto.setFileName3(rs.getString("filename3"));
				dto.setGroup_id(rs.getInt("group_id"));
				dto.setGroup_depth(rs.getInt("group_depth"));
				dto.setGroup_level(rs.getInt("group_level"));
				dto.setHit(rs.getInt("hit"));
				dto.setUsername(rs.getString("username"));
			
			
			}
			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally {
			try {
				if(rs!=null)rs.close();
				if(stmt!=null)stmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}	
		}
		
		return dto;
	}
	
	
	public int getTotalCount(GuestbookDto dto)
	{
		Connection conn=null;//디비연결
		PreparedStatement stmt=null;//쿼리실행객체
		ResultSet rs=null;//결과셋가져오는 객체
		
		String sql="select count(*) from board";
		sql = sql +  getWhere(dto);
	   	int result=0;
	   	
	    System.out.println(sql);
		try
		{
			conn = DriverManager.getConnection(
				UtilDB.url, UtilDB.id,UtilDB.pwd);
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
		
			if(rs.next()) {
				result=rs.getInt(1);
			}
			
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally {
			try {
				if(rs!=null)rs.close();
				if(stmt!=null)stmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}	
		}
		
		return result;
	}
}
