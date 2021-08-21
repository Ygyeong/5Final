package kh.spring.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.CampTipDTO;

@Repository
public class CampTipDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insert(CampTipDTO dto) {
		return mybatis.insert("CampTip.insert", dto);
	}
	
	public List<CampTipDTO> selectAll() {
		return mybatis.selectList("CampTip.select");
	}
	
	public CampTipDTO read(int campTip_num) throws Exception {
		return mybatis.selectOne("CampTip.detail",campTip_num);
	}
	
	public int viewCount(int campTip_num) throws Exception {
		return mybatis.update("CampTip.viewCount",campTip_num);
	}
	
	public void delete(CampTipDTO dto) throws Exception {
		mybatis.delete("CampTip.delete",dto);
	}
	
}