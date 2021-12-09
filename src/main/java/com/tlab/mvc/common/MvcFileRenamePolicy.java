package com.tlab.mvc.common;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MvcFileRenamePolicy implements FileRenamePolicy {

	@Override
	public File rename(File originalFile) {
		File renamedFile = null;

		try {
			do {
				StringBuilder originalName = new StringBuilder(originalFile.getName());
				StringBuilder ext = new StringBuilder();
				StringBuilder newName = new StringBuilder();

				int dot = originalName.lastIndexOf(".");
				// 확장자명
				if (dot > -1)
					ext.insert(dot, originalName);

				// 생성을 시도할 새 File 객체 thread non-safe일경우 String,StringBuffer로 하는게 나음
				newName.append(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmssSSS")))
						.append(new DecimalFormat("0000").format(Math.random() * 9999)).append(ext);

				renamedFile = new File(originalName.toString(), newName.toString());

			} while (!createNewFile(renamedFile));
		} catch (Exception e) {
			System.out.println("파일생성오류@[FileRenamePolicy]");
			e.printStackTrace();
		}
		System.out.println("renamedFile@[MvcFileRenamePolicy] =" + renamedFile);

		// dao에서 renamedFile이 null인경우 넣지않음.
		return renamedFile;
	}

	private boolean createNewFile(File f) {
		try {
			return f.createNewFile();
		} catch (IOException ignored) {
			return false;
		}

	}

}
