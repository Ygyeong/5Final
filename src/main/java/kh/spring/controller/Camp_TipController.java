package kh.spring.controller;

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
import kh.spring.service.CampTipService;

@Controller
@RequestMapping("/CampTipBoard")
public class Camp_TipController {

    @Autowired
    private HttpSession session;

    @Autowired
    private CampTipService service;

    @RequestMapping("write")
    public String write() {
        return "/CampTip/CampTipWrite";
    }

    @RequestMapping("insert") // 게시글 등록
    public String insert(CampTipDTO dto) throws Exception {
        int result = service.insert(dto);
        System.out.println(dto.getCampTip_num());
        return "redirect:/";
    }

    @RequestMapping("detail")
    public ModelAndView detail(@RequestParam int campTip_num) throws Exception {
    	//조회수 증가
    	service.viewCount(campTip_num);
    	ModelAndView model = new ModelAndView();
    	model.setViewName("CampTip/CampTipDetail");
    	model.addObject("dto",service.read(campTip_num));
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
    public String delete(CampTipDTO dto) throws Exception {
    	service.delete(dto);
    	return "redirect:/selectAll";
    }
    
//    @RequestMapping("detail/{p_seq}") // 상품상세
//    public ModelAndView detail(@PathVariable("p_seq") int p_seq, ModelAndView model) {
//        model.setViewName("/shop/productsDetail");
//        model.addObject("dto",service.detail(p_seq));
//        return model;
//    }

}