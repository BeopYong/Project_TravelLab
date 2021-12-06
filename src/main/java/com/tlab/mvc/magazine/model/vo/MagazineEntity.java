package com.tlab.mvc.magazine.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class MagazineEntity implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int no;
	private String title;
	private String writer;
	private String content;
	private Date regDate;
	private int readCount;
	private String region;
	private String valid;
	
	
	public MagazineEntity() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public MagazineEntity(String title, String writer, String content, String region) {
		super();
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.region = region;
	}
	

	public MagazineEntity(int no, String title, String writer, String content, String region) {
		super();
		this.no = no;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.region = region;
	}


	public MagazineEntity(int no, String title, String writer, String content, Date regDate, int readCount) {
		super();
		this.no = no;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.regDate = regDate;
		this.readCount = readCount;
	}

	public MagazineEntity(int no, String title, String writer, String content, Date regDate, int readCount,
			String region) {
		super();
		this.no = no;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.regDate = regDate;
		this.readCount = readCount;
		this.region = region;
	}
		

	public MagazineEntity(int no, String title, String writer, String content, Date regDate, int readCount,
			String region, String valid) {
		super();
		this.no = no;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.regDate = regDate;
		this.readCount = readCount;
		this.region = region;
		this.valid = valid;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getValid() {
		return valid;
	}
	public void setValid(String valid) {
		this.valid = valid;
	}
	
	@Override
	public String toString() {
		return "MagazineEntity [no=" + no + ", title=" + title + ", writer=" + writer + ", content=" + content
				+ ", regDate=" + regDate + ", readCount=" + readCount + ", region=" + region + ", valid=" + valid + "]";
	}
	

	
	
	
	
}
