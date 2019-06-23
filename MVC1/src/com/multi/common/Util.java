package com.multi.common;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

public class Util {
	public static final String FILE_UPLOAD_BASE="/upload";
	
	public static String textToDb(String s)
	{
		if(s==null)
			return "";
		
		String result;
		result = s.replace("\n", "<br>");
		return result;
	}
	
	public static String dbToText(String s)
	{
		if(s==null)
			return "";
		String result;
		result = s.replace("<br>", "\n");
		return result;
	}
	
	public static String nullToValue(Object obj, String value)
	{
		if(obj==null)
			return value;
		
		return (String)obj;
	}
	
	public static String nullTo(Object obj)
	{
		if(obj==null)
			return "";
		
		return (String)obj;
	}
	 
	public static String encoding(Object obj)
	{
		if(obj==null)
			return "";
		
		String result="";
		try {
			result = URLDecoder.decode((String)obj, "utf-8").toString();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	public static String getMeetingCategoryName(String category) {
		if(category.equals("1"))
			return "후쿠오카";
		else if (category.equals("2"))
			return "교토";
		else if (category.equals("3"))
			return "오사카";
		else if (category.equals("4"))
			return "도쿄";
		else if (category.equals("5"))
			return "삿포로";
		else if (category.equals("6"))
			return "나고야";
		else 
			return "";
	}
	
	public static String getWorkCategoryName(String category) {
		if(category.equals("1"))
			return "취업 질문방";
		else if (category.equals("2"))
			return "스터디 모집";
		else if (category.equals("3"))
			return "취업 노하우";
		else if (category.equals("4"))
			return "구인공고";
		else if (category.equals("5"))
			return "서류 합격후기";
		else if (category.equals("6"))
			return "면접 후기";
		else 
			return "";
	}
	
	 
}
