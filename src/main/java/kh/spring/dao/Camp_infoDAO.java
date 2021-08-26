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
	public List<Camp_infoDTO> selectAll(Map<String,Object> param){
		return mybatis.selectList("Camp_info.selectnum", param);
	}
	
	//디테일 출력
	public List<Camp_infoDTO> detail(int contentId){
		return mybatis.selectList("Camp_info.detail",contentId);
	}
	
	//사진 출력
	public List<Camp_photoDTO> detailimage(int contentId){
		return mybatis.selectList("Camp_info.detailimage",contentId);
	}
		
	//찜하기 
	public int wishinsert(Camp_wishlistDTO dto) {
		return mybatis.insert("Camp_info.wishinsert", dto);
	}
		
	//찜하기 확인
	public List<Camp_wishlistDTO> selectwish(Map<String,String> param){
		return mybatis.selectList("Camp_info.selectwish",param);
	}
	
	//찜하기 취소
	public int wishdelete(int wish_seq){
		return mybatis.delete("Camp_info.wishdelete", wish_seq);
				
	}
	
	//검색 리스트
	public List<Camp_infoDTO> search(Map<String,String> param){
		return mybatis.selectList("Camp_info.listAll", param);
	}
	
	//캠핑장 번호 뽑기(이미지 데려오는 용)
	public List<Camp_infoDTO> contentIdlist(){
		return mybatis.selectList("Camp_info.contentidlist");
	}
	
	//이미지 데이터 파싱
	public int imageinsert(Camp_photoDTO dto) {
		return mybatis.insert("Camp_info.imageinsert", dto);
	}
	
	//메인 썸네일용 리스트
	public List<Camp_infoDTO> indexlist(){
		return mybatis.selectList("Camp_info.indexlist");
	}
}
