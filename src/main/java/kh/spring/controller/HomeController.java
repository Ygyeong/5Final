package kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.Camp_infoDTO;
import kh.spring.dto.GalleryDTO;
import kh.spring.service.Camp_infoService;
import kh.spring.service.GalleryService;

@Controller
public class HomeController {
	
	@Autowired
	private Camp_infoService service;
	
	@Autowired 
	private GalleryService gservice;
	
	
	@RequestMapping("/")
	public String home(HttpServletRequest request, Model model) throws Exception  {
		List<Camp_infoDTO> list = service.selectAll();
		int rating = gservice.selectRating();  
		
		model.addAttribute("list",list);
		model.addAttribute("rating",rating);
		return "index";
	}
	
}
