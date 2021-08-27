package kh.spring.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.OrderDTO;

@Repository
public class OrderDAO {

	@Autowired
	private SqlSessionTemplate mybatis; 
	
	public int insert(Map<String,Object> param) {
		return mybatis.insert("Order.insert",param);
	} 
	public OrderDTO getDetail(int seq) {
		return mybatis.selectOne("Order.select",seq);
	}
	public OrderDTO select(int seq) {
		return mybatis.selectOne("Order.select",seq);
	}
	public int getSeq() {
		return mybatis.selectOne("Order.getSeq");
	}
	public int update(Map<String,Object> param) {
		return mybatis.update("Order.update",param);
	}
	public List<OrderDTO> getAll(){
		return mybatis.selectList("Order.getAll");
	}
}
