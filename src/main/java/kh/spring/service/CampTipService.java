package kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.CampTipDAO;
import kh.spring.dto.CampTipDTO;

@Service
public class CampTipService {

	@Autowired
	private CampTipDAO dao;
	
	public int insert(CampTipDTO dto) throws Exception {
		return dao.insert(dto);
	}
	
	public List<CampTipDTO> listAll(int start, int end, String searchOption, String keyword) throws Exception {
		return dao.listAll(start, end, searchOption, keyword);
	}
	
	public CampTipDTO read(int camp_tip_num) throws Exception {
		return dao.read(camp_tip_num);
	}
	
	public int viewCount(int camp_tip_num) throws Exception {
		return dao.viewCount(camp_tip_num);
	}
	
	public int delete(int delNum) throws Exception {
		return dao.delete(delNum);
	}
	
	public int modify(CampTipDTO dto)throws Exception {
		return dao.modify(dto);
	}
	
	public int countArticle(String searchOption, String keyword) throws Exception {
	    return dao.countArticle(searchOption, keyword);
	}

	
}
