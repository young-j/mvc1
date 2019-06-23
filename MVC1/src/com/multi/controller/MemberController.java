package com.multi.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.json.simple.JSONObject;

import com.multi.dto.MemberDto;
import com.multi.model.MemberDao;


public class MemberController {
	MemberDao memberDao = new MemberDao();
	
	public void insert(HttpServletRequest request, HttpServletResponse response)
	{
		MemberDto memberDto = new MemberDto();
		memberDto.setMember_id("1");
		memberDto.setUserid(request.getParameter("userid"));
		memberDto.setPassword(request.getParameter("password"));
		memberDto.setUsername(request.getParameter("username"));
		memberDto.setEmail(request.getParameter("email"));
		memberDto.setZipcode(request.getParameter("zipcode"));
		memberDto.setAddress1(request.getParameter("address1"));
		memberDto.setAddress2(request.getParameter("address2"));
		memberDto.setPhone(request.getParameter("phone"));
		
		memberDao.insert(memberDto);
		
	}
	
	public void logon(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		//session개체를 request 객체를 이용해 가져온다
		HttpSession session = request.getSession();
		
		String userid = request.getParameter("userid");
		String password = request.getParameter("password");
		MemberDto dto = memberDao.logon(userid, password);
		
		if(dto != null)
		{
			session.setAttribute("userid", dto.getUserid());
			session.setAttribute("username", dto.getUsername());
			session.setAttribute("email", dto.getEmail());
			session.setAttribute("phone", dto.getPhone());
			response.sendRedirect("/MVC1/index.do");
		}
		else
		{
			session.setAttribute("userid", "");
			session.setAttribute("username", "");
			session.setAttribute("email", "");
			session.setAttribute("phone", "");
			
			JOptionPane.showMessageDialog(null, "아이디와 비밀번호를 확인해 주세요.");
			response.sendRedirect("/MVC1/index.do?cmd=member&job=logon_form");
		}
	}
	public void logout(HttpServletRequest request, HttpServletResponse response)
	{
		HttpSession session = request.getSession();
		session.setAttribute("userid", "");
		session.setAttribute("username", "");
		session.setAttribute("email", "");
		session.setAttribute("phone", "");
	}
	
	public void idCheck(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		String userid=request.getParameter("userid");
		boolean result = memberDao.idCheck(userid);
		
		JSONObject object = new JSONObject();
		object.put("idcheck", result);
		
		PrintWriter output = response.getWriter();
		output.print(object);
		output.flush();
	}
	
	public void findId(HttpServletRequest request, HttpServletResponse response) 
	{
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		String userid = memberDao.findId(email, phone);
		request.setAttribute("userid", userid);
		
	}
	public void findPassword(HttpServletRequest request, HttpServletResponse response) 
	{
		String email = request.getParameter("email");
		String userid = request.getParameter("userid");
		
		String password = memberDao.findPwd(email, userid);
		request.setAttribute("password", password);
		
	}


}
