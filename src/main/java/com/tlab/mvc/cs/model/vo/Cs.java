package com.tlab.mvc.cs.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import com.tlab.mvc.cs.model.vo.CsAttachment;

public class Cs extends CsEntity implements Serializable {

	private List<CsAttachment> csAttachments;
	private int commentCount;

	public Cs() {
		super();
	}

	public Cs(int no, String options, String title, String writer, String content, Date regDate) {
		super(no, options, title, writer, content, regDate);
	}

	public Cs(int no, String options, String title, String writer, String content, int boardRef, Date regDate) {
		super(no, options, title, writer, content, boardRef, regDate);
	}

	public Cs(int no, String options, String title, String writer, String content, Date regDate,
			List<CsAttachment> csAttachments, int commentCount) {
		super(no, options, title, writer, content, regDate);
		this.csAttachments = csAttachments;
		this.commentCount = commentCount;
	}

	public Cs(int no, String options, String title, String writer, String content, Date regDate, int commentCount) {
		super(no, options, title, writer, content, regDate);
		this.commentCount = commentCount;
	}

	public Cs(int no, String options, String title, String writer, String content, int boardRef, Date regDate,
			int commentCount) {
		super(no, options, title, writer, content, boardRef, regDate);
		this.commentCount = commentCount;
	}

	public List<CsAttachment> getAttachments() {
		return csAttachments;
	}

	public void setAttachments(List<CsAttachment> attachments) {
		this.csAttachments = attachments;
	}

	public int getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}

	@Override
	public String toString() {
		return "Cs [csAttachments=" + csAttachments + ", commentCount=" + commentCount + "]";
	}

}
