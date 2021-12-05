package com.tlab.mvc.cs.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class CsComment implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private int no;
	private int commentLevel;
	private String writer;
	private String content;
	private int csBoardno;
	private int commentRef;
	private Date regDate;
	
	public CsComment() {
		super();
	}

	public CsComment(int no, int commentLevel, String writer, String content, int csBoardno, int commentRef,
			Date regDate) {
		super();
		this.no = no;
		this.commentLevel = commentLevel;
		this.writer = writer;
		this.content = content;
		this.csBoardno = csBoardno;
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

	public int getCsBoardno() {
		return csBoardno;
	}

	public void setCsBoardno(int csBoardno) {
		this.csBoardno = csBoardno;
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
		return "CsComment [no=" + no + ", commentLevel=" + commentLevel + ", writer=" + writer + ", content=" + content
				+ ", csBoardno=" + csBoardno + ", commentRef=" + commentRef + ", regDate=" + regDate + "]";
	}
	
	
}
