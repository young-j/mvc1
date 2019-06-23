package com.multi.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.multi.common.UtilDB;
import com.multi.dto.BoardDto;


public class BoardDao {
   
   //생성자 - jdbc driver 로딩하기
   
   public BoardDao() 
   {
      try {
         Class.forName(UtilDB.driverClass);
      } catch(ClassNotFoundException e) {
         e.printStackTrace();
      }
   }
   
   /*
   List<BoardDto> getList(BoardDto dto){
      List<BoardDto> boardList = new ArrayList<BoardDto>();
      
      boardList.add(new BoardDto());
      for(int i = 2 ; i <= 10; i++) {
         boardList.add(new BoardDto(String.valueOf(i), "홍길동"+i, "제목"+i, "내용"+i,"2019-03-1"+i));
      }
      
      for(int i = 0; i<boardList.size();i++) {
         System.out.println(boardList.get(i).getWriter());
      }
      
      return boardList;
      
   }
   */
   
   //BoardDto dto - 매개변수, 외부에서 선택한 검색내용을 본내기 위해서
   //getList - 데이터 10개만 읽어서 ArrayList 객체에 담아보내면 된다.
   public List<BoardDto> getList(BoardDto dto) 
   {
      List<BoardDto> boardList = new ArrayList<BoardDto>();
      
      Connection conn = null;
      PreparedStatement stmt = null;
      ResultSet rs = null;
      
      StringBuffer buffer = new StringBuffer();
      buffer.append("select * from tb_board1");
      
      try {
         conn = DriverManager.getConnection(UtilDB.url, UtilDB.id, UtilDB.pwd);
         stmt = conn.prepareStatement(buffer.toString());
         
         rs = stmt.executeQuery();
         while(rs.next()) {
            BoardDto boardDto = new BoardDto();
            boardDto.setId(rs.getString("id"));
            boardDto.setWriter(rs.getString("writer"));
            boardDto.setTitle(rs.getString("title"));
            boardDto.setContents(rs.getString("contents"));
            boardDto.setRegdate(rs.getString("regdate"));
            
            boardList.add(boardDto);
         }
      } catch(Exception ex) {
         ex.printStackTrace();
      } finally {
         try {
            if(rs != null) rs.close();
            if(stmt != null) stmt.close();
            if(conn != null) conn.close();
         } catch(SQLException s) {
            s.printStackTrace();
         }
      }
      
      return boardList;
   }

   public void save(BoardDto dto) {
      Connection conn = null;
      PreparedStatement stmt = null;
      StringBuffer buffer = new StringBuffer();

      buffer.append("insert into tb_board1(id, title, contents,writer,regdate) ");
      buffer.append("values(boardSeq.nextval,?,?,?,sysdate) ");
      
      try {
         conn = DriverManager.getConnection(UtilDB.url,UtilDB.id, UtilDB.pwd);
         stmt = conn.prepareStatement(buffer.toString());
         int pos=1;
         stmt.setString(pos++, dto.getTitle());
         stmt.setString(pos++, dto.getContents());
         stmt.setString(pos++, dto.getWriter());
         
         stmt.execute();   //이때 디비에 저장된다.
         
      } catch(Exception ex) {
         ex.printStackTrace();
      } finally {
         try {
            if(stmt != null) stmt.close();
            if(conn != null) conn.close();
         } catch(SQLException s) {
            s.printStackTrace();
         }
      }
   }
   public BoardDto getView(String id) {
	   //데이터 하나만 찾아서 보내주면 된다
	      Connection conn = null;
	      PreparedStatement stmt = null;
	      ResultSet rs = null;
	      StringBuffer buffer = new StringBuffer();
	      
	     
	      buffer.append(" select id, title, contents, writer, ");
	      buffer.append(" to_char(regdate, 'yyyy-mm-dd') regdate ");
	      buffer.append(" from tb_board1 ");
	      buffer.append(" where id=? ");
	      
	      //쿼리가 제대로 작성되었는지 콜솔창에 완성된 쿼리를 찍어서 확인해봐야 한다
	      System.out.println(buffer.toString());
	      
	      BoardDto boardDto = new BoardDto();
	      //데이터를 읽어와서 이 객체에 담아 보내야 한다
	      try {
	    	 System.out.println("id=" + id);
	    	 System.out.println("id=" + id);
	    	 System.out.println("id=" + id);
	    	 
	         conn = DriverManager.getConnection(UtilDB.url,UtilDB.id, UtilDB.pwd);
	         stmt = conn.prepareStatement(buffer.toString());
	         stmt.setString(1, id+"");
	         
	         rs = stmt.executeQuery();   //이때 디비에 저장된다.
	         
	         if(rs.next())//데이터가 있을 경우
	         {
	        	 boardDto.setId(rs.getString("id"));
	             boardDto.setWriter(rs.getString("writer"));
	             boardDto.setTitle(rs.getString("title"));
	             boardDto.setContents(rs.getString("contents"));
	             
	             //\n을 <br>태그로 바꾸어서 보여줘야 줄바꿈이 된다
	             String contents = boardDto.getContents();
	             contents = contents.replaceAll("\n", "<br/>");
	             boardDto.setContents(contents);
	             boardDto.setRegdate(rs.getString("regdate"));
	         }
	         
	      } catch(Exception ex) {
	         ex.printStackTrace();
	      } finally {
	         try {
	        	if(rs != null) rs.close();
	            if(stmt != null) stmt.close();
	            if(conn != null) conn.close();
	         } catch(SQLException s) {
	            s.printStackTrace();
	         }
	      }
	      return boardDto;
	   }
}