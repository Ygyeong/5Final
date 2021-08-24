package kh.spring.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import kh.spring.dto.SummerDTO;

@Repository
public class SummerDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insert(SummerDTO dto) {
		return mybatis.insert("Summer.insert",dto);
	}
	
	public List<SummerDTO> getSList(){
		return mybatis.selectList("Summer.getAll");
	}
	
	public List<SummerDTO> filesBySeq(int p_seq){
		return mybatis.selectList("Summer.filesBySeq",p_seq);
	}
	
	public SummerDTO selectThumbBySeq(int p_seq) {
		return mybatis.selectOne("Summer.selectThumbBySeq",p_seq);
	}
	

}
