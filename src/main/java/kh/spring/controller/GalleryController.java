package kh.spring.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.config.GalleryConfig;
import kh.spring.dao.CommentsDAO;
import kh.spring.dao.GalleryDAO;
import kh.spring.dao.Gallery_ImgDAO;
import kh.spring.dto.CommentsDTO;
import kh.spring.dto.GalleryDTO;
import kh.spring.dto.Gallery_ImgDTO;
import kh.spring.service.GalleryService;



@Controller
@RequestMapping("/gal")
public class GalleryController {

	@Autowired
	private GalleryService service;
		
	@Autowired
	private HttpSession session;
	
	@Autowired
	private Gallery_ImgDAO idao;
	
	@Autowired
	private GalleryDAO dao;
	
	@Autowired
	private CommentsDAO cdao;
	
	
	//수정화면 이동
		@RequestMapping("modifyForm")
		public String modifyForm(int seq,Model model) throws Exception {
			
			GalleryDTO list = service.search(seq);
			
			List<Gallery_ImgDTO> flist= idao.filesBySeq(seq);
			
			model.addAttribute("list",list);
			model.addAttribute("flist", flist);
			
			return "gallery/gallery_modify";
		}
		

		
		
		@RequestMapping("modifyProc")
		public String modify(@RequestParam(value="delete") String[] delete ,String title, String contents, MultipartFile[] file,int rating,int seq,Model model) throws Exception {
			
			String realPath = session.getServletContext().getRealPath("resources/aboutGallery/files");
			String [] delTargets = delete;
			System.out.println("modify delete :" +  delTargets);
			service.modify(title,contents,realPath,file,rating,seq,delTargets);

			System.out.println("modifyProc : "+seq);
			return "redirect:detail?seq="+seq;
		}
		
		
		
		
		@RequestMapping("delete")
		public String delete(int seq) throws Exception {
			System.out.println("삭제 요청 확인");
			service.delete(seq);
			return "redirect:list?cpage=1";
		}




		
	
		
		@RequestMapping("galleryWrite")
		public String galleryWrite() {
			return "gallery/gallery_write(new)";
		}
		
		
		
		@RequestMapping("writeProc")
		public String writeProc(String title, String contents, MultipartFile[] file,int rating) throws Exception{

			String realPath = session.getServletContext().getRealPath("resources/aboutGallery/files");
			
			service.insert(title,contents,realPath,file,rating); 
			
			
			return "redirect:list?cpage=1";
		}
		
		
		

		

		
		
		@RequestMapping("list")
		public String list(int cpage,String category,String keyword ,Model model) throws Exception {
			
			System.out.println("현재 페이지 : " + cpage);
			System.out.println("검색 분류 : "+ category);
			System.out.println("검색어 : "+ keyword);

			int endNum = cpage * GalleryConfig.RECORD_COUNT_PER_PAGE;
			int startNum = endNum - (GalleryConfig.RECORD_COUNT_PER_PAGE-1);

			
			
			Map<String,Object> param1 = new HashMap<>();
			param1.put("endNum", endNum);
			param1.put("startNum", startNum);
			
			
			
			Map<String,Object> param2 = new HashMap<>();
			param2.put("endNum", endNum);
			param2.put("startNum", startNum);
			param2.put("category", category);
			param2.put("keyword", keyword);
			
			Map<String,Object> param3 = new HashMap<>();
			
			param3.put("cpage", cpage);
			param3.put("category", category);
			param3.put("keyword", keyword);
		
			Map<String,Object> param4 = new HashMap<>();
			
		
			param4.put("category", category);
			param4.put("keyword", keyword);
			
			System.out.println(param1);

			List<GalleryDTO> list;

			if(keyword == null || keyword.contentEquals("")) {
				list = service.getPageList(param1);
			}else {
				list = service.getPageList2(param2);
			}
			
			
			List<String> pageNavi = dao.getPageNavi(cpage,param4);
			System.out.println(pageNavi);
			System.out.println(list);
			
			
			for(GalleryDTO gdto : list) {
				System.out.println("gdto seq:"+gdto.getSeq());
				
				Gallery_ImgDTO idto = idao.selectThumbBySeq(gdto.getSeq());
				gdto.setThumbPath(idto.getSysName());
			}

			model.addAttribute("list", list);
			model.addAttribute("navi", pageNavi);
			model.addAttribute("cpage", cpage);
			model.addAttribute("category", category);
			model.addAttribute("keyword", keyword);


			
			
			return "gallery/gallery_main";
		}
		
		
		@RequestMapping("mainList")
		@ResponseBody
		public List<GalleryDTO> list(int cpage ,Model model) throws Exception {
			
			System.out.println("현재 페이지 : " + cpage);
			
			int endNum = cpage * GalleryConfig.RECORD_COUNT_PER_PAGE;
			int startNum = endNum - (GalleryConfig.RECORD_COUNT_PER_PAGE-1);

			
			
			Map<String,Object> param = new HashMap<>();
			param.put("endNum", endNum);
			param.put("startNum", startNum);
			

			List<GalleryDTO> list = service.getPageList(param);
			
			
			
			for(GalleryDTO gdto : list) {
				System.out.println("gdto seq:"+gdto.getSeq());
				Gallery_ImgDTO idto = idao.selectThumbBySeq(gdto.getSeq());
				gdto.setThumbPath(idto.getSysName());
			}
		
			
			return list;
		}
		
		
		
		
		

		@RequestMapping("detail")
		public String detail(Model model,int seq, HttpServletResponse resp) throws Exception{
			
			
			System.out.println(seq);
			GalleryDTO dto = service.detail(seq);
			
			List<Gallery_ImgDTO> flist = idao.filesBySeq(seq);
			
			List<CommentsDTO> clist = cdao.list(seq);
			
			System.out.println(dto);
			System.out.println(flist);
			System.out.println("댓글 주소"+clist);

			
			model.addAttribute("list",dto);
			model.addAttribute("flist",flist);
			model.addAttribute("clist",clist);
			
			return "gallery/gallery_detail";
		}
		


		@ExceptionHandler 
		public String execeptionHandler(Exception e) {
			e.printStackTrace();
			return "error";
		}
	
	
}
