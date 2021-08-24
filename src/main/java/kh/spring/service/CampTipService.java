package kh.spring.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import kh.spring.dao.CampTipDAO;
import kh.spring.dao.CampTipImgDAO;
import kh.spring.dto.CampTipDTO;
import kh.spring.dto.CampTipImgDTO;

@Service
public class CampTipService {

	@Autowired
	private CampTipDAO dao;
	
	@Autowired
	private CampTipImgDAO fdao;
	
	@Autowired
	private HttpSession session;
	
	public void insert(int category, String title,String contents,String realPath, MultipartFile[] file) throws Exception {
		String writer = (String)session.getAttribute("loginID");
		System.out.println("캠핑팁 작성자 : " + writer);
		Map<String,String> param = new HashMap<>();
		param.put("category", category+"");
		param.put("writer", writer);
		param.put("title", title);
		param.put("contents", contents);
		
		dao.insert(param);
		
		System.out.println(realPath);

		File filesPath = new File(realPath);
		if(!filesPath.exists()) {
			filesPath.mkdir();
		}

		for(MultipartFile tmp : file) {

			int seq = dao.getSeq();
			if(tmp.getSize() > 0) {
				String oriName = tmp.getOriginalFilename();
				String sysName = UUID.randomUUID().toString().replaceAll("-", "")+"_"+oriName;


				tmp.transferTo(new File(filesPath.getAbsolutePath()+"/"+sysName));
				
				CampTipImgDTO fdto = new CampTipImgDTO(0,oriName, sysName,seq);

				if(oriName!=null) {
					System.out.println("파일 이름" + oriName +"DB에 저장됨.");
					fdao.filesInsert(fdto);
				}
			}
		}
	}
	
	public List<CampTipDTO> listAll(int start, int end, String searchOption, String keyword) throws Exception {
		return dao.listAll(start, end, searchOption, keyword);
	}
	
	public CampTipDTO read(int camp_tip_num) throws Exception {
		return dao.read(camp_tip_num);
	}
	
	public int viewCount(int camp_tip_num) throws Exception {
		return dao.viewCount(camp_tip_num);
	}
	
	public int delete(int delNum) throws Exception {
		return dao.delete(delNum);
	}

	public void modify(String [] delTargets,int category, String title,String contents,String realPath, MultipartFile[] file,int camp_tip_num)throws Exception {
		System.out.println("여기까지 넘어오나?");
		Map<String,String> param = new HashMap<>();
		param.put("category", String.valueOf(category));
		param.put("camp_tip_num", String.valueOf(camp_tip_num));
		param.put("title", title);
		param.put("contents", contents);
		
		System.out.println("modify : " + category);
		System.out.println("modify : " + camp_tip_num);
		System.out.println("modify : " + title);
		System.out.println("modify : " + contents);
		dao.modify(param);

		File filesPath = new File(realPath);

		if(delTargets != null) {
			for(String target : delTargets) {
				System.out.println("타켓 번호"+target);
				String sysName = fdao.getSysName(Integer.parseInt(target));
				File targetFile = new File(filesPath+"/"+sysName);
				boolean result = targetFile.delete();
			
     			if(result) {fdao.fileDelete(Integer.parseInt(target));}
			}
		}

		for(MultipartFile tmp : file) {
			if(tmp.getSize() > 0) {
				String oriName = tmp.getOriginalFilename();
				String sysName = UUID.randomUUID().toString().replaceAll("-", "")+"_"+oriName;
				tmp.transferTo(new File(filesPath.getAbsolutePath()+"/"+sysName));
				CampTipImgDTO fdto = new CampTipImgDTO(0,oriName, sysName,camp_tip_num);

				if(oriName!=null) {
					System.out.println("파일 이름" + oriName +"DB에 저장됨.");
					fdao.filesInsert(fdto);
				}
			}
		}
	}
	
//	public int modify(CampTipDTO dto)throws Exception {
//		return dao.modify(dto);
//	}
	
	public int countArticle(String searchOption, String keyword) throws Exception {
	    return dao.countArticle(searchOption, keyword);
	}
	
	public CampTipDTO search(int camp_tip_num) throws Exception {
		return dao.search(camp_tip_num);
	}

	
}
