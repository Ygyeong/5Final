package kh.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.spring.config.AdminConfig;
import kh.spring.dao.AdminDAO;
import kh.spring.data.PublicData;
import kh.spring.dto.Camp_infoDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.service.AdminService;
import kh.spring.service.MemberService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private AdminService service;
	

	@Autowired
	private AdminDAO dao;
	
	@Autowired
	public MemberService ms;
	
	

	@RequestMapping("home")
	public String home(HttpServletRequest request,Model model) throws Exception {
	    return "admin/admin";
	}
	
	
	@RequestMapping("mem")
	public String member(int cpage,String category,String keyword ,Model model) throws Exception {
		
		
		System.out.println("현재 페이지 : " + cpage);
		System.out.println("검색 분류 : "+ category);
		System.out.println("검색어 : "+ keyword);

		int endNum = cpage * AdminConfig.RECORD_COUNT_PER_PAGE;
		int startNum = endNum - (AdminConfig.RECORD_COUNT_PER_PAGE-1);

		
		
		Map<String,Object> param1 = new HashMap<>();
		param1.put("endNum", endNum);
		param1.put("startNum", startNum);
		
		
		
		Map<String,Object> param2 = new HashMap<>();
		param2.put("endNum", endNum);
		param2.put("startNum", startNum);
		param2.put("category", category);
		param2.put("keyword", keyword);
		
		Map<String,Object> param3 = new HashMap<>();
		
		param3.put("cpage", cpage);
		param3.put("category", category);
		param3.put("keyword", keyword);
	
		Map<String,Object> param4 = new HashMap<>();
		
		param4.put("category", category);
		param4.put("keyword", keyword);
		
		System.out.println(param1);

		List<MemberDTO> list;

		if(keyword == null || keyword.contentEquals("")) {
			list = service.getPageList(param1);
		}else {
			list = service.getPageList2(param2);
		}
		
		
		List<String> pageNavi = dao.getPageNavi(cpage,param4);
		System.out.println(pageNavi);
		System.out.println(list);
		
		
		model.addAttribute("list", list);
		model.addAttribute("navi", pageNavi);
		model.addAttribute("cpage", cpage);
		model.addAttribute("category", category);
		model.addAttribute("keyword", keyword);
		
		
	
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
	
	@RequestMapping("memberOutProc")
	public String memberOutProc(String cm_id) throws Exception {
		System.out.println("아이디 값"+cm_id);
		
		
		ms.memberOut(cm_id);
		
		return  "redirect:/admin/mem?cpage=1";
	}

	

}
