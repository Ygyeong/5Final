package kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.AdminDAO;
import kh.spring.dto.Camp_infoDTO;
import kh.spring.dto.MemberDTO;

@Service
public class AdminService {
	
	@Autowired
	private AdminDAO dao;
	
	
	
	//DB입력
	public int campinsert(Camp_infoDTO dto) {
		return dao.campinsert(dto);
	}
	
	//목록 출력
	public List<MemberDTO> SelectMember(){
		return dao.SelectMember();
	}
	
	//회원 강탈
	public String memberdelete(String cm_id) {
		return dao.memberdelete(cm_id);
	}
}
