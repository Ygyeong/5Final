package kh.spring.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.config.GalleryConfig;
import kh.spring.dto.GalleryDTO;




@Repository
public class GalleryDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Autowired
	private HttpSession session;

	// 수정
//	public int modify(GalleryDTO dto) {
//		return mybatis.update("Gallery.modify",dto);
//	}
	
	public int modify(Map<String,String> param) {
		
		return mybatis.update("Gallery.modify",param);
	}
	
	
	// 삭제
	public int delete(int seq) {
		return mybatis.delete("Gallery.delete", seq);
	}

	
	public int insert(Map<String,String> param) throws Exception{
//		String writer = (String) session.getAttribute("loginID");
		
		return mybatis.insert("Gallery.insert",param);
	}

	// 새로 작성한 글에 대한 seq ----------------------------------------------------
	public int getSeq() {
		
		return mybatis.selectOne("Gallery.getSeq");
	}

	// 게시판 내용 화면에 뿌리기 -----------------------------------------------------
	public GalleryDTO detail(int seq) throws Exception {
		
		return mybatis.selectOne("Gallery.detail",seq);
		
		
		

	}
	
	
	
	public GalleryDTO search(int seq) throws Exception{
		
		return mybatis.selectOne("Gallery.search",seq);
	}
	
	

	// 조회수 출력 ---------------------------------------------------------------
	public int view_count(int seq) {
		
		return mybatis.selectOne("Gallery.view_count",seq);

	}

	// xss 공격방어 --------------------------------------------------------------
	public String XSSFilter(String target) {
		if(target!=null){
			target = target.replaceAll("<","&lt;");   
			target = target.replaceAll(">","&gt;");      
			target = target.replaceAll("&","&amp;");      
		}
		return target;
	}

	// XSSFilter 역으로 다시 해서 화면에 뿌리기 ---------------------------------------
	public String ReXSSFilter(String target) {
		if(target!=null){
			target = target.replaceAll("&lt;","<");   
			target = target.replaceAll("&gt;",">");      
			target = target.replaceAll("&amp;","&");      
		}
		return target;
	}



	// Board List 화면에 뿌리기 ---------------------------------------
	public List<GalleryDTO> List() throws Exception{
		
		return mybatis.selectList("Gallery.selectAll");


	}

	//------------------ Paging --------------------------------------

	// 총 게시글 개수
	public int CountBoard() {
		
		return mybatis.selectOne("Gallery.CountBoard");
	}

	
	
	public int Rating() throws Exception{
		
		return mybatis.selectOne("Gallery.selectRating");


	}

	
	
	public List<GalleryDTO> getPageList(Map<String,Object> param1)throws Exception{
		
		return mybatis.selectList("Gallery.getPageList", param1);
	}
	
	public List<GalleryDTO> getPageList2(Map<String,Object> param2)throws Exception{
		
		return mybatis.selectList("Gallery.getPageList2", param2);
	}
	
	private int getRecordCount()throws Exception {
		
		return mybatis.selectOne("Gallery.getRecordCount");
		
		
	}

 	
 	private int getRecordCount2(Map<String,Object> param4)throws Exception {
 		
 		return mybatis.selectOne("Gallery.getRecordCount2",param4);
 	
	}
	
	
	public List<String> getPageNavi(int currentPage,Map<String,Object> param4)throws Exception{
		   
		
		  System.out.println("페이지 네비 : " + param4);
		
		  int recordTotalCount = 0; 
		  recordTotalCount =this.getRecordCount(); // record 총 개수 알아야함(몇개인지) / record는 한줄(한개)
		
		  if(param4.get("keyword") == null) {
				 recordTotalCount =this.getRecordCount(); // record 총 개수 알아야함(몇개인지) / record는 한줄(한개)
			 }else {
				 recordTotalCount =this.getRecordCount2(param4);
			 }
	     
	      int recordCountPerpage = GalleryConfig.RECORD_COUNT_PER_PAGE; // 한 페이지당 보여줄 게시글의 개수
	      int naviCountPerPage = GalleryConfig.NAVI_COUNT_PER_PAGE; // 내 위치 페이지를 기준으로 시작부터 끝까지의 페이지가 총 몇개인지. 
	      
	      int pageTotalCount = 0;
	      if(recordTotalCount%recordCountPerpage>0) {   // 총 몇개의 페이지로 구분되는지   
	         pageTotalCount = recordTotalCount / recordCountPerpage + 1;
	      }else {
	         pageTotalCount = recordTotalCount / recordCountPerpage ;
	      }
	      

	      
	      if(currentPage > pageTotalCount) {
	         currentPage= pageTotalCount;
	      }else if(currentPage <1) {
	         currentPage=1;
	      }
	      
	      
	      int startNavi = (currentPage-1) / naviCountPerPage * naviCountPerPage + 1;
	      int endNavi = startNavi + (naviCountPerPage -1);
	      if(endNavi > pageTotalCount) {endNavi = pageTotalCount;}
	      
	      boolean needPrev =true;
	      boolean needNext = true;
	      
	      if(startNavi == 1) {needPrev = false;}
	      if(endNavi == pageTotalCount) {needNext = false;}
	      
	      List<String> pageNavi = new ArrayList<>();
	      if(needPrev) {pageNavi.add("<");}
	      
	      for(int i= startNavi; i<=endNavi;i++) {
	         pageNavi.add(String.valueOf(i));
	      }
	      if(needNext) {pageNavi.add(">");}
	      return pageNavi;
	   }

	

}
