package kh.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.MemberDAO;
import kh.spring.dto.MemberDTO;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO dao;

	public int memberSign(MemberDTO dto) {
		return dao.memberSign(dto);
	}
	
	public int idDuplCheck(String cm_id) {
		return dao.idDuplCheck(cm_id);
	}
	
	public MemberDTO login(String cm_id) {
		return dao.login(cm_id);
	}
	
	public String memberOut(String cm_id) {
		return dao.memberOut(cm_id);
	}
	
	public String memberUpdate(MemberDTO dto) {
		return dao.memberUpdate(dto);
	}

}
