package com.tlab.mvc.magazine.model.vo;

import java.io.Serializable;
import java.sql.Date;
import com.tlab.mvc.common.Attachment;

public class MagazineAttachment extends Attachment {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int magazineNo;

	/**
	 * 
	 */
	public MagazineAttachment() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	/**
	 * @param no
	 * @param magazineNo
	 * @param originalFilename
	 * @param renamedFilename
	 */
	public MagazineAttachment(int no, String originalFilename, String renamedFilename) {
		super(no, originalFilename, renamedFilename);
		// TODO Auto-generated constructor stub
	}

	public MagazineAttachment(String originalFilename, String renamedFilename) {
		super(originalFilename, renamedFilename);
		// TODO Auto-generated constructor stub
	}

	public MagazineAttachment(int no, String originalFilename, String renamedFilename, int magazineNo) {
		super(no, originalFilename, renamedFilename);
		this.magazineNo = magazineNo;
	}

	@Override
	public int getNo() {
		// TODO Auto-generated method stub
		return super.getNo();
	}

	@Override
	public void setNo(int no) {
		// TODO Auto-generated method stub
		super.setNo(no);
	}

	@Override
	public String getOriginalFilename() {
		// TODO Auto-generated method stub
		return super.getOriginalFilename();
	}

	@Override
	public void setOriginalFilename(String originalFilename) {
		// TODO Auto-generated method stub
		super.setOriginalFilename(originalFilename);
	}

	@Override
	public String getRenamedFilename() {
		// TODO Auto-generated method stub
		return super.getRenamedFilename();
	}

	@Override
	public void setRenamedFilename(String renamedFilename) {
		// TODO Auto-generated method stub
		super.setRenamedFilename(renamedFilename);
	}

	public int getMagazineNo() {
		return magazineNo;
	}

	public void setMagazineNo(int magazineNo) {
		this.magazineNo = magazineNo;
	}

	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return super.hashCode();
	}

	@Override
	public boolean equals(Object obj) {
		// TODO Auto-generated method stub
		return super.equals(obj);
	}

	public void setRegDate(Date date) {
		// TODO Auto-generated method stub

	}

	@Override
	public String toString() {
		return "MagazineAttachment [ "+super.toString()+", magazineNo=" + magazineNo + "]";
	}
	
	
	
}
