package kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import kh.spring.config.ReProductConfig;
import kh.spring.dto.MemberDTO;
import kh.spring.dto.ReCommentsDTO;
import kh.spring.dto.RePicturesDTO;
import kh.spring.dto.ReProductDTO;
import kh.spring.dto.ReWishListDTO;
import kh.spring.service.MemberService;
import kh.spring.service.ReCommentService;
import kh.spring.service.ReProductService;

@Controller
@RequestMapping("/rep")
public class ReProductController {

	
	@Autowired
	private ReProductService service;
	
	@Autowired
	private ReCommentService cservice;
	
	@Autowired
	private MemberService mservice;
	
	@Autowired
	private HttpSession session;
	
	
	
	
	
	@RequestMapping("list")

	public String list(int index,String keyword,Model m) {
		int endNum=index*ReProductConfig.RECORD_COUNT_PER_LIST;
		int startNum =endNum -(ReProductConfig.RECORD_COUNT_PER_LIST-1);
		System.out.println(startNum);
		System.out.println(keyword);
		if(keyword == null || keyword.contentEquals("")) {
			List<ReProductDTO> list = service.Thumbnail(startNum,endNum);
			m.addAttribute("list",list);
		}else {
			List<ReProductDTO> list = service.search(keyword,startNum,endNum);
			int listsize = list.size();
			int total = (int)Math.ceil(listsize/(double)ReProductConfig.RECORD_COUNT_PER_LIST);
			m.addAttribute("list",list);
			m.addAttribute("keyword",keyword);
			m.addAttribute("count",listsize);
		}
		return "rep/list";
	}
	
	@RequestMapping("detail")
	public String detail(int rep_seq,Model m) {
		System.out.println(rep_seq);
		ReProductDTO dto = service.getDetail(rep_seq);
		List<RePicturesDTO> plist = service.filesBySeq(rep_seq);
		RePicturesDTO pdto = service.selectThumbBySeq(dto.getRep_seq());
		List<ReProductDTO> list = service.repList(dto.getRep_writer(),1,1,2);
		int repCount = service.repCount(dto.getRep_writer());
		List<ReCommentsDTO> cdto = cservice.getWriter(rep_seq);
		m.addAttribute("plist",plist);
		m.addAttribute("list",list);
		m.addAttribute("dto",dto);
		m.addAttribute("cdto",cdto);
		m.addAttribute("pdto",pdto);
		m.addAttribute("repCount",repCount);
		return "rep/detail";
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="scrollList",produces="text/html;charset=utf8")
	public String scrollList(int index) {
		System.out.println("검색어 없을 때 인덱스 :"+index);
		int endNum=index*ReProductConfig.RECORD_COUNT_PER_LIST;
		int startNum =endNum -(ReProductConfig.RECORD_COUNT_PER_LIST-1);
		List<ReProductDTO> list = service.Thumbnail(startNum,endNum);
		System.out.println("스크롤 인덱스 : "+index);
		return new Gson().toJson(list);
	}
	@ResponseBody
	@RequestMapping(value="scrollSearchList",produces="text/html;charset=utf8")
	public String scrollSearchList(int index,String keyword) {
		System.out.println("검색어 있을 때 인덱스 :"+index);
		int endNum=index*ReProductConfig.RECORD_COUNT_PER_LIST;
		int startNum =endNum -(ReProductConfig.RECORD_COUNT_PER_LIST-1);
		List<ReProductDTO> list = service.search(keyword, startNum, endNum);
		System.out.println("검색 스크롤 결과 :"+list);
		System.out.println("사이즈 : "+list.size());
		return new Gson().toJson(list);
	}
	
	
	@RequestMapping("write")
	public String detail() {
		return "rep/write";
	}
	
	
	@RequestMapping("insertProc")
	public String insertProc(ReProductDTO dto,MultipartFile[] file) throws Exception {
		int rep_seq = service.getSeq();
		System.out.println("세션 :"+session.getAttribute("loginID"));

		dto.setRep_writer((String)session.getAttribute("loginID"));
		dto.setRep_seq(rep_seq);
		String realPath = session.getServletContext().getRealPath("resources/imgs");

		System.out.println(realPath);
		service.insert(dto,rep_seq,file,realPath);
		return "redirect:/rep/list?index=1";
	}
	
	@RequestMapping("myJG")
	public String myJG(String id,int seq,int index,Model m){
		MemberDTO mdto = mservice.login(id);
		int endNum=index*ReProductConfig.RECORD_COUNT_PER_LIST;
		int startNum =endNum -(ReProductConfig.RECORD_COUNT_PER_LIST-1);
		
			List<ReProductDTO> list = service.repList(id,seq,startNum,endNum);
			int repCount = service.JGCount(id,seq);
			int totalCount = service.repCount(id);
			List<String> pageNavi = service.getPageNavi(index,id,seq);
			System.out.println(pageNavi);
			m.addAttribute("mdto",mdto);
			m.addAttribute("userID",id);
			m.addAttribute("list",list);
			m.addAttribute("navi",pageNavi);
			m.addAttribute("index",index);
			m.addAttribute("Count",repCount);
			m.addAttribute("totalCount",totalCount);
			m.addAttribute("seq",seq);
		
		return "rep/myJG";
		
	}
	
	
	
	
	
	
//	@RequestMapping("myWishList")
//	public String myWishList(Model m) {
//		String id = (String)session.getAttribute("loginID");
//		List<ReProductDTO> list = service.myWishList(id);
//		int wishCount = service.myWishCount(id);
//		m.addAttribute("list",list);
//		m.addAttribute("Count",wishCount);
//		return "rep/myJG";
//	}
	
	
	@ResponseBody
	@RequestMapping("wishInsert")
	public void wishInsert(ReWishListDTO wdto) {
//		session.setAttribute("id", "kt478");
		wdto.setRem_id((String)session.getAttribute("loginID"));
		System.out.println("찜하기 기능");
		System.out.println(wdto.getRem_id()+" : "+wdto.getRep_id()+" : "+wdto.getRew_id());
		service.wishInsert(wdto);
		System.out.println(wdto);
	}
	
	@ResponseBody
	@RequestMapping("wishCancel")
	public void wishCancel(int rep_seq) {
		service.wishCancel(rep_seq);
	}
	
	@ResponseBody
	@RequestMapping("wishCount")
	public String wishCount(int rep_seq) {
		int count = service.wishCount(rep_seq);
		return new Gson().toJson(count);
	}
	
	@ResponseBody
	@RequestMapping("wishExist")
	public String wishExist(ReWishListDTO wdto) {
		wdto.setRem_id((String)session.getAttribute("loginID"));
		int result = service.wishExist(wdto);
		System.out.println(result);
		return new Gson().toJson(result);
		
	}
	
	
//	게시글 수정,삭제
	@RequestMapping("delete")
	public String delete(int rep_seq) {
		service.delete(rep_seq);
		return "redirect:list?index=1";
	} 
	@RequestMapping("update")
	public String update(int rep_seq,Model m) {
		System.out.println("수정페이지");
		ReProductDTO dto = service.getDetail(rep_seq);
		List<RePicturesDTO> pdto = service.filesBySeq(rep_seq);
		m.addAttribute("pdto",pdto);
		m.addAttribute("dto",dto);
		return "rep/update";
	} 
	@RequestMapping("updateProc")
	public String updateProc(@RequestParam(value="delete") String[] delete , MultipartFile[] file,ReProductDTO dto,Model m)throws Exception {
		String realPath = session.getServletContext().getRealPath("/resources/imgs");
		String [] delTargets = delete;
		System.out.println("modify delete :" +  delTargets);
		service.modify(realPath,file,delTargets,dto);
		return "redirect:list?index=1";
	} 
	
	@RequestMapping("saleInfo")
	public String saleInfo(int rep_stock,int rep_seq) {
		service.saleInfo(rep_stock, rep_seq);
		return "redirect:list?index=1";
	}
	
	@ExceptionHandler // 예외가 발생했을 때만,
	public String execeptionHandler(Exception e) {
		e.printStackTrace();
		return "error";
	}
	
}
