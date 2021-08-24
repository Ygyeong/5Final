package kh.spring.service;

import java.io.File;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.config.TimeConfig;
import kh.spring.dao.RePicturesDAO;
import kh.spring.dao.ReProductDAO;
import kh.spring.dao.ReWishListDAO;
import kh.spring.dto.RePicturesDTO;
import kh.spring.dto.ReProductDTO;
import kh.spring.dto.ReWishListDTO;

@Service
public class ReProductService {

	@Autowired
	private ReProductDAO dao;
	
	@Autowired
	private RePicturesDAO pdao;
	
	@Autowired
	private ReWishListDAO wdao;
	
	
//	로그인
	public int login(String id, int pw) {
		Map<String,Object> param = new HashMap<>();
		System.out.println(id+":"+pw);
		param.put("id",id);
		param.put("pw",pw);
		return dao.login(param);
		
	}
	
	
	
	
	@Transactional
	public void insert(ReProductDTO dto,int rep_seq,MultipartFile[] file,String realPath)throws Exception {
		DecimalFormat df = new DecimalFormat("#,###");
		dto.setRep_price(df.format(Integer.parseInt(dto.getRep_price())));
		dao.insert(dto);
		
		File filesPath = new File(realPath);
		if(!filesPath.exists()) { filesPath.mkdir(); }
		for(MultipartFile tmp : file) { 
				String oriName = tmp.getOriginalFilename();
				String sysName = UUID.randomUUID().toString().replaceAll("-", "")+"_"+oriName;
				
				System.out.println(oriName+" : "+sysName+" : "+rep_seq);
				
				if(pdao.insert(new RePicturesDTO(0,oriName,sysName,rep_seq))>0) {
					tmp.transferTo(new File(filesPath.getAbsolutePath()+"/"+sysName));
				
			}
		}
	}

	
	public List<RePicturesDTO> getPList(){
		return pdao.getPList();
	}
	public int delete(int seq) {
		return dao.delete(seq);
	}
	
	public List<ReProductDTO> getAll(int startNum,int endNum) {
		Map<String,Object> param = new HashMap<>();
		param.put("startNum",startNum);
		param.put("endNum",endNum);
		return dao.getList(param);
	}
	
	public ReProductDTO getDetail(int rep_seq) {
		ReProductDTO dto = dao.getDetail(rep_seq);
		String diffDate = TimeConfig.calculateTime(dto.getRep_write_date());
		 dto.setRep_diff_date(diffDate);
		return dto;
	}
	
	public List<RePicturesDTO> filesBySeq(int rep_seq) {
		
		return pdao.filesBySeq(rep_seq);
	}
	public int getSeq() {
		return dao.getSeq();
	}
	public RePicturesDTO selectThumbBySeq(int rep_seq) {
		return pdao.selectThumbBySeq(rep_seq);
	}
	
	public List<ReProductDTO> search (String keyword,int startNum,int endNum) {
		
		Map<String,Object> param = new HashMap<>();
		param.put("keyword", keyword);
		param.put("startNum",startNum);
		param.put("endNum",endNum);
		
		List<ReProductDTO> list = dao.search(param);
		for(ReProductDTO dto : list) {
			RePicturesDTO pdto = pdao.selectThumbBySeq(dto.getRep_seq());
			dto.setThumsysName(pdto.getReSysName());
			
			String diffDate = TimeConfig.calculateTime(dto.getRep_write_date());
			dto.setRep_diff_date(diffDate);
			
			if(dto.getRep_name().length()>14) {
				String subName = dto.getRep_name().substring(0, 14)+"...";
				dto.setRep_name(subName);
			}
		}
		return list;
	}
	public List<ReProductDTO> Thumbnail(int startNum,int endNum) {
		List<ReProductDTO> list = this.getAll(startNum,endNum);
		for(ReProductDTO dto : list) {
			RePicturesDTO pdto = pdao.selectThumbBySeq(dto.getRep_seq());
			dto.setThumsysName(pdto.getReSysName());
			
			String diffDate = TimeConfig.calculateTime(dto.getRep_write_date());
			dto.setRep_diff_date(diffDate);
			
			if(dto.getRep_name().length()>14) {
				String subName = dto.getRep_name().substring(0, 14)+"...";
				dto.setRep_name(subName);
			}
		}
		return list;
		
	}
	
	public void modify(String realPath,MultipartFile[] file,String [] delTargets,ReProductDTO dto) throws Exception {
		int seq = dto.getRep_seq();
		dao.update(dto);
		File filesPath = new File(realPath);

		if(delTargets != null) {
			for(String target : delTargets) {
				
				System.out.println("타켓 번호"+target);
				String sysName = pdao.getSysName(Integer.parseInt(target));
				File targetFile = new File(filesPath+"/"+sysName);
				boolean result = targetFile.delete();

     			if(result) {pdao.delete(Integer.parseInt(target));}


			}
		}

		for(MultipartFile tmp : file) {

			if(tmp.getSize() > 0) {
				String oriName = tmp.getOriginalFilename();
				String sysName = UUID.randomUUID().toString().replaceAll("-", "")+"_"+oriName;

				tmp.transferTo(new File(filesPath.getAbsolutePath()+"/"+sysName));

				if(oriName!=null) {
					System.out.println("파일 이름" + oriName +"DB에 저장됨.");
					pdao.insert(new RePicturesDTO(0,oriName, sysName,seq));
				}


			}

		}

	}
	public int saleInfo(int rep_stock,int rep_seq) {
		Map<String,Object> param = new HashMap<>();
		param.put("rep_stock", rep_stock);
		param.put("rep_seq",rep_seq);
		
		return dao.saleInfo(param);
	}
	public int repCount(String rep_writer) {
		return dao.repCount(rep_writer);
	}
	
//	사용자,myJG 페이지
	public List<ReProductDTO> myWishList(String rep_writer,int startNum,int endNum){
		Map<String,Object> param = new HashMap<>();
		param.put("rem_id", rep_writer);
		param.put("startNum",startNum);
		param.put("endNum",endNum);
		
		List<ReWishListDTO> wlist = wdao.myWishList(param);
		List<ReProductDTO> list = new ArrayList<>();
		for(ReWishListDTO dto : wlist) {
			ReProductDTO rdto = dao.getDetail(dto.getRep_id());
			list.add(rdto);
		}
		return list;
	}
	public int myWishCount(String rem_id) {
		return wdao.myWishCount(rem_id);
	}
	public List<ReProductDTO> repList(String rep_writer,int seq,int startNum,int endNum){
		List<ReProductDTO> list = new ArrayList<>();
		Map<String,Object> param = new HashMap<>();
		param.put("rep_writer", rep_writer);
		param.put("startNum",startNum);
		param.put("endNum",endNum);
		
		if(seq==1) {
			list= dao.repList1(param);
		}else if(seq==2) {
			list= this.myWishList(rep_writer,startNum,endNum);
		}else {
			 list = dao.repList2(param);
		}
		
		for(ReProductDTO dto : list) {
			RePicturesDTO pdto = pdao.selectThumbBySeq(dto.getRep_seq());
			dto.setThumsysName(pdto.getReSysName());
			
			String diffDate = TimeConfig.calculateTime(dto.getRep_write_date());
			dto.setRep_diff_date(diffDate);
			
			if(dto.getRep_name().length()>14) {
				String subName = dto.getRep_name().substring(0, 12)+"...";
				dto.setRep_name(subName);
			}
		}
		return list;
	}
	public int JGCount(String rep_writer,int seq) {
		int count;
		if(seq==1) {
			 count = dao.repCount1(rep_writer);
		}else if(seq==2) {
			count = this.myWishCount(rep_writer);
		}else {
			count =dao.repCount2(rep_writer);
		}
		
		return count;
	}
	
//	찜하기 기능
	public int wishInsert(ReWishListDTO dto) {
		return wdao.Insert(dto);
	}
	public int wishCount(int rep_seq) {
		return wdao.wishCount(rep_seq);
	}
	public int wishCancel(int rep_seq) {
		return wdao.wishCancel(rep_seq);
	}
	public int wishExist(ReWishListDTO dto) {
		return wdao.wishExist(dto);
	}
	
//	페이징
	
	public List<String> getPageNavi(int currentPage,String rep_writer,int seq) {
		int recordTotalCount =0;
		
		if(seq==1) {
			recordTotalCount = dao.repCount1(rep_writer);
		}else if(seq==2) {
			recordTotalCount = this.myWishCount(rep_writer);
		}else {
			recordTotalCount =dao.repCount2(rep_writer);
		}
		
		int recordCountPerpage = 10; // 한 페이지당 보여줄 게시글의 개수
		int naviCountPerPage =10; // 내 위치 페이지를 기준으로 시작부터 끝까지의 페이지가 총 몇개인지. 
		
		int pageTotalCount = 0;
		if(recordTotalCount%recordCountPerpage>0) {   // 총 몇개의 페이지로 구분되는지   
			pageTotalCount = recordTotalCount / recordCountPerpage + 1 ;
		}else {
			pageTotalCount = recordTotalCount / recordCountPerpage ;
		}
		
		//int currentPage; // 현재 위치하고있는 페이지 번호 ( 3페이지인지, 13페이지인지)
		
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


