package com.Util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

public class FileManager {

	public static boolean doFileDownload(HttpServletResponse response, String saveFileName, String originalFileName, String path) {
		
		try {			
			// 파일 경로
			String filePath = path + File.separator + saveFileName; 
			
			// 클라이언트가 설정한 파일명이 없을 경우 서버에 저장된 파일명으로 등록
			if(originalFileName == null || originalFileName.equals("")) {
				originalFileName = saveFileName;
			}
			
			// 파일을 다운 받아 저장시에 한글깨짐 방지
			originalFileName = new String(originalFileName.getBytes("euc-kr"), "ISO-8859-1");
			
			File f = new File(filePath);
			if(!f.exists()) {
				return false;
			}
			
			// 파일의 종류 -> .txt와 같이 파일확장자 앞에 붙는 .을 octet-stream
			response.setContentType("application/octet-stream");
			// 헤더정보
			response.setHeader("Content-Disposition",  "attatchment;filename=" + originalFileName);
			BufferedInputStream bis = new BufferedInputStream(new FileInputStream(f));
			OutputStream out = response.getOutputStream(); 
			
			int n;
			byte[] bytes = new byte[4096];
			
			while((n = bis.read(bytes, 0, 4096)) != -1) {
				out.write(bytes, 0, n);
			}
			
			out.flush();
			out.close();
			bis.close();
		} catch (Exception e) {
			System.out.println(e.toString());
			return false;
		}
		return true;
	}
	
	public static void doFileDelete(String fileName, String path) {
		
		try {
			String filePath = path + File.separator + fileName;
			File f = new File(filePath);
			if(f.exists()) {
				f.delete(); // 파일 삭제
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}
}
