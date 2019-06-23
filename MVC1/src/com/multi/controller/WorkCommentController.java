package com.multi.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.multi.common.Util;
import com.multi.dto.CommentDto;
import com.multi.dto.MeetCommentDto;
import com.multi.dto.WorkCommentDto;
import com.multi.model.CommentDao;
import com.multi.model.MeetCommentDao;
import com.multi.model.WorkCommentDao;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


/**
 * Servlet implementation class GuestbookController
 */
@WebServlet("/workcomment.do")
public class WorkCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd=request.getParameter("cmd");
		System.out.println("cmd : " + cmd);
		
		String url="/work/list.jsp";
		request.setCharacterEncoding("utf-8");
		boolean bForward=true;
			
		
		if(cmd==null || cmd.equals("") || cmd.equals("list"))
		{
			doList(request, response);
			return;
		}
	
		else if(cmd.equals("modify"))
		{ 
			System.out.println("************************************************");
			url="/work/write.jsp";
		}
		else if(cmd.equals("delete"))
		{ 
			bForward=false; //뒤로가기 작동 안되게
			
			doDeleteItem(request, response);//원래글 갖고 가야 한다 
			url =request.getContextPath() + "/workcomment.do?cmd=list";
		}
		else if(cmd.equals("save"))
		{
			bForward=false; //뒤로가기 작동 안되게
			
			doWrite(request, response);
			
		}
	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");	
		doGet(request, response);
	}
	
	//comment.do 
	void doList(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {

		WorkCommentDao dao = new WorkCommentDao();
		WorkCommentDto dto = new WorkCommentDto();
		
		String board_id=request.getParameter("board_id");
		dto.setBoard_id(board_id);
		
		List<WorkCommentDto> list = dao.getList(dto);
		
		JSONArray jsonArray =  new JSONArray();

		for(int i=0; i<list.size(); i++)
		{
			JSONObject jsonObject = new JSONObject();
			WorkCommentDto tempDto = list.get(i);
			jsonObject.put("board_id", tempDto.getBoard_id());
			jsonObject.put("comment_id", tempDto.getComment_id());
			jsonObject.put("ip", tempDto.getIp());
			jsonObject.put("category", tempDto.getCategory());
			jsonObject.put("contents", tempDto.getContents());
			jsonObject.put("writer", tempDto.getWriter());
			jsonObject.put("wdate", tempDto.getWdate());
			jsonObject.put("username", tempDto.getUsername());
			
			jsonArray.add(jsonObject);
		}
		
		response.setCharacterEncoding("utf-8");
		response.getWriter().append(jsonArray.toJSONString());
		response.getWriter().flush();
		//1.JasonObject 만들어서 dto값을 넣어서 
		//jsonlist 저장
		
		
	}
	
	void doDeleteItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		WorkCommentDao dao = new WorkCommentDao();
		WorkCommentDto dto = new WorkCommentDto();

		String id = request.getParameter("comment_id");
		
		System.out.println("comment_id : " + id);
		System.out.println("딜리트 함수");
		dto.setComment_id(id);
		dao.delete(dto);
		
		response.getWriter().append("OK");
		response.getWriter().flush();
	}
	
	void doWrite(HttpServletRequest request, 		HttpServletResponse response) 
	throws ServletException, IOException {

		
		 
		WorkCommentDto dto = new WorkCommentDto();
		String mode = Util.nullToValue(request.getParameter("mode"), "insert");
		
		dto.setBoard_id(request.getParameter("board_id"));
		dto.setComment_id(request.getParameter("comment_id"));
		dto.setWriter(request.getParameter("writer"));
		dto.setCategory(request.getParameter("category"));
		dto.setIp(request.getRemoteHost());
		dto.setContents(request.getParameter("contents"));
		
		WorkCommentDao dao = new WorkCommentDao();
		
		
		dao.insert(dto);
		
		response.getWriter().append("OK");
		response.getWriter().flush();
	
	}
}



