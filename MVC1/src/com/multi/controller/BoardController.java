package com.multi.controller;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;

import com.multi.dto.BoardDto;
import com.multi.model.BoardDao;


public class BoardController {
	BoardDao dao = new BoardDao();
	
	public void getList(HttpServletRequest request, BoardDto dto)
	{
		request.setAttribute("boardList", dao.getList(dto));
	}
	
	public void save(HttpServletRequest request)
	{
		BoardDto dto = new BoardDto();
		
		dto.setWriter(request.getParameter("writer"));
		dto.setTitle(request.getParameter("title"));
		dto.setContents(request.getParameter("contents"));
		
		dao.save(dto);
	}

	public void view(HttpServletRequest request)
	{
		String id = request.getParameter("id");
		BoardDto boardDto = dao.getView(id);
		request.setAttribute("boardDto", boardDto);
	}
}