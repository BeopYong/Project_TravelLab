package com.tlab.mvc.magazine.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class MagazineComment implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int no;
	private int commentLevel;
	private String writer;
	private String content;
	private int magazineNo;
	private int commentRef;
	private Date regDate;
	
	public MagazineComment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MagazineComment(int no, int commentLevel, String writer, String content, int magazineNo, int commentRef,
			Date regDate) {
		super();
		this.no = no;
		this.commentLevel = commentLevel;
		this.writer = writer;
		this.content = content;
		this.magazineNo = magazineNo;
		this.commentRef = commentRef;
		this.regDate = regDate;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getCommentLevel() {
		return commentLevel;
	}

	public void setCommentLevel(int commentLevel) {
		this.commentLevel = commentLevel;
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

	public int getMagazineNo() {
		return magazineNo;
	}

	public void setMagazineNo(int magazineNo) {
		this.magazineNo = magazineNo;
	}

	public int getCommentRef() {
		return commentRef;
	}

	public void setCommentRef(int commentRef) {
		this.commentRef = commentRef;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "MagazineComment [no=" + no + ", commentLevel=" + commentLevel + ", writer=" + writer + ", content="
				+ content + ", magazineNo=" + magazineNo + ", commentRef=" + commentRef + ", regDate=" + regDate + "]";
	}
	
	
	
}
