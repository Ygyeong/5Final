package kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import kh.spring.config.ReProductConfig;
import kh.spring.dto.RePicturesDTO;
import kh.spring.dto.ReProductDTO;
import kh.spring.dto.ReWishListDTO;
import kh.spring.service.ReProductService;

@Controller
@RequestMapping("/rep")
public class ReProductController {

	
	@Autowired
	private ReProductService service;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("loginProc")
	public String loginProc(String id, String pw) {
		
		int result= service.login(id,pw);
		
		if(result>0) {
			session.setAttribute("id",id);
		}
		return "redirect:/";
	}
	
	
	
	
	
	
	@RequestMapping("list")
	public String list(int index,Model m) {
		int endNum=index*ReProductConfig.RECORD_COUNT_PER_LIST;
		int startNum =endNum -(ReProductConfig.RECORD_COUNT_PER_LIST-1);
		List<ReProductDTO> list = service.Thumbnail(startNum,endNum);
		m.addAttribute("list",list);
		return "rep/list";
	}
	
	@RequestMapping("detail")
	public String detail(int rep_seq,Model m) {
		ReProductDTO dto = service.getDetail(rep_seq);
		RePicturesDTO pdto = service.getDetailP(rep_seq);
		int repCount = service.repCount(dto.getRep_writer());
		m.addAttribute("pdto",pdto);
		m.addAttribute("dto",dto);
		m.addAttribute("repCount",repCount);
		return "rep/detail";
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="scrollList",produces="text/html;charset=utf8")
	public String scrollList(int index) {
		int endNum=index*ReProductConfig.RECORD_COUNT_PER_LIST;
		int startNum =endNum -(ReProductConfig.RECORD_COUNT_PER_LIST-1);
		List<ReProductDTO> list = service.getAll(startNum,endNum);
		System.out.println(index);
		return new Gson().toJson(list);
	}
	
	
	@RequestMapping("write")
	public String detail() {
		return "rep/write";
	}
	
	@RequestMapping("insertProc")
	public String insertProc(ReProductDTO dto,MultipartFile[] file) throws Exception {
		int rep_seq = service.getSeq();
		
//		session.setAttribute("id", "kt478");
		dto.setRep_writer((String)session.getAttribute("id"));
		dto.setRep_seq(rep_seq);
		String realPath = session.getServletContext().getRealPath("/resources/imgs");
		System.out.println(realPath);
		service.insert(dto,rep_seq,file,realPath);
		return "redirect:/rep/list?index=1";
	}
	
	@RequestMapping("myJG")
	public String myJG(String id,Model m) {
		System.out.println(id);
			List<ReProductDTO> list = service.repList(id);
			int repCount = service.repCount(id);
			System.out.println(id +repCount+list);
			m.addAttribute("userID",id);
			m.addAttribute("list",list);
			m.addAttribute("Count",repCount);
		
		return "rep/myJG";
		
	}
	
	@RequestMapping("myWishList")
	public String myWishList(Model m) {
		String id = (String)session.getAttribute("id");
		List<ReProductDTO> list = service.myWishList(id);
		int wishCount = service.myWishCount(id);
		m.addAttribute("list",list);
		m.addAttribute("Count",wishCount);
		return "rep/myJG";
	}
	
	
	@ResponseBody
	@RequestMapping("wishInsert")
	public void wishInsert(ReWishListDTO wdto) {
//		session.setAttribute("id", "kt478");
		wdto.setRem_id((String)session.getAttribute("id"));
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
//		session.setAttribute("id", "kt478");
		wdto.setRem_id((String)session.getAttribute("id"));
		int result = service.wishExist(wdto);
		System.out.println(result);
		return new Gson().toJson(result);
		
	}
	
	
	@ExceptionHandler // 예외가 발생했을 때만,
	public String execeptionHandler(Exception e) {
		e.printStackTrace();
		return "error";
	}
	
}
