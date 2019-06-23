package com.multi.common;

import javax.servlet.http.HttpServletRequest;

public class Pager {
		
	
	public static String makeTag(HttpServletRequest request , int pageSize , int total) {
		String Tag = "" ; 
		
		int cpage;
		int pageTotal; 
		int pageGroupSize = 5;
		
		int pageGroupStart; //1,6,11,16,...
		int pageGroupEnd;//5,10,15,....

		String path="";
		//System.out.println(path);
		String beginLabel 	= "<<";
		String prevLabel 	= "<";
		String nextLabel 	= ">";
		String endLabel 	= ">>";	

		
		try {

			StringBuffer sb = new StringBuffer();
			
			String page = request.getParameter("pg") ;
			page = ( page == null ) ? "0" : page ; 
			
//			setPg(Integer.parseInt(page)) ; 
//			setTotalCnt(Integer.parseInt(totCnt)) ; 
	
			cpage = Integer.parseInt(page) ; 

			pageTotal = (total - 1) / pageSize;
			//total - ��ü ������ �Ǽ� 
			//��ü ������ ���� ���ϱ� 
           
			pageGroupStart = (int) (cpage / pageGroupSize) * pageGroupSize;
			pageGroupEnd = pageGroupStart + pageGroupSize;
			if (pageGroupEnd > pageTotal) {
				pageGroupEnd = pageTotal + 1;
			}
            //0~4, 5~9, 10~14, 15~19
			boolean hasPreviousPage = cpage - pageGroupSize >= 0;
			boolean hasNextPage = pageGroupStart + pageGroupSize < pageTotal;
			
			sb.append("<table border=0 cellspacing=0 cellpadding=0 align='center'>\r\n") ; 
			sb.append("<tr><td style='padding-left:10px'>\r\n") ;
			sb.append("&nbsp");
			sb.append((cpage > 0) ? makeLink(0, beginLabel) : beginLabel);
			sb.append("&nbsp");
			sb.append("</td>\r\n") ;  
			sb.append("<td>\r\n") ;
			sb.append("&nbsp");
			sb.append(hasPreviousPage ? makeLink(pageGroupStart - 1, prevLabel) : prevLabel);
			sb.append("&nbsp");
			sb.append("</td>\r\n") ;  
		
			for (int i = pageGroupStart; i < pageGroupEnd; i++) {
				if (i == cpage) {
					sb.append("<td style='padding-left:10px'>\r\n") ; 
					sb.append("<font color='#F47906'>");
					sb.append("<b>").append(i + 1).append("</b>");
					sb.append("</font>");
					sb.append("</td>\r\n") ;  
				} else {
					sb.append("<td style='padding-left:10px'>\r\n") ; 
					sb.append(makeLink(i, (i + 1) + ""));
					sb.append("</td>\r\n") ;  
				}
			}
			
			sb.append("<td style='padding-left:10px'>\r\n") ; 
			sb.append("&nbsp");
			sb.append(hasNextPage ? makeLink(pageGroupEnd, nextLabel) : nextLabel);
			sb.append("&nbsp");
			sb.append("</td>\r\n") ;  
			sb.append("<td>\r\n") ;
			sb.append("&nbsp");
			sb.append((cpage < pageTotal) ? makeLink(pageTotal, endLabel) : endLabel);
			sb.append("&nbsp");
			sb.append("</td></tr>\r\n") ;  
			sb.append("</table>") ;
			Tag = sb.toString() ; 	
		} catch ( Exception e ) {
			e.printStackTrace() ; 
		}
			
		return Tag ; 
	}

	public static String makeLink(int page, String label) 
	{
		StringBuffer tmp = new StringBuffer();
		tmp.append("<a href=\"javascript:goPage('" + page + "')\">").append(label).append("</a>");
		return tmp.toString();
	}
	
	
	
	
	
}
