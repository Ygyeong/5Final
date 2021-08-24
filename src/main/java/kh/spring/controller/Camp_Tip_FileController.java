package kh.spring.controller;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/CampTipFile")
public class Camp_Tip_FileController {
	
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private HttpServletResponse response;
	
	@RequestMapping("download")
	public void FileDown() throws Exception {
		System.out.println("다운요청완료");
		int seq = Integer.parseInt(request.getParameter("seq"));
		String sysName = request.getParameter("sysname");
		String oriName = request.getParameter("oriname");
		System.out.println(sysName);
		System.out.println(oriName);
		String filesPath = request.getServletContext().getRealPath("/resources/campTipImg/files");
		System.out.println("파일다운 리얼패스 : " + filesPath);
		File targetFile = new File(filesPath+"/"+sysName);
		try(
			FileInputStream fis = new FileInputStream(targetFile);
			DataInputStream dis = new DataInputStream(fis);
			DataOutputStream dos = new DataOutputStream(response.getOutputStream());
			){
		byte[] fileContents = new byte[(int)targetFile.length()];
		dis.readFully(fileContents);
		
		oriName = new String(oriName.getBytes("utf-8"),"iso-8859-1");
		
//				2번 - 램에 로딩된 내용을 클라이언트에 전송한다.
		response.reset(); // response객체의 기본동작을 전부 제거
		response.setContentType("application/octet-stream");
		response.setHeader("content-disposition", "attachment; filename=\""+oriName+"\""); // 랜더링 말고 첨부파일이니 다운로드 받아라
		
		dos.write(fileContents);
		dos.flush();
		}
	}
}
