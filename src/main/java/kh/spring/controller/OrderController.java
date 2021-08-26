package kh.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.OrderDTO;
import kh.spring.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private OrderService service;
	
	
	
	@RequestMapping("result")
	public String result(Model m) {
		return "payresult";
	}
}
