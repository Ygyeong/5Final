package kh.spring.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kh.spring.dto.Camp_infoDTO;
import kh.spring.dto.Camp_photoDTO;
import kh.spring.dto.Camp_wishlistDTO;


@Component
public class Camp_infoDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	//목록 출력
	public List<Camp_infoDTO> selectAll(){
		return mybatis.selectList("Camp_info.selectAll");
	}
	
	//디테일 출력
	public List<Camp_infoDTO> detail(int contentId){
		return mybatis.selectList("Camp_info.detail",contentId);
	}
	
	//사진 출력
	public List<Camp_photoDTO> detailimage(int ci_seq){
		return mybatis.selectList("Camp_info.detailimage",ci_seq);
	}
		
	//찜하기 
	public int wishinsert(Camp_wishlistDTO dto) {
		return mybatis.insert("Camp_info.wishinsert", dto);
	}
	
	//캠핑 정보 넣기
	public int campinsert(Camp_infoDTO dto) {
		return mybatis.insert("Camp_info.campinsert", dto);
	}
	
	//찜하기 확인
	public List<Camp_wishlistDTO> selectwish(Map<String,String> param){
		return mybatis.selectList("Camp_info.selectwish",param);
	}
	
	//찜하기 취소
	public int wishdelete(int wish_seq){
		return mybatis.delete("Camp_info.wishdelete", wish_seq);
				
	}
	
}
