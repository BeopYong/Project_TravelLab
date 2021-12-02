package com.tlab.mvc.magazine.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

public class Magazine extends MagazineEntity implements Serializable {

	//DB테이블엔 없지만 필요한 것
	private List<Attachment> attachments;
	private int attachCount; //첨부파일 수
	
	public Magazine() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Magazine(int no, String title, String writer, String content, Date regDate, int readCount, String vaild) {
		super(no, title, writer, content, regDate, readCount, vaild);
		// TODO Auto-generated constructor stub
	}

	
	public Magazine(int no, String title, String writer, String content, Date regDate, int readCount, String vaild,
			List<Attachment> attachments, int attachCount) {
		super(no, title, writer, content, regDate, readCount, vaild);
		this.attachments = attachments;
		this.attachCount = attachCount;
	}

	public List<Attachment> getAttachments() {
		return attachments;
	}

	public void setAttachments(List<Attachment> attachments) {
		this.attachments = attachments;
	}

	public int getAttachCount() {
		return attachCount;
	}

	public void setAttachCount(int attachCount) {
		this.attachCount = attachCount;
	}

	@Override
	public String toString() {
		return "Magazine ["+ super.toString()
			+ ", attachments=" + attachments 
			+ ", attachCount=" + attachCount + "]";
	}
	
	
	
	
	
}
