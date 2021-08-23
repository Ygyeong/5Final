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
			model.addAttribute("contents",null);
		}else {
			if(wish.size() > 0) {
				model.addAttribute("contents",wish.get(0).getContents());
			} else if(wish.size() == 0){
				System.out.println("안됨");
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
			} else if(wish.size() == 0) {
				System.out.println("안와야되는데여" );
			}

		}	
		 
		return "redirect:camp_info/campingdetail";
	}
	
	
	//찜하기 취소
	@RequestMapping(value ="wishdelete", method = RequestMethod.POST)
	public String wishdelete(HttpServletRequest request, int contentId, String contents, Model model ) throws Exception {
		
		HttpSession session = request.getSession();
		String loginID = (String)session.getAttribute("loginID");
		String contentId1 = Integer.toString(contentId);
		System.out.println(contentId);
		List<Camp_wishlistDTO> wish = service.selectwish(contentId1, loginID); 
		
		Camp_wishlistDTO dto = new Camp_wishlistDTO();
		
		if( wish.size() > 0) {
			
			System.out.println("딜리트");			
			int wish_seq = wish.get(0).getWish_seq();
			
			service.wishdelete(wish_seq);
		}else {
			System.out.println("안와야되는데여" );
		}
		
		 
		return "redirect:detail";
	}
	


	
}