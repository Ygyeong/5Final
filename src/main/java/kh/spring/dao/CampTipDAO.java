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
	
	public CampTipDTO read(int camp_tip_num) throws Exception {
		return mybatis.selectOne("CampTip.detail",camp_tip_num);
	}
	
	public int viewCount(int camp_tip_num) throws Exception {
		return mybatis.update("CampTip.viewCount",camp_tip_num);
	}
	
	public int delete(int delNum) {
		return mybatis.delete("CampTip.delete",delNum);
	}
	
	public int modify(CampTipDTO dto) throws Exception {
		return mybatis.update("CampTip.modify",dto);
	}
	
}