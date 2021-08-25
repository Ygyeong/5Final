package kh.spring.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import kh.spring.dto.ProductsDTO;

@RequestMapping("/summer")
@Controller
public class SummerController {
	
	@Autowired
	private HttpSession session;
	
//	@ResponseBody
//	@RequestMapping(value="upload",produces = "application/json; charset=utf8")
//	public String upload(MultipartFile[] file,ProductsDTO dto) {
//		
//		JsonObject json = new JsonObject();
//		
//		String realPath = session.getServletContext().getRealPath("files");
//		File filesPath = new File(realPath);
//		System.out.println("파일저장 경로는 "+filesPath);
//		if(!filesPath.exists()) {filesPath.mkdir();}
//		
//		for(MultipartFile tmp : file) {
//			String oriName = tmp.getOriginalFilename();
//			String sysName = UUID.randomUUID().toString().replaceAll("-", "")+"_"+oriName; 
//			File targetFile = new File(filesPath + sysName);
//			try {
//				tmp.transferTo(new File(filesPath.getAbsolutePath()+"/"+sysName));
//				json.addProperty("url","절대경로"+sysName);
//				json.addProperty("oriName", oriName);
//				json.addProperty("sysName", sysName);
//			} catch (IOException e) {
//				FileUtils.deleteQuietly(targetFile);
//				e.printStackTrace();
//			}
//		}
//		return json.toString();
//	}
	
	@PostMapping(value="/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public JsonObject uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile,ProductsDTO dto)  {
		JsonObject jsonObject = new JsonObject();
		
		String filesPath = "C:\\Users\\jinwon\\git\\5Final\\src\\main\\webapp\\file\\";
		System.out.println("파일저장 경로는 "+filesPath);
		
		String oriName= multipartFile.getOriginalFilename();	//오리지날 파일명;
		String extension = oriName.substring(oriName.lastIndexOf("."));	//파일 확장자
		String sysName = UUID.randomUUID() +"_"+ extension;	//저장될 파일 명
		
		File targetFile = new File(filesPath + sysName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/summernoteImage/" + sysName);
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		
		return jsonObject;
	}
}
