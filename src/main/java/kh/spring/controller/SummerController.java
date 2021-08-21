package kh.spring.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import kh.spring.dto.ProductsDTO;

@RequestMapping("/summer")
@Controller
public class SummerController {
	
	@Autowired
	private HttpSession session;
	
	@ResponseBody
	@RequestMapping(value="upload",produces = "application/json; charset=utf8")
	public String upload(MultipartFile[] file,ProductsDTO dto) {
		
		JsonObject json = new JsonObject();
		
		String realPath = session.getServletContext().getRealPath("files");
		File filesPath = new File(realPath);
		System.out.println("파일저장 경로는 "+filesPath);
		if(!filesPath.exists()) {filesPath.mkdir();}
		
		for(MultipartFile tmp : file) {
			String oriName = tmp.getOriginalFilename();
			String sysName = UUID.randomUUID().toString().replaceAll("-", "")+"_"+oriName; 
			File targetFile = new File(filesPath + sysName);
			try {
				tmp.transferTo(new File(filesPath.getAbsolutePath()+"/"+sysName));
				json.addProperty("url","/resources/imgs/"+sysName);
				json.addProperty("oriName", oriName);
				json.addProperty("sysName", sysName);
			} catch (IOException e) {
				FileUtils.deleteQuietly(targetFile);
				e.printStackTrace();
			}
		}
		return json.toString();
	}
	
	@ExceptionHandler // 예외가 발생했을 때만,
	public String execeptionHandler(Exception e) {
		e.printStackTrace();
		return "error";
	}
}
