package kh.spring.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.RePicturesDTO;

@Repository
public class RePicturesDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis; 
	
	@Autowired
	private HttpSession session;
	
	public int insert(RePicturesDTO dto) {
		return mybatis.insert("RePictures.insert",dto);
	}
	
	public List<RePicturesDTO> getPList() {
		return mybatis.selectList("RePictures.getAll");
	}
	
	//오류
	public RePicturesDTO getDetail(int rep_seq){
		return mybatis.selectOne("RePictures.getDetail",rep_seq);
	}
	
}
