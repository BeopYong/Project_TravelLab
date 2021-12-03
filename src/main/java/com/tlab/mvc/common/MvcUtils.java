package com.tlab.mvc.common;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.Base64.Encoder;

import com.oreilly.servlet.MultipartRequest;

public class MvcUtils {

	/**
	 * 비밀번호 암호화 처리 메소드
	 * 
	 * 1. 암호화 처리 MessageDigest
	 * 2. 암호화 된 이진배열을 문자열로 인코딩 처리 Base64Encoder
	 */
	public static String getEncryptedPassword(String password) {
		
		//1.암호화 처리
		byte[] encrypted = null;
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-512");
			byte[] plain = password.getBytes("utf-8");
			md.update(plain);
			encrypted = md.digest();
		} catch(NoSuchAlgorithmException| UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		System.out.println(new String(encrypted));
		
		//2.인코딩처리
		//영문자, 숫자, +, / 64개의 문자를 사용(=패딩문자 사용)
		Encoder encoder = Base64.getEncoder();
		String encryptedPassword = encoder.encodeToString(encrypted);
		System.out.println(encryptedPassword);
		
		return encryptedPassword;
	}
	
	/**
	 * 
	 * @param cPage
	 * @param numPerPage
	 * @param totalContent
	 * @param url
	 * 
	 * totalPage 전체페이지
	 * pagebarSize 페이지 바 크기 5
	 * pageNo
	 * pageStart - pageEnd
	 * 
	 * @return
	 */
	public static String getPagebar(int cPage, int numPerPage, int totalContent, String url) {
		StringBuilder pagebar = new StringBuilder();
		//"?cpage= "띄어쓰기 하지말것 띄어쓰기도 parameter에 포함되서 오류남.
		url = url +"?cPage="; // pageNo 추가전 상태
		final int pagebarSize = 5;
		final int totalPage = (int) Math.ceil((double) totalContent/numPerPage);
		final int pageStart = ((cPage -1 ) / pagebarSize) * pagebarSize +1;
		int pageEnd = pageStart + pagebarSize -1;
		pageEnd = totalPage < pageEnd ? totalPage : pageEnd;
		int pageNo = pageStart;
		
		// page bar 구조
		// 1 2 3 4 5 [다음]  
		// [이전] 6 7 8 9 10 [다음]
		// [이전] 13 14 15 
		// 2의 실제 url : /mvc/board/boardList?cPage=2
		
		
		// [이전] 버튼 만들기
		if(pageNo ==1) {
		} else {
			pagebar.append("<a href ='" + url +(pageNo -1) +"'>이전</a>\n");
		}
		
		// pageNo
		while (pageNo <= pageEnd) {
			if(pageNo == cPage) {
				pagebar.append("<span class ='cPage'>"+ cPage + "</span>\n");
			} else {
				pagebar.append("<a href='"+ url + pageNo + "'>"+ pageNo+ "</a>\n");
			}
			pageNo++;
		}
		
		// [다음] 버튼 만들기
		if (pageNo > totalPage) {
		} else {
			pagebar.append("<a href='"+ url + pageNo + "'>next</a>\n");
		}
		
		return pagebar.toString();
	}
		
	public static Attachment makeAttachment(MultipartRequest multipartRequest,String string) {
		Attachment attach = new Attachment();
		String originalFilename= multipartRequest.getOriginalFileName(string);
		String renamedFilename = multipartRequest.getFilesystemName(string);
		attach.setOriginalFilename(originalFilename);
		attach.setRenamedFilename(renamedFilename);
		return attach;
	}
	
}
