package kh.spring.service;

import java.util.List;
import java.util.Map;

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

	public List<MemberDTO> getPageList(Map<String,Object> param1) throws Exception{

		System.out.println(param1);
		return dao.getPageList(param1);

	}

	public List<MemberDTO> getPageList2(Map<String,Object> param2) throws Exception{

		System.out.println(param2);
		return dao.getPageList2(param2);

	}

}
