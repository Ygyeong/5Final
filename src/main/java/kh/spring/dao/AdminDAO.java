package kh.spring.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kh.spring.dto.Camp_infoDTO;

@Component
public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//캠핑 정보 넣기
	public int campinsert(Camp_infoDTO dto) {
		return mybatis.insert("Admin.campinsert", dto);
	}
}
