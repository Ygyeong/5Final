package kh.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.dto.CartDTO;
import kh.spring.dto.ProductsDTO;
import kh.spring.service.CartService;
import kh.spring.service.ProductsService;

@Controller
@RequestMapping("/products")
public class ProductsController {

	@Autowired
	private HttpSession session;

	@Autowired
	private ProductsService service;

	@RequestMapping("boardWritePage")
	public String boardWritePage() {
		return "admin/productsInsert";
	}

	@RequestMapping("insert") // 상품등록
	public String insert(ProductsDTO dto) {
		int result = service.insert(dto);
		return "redirect:/";
	}

	@RequestMapping("selectAll") // 상품목록
	public ModelAndView selectAll(ModelAndView model) {
		// view의 이름과 service에서 가져온 list 반환
		model.setViewName("/shop/productsList");
		model.addObject("list",service.selectAll());

		return model;
	}

	@RequestMapping("detail/{p_seq}") // 상품상세
	public ModelAndView detail(@PathVariable("p_seq") int p_seq, ModelAndView model) {
		model.setViewName("/shop/productsDetail");
		model.addObject("dto",service.detail(p_seq));

		return model;

	}

}
