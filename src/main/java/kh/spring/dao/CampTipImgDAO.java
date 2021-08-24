package kh.spring.dao;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import kh.spring.dto.CampTipImgDTO;
import kh.spring.dto.Gallery_ImgDTO;

@Repository
public class CampTipImgDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int filesInsert(CampTipImgDTO dto)throws Exception{
		return mybatis.insert("CampTipImg.filesInsert",dto);
	}
	
	public List<CampTipImgDTO> filesBySeq(int seq) throws Exception {
		return mybatis.selectList("CampTipImg.filesBySeq",seq);
	 
	}
	
	public CampTipImgDTO selectThumbBySeq(int seq)throws Exception{
		return mybatis.selectOne("CampTipImg.selectThumbBySeq",seq);
	}
	
	public String getSysName(int seq)throws Exception {
		System.out.println("DAO 타겟 :" + seq);
		return mybatis.selectOne("CampTipImg.getSysName",seq);
	}
	 
	public int fileDelete(int seq)throws Exception {
		System.out.println("삭제할 파일 " + seq);
		return mybatis.delete("CampTipImg.fileDelete",seq);
	}
	
}
