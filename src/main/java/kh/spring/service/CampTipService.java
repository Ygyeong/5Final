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
	
	public List<CampTipDTO> selectAll() throws Exception {
		return dao.selectAll();
	}
	
	public CampTipDTO read(int campTip_num) throws Exception {
		return dao.read(campTip_num);
	}
	
	public int viewCount(int campTip_num) throws Exception {
		return dao.viewCount(campTip_num);
	}
	
	public void delete(CampTipDTO dto) throws Exception {
		dao.delete(dto);
	}
	
}
