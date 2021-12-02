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
	private String vaild;
	
	/**
	 * 
	 */
	public MagazineEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param no
	 * @param title
	 * @param writer
	 * @param content
	 * @param regDate
	 * @param readCount
	 * @param vaild
	 */
	public MagazineEntity(int no, String title, String writer, String content, Date regDate, int readCount,
			String vaild) {
		super();
		this.no = no;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.regDate = regDate;
		this.readCount = readCount;
		this.vaild = vaild;
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

	public String getVaild() {
		return vaild;
	}

	public void setVaild(String vaild) {
		this.vaild = vaild;
	}

	@Override
	public String toString() {
		return "MagazineEntity [no=" + no + ", title=" + title + ", writer=" + writer + ", content=" + content
				+ ", regDate=" + regDate + ", readCount=" + readCount + ", vaild=" + vaild + "]";
	}
	
	
	
}
