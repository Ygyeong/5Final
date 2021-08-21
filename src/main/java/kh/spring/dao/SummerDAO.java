package kh.spring.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.SummerDTO;

@Repository
public class SummerDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int upload(SummerDTO dto) {
		return mybatis.insert("Summer.upload",dto);
	}
	

}
