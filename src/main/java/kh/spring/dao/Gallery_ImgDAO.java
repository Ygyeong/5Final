package kh.spring.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.Gallery_ImgDTO;

@Repository
public class Gallery_ImgDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	public int filesInsert(Gallery_ImgDTO dto)throws Exception{
		
		return mybatis.insert("Gallery_Img.filesInsert",dto);
		
		}
	
	public List<Gallery_ImgDTO> filesBySeq(int seq) throws Exception {

		return mybatis.selectList("Gallery_Img.filesBySeq",seq);
	 
	}
	
	public Gallery_ImgDTO selectThumbBySeq(int seq)throws Exception{
		return mybatis.selectOne("Gallery_Img.selectThumbBySeq",seq);
	}
	
	public  String getSysName(int seq)throws Exception {
			
		System.out.println("DAO 타겟 :" + seq);
		return mybatis.selectOne("Gallery_Img.getSysName",seq);
	}
	 
	public int fileDelete(int seq)throws Exception {
		
		return mybatis.selectOne("Gallery_Img.fileDelete",seq);
		
	}
	
}
