package kh.spring.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.ProductsDTO;

@Repository
public class ProductsDAO {
		
	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Inject
	SqlSession sqlSession;
	
	public int insert(ProductsDTO dto) { // 상품등록
		return mybatis.insert("Products.insert",dto);
		
	}
	
	public List<ProductsDTO> selectAll(Map<String,Object> param){
		return mybatis.selectList("Products.selectAll",param);
	}
	
	public ProductsDTO detail(int p_seq) { // 상품상세
		return sqlSession.selectOne("Products.detail", p_seq);
	}
	
	public int delete(int p_seq) {
		return mybatis.delete("Products.delete",p_seq);
	}
	
	public int getP_seq() {
		return mybatis.selectOne("Products.getP_seq");
	}
	public List<ProductsDTO> pList(String camp_id){
		return mybatis.selectList("Products.pList",camp_id);
	}
	
	

}
