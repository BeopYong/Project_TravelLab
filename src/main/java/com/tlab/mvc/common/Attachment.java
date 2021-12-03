package com.tlab.mvc.common;

import java.io.Serializable;
import java.util.Objects;

public class Attachment implements Serializable {

	private static final long serialVersionUID = 1L;

	private int no;
	private String originalFilename; // 사용자가 업로드한 파일명
	private String renamedFilename; // 서버컴퓨터 저장한 파일명

	public Attachment() {
		super();
	}

	public Attachment(String originalFilename, String renamedFilename) {
		super();
		this.originalFilename = originalFilename;
		this.renamedFilename = renamedFilename;
	}

	public Attachment(int no, String originalFilename, String renamedFilename) {
		super();
		this.no = no;
		this.originalFilename = originalFilename;
		this.renamedFilename = renamedFilename;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getOriginalFilename() {
		return originalFilename;
	}

	public void setOriginalFilename(String originalFilename) {
		this.originalFilename = originalFilename;
	}

	public String getRenamedFilename() {
		return renamedFilename;
	}

	public void setRenamedFilename(String renamedFilename) {
		this.renamedFilename = renamedFilename;
	}

	@Override
	public int hashCode() {
		return Objects.hash(no, renamedFilename);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Attachment other = (Attachment) obj;
		return no == other.no && Objects.equals(renamedFilename, other.renamedFilename);
	}

	@Override
	public String toString() {
		return "Attachment [ no=" + no + ", originalFilename=" + originalFilename + ", renamedFilename="
				+ renamedFilename + " ]";
	}

}
