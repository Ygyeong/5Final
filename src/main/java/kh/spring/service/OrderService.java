package kh.spring.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.OrderDAO;
import kh.spring.dto.OrderDTO;

@Service
public class OrderService {

	@Autowired
	private OrderDAO dao;
	
	public int insert(OrderDTO dto) {
		return dao.insert(dto);
	} 
	public OrderDTO select(String m_id) {
		return dao.select(m_id);
	}
	public int update(String apply_num,int o_seq) {
		Map<String,Object> param = new HashMap<>();
		param.put("o_num", apply_num );
		param.put("o_seq", o_seq);
		return dao.update(param);
	}
}
