package kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.data.PublicData;
import kh.spring.dto.Camp_infoDTO;
import kh.spring.service.AdminService;
import kh.spring.service.Camp_infoService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private AdminService service;
	
	//파싱된 데이터를 DB에 저장
	@RequestMapping("home")
	public String home(HttpServletRequest request) throws Exception {
		
	    return "admin/admin";
	}
	
	
	@RequestMapping("mem")
	public String member(HttpServletRequest request) throws Exception {
		
	    return "admin/adminMember";
	}
	
	@RequestMapping("newProduct")
	public String np(HttpServletRequest request) throws Exception {
		
	    return "admin/adminNewP";
	}
	
	@RequestMapping("pay")
	public String pay(HttpServletRequest request) throws Exception {
		
	    return "admin/adminPay";
	}
	
	@RequestMapping("re")
	public String re(HttpServletRequest request) throws Exception {
		
	    return "admin/adminRe";
	}
	//파싱된 데이터를 DB에 저장
	@RequestMapping("dataupdate")
	public String practice(HttpServletRequest request) throws Exception {
		System.out.println("출력");
		PublicData data = new PublicData();
		List <Camp_infoDTO> list = data.ParsingData();
		
		for(Camp_infoDTO dto : list) {
			service.campinsert(dto);
		}
	    
	    return "redirect:/";
	}
	
	
	

}
