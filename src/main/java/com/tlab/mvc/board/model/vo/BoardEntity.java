package com.tlab.mvc.board.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class BoardEntity implements Serializable {

	private static final long seriavlVersionUID = 1L;
	
	private int no;
	private String title;
	private String write;
	private String content;
	private int boardRef;
	private Date regDate;
	
	public BoardEntity() {
		super();
	}

	public BoardEntity(int no, String title, String write, String content, int boardRef, Date regDate) {
		super();
		this.no = no;
		this.title = title;
		this.write = write;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWrite() {
		return write;
	}

	public void setWrite(String write) {
		this.write = write;
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
		return "BoardEntity [no=" + no + ", title=" + title + ", write=" + write + ", content=" + content
				+ ", boardRef=" + boardRef + ", regDate=" + regDate + "]";
	}
	
	
}
