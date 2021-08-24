package kh.spring.dao;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.dto.ReProductDTO;

@Repository
public class ReProductDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

//	로그인
	public int login(Map<String,Object> param) {
		return mybatis.selectOne("ReProduct.login",param);
	}
	
	
	
	
	public int insert(ReProductDTO dto) {
		return mybatis.insert("ReProduct.insert",dto);
	}
	
	public int delete(int seq) {
		return mybatis.delete("ReProduct.delete",seq);
	}
	public int update(ReProductDTO dto) {
		return mybatis.update("ReProduct.update",dto);
	}
	public List<ReProductDTO> getList(Map<String,Object> param){
		return mybatis.selectList("ReProduct.setAll",param);
	}
	public List<ReProductDTO> search(Map<String,Object> param){
		return mybatis.selectList("ReProduct.search",param);
	}
	public ReProductDTO getDetail(int seq) {
		return mybatis.selectOne("ReProduct.detail",seq);
	}
	public int saleInfo(Map<String,Object> param) {
		return mybatis.update("ReProduct.saleInfo",param);
	}
	public int getSeq() {
		return mybatis.selectOne("ReProduct.getSeq");
	}
	public List<ReProductDTO> repList1(Map<String,Object> param){
		return mybatis.selectList("ReProduct.repList1",param);
	}
	public List<ReProductDTO> repList2(Map<String,Object> param){
		return mybatis.selectList("ReProduct.repList2",param);
	}
	public int repCount(String rep_writer) {
		return mybatis.selectOne("ReProduct.repCount",rep_writer);
	}
	public int repCount1(String rep_writer) {
		return mybatis.selectOne("ReProduct.repCount1",rep_writer);
	}
	public int repCount2(String rep_writer) {
		return mybatis.selectOne("ReProduct.repCount2",rep_writer);
	}
}
