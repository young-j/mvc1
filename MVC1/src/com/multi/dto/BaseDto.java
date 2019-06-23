package com.multi.dto;

public class BaseDto {
	protected int group_id=1;
	protected int group_depth=0;
	protected int group_level=1;
	
	protected int num=0;
	protected int pg=1;
	protected int pgSize=10;

	protected String key="";
	protected String sel="";
	
	private String fileName1=""; 
	private String fileName2="";
	private String fileName3="";
	
	private String oldFileName1=""; 
	private String oldFileName2="";
	private String oldFileName3="";
	
	private int hit=0;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getGroup_id() {
		return group_id;
	}
	public void setGroup_id(int group_id) {
		this.group_id = group_id;
	}
	public int getGroup_depth() {
		return group_depth;
	}
	public void setGroup_depth(int group_depth) {
		this.group_depth = group_depth;
	}
	public int getGroup_level() {
		return group_level;
	}
	public void setGroup_level(int group_level) {
		this.group_level = group_level;
	}
	public int getPg() {
		return pg;
	}
	public void setPg(int pg) {
		this.pg = pg;
	}
	public int getPgSize() {
		return pgSize;
	}
	public void setPgSize(int pgSize) {
		this.pgSize = pgSize;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getSel() {
		return sel;
	}
	public void setSel(String sel) {
		this.sel = sel;
	}
	public String getFileName1() {
		return fileName1;
	}
	public void setFileName1(String fileName1) {
		this.fileName1 = fileName1;
	}
	public String getFileName2() {
		return fileName2;
	}
	public void setFileName2(String fileName2) {
		this.fileName2 = fileName2;
	}
	public String getFileName3() {
		return fileName3;
	}
	public void setFileName3(String fileName3) {
		this.fileName3 = fileName3;
	}
	public String getOldFileName1() {
		return oldFileName1;
	}
	public void setOldFileName1(String oldFileName1) {
		this.oldFileName1 = oldFileName1;
	}
	public String getOldFileName2() {
		return oldFileName2;
	}
	public void setOldFileName2(String oldFileName2) {
		this.oldFileName2 = oldFileName2;
	}
	public String getOldFileName3() {
		return oldFileName3;
	}
	public void setOldFileName3(String oldFileName3) {
		this.oldFileName3 = oldFileName3;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	
	
}
