package kh.spring.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.CommentsDTO;

@Repository
public class CommentsDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	
	public int insert(Map<String,String> param) throws Exception {

		return mybatis.insert("Comments.insert",param);
				
	}

	
	public List<CommentsDTO> list(int seq) throws Exception{
		
		return mybatis.selectList("Comments.list",seq);
		
		
	}
	
	
	public int update(Map<String,Object> param) throws Exception {
		
		System.out.println(param.get("seq"));
		return mybatis.update("Comments.modify",param);
		
	}
	
	public int delete(int seq) throws Exception {
		
		
		System.out.println("delete dao : "+ seq);
		return mybatis.delete("Comments.delete",seq);
		
		
	}
	

}
