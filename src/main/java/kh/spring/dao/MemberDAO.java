package kh.spring.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.MemberDTO;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int memberSign(MemberDTO dto) {
		return mybatis.insert("Member.memberSign", dto);
	}
	
	public int idDuplCheck(String cm_id) {
		return mybatis.selectOne("Member.idDuplCheck", cm_id);
	}
	
	public MemberDTO login(MemberDTO dto) {
		return mybatis.selectOne("Member.login", dto);
	}
}
