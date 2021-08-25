package kh.spring.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kh.spring.config.AdminConfig;
import kh.spring.dto.Camp_infoDTO;
import kh.spring.dto.MemberDTO;


@Component
public class AdminDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	//캠핑 정보 넣기
	public int campinsert(Camp_infoDTO dto) {
		return mybatis.insert("Admin.campinsert", dto);
	}



	public List<MemberDTO> getPageList(Map<String,Object> param1)throws Exception{

		return mybatis.selectList("Admin.getPageList", param1);
	}

	public List<MemberDTO> getPageList2(Map<String,Object> param2)throws Exception{

		return mybatis.selectList("Admin.getPageList2", param2);
	}




















	private int getRecordCount()throws Exception {

		return mybatis.selectOne("Admin.getRecordCount");


	}


	private int getRecordCount2(Map<String,Object> param4)throws Exception {

		return mybatis.selectOne("Admin.getRecordCount2",param4);

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

		int recordCountPerpage = AdminConfig.RECORD_COUNT_PER_PAGE; // 한 페이지당 보여줄 게시글의 개수
		int naviCountPerPage = AdminConfig.NAVI_COUNT_PER_PAGE; // 내 위치 페이지를 기준으로 시작부터 끝까지의 페이지가 총 몇개인지. 

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


