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
	
	
	public int repCount(String rep_writer) {
		return dao.repCount(rep_writer);
	}
	
//	사용자,myJG 페이지
	public List<ReProductDTO> myWishList(String rem_id){
		List<ReWishListDTO> wlist = wdao.myWishList(rem_id);
		List<ReProductDTO> list = new ArrayList<>();
		for(ReWishListDTO dto : wlist) {
			ReProductDTO rdto = dao.getDetail(dto.getRep_id());
			list.add(rdto);
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
	public int myWishCount(String rem_id) {
		return wdao.myWishCount(rem_id);
	}
	public List<ReProductDTO> repList(String rep_writer){
		List<ReProductDTO> list = dao.repList(rep_writer);
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




	
	
	
}


