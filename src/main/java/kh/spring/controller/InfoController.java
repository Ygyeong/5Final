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

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import kh.spring.config.InfoConfig;
import kh.spring.config.ReProductConfig;
import kh.spring.data.PublicData;
import kh.spring.data.PublicImage;
import kh.spring.dto.Camp_infoDTO;
import kh.spring.dto.Camp_photoDTO;
import kh.spring.dto.Camp_wishlistDTO;
import kh.spring.dto.ReProductDTO;
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
	public String home(int index,String keyword, String searchOption,  Model model) throws Exception {

		int endNum = index*InfoConfig.RECORD_COUNT_PER_LIST;
		int startNum = endNum -(InfoConfig.RECORD_COUNT_PER_LIST-1);
		
		
		if(keyword == null || keyword.contentEquals("")) {
			List<Camp_infoDTO> list = service.selectAll(startNum,endNum);
			model.addAttribute("list",list);
		}else {
			
			List<Camp_infoDTO> list = service.search(searchOption, keyword);
			int listsize = list.size();
			int total = (int)Math.ceil(listsize/(double)InfoConfig.RECORD_COUNT_PER_LIST);
			model.addAttribute("list", list);
			model.addAttribute("keyword",keyword);		
		}
		
		System.out.println("인덱스" + index +"끝" + endNum + "첫" + startNum);
		
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
	
	
	//무한스크롤
	@ResponseBody
	@RequestMapping(value="scroll",produces="text/html;charset=utf8")
	public String scrollList(int index) {
		int endNum=index*ReProductConfig.RECORD_COUNT_PER_LIST;
		int startNum =endNum -(ReProductConfig.RECORD_COUNT_PER_LIST-1);
		List<Camp_infoDTO> list = service.selectAll(startNum,endNum);
		System.out.println(index);
		return new Gson().toJson(list);
	}
	
	//무한 스크롤 (서치결과)
	@ResponseBody
	@RequestMapping(value="scrollsearch",produces="text/html;charset=utf8")
	public String scrollSearchList(int index, String searchOption, String keyword) {
		int endNum=index*ReProductConfig.RECORD_COUNT_PER_LIST;
		int startNum =endNum -(ReProductConfig.RECORD_COUNT_PER_LIST-1);
		List<Camp_infoDTO> list = service.search(searchOption, keyword);
		System.out.println(index);
		return new Gson().toJson(list);
	}
	
	//디테일 이미지 출력
	@RequestMapping("imagelist")
	public String ImageList(HttpServletRequest request) throws Exception {
		System.out.println("출력");
		
		List <Camp_infoDTO> id = service.contentIdlist();
		PublicImage image = new PublicImage();
		Camp_photoDTO dto = new Camp_photoDTO(); 
		
		for(int i=0; i< 208; i++) {
			Camp_infoDTO idlist = id.get(i);
			int contentId = idlist.getContentId();
			System.out.println(i + ": " + contentId);
			List <Camp_photoDTO> list = image.ParsingData(contentId);
			service.imageinsert(dto);
		}

	    
		
		return "camp_info/campinglist";
	}
	

	
	


	
}