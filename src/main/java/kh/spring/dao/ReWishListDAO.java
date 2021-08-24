package kh.spring.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.ReWishListDTO;

@Repository
public class ReWishListDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int Insert(ReWishListDTO dto) {
		return mybatis.insert("ReWishList.insert",dto);
	}
	
	public int wishCount(int rep_seq) {
		return mybatis.selectOne("ReWishList.Count",rep_seq);
	}
	public int wishCancel(int rep_seq) {
		return mybatis.delete("ReWishList.Cancel",rep_seq);
	}
	public int wishExist(ReWishListDTO dto) {
		return mybatis.selectOne("ReWishList.exist", dto);
	}
	
	public List<ReWishListDTO> myWishList(Map<String,Object> param) {
		return mybatis.selectList("ReWishList.myWishList",param);
	}
	public int myWishCount(String rem_id) {
		return mybatis.selectOne("ReWishList.myWishCount",rem_id);
	}
}
