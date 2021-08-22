package kh.spring.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.ReCommentsDTO;

@Repository
public class ReCommentsDAO {

	@Autowired
	private SqlSessionTemplate mybatis; 
	
	public int insert(ReCommentsDTO dto) {
		return mybatis.insert("ReComments.insert",dto);
	}
	public List<ReCommentsDTO> getAll(int recmt_rep_seq){
		return mybatis.selectList("ReComments.getAll",recmt_rep_seq);
	}
	public int delete(int recmt_seq) {
		return mybatis.delete("ReComments.delete",recmt_seq);
	}
	public int getSeq() {
		return mybatis.selectOne("ReComments.getSeq");
	}
	public ReCommentsDTO getCmt(int recmt_seq){
		return mybatis.selectOne("ReComments.getCmt",recmt_seq);
	}
	public int update(Map<String,Object> param) {
		return mybatis.update("ReComments.update",param);
	}
	public List<ReCommentsDTO> getWriter(int recmt_rep_seq){
		return mybatis.selectList("ReComments.getWriter",recmt_rep_seq);
	}
	
}
