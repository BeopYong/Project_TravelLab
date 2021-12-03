package com.tlab.mvc.cs.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Cs extends CsEntity implements Serializable{

	private int commentCount;

	public Cs() {
		super();
	}

	public Cs(int no, String title, String write, String content, int boardRef, Date regDate) {
		super(no, title, write, content, boardRef, regDate);
	}

	public Cs(int no, String title, String write, String content, int boardRef, Date regDate, int commentCount) {
		super(no, title, write, content, boardRef, regDate);
		this.commentCount = commentCount;
	}

	public int getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}

	@Override
	public String toString() {
		return "Cs [commentCount=" + commentCount + "]";
	}
	
	
}
