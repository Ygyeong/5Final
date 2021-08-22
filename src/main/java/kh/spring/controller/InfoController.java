package kh.spring.controller;


import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xml.sax.SAXException;

import com.google.gson.JsonObject;

import kh.spring.data.PublicData;
import kh.spring.dto.Camp_infoDTO;
import kh.spring.dto.Camp_photoDTO;
import kh.spring.dto.Camp_wishlistDTO;
import kh.spring.service.Camp_infoService;



@Controller
@RequestMapping("/info")
public class InfoController {
	
	@Autowired
	private Camp_infoService service;
	
	@Autowired
	private HttpSession session;
	
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

	
	//정보 리스트
	@RequestMapping("list")
	public String home(HttpServletRequest request, Model model) throws Exception {	
		List<Camp_infoDTO> list = service.selectAll();
		model.addAttribute("list",list);
		return "camp_info/campinglist";
	}
	
	//캠핑 디테일
	@RequestMapping("detail")
	public String detail(HttpServletRequest request, Model model, int contentId) throws Exception {
		//List<Camp_photoDTO> image = service.detailimagecontentId);
		List<Camp_infoDTO> list = service.detail(contentId);

		HttpSession session = request.getSession();
		String loginID = (String)session.getAttribute("loginID");
		String contentId1 = Integer.toString(contentId);
		
		List<Camp_wishlistDTO> wish  = service.selectwish(contentId1, loginID); 
		
		if(loginID == null) {
			model.addAttribute("contents","dislike");
		}else {
			if(wish.size() > 0) {
				model.addAttribute("contents","like");
			}else {
				model.addAttribute("contents","dislike");
			}

		}
				
		model.addAttribute("list",list);
		//model.addAttribute("image",image);
		return "camp_info/campingdetail";
	}
	
	//찜하기 인서트
	@RequestMapping(value = "wishinsert", method = RequestMethod.POST, produces = "application/json; charset=utf8")
 	@ResponseBody
	public String wishinsert(String contents, int contentId, HttpServletRequest request,Model model ) throws Exception {
		System.out.println("성공");
		HttpSession session = request.getSession();
		String loginID = (String)session.getAttribute("loginID");
		String contentId1 = Integer.toString(contentId);
		System.out.println("controller id: " + contentId1 + loginID);
		List<Camp_wishlistDTO> wish = service.selectwish(contentId1, loginID); 
		
		if(loginID == null) {
			System.out.println("로그인X" );
			model.addAttribute("contents",0);
		}else {
			if(wish.size() < 1) {
				System.out.println("인서트");
				Camp_wishlistDTO dto = new Camp_wishlistDTO();
				
				dto.setContentId(contentId);
				dto.setCm_id(loginID);
				dto.setContents(contents);
				service.wishinsert(dto);
			}else {
				System.out.println("안와야되는데여" );
			}

		}
		
		 
		return "redirect:camp_info/campingdetail";
	}
	
	
//	//ķ�� ���ϱ� ����(���� ���)
//	@RequestMapping(value ="wishdelete", method = RequestMethod.POST)
//	public String wishdelete(HttpServletRequest request, String ci_seq) throws Exception {
//		
//		HttpSession session = request.getSession();
//		String cm_id = (String)session.getAttribute("cm_id");
//		
//		Camp_wishlistDTO dto = new Camp_wishlistDTO();
//		
//		dto.setCm_id(cm_id);
//		dto.setCi_seq(ci_seq);
//		 
//		int result = service.wishdelete(dto);
//		 
//		return "redirect:detail";
//	}
	
//

	
}