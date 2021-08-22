package kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import kh.spring.dto.CampTipDTO;
import kh.spring.dto.CampTipPagingDTO;
import kh.spring.service.CampTipService;

@Controller
@RequestMapping("/CampTipBoard")
public class Camp_TipController {

    @Autowired
    private HttpSession session;

    @Autowired
    private CampTipService service;

    @RequestMapping("selectAll")
    public ModelAndView selectAll() throws Exception {

//    	게시글 불러오기 시작
    	List<CampTipDTO> list = service.selectAll();
    	ModelAndView model = new ModelAndView();
    	model.setViewName("CampTip/CampTip");
    	model.addObject("list",list);
    	
    	return model;
    }
    
    @RequestMapping("write")
    public String write() {
        return "/CampTip/CampTipWrite";
    }

    @RequestMapping("insert") // 게시글 등록
    public String insert(CampTipDTO dto) throws Exception {
        int result = service.insert(dto);
        System.out.println(dto.getCamp_tip_num());
        return "redirect:/CampTipBoard/selectAll";
    }

    @RequestMapping("detail")
    public ModelAndView detail(@RequestParam int camp_tip_num) throws Exception {
    	//조회수 증가
    	service.viewCount(camp_tip_num);
    	ModelAndView model = new ModelAndView();
    	model.setViewName("CampTip/CampTipDetail");
    	model.addObject("dto",service.read(camp_tip_num));
    	return model;
    }
    
    @RequestMapping("detailContents")
    public String detailContents(CampTipDTO dto,HttpServletRequest request, HttpServletResponse response) throws Exception {
    	 Gson g = new Gson();
    	 g = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
    	 String title = request.getParameter("category");
    	 System.out.println("제목 : " + title);
    	 String result = g.toJson(dto);
    	 System.out.println("AJAX 값 : " + result);
    	 return result;
    }
    
    @RequestMapping("delete")
    public String delete(CampTipDTO dto,HttpServletRequest request, HttpServletResponse response) throws Exception {
    	int delNum = Integer.parseInt(request.getParameter("num"));
    	System.out.println("글 번호 : " + delNum);
    	service.delete(delNum);
    	return "redirect:/CampTipBoard/selectAll";
    }
    
	@RequestMapping("modify")
	public ModelAndView modify(@RequestParam int camp_tip_num) throws Exception {
		ModelAndView model = new ModelAndView();
    	model.setViewName("CampTip/CampTipModify");
    	model.addObject("dto",service.read(camp_tip_num));
    	return model;
	}
	
	@RequestMapping("modifyProc")
	public String modifyProc(CampTipDTO dto) throws Exception {
		System.out.println(dto.getCamp_tip_num());
        int result = service.modify(dto);
        return "redirect:/CampTipBoard/selectAll";
	}

}