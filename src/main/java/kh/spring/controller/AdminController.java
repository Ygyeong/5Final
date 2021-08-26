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
import org.springframework.web.multipart.MultipartFile;

import kh.spring.config.AdminConfig;
import kh.spring.config.ReProductConfig;
import kh.spring.dao.AdminDAO;
import kh.spring.data.PublicData;
import kh.spring.dto.Camp_infoDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.dto.ProductsDTO;
import kh.spring.dto.ReProductDTO;
import kh.spring.service.AdminService;
import kh.spring.service.MemberService;
import kh.spring.service.ProductsService;
import kh.spring.service.ReProductService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private AdminService service;
	
	@Autowired
	private ProductsService pservice;
	
	@Autowired
	private ReProductService rservice;
	

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
//		param2.put("keyword", keyword);
		
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
	public String np(int index, Model model) throws Exception {
		int endNum=index*ReProductConfig.RECORD_COUNT_PER_LIST;
		int startNum =endNum -(ReProductConfig.RECORD_COUNT_PER_LIST-1);
		List<ProductsDTO> list = pservice.Thumbnail(startNum,endNum);
		model.addAttribute("list",list);
		
		
	    return "admin/adminNewP";
	}
	
	@RequestMapping("pay")
	public String pay(HttpServletRequest request) throws Exception {
		
	    return "admin/adminPay";
	}
	
	@RequestMapping("insert") // 상품등록
	public String insert(ProductsDTO dto,MultipartFile[] file) throws Exception {
		
		int p_seq = pservice.getP_seq();
		dto.setCamp_id(String.valueOf(session.getAttribute("loginID")));
		dto.setP_seq(p_seq);
		String realPath = session.getServletContext().getRealPath("/resources/imgs");
		pservice.insert(dto,p_seq,file,realPath);
		return "/admin/adminPay?index=1";
	}
	
	
	@RequestMapping("re")
	public String re(int index,String keyword,Model m) throws Exception {
		
		
			int endNum=index*ReProductConfig.RECORD_COUNT_PER_LIST;
			int startNum =endNum -(ReProductConfig.RECORD_COUNT_PER_LIST-1);
			System.out.println(startNum);
			System.out.println(keyword);
			if(keyword == null || keyword.contentEquals("")) {
				List<ReProductDTO> list = rservice.Thumbnail(startNum,endNum);
				m.addAttribute("list",list);
			}else {
				List<ReProductDTO> list = rservice.search(keyword,startNum,endNum);
				int listsize = list.size();
				int total = (int)Math.ceil(listsize/(double)ReProductConfig.RECORD_COUNT_PER_LIST);
				m.addAttribute("list",list);
				m.addAttribute("keyword",keyword);
				m.addAttribute("count",listsize);
		
			}
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
