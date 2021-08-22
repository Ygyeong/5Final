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
	
	public int insert(RePicturesDTO dto) {
		return mybatis.insert("RePictures.insert",dto);
	}
	
	public List<RePicturesDTO> getPList() {
		return mybatis.selectList("RePictures.getAll");
	}
	
	
	public List<RePicturesDTO> filesBySeq(int rep_seq){
		return mybatis.selectList("RePictures.filesBySeq",rep_seq);
	}
	public RePicturesDTO selectThumbBySeq(int rep_seq) {
		return mybatis.selectOne("RePictures.selectThumbBySeq",rep_seq);
	}
	
}
