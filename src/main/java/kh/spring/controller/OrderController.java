package kh.spring.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.MemberDTO;
import kh.spring.dto.OrderDTO;
import kh.spring.dto.ProductsDTO;
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
		OrderDTO dto = service.getDetail(seq);
		int o_seq = dto.getO_seq();
		
		m.addAttribute("price",price);
		m.addAttribute("o_seq",o_seq);
		m.addAttribute("dto",dto);
		return "shop/pay";
	}
	
	@RequestMapping("payAll")
	public String payView(int [] p_seq,int [] c_qty,String sumMoney,String delivery,String allSum ,Model m) {
		String id = ((String)session.getAttribute("loginID"));
		MemberDTO mdto = mservice.login(id);
		System.out.println(c_qty.length);
		int o_seq = service.getSeq();
		List<OrderDTO> list =service.setOrderDTO(o_seq, mdto, sumMoney,p_seq ,c_qty);
		
		

		m.addAttribute("list",list);
		m.addAttribute("sumMoney",sumMoney);
		m.addAttribute("delivery",delivery);
		m.addAttribute("allSum",allSum);
		m.addAttribute("mdto",mdto);
		m.addAttribute("size",p_seq.length);
		m.addAttribute("o_seq",o_seq);
		return "shop/pay";
	}
	@RequestMapping("payQty")
	public String payQty(String product,String price ,String qty,Model m) {
		System.out.println("결제페이지로 ㄱㄱ");
		
		String id = ((String)session.getAttribute("loginID"));
		MemberDTO mdto = mservice.login(id);
		int seq=service.getSeq();
		service.insert(seq, mdto,product,price,qty);
		OrderDTO dto = service.getDetail(seq);
		int o_seq = dto.getO_seq();
		
		m.addAttribute("price",price);
		m.addAttribute("o_seq",o_seq);
		m.addAttribute("dto",dto);
		return "shop/pay";
	}
	@RequestMapping("payResult")
	public String payResult(String apply_num,int o_seq,String allSum,Model m) {
		System.out.println("결제완료");
		System.out.println("apply_num : "+apply_num);
		System.out.println("합계 :"+allSum);
		System.out.println(o_seq);
		service.update(apply_num, o_seq);
		String id = (String)session.getAttribute("loginID");
		OrderDTO dto =service.select(o_seq);
		m.addAttribute("o_seq",o_seq);
		m.addAttribute("dto",dto);
		return "shop/payResult";
	}
	
}
