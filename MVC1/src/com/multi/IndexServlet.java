package com.multi;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.multi.controller.BoardController;
import com.multi.dto.BoardDto;
import com.multi.controller.MemberController;

/**
 * Servlet implementation class IndexServlet
 */

@WebServlet("/index.do")
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	HashMap<String, String>map = new HashMap<String, String>();
    public IndexServlet() {
        map.put("/","index.jsp");
        map.put("board","list.jsp");
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//한글 안깨지게
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String cmd=request.getParameter("cmd");
		String job=request.getParameter("job");
		String path="/index.jsp";
		
		System.out.println("cmd : " + cmd);
		System.out.println("cmd : " + job);
		
		if(cmd == null || cmd.equals("")) cmd="/";
		if(job == null || job.equals("")) job="list";
		
		if(cmd.equals("board")) {
			doBoard(cmd,job, request, response);
			return;  //함수 종료
		}
		if(cmd.equals("member")) {
			doMember(cmd,job, request, response);
			return;  
		}
		if(cmd.equals("index")) {

	        response.sendRedirect("/MVC1/index.jsp");
	        return;
		}
		
		RequestDispatcher disp;
		disp = request.getRequestDispatcher(path);
		disp.forward(request, response);
	}
	
	void doBoard(String cmd, String job, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		BoardController boardController = new BoardController();
		BoardDto dto = new BoardDto();
		String path="";
		RequestDispatcher disp;
		
		if(job.equals("list"))
		{
			boardController.getList(request, dto);
			path="/board/list.jsp";
			disp = request.getRequestDispatcher(path);
			disp.forward(request, response);
		}
		else if(job.equals("write"))
		{
			path="/board/write.jsp";
			disp = request.getRequestDispatcher(path);
			disp.forward(request, response);
		}
		else if(job.equals("view"))
		{
			boardController.view(request);
			path="/board/view.jsp";
			disp = request.getRequestDispatcher(path);
			disp.forward(request, response);
		}
		else if(job.equals("save"))
		{
			boardController.save(request);
			path=request.getContextPath()+"/index.do?cmd=board&job=list";
			response.sendRedirect(path);
			//여기선 forward가 아니라 redirect를 해줘야 한다. request 에 입력받은 값 모두 제거하기
			}
		
		}
	/*
	http://127.0.0.1:9000/MVC1/index.do?cmd=member&jobwrite
	*/
		void doMember(String cmd, String job, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
		{
			RequestDispatcher disp;
			MemberController memController = new MemberController();
			String path="/member/member_write.jsp";
			if(job.contentEquals("write"))
			{
				disp = request.getRequestDispatcher(path);
				disp.forward(request, response);
			}
			else if(job.equals("insert"))
			{
				memController.insert(request, response);
				response.sendRedirect("/MVC1/index.do");
				//회원가입 후 맨 처음 페이지로 이동한다
			}
			else if(job.equals("writeOK"))
			{
				memController.insert(request, response);
				response.sendRedirect("/MVC1/regSuccess.jsp");
				//회원가입 후 맨 처음 페이지로 이동한다
			}
			//로그온 화면으로 이동하기
			else if(job.equals("logon_form"))
			{
				path = "/member/logon.jsp";
				disp = request.getRequestDispatcher(path);
				disp.forward(request, response);
			}
			//실제 로그온 작업
			else if(job.equals("logon"))
			{
				memController.logon(request, response);
				
				//회원가입 후 맨 처음 페이지로 이동한다
			}
			else if(job.equals("logout"))
			{
				memController.logout(request, response);
				response.sendRedirect("/MVC1/index.do");
			}
			//http://127.0.0.1:9000/MVC1/index.do?cmd=member&job=idCheck&userid=test
			else if(job.equals("idCheck"))
			{
				memController.idCheck(request, response);
			}
			else if(job.equals("findid")) //페이지 이동만
			{
				path = "/member/findid.jsp";
				disp = request.getRequestDispatcher(path);
				disp.forward(request, response);
			}
			else if(job.equals("findidresult"))
			{
				memController.findId(request, response);
				path = "/member/findidresult.jsp";
				disp = request.getRequestDispatcher(path);
				disp.forward(request, response);
			}
			else if(job.equals("findpassword")) //페이지 이동만
			{
				path = "/member/findpassword.jsp";
				disp = request.getRequestDispatcher(path);
				disp.forward(request, response);
			}
			else if(job.equals("findpwdresult"))
			{
				memController.findPassword(request, response);
				path = "/member/findpwdresult.jsp";
				disp = request.getRequestDispatcher(path);
				disp.forward(request, response);
			}
		}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
