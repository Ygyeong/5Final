package kh.spring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.OrderDAO;
import kh.spring.dto.MemberDTO;
import kh.spring.dto.OrderDTO;

@Service
public class OrderService {

	@Autowired
	private OrderDAO dao;
	
	public int insert(int seq,MemberDTO mdto,String product,String price) {
		int o_price = Integer.parseInt(price);
		Map<String,Object> param = new HashMap<>();
		System.out.println(mdto.getCm_id());
		param.put("o_seq", seq);
		param.put("m_id",mdto.getCm_id());
		param.put("o_name",mdto.getCm_name());
		param.put("o_phone",mdto.getCm_phone());
		param.put("o_email",mdto.getCm_email());
		param.put("o_zipcode",mdto.getCm_zipcode());
		param.put("o_address1",mdto.getCm_address1());
		param.put("o_address2",mdto.getCm_address2());
		param.put("o_product",product);
		param.put("o_qcy",1);
		param.put("o_num",0);
		param.put("o_check",0);
		if(o_price>=50000) {
			param.put("o_allSum",price);
			param.put("o_delivery",0);
		}else {
			param.put("o_allSum",o_price+2500);
			param.put("o_delivery",2500);
		}
		
		
		
		return dao.insert(param);
	} 
	public OrderDTO select(int seq) {
		return dao.select(seq);
	}
	public int getSeq() {
		return dao.getSeq();
	}
	public List<OrderDTO> getAll(){
		return dao.getAll();
	}
	public int update(String apply_num,int o_seq) {
		Map<String,Object> param = new HashMap<>();
		param.put("o_num", apply_num );
		param.put("o_seq", o_seq);
		return dao.update(param);
	}
}
