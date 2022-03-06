package com.tlab.mvc.cs.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class CsEntity implements Serializable {

	private static final long seriavlVersionUID = 1L;

	private int no;
	private String options;
	private String title;
	private String writer;
	private String content;
	private int boardRef;
	private Date regDate;

	public CsEntity() {
		super();
	}

	public CsEntity(int no, String options, String title, String writer, String content, Date regDate) {
		super();
		this.no = no;
		this.options = options;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.regDate = regDate;
	}

	public CsEntity(int no, String options, String title, String writer, String content, int boardRef, Date regDate) {
		super();
		this.no = no;
		this.options = options;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.boardRef = boardRef;
		this.regDate = regDate;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getOptions() {
		return options;
	}

	public void setOptions(String options) {
		this.options = options;
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

	public int getBoardRef() {
		return boardRef;
	}

	public void setBoardRef(int boardRef) {
		this.boardRef = boardRef;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "BoardEntity [no=" + no + ", options= " + options + ", title=" + title + ", writer=" + writer
				+ ", content=" + content + ", boardRef=" + boardRef + ", regDate=" + regDate + "]";
	}

}
