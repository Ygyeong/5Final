package kh.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.CartDTO;

@Repository
public class CartDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insert(CartDTO dto) { // 장바구니 추가
		sqlSession.insert("Cart.insert",dto);
		
	}
	public CartDTO getC(int p_seq) {
		return mybatis.selectOne("Cart.getC",p_seq);
	}
	public List<CartDTO> list(String camp_id){ // 장바구니 목록
		return sqlSession.selectList("Cart.list", camp_id);
	}
	
	public void delete(int c_seq) { // 장바구니 삭제
		sqlSession.delete("Cart.delete",c_seq);
	}
	
	public void modify(CartDTO dto) { // 장바구니 수정
		sqlSession.update("Cart.modify",dto);
	}
	
	public int sumMoney(String camp_id) { // 장바구니 금액 합계
		sqlSession.selectOne("Cart.sumMoney", camp_id);
		return sqlSession.selectOne("Cart.sumMoney", camp_id);
	}
	
	
	public int count(int p_seq, String camp_id) { // 장바구니 동일상품 확인
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("p_seq", p_seq);
		map.put("camp_id", camp_id);
		return sqlSession.selectOne("Cart.count", map);
	}
	
	public void update(CartDTO dto) { // 장바구니 상품수량 변경
		sqlSession.update("Cart.update",dto);
	}

}
