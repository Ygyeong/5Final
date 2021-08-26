package kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.MemberDAO;
import kh.spring.dao.ReWishListDAO;
import kh.spring.dto.Camp_infoDTO;
import kh.spring.dto.Camp_wishlistDTO;
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
	
	public String pwUpdate(MemberDTO dto) {
		return dao.pwUpdate(dto);
	}

	public MemberDTO modifySelect(MemberDTO dto) {
		return dao.modifySelect(dto);
	}
	
	public List<Camp_wishlistDTO> wishListSelectAll(Camp_wishlistDTO dto) {
		return dao.wishListSelectAll(dto);
	}
	
	public int wishCount(String cm_id) {
		return dao.wishCount(cm_id);
	}

	public List<Camp_infoDTO> selectAll() {
		
		return dao.selectAll();
	}
	
	public int idPwCheck(MemberDTO dto) {
		return dao.pwIdCheck(dto);
	}

}
