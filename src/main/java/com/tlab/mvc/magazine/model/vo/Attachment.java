package com.tlab.mvc.magazine.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Attachment implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int no;
	private int magazineNo;
	private String originalFilename; //업로드파일
	private String renamedFilename; //서버에 저장된 파일
	/**
	 * 
	 */
	public Attachment() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * @param no
	 * @param magazineNo
	 * @param originalFilename
	 * @param renamedFilename
	 */
	public Attachment(int no, int magazineNo, String originalFilename, String renamedFilename) {
		super();
		this.no = no;
		this.magazineNo = magazineNo;
		this.originalFilename = originalFilename;
		this.renamedFilename = renamedFilename;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getmagazineNo() {
		return magazineNo;
	}
	public void setmagazineNo(int magazineNo) {
		this.magazineNo = magazineNo;
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
	public String toString() {
		return "Attachment [no=" + no + ", magazineNo=" + magazineNo + ", originalFilename=" + originalFilename
				+ ", renamedFilename=" + renamedFilename + "]";
	}
	
	
	
	
}
