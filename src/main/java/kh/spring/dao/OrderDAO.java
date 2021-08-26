package kh.spring.dao;

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
	public OrderDTO select(String m_id) {
		return mybatis.selectOne("Order.select",m_id);
	}
	public int update(Map<String,Object> param) {
		return mybatis.update("Order.update",param);
	}
	
}
