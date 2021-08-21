package kh.spring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.service.CommentsService;

@Controller
@RequestMapping("/com")
public class CommentsController {

	@Autowired
	private CommentsService service;
	
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("add")
	public String writeProc(String comments,int gallery_seq) throws Exception{

		service.insert(comments,gallery_seq);
		
		
		return "redirect:/gal/detail?seq="+gallery_seq;
	}
		
		
	@RequestMapping("delete")
	public String delete(int seq,int gallery_seq) throws Exception {
		
		
		System.out.println("delete controller :" + seq);
		System.out.println("delete controller" + gallery_seq);
		service.delete(seq);
		return "redirect:/gal/detail?seq="+gallery_seq;
	}
		 
		

	@RequestMapping("update")
	public String modify(String comments,int seq,int gallery_seq) throws Exception {
		
		
		
		System.out.println("컨트롤러 : "+seq);
		service.update(comments,seq);
		return "redirect:/gal/detail?seq="+gallery_seq;
	}
		
		
		
	
	
	@ExceptionHandler 
	public String execeptionHandler(Exception e) {
		e.printStackTrace();
		return "error";
	}
		
	
}
