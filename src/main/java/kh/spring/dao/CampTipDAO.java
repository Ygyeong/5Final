package kh.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import kh.spring.dto.CampTipDTO;

@Repository
public class CampTipDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insert(Map<String,String> param) {
		return mybatis.insert("CampTip.insert", param);
	}
	
	public List<CampTipDTO> listAll(int start, int end, String searchOption, String keyword) {
		// 검색옵션, 키워드 맵에 저장
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("searchOption", searchOption);
	    map.put("keyword", keyword);
	    // BETWEEN #{start}, #{end}에 입력될 값을 맵에 
	    map.put("start", start);
	    map.put("end", end);
	    
		return mybatis.selectList("CampTip.select", map);
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
	
	public int modify(Map<String,String> param) {	
		return mybatis.update("CampTip.modify",param);
	}
	
//	public int modify(CampTipDTO dto) throws Exception {
//		return mybatis.update("CampTip.modify",dto);
//	}
	
	public int countArticle(String searchOption, String keyword) throws Exception {
	    // 검색옵션, 키워드 맵에 저장
	    Map<String, String> map = new HashMap<String, String>();
	    map.put("searchOption", searchOption);
	    map.put("keyword", keyword);
	    return mybatis.selectOne("CampTip.countArticle", map);
	}
	
	public int getSeq() {
		return mybatis.selectOne("CampTip.getSeq");
	}
	public CampTipDTO search(int camp_tip_num) throws Exception{
		return mybatis.selectOne("CampTip.search",camp_tip_num);
	}

}