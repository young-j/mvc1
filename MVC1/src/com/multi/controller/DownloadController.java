package com.multi.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.multi.common.Util;

/**
 * Servlet implementation class DownloadController
 */

//download.do?path=guestbook&filename=Chrysanthemum.jpg
@WebServlet("/download.do")
public class DownloadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DownloadController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(
			HttpServletRequest req,
			HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		String filename	= req.getParameter("filename");
		String path=req.getParameter("path");
		
		String savePath = req.getServletContext().getRealPath(Util.FILE_UPLOAD_BASE+"/"+path);
		
		InputStream in=null;
		OutputStream out = null;
		File file=null; 
		
		boolean skip=false;
	
		try
		{
			file = new File(savePath,  filename);
			in = new FileInputStream(file);
		}
		catch(FileNotFoundException ex)
		{
			skip = true; 
		}
		
		String client = req.getHeader("User-Agent");
		
		
		res.reset(); 
		res.setContentType("application/octet-stream");
		res.setHeader("Content-Description",  		"JSP Generated Data");	 
		if(!skip) 
		{
			if(client.indexOf("MSIE")!=-1)
			{
				
				res.setHeader("Content-Disposition","attachment; filename="
				+new String(filename.getBytes("KSC5601"),"ISO8859_1"));
			}
			else
			{
                filename = new String(
                		filename.getBytes("utf-8"),  "iso-8859-1");
 
                res.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
                res.setHeader("Content-Type",  "application/octet-stream;charset=utf-8");
 
			}
			
			res.setHeader ("Content-Length",""+file.length() );
			 
	        out = res.getOutputStream();
            byte b[] = new byte[(int)file.length()];
            int leng = 0;
             
            while( (leng = in.read(b)) > 0 ){
                out.write(b,0,leng);
            }
      	}
		
	     out.close();
         in.close();
	
	}

}
