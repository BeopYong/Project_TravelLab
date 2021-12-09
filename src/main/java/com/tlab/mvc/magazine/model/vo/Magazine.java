package com.tlab.mvc.magazine.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

public class Magazine extends MagazineEntity implements Serializable {

	// DB테이블엔 없지만 필요한 것
	private int attachCount; // 첨부파일 수
	private List<MagazineAttachment> attachments;
	private int commentCount;

	public Magazine() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Magazine(int no, String title, String writer, String content, Date regDate, int readCount) {
		super(no, title, writer, content, regDate, readCount);
		// TODO Auto-generated constructor stub
	}

	public Magazine(int no, String title, String writer, String content, Date regDate, int readCount, String region) {
		super(no, title, writer, content, regDate, readCount, region);
	}

	public Magazine(int no, String title, String writer, String content, String region) {
		super(no, title, writer, content, region);
	}

	public Magazine(String title, String writer, String content, String region) {
		super(title, writer, content, region);
	}

	public Magazine(int no, String title, String writer, String content, Date regDate, int readCount, String region,
			String valid) {
		super(no, title, writer, content, regDate, readCount, region, valid);
		// TODO Auto-generated constructor stub
	}

	public Magazine(String title, String writer, String content, String region, List<MagazineAttachment> attachments,
			int attachCount) {
		super(title, writer, content, region);
		this.attachments = attachments;
		this.attachCount = attachCount;
	}

	public Magazine(int no, String title, String writer, String content, Date regDate, int readCount, String region,
			String valid, int attachCount, List<MagazineAttachment> attachments, int commentCount) {
		super(no, title, writer, content, regDate, readCount, region, valid);
		this.attachCount = attachCount;
		this.attachments = attachments;
		this.commentCount = commentCount;
	}

	public Magazine(int no, String title, String writer, String content, Date regDate, int readCount, int attachCount,
			List<MagazineAttachment> attachments, int commentCount) {
		super(no, title, writer, content, regDate, readCount);
		this.attachCount = attachCount;
		this.attachments = attachments;
		this.commentCount = commentCount;
	}

	public Magazine(int attachCount, List<MagazineAttachment> attachments, int commentCount) {
		super();
		this.attachCount = attachCount;
		this.attachments = attachments;
		this.commentCount = commentCount;
	}

	public Magazine(int no, String title, String writer, String content, Date regDate, int readCount, String region,
			String valid, List<MagazineAttachment> attachments, int attachCount) {
		super(no, title, writer, content, regDate, readCount, region, valid);
		this.attachments = attachments;
		this.attachCount = attachCount;
	}

	public List<MagazineAttachment> getAttachments() {
		return attachments;
	}

	public void setAttachments(List<MagazineAttachment> attachments) {
		this.attachments = attachments;
	}

	public int getAttachCount() {
		return attachCount;
	}

	public void setAttachCount(int attachCount) {
		this.attachCount = attachCount;
	}

	public int getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}

	@Override
	public String toString() {
		return "Magazine [" + super.toString() + ", attachCount=" + attachCount + ", commentCount=" + commentCount
				+ ", attachments=" + attachments + "]";
	}

}
