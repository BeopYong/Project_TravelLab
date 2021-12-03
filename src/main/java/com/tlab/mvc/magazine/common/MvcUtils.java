package com.tlab.mvc.magazine.common;

import com.oreilly.servlet.MultipartRequest;
import com.tlab.mvc.magazine.model.vo.Attachment;

public class MvcUtils {

	public static Attachment makeAttachment(MultipartRequest multipartRequest, String name) {
		Attachment attach = new Attachment();
		String originalFilename = multipartRequest.getOriginalFileName(name);
		String renamedFilename = multipartRequest.getFilesystemName(name);
		attach.setOriginalFilename(originalFilename);
		attach.setRenamedFilename(renamedFilename);
		return attach;
	}

	
}
