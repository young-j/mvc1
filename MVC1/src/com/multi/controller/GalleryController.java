package com.multi.controller;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.multi.common.Util;
import com.multi.dto.GalleryDto;
import com.multi.dto.GuestbookDto;
import com.multi.model.GalleryDao;
import com.multi.model.GuestbookDao;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


/**
 * Servlet implementation class GuestbookController
 */
@WebServlet("/gallery.do")
public class GalleryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
 	

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd=request.getParameter("cmd");
		System.out.println("cmd : " + cmd);
		
		String url="/gallery/list.jsp";
		request.setCharacterEncoding("utf-8");
		boolean bForward=true;
			
		
		if(cmd==null || cmd.equals("") || cmd.equals("list"))
		{
			doList(request, response);
		}
		else if(cmd.equals("view"))
		{
			doView(request, response);
			url="/gallery/view.jsp";
		}
		else if(cmd.equals("write"))
		{ 
			url="/gallery/write.jsp";
		}
		else if(cmd.equals("reply"))
		{ 
			doView(request, response); //부모 글 갖고 가야 한다 
			url="/gallery/write.jsp";
		}
		else if(cmd.equals("modify"))
		{ 
			System.out.println("************************************************");
			doView(request, response);//원래글 갖고 가야 한다 
			url="/gallery/write.jsp";
		}
		else if(cmd.equals("save"))
		{
			bForward=false; //뒤로가기 작동 안되게
			
			doWrite(request, response);
			url =request.getContextPath() + "/gallery.do?cmd=list";
		}
		else if(cmd.equals("delete"))
		{
			bForward=false; //뒤로가기 작동 안되게
			
			doDeleteItem(request, response);
			url =request.getContextPath() + "/gallery.do?cmd=list";
		}
		
		
		if( bForward)
		{
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request,  response);
		}
		else
		{
			//뒤로가기 할때 캐쉬 없애기 
			response.setHeader("Cache-Control","no-store");   
			response.setHeader("Pragma","no-cache");   
			response.setDateHeader("Expires",0);   
			if (request.getProtocol().equals("HTTP/1.1"))   response.setHeader("Cache-Control", "no-cache"); 
			
			response.sendRedirect(url);
		}
		
		
	}

	private void doDeleteItem(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		GalleryDao dao = new GalleryDao();
		
		String id = request.getParameter("id");
		dao.delete(id);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");	
		doGet(request, response);
	}
	
	void doList(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {

		GalleryDao dao = new GalleryDao();
		GalleryDto dto = new GalleryDto();
	
		String key = Util.encoding(request.getParameter("key"));
		String sel = Util.nullToValue(request.getParameter("sel"), "0");
		System.out.println(key);
	
		dto.setKey(key);
		dto.setSel(sel);
		
		int pg=0;
		String temp = Util.nullToValue(request.getParameter("pg"), "0"); 
		pg = Integer.parseInt(temp);
		
		dto.setPg(pg);
		request.setAttribute("totalCount",  dao.getTotalCount(dto));
		request.setAttribute("list",  	dao.getList(dto));
	}
	
	void doView(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		GalleryDao dao = new GalleryDao();
		GalleryDto dto = new GalleryDto();

		String id = request.getParameter("id");
		
		System.out.println("id : " + id);
		
		request.setAttribute("dto",dao.getView(id));
	}
	
	void doWrite(HttpServletRequest request, 		HttpServletResponse response) 
	throws ServletException, IOException {

		System.out.println("*****************************");
		ServletContext ctx =  request.getServletContext();
		String savePath =	ctx.getRealPath(Util.FILE_UPLOAD_BASE+"/gallery");
		int sizeLimit=1024*1024*20;
		
		MultipartRequest  multi  = new MultipartRequest(request, 
				 savePath,
				 sizeLimit,
				 "utf-8",
				 new DefaultFileRenamePolicy());
		 
		GalleryDto dto = new GalleryDto();
		String mode = Util.nullToValue(multi.getParameter("mode"), "insert");
		System.out.println("mode : " + mode);
		
		dto.setWriter(multi.getParameter("writer"));
		dto.setTitle(multi.getParameter("title"));
		dto.setContents(multi.getParameter("contents"));
		dto.setId(multi.getParameter("id"));
		
		//수정의 경우에는 파일 첨부 내역이 없을 수 있다. 그럴 경우 원래의 파일명을 저장해 줘야 한다 
		System.out.println("id : " + multi.getParameter("id"));
		System.out.println("수정 : " +multi.getParameter("title") );
		System.out.println("수정 : " +multi.getParameter("contents") );
		
		System.out.println("수정 : " +multi.getOriginalFileName("filename1") );
		System.out.println("수정 : " +multi.getOriginalFileName("filename2") );
		System.out.println("수정 : " +multi.getOriginalFileName("filename3") );
		
		if( mode.contentEquals("modify"))
		{
			if(  multi.getOriginalFileName("filename1")==null   )
				dto.setFileName1(multi.getParameter("oldFileName1"));
			else
				dto.setFileName1(multi.getOriginalFileName("filename1"));
			
			if( multi.getOriginalFileName("filename2")==null )
				dto.setFileName2(multi.getParameter("oldFileName2"));
			else
				dto.setFileName2(multi.getOriginalFileName("filename2"));
			
			if( multi.getOriginalFileName("filename3")==null)
				dto.setFileName3(multi.getParameter("oldFileName3"));
			else
				dto.setFileName3(multi.getOriginalFileName("filename3"));
		}
		else
		{
			dto.setFileName1(multi.getOriginalFileName("filename1"));
			dto.setFileName2(multi.getOriginalFileName("filename2"));
			dto.setFileName3(multi.getOriginalFileName("filename3"));
		}
		
		System.out.println(dto.getFileName1());
		System.out.println(dto.getFileName2());
		System.out.println(dto.getFileName3());
		
		GalleryDao dao = new GalleryDao();
		
		if( mode.contentEquals("insert"))
		{
			dao.insert(dto);
		}
		else if( mode.contentEquals("reply"))
		{
			//부모글 정보를 가져가야 한다 
			dto.setGroup_id(Integer.parseInt(multi.getParameter("group_id").toString()));
			dto.setGroup_depth(Integer.parseInt(multi.getParameter("group_depth").toString()));
			dto.setGroup_level(Integer.parseInt(multi.getParameter("group_level").toString()));
			
			System.out.println("reply................................................");
			dao.reply(dto);
		}
		else if( mode.contentEquals("modify"))
		{
			System.out.println("reply................................................");
			dao.update(dto);
		}
		
	}
}



