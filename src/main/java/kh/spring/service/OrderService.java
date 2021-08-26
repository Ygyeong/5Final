package kh.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.OrderDAO;

@Service
public class OrderService {

	@Autowired
	private OrderDAO dao;
	
	
}
