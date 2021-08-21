package kh.spring.dao;

import java.util.List;

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
	
	public List<ReWishListDTO> myWishList(String rem_id) {
		return mybatis.selectList("ReWishList.myWishList",rem_id);
	}
	public int myWishCount(String rem_id) {
		return mybatis.selectOne("ReWishList.myWishCount",rem_id);
	}
}
