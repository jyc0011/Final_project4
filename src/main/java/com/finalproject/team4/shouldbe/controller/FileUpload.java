package com.finalproject.team4.shouldbe.controller;

import java.io.File;

import org.springframework.web.multipart.MultipartFile;

public class FileUpload {
    // 파일 업로드 구현
	public static String fileUpload(String path, MultipartFile file) {
		// 클라이언트가 선택한 파일의 파일명을 구한다.
		String orgFilename = file.getOriginalFilename();

		try {
			file.transferTo(new File(path, orgFilename));
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return orgFilename;
	}
}
