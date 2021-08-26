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
	

	//캠프 정보
	public List<Camp_infoDTO> detail(int contentId){
		return dao.detail(contentId);
	}
	
	//캠프 사진 디테일에 뿌리기
	public List<Camp_photoDTO> detailimage(int contentId){
		return dao.detailimage(contentId);
	}
	
	//캠프 사진 파싱
	public int imageinsert(Camp_photoDTO dto) {
		return dao.imageinsert(dto);
	}	
	
	//찜하기
	public int wishinsert(Camp_wishlistDTO dto) {
		return dao.wishinsert(dto);
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
	
	//리스트
	public List<Camp_infoDTO> selectAll(int startNum,int endNum) {
		Map<String,Object> param = new HashMap<>();
		param.put("startNum",startNum);
		param.put("endNum",endNum);
		
		return dao.selectAll(param);
	}
	
	//검색
	public List<Camp_infoDTO> search(String searchOption, String keyword){
		Map<String, String> param = new HashMap<>();
		param.put("searchOption",searchOption);
		param.put("keyword", keyword);
		
		return dao.search(param);
	}
	
	//이미지 뽑기용
	public List<Camp_infoDTO> contentIdlist() {
		return dao.contentIdlist();
	}
	
	// 메인 리스트 뽑는 용
	public List<Camp_infoDTO> indexlist() {
		return dao.indexlist();
	}
	
	
}