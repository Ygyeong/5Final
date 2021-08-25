package kh.spring.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kh.spring.dto.Camp_infoDTO;
import kh.spring.dto.MemberDTO;

@Component
public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//캠핑 정보 넣기
	public int campinsert(Camp_infoDTO dto) {
		return mybatis.insert("Admin.campinsert", dto);
	}
	
	//회원목록 출력
	public List<MemberDTO> SelectMember(){
		return mybatis.selectList("Admin.member");
	}
	
	//회원 강탈
	public String memberdelete(String cm_id) {
		return mybatis.selectOne("Member.memberdelete", cm_id);
	}
}
