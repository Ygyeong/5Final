package kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.MemberDTO;
import kh.spring.dto.OrderDTO;
import kh.spring.service.MemberService;
import kh.spring.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private OrderService service;
	
	@Autowired
	private MemberService mservice;
	
	
	@RequestMapping("payView")
	public String payView(String product,String price ,Model m) {
		System.out.println("결제페이지로 ㄱㄱ");
		System.out.println(product+" : "+price);
		
		String id = ((String)session.getAttribute("loginID"));
		MemberDTO mdto = mservice.login(id);
		int seq=service.getSeq();
		service.insert(seq, mdto,product,price);
		OrderDTO dto =service.select(seq);
		int o_seq = dto.getO_seq();
		m.addAttribute("price",price);
		m.addAttribute("o_seq",o_seq);
		m.addAttribute("dto",dto);
		return "shop/pay";
	}
	@RequestMapping("payResult")
	public String payResult(String apply_num,int o_seq,Model m) {
		System.out.println("결제완료");
		System.out.println("apply_num : "+apply_num);
		service.update(apply_num, o_seq);
		String id = (String)session.getAttribute("loginID");
		OrderDTO dto =service.select(o_seq);
		m.addAttribute("dto",dto);
		return "shop/payResult";
	}
	
}
