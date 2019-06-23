package com.multi.dto;

public class BoardDto {
	private String id = "";		 //아이디
	private String writer = "";  //글쓴이
	private String title = "";   //제목
	private String contents = "";//내용
	private String regdate = ""; //등록일
	private String delyn = "";   //삭제여부
	private String hit = "";	 //조회수
	private String ip = "";		 //아이피
	
	
	public BoardDto()
	{
		id="1";
		writer="홍길동";
		title="제목1";
		contents="내용1";
		regdate="2019-03-20";
	}
	
	public BoardDto(String id, String writer, String title, String contents, String regdate)
	{
		this.id=id;
		this.writer=writer;
		this.title=title;
		this.contents=contents;
		this.regdate=regdate;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getDelyn() {
		return delyn;
	}
	public void setDelyn(String delyn) {
		this.delyn = delyn;
	}
	public String getHit() {
		return hit;
	}
	public void setHit(String hit) {
		this.hit = hit;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	
}
