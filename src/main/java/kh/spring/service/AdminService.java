package kh.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.AdminDAO;
import kh.spring.dto.Camp_infoDTO;

@Service
public class AdminService {
	
	@Autowired
	private AdminDAO dao;
	
	//DB입력
	public int campinsert(Camp_infoDTO dto) {
		return dao.campinsert(dto);
	}
	
}
