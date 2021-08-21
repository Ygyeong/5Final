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
	
	public MemberDTO login(MemberDTO dto) {
		return dao.login(dto);
	}
}
