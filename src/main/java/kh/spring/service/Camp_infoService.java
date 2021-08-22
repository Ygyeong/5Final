package kh.spring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.Camp_infoDAO;
import kh.spring.dto.Camp_infoDTO;
import kh.spring.dto.Camp_photoDTO;
import kh.spring.dto.Camp_wishlistDTO;



@Service
public class Camp_infoService {

	@Autowired
	private Camp_infoDAO dao;
	
	//캠프 리스트
	public List<Camp_infoDTO> selectAll(){
		return dao.selectAll();
	}
	
	//캠프 정보
	public List<Camp_infoDTO> detail(int contentId){
		return dao.detail(contentId);
	}
	
//	//캠프 사진
//	public List<Camp_photoDTO> detailimage(int ci_seq){
//		return dao.detailimage(ci_seq);
//	}
	
	
	//찜하기
	public int wishinsert(Camp_wishlistDTO dto) {
		return dao.wishinsert(dto);
	}
	
	//DB입력
	public int campinsert(Camp_infoDTO dto) {
		return dao.campinsert(dto);
	}
	
	//찜하기 목록
	public List<Camp_wishlistDTO> selectwish(String contentId1, String cm_id){
		Map<String,String> param = new HashMap<>();

	    param.put("contentId",contentId1);
	    param.put("cm_id", cm_id);
		
		return dao.selectwish(param);
	}
	
	//찜빼기
	public int wishdelete(int wish_seq) {
		return dao.wishdelete(wish_seq);
	}

	
	
}