package kh.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.dto.CartDTO;
import kh.spring.service.CartService;

@RequestMapping("cart")
@Controller
public class CartController {
	
	@Autowired
	private CartService cservice;
	
	@RequestMapping("insertCart") // 장바구니 넣기
	public String insertCart(@ModelAttribute CartDTO dto,HttpSession session) {
		String camp_id = "admin";
		session.setAttribute("camp_id",camp_id);
		dto.setCamp_id(camp_id);
		// 장바구니에 기존 상품이 있는지 검사
		
		int count = cservice.count(dto.getP_seq(),camp_id);
		if(count == 0) {
			cservice.insert(dto);
		}else {
			cservice.update(dto);
		}
		return "redirect:/cart/cartList";
	}
	
	@RequestMapping("cartList") // 장바구니 목록
	public ModelAndView list(HttpSession session,ModelAndView model) {
		System.out.println("장바구니 목록 출력!");
		String camp_id = (String)session.getAttribute("camp_id");
		Map<String,Object>map = new HashMap<String,Object>();
		List<CartDTO> list = cservice.list(camp_id); // 장바구니 목록
		int sumMoney = cservice.sumMoney(camp_id); // 장바구니 전체 금액
		// 장바구니 전체 금액에 따라 배송비 구분
		// 배송료 ( 5만원이상 => 무료, 미만=>2500원 )
		int delivery = sumMoney >= 50000 ?  0 : 2500;
		
		map.put("list", list);
		map.put("count", list.size()); // 장바구니 상품 유무
		map.put("sumMoney", sumMoney); // 장바구니 전체 금액
		map.put("delivery", delivery); // 배송비
		map.put("allSum", sumMoney+delivery); // 주문 상품 전체 금액
		model.setViewName("shop/cartList");
		model.addObject("map",map);
		return model;
	}
	
	
	@RequestMapping("delete")
	public String delete(@RequestParam int c_seq) {
		System.out.println(c_seq);
		cservice.delete(c_seq);
		return "redirect:/shop/cartList";
	}
	
	@RequestMapping("update")
	public String update(@RequestParam int[] c_qty, @RequestParam int[] p_seq, HttpSession session) {
		String camp_id = (String)session.getAttribute("camp_id");
		
		for(int i=0; i<p_seq.length; i++) {
			CartDTO dto = new CartDTO();
			dto.setCamp_id(camp_id);
			dto.setC_qty(c_qty[i]);
			dto.setP_seq(p_seq[i]);
			cservice.modify(dto);
		}
		return "redirect:/shop/cartList";
	}

}
