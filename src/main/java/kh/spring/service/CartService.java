package kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.CartDAO;
import kh.spring.dto.CartDTO;

@Service
public class CartService {
	
	@Autowired
	CartDAO dao;
	
	public void insert(CartDTO dto) { // 장바구니 추가
		dao.insert(dto);
	}
	
	public List<CartDTO> list(String camp_id){ // 장바구니 목록
		return dao.list(camp_id);
	}
	
	public int count(int p_seq,String camp_id) { // 장바구니 상품 확인
		return dao.count(p_seq, camp_id);
	}
	
	public void update(CartDTO dto) { // 장바구니 수량 변경
		dao.update(dto);
	}

	public void delete(int c_seq) { // 장바구니 삭제
		dao.delete(c_seq);
	}
	
	public void modify(CartDTO dto) { // 장바구니 수정
		dao.modify(dto);
	}
	
	public int sumMoney(String camp_id) { // 장바구니 금액 합계
		return dao.sumMoney(camp_id);
	}
	

}
