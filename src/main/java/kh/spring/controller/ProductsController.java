package kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.google.gson.Gson;

import kh.spring.config.ReProductConfig;
import kh.spring.dto.ProductsDTO;

import kh.spring.dto.SummerDTO;
import kh.spring.service.ProductsService;

@Controller
@RequestMapping("/products")
public class ProductsController {

	@Autowired
	private HttpSession session;

	@Autowired
	private ProductsService service;

	@RequestMapping("write")
	public String boardWritePage() {
		return "admin/productsInsert";
	}

	@RequestMapping("insert") // 상품등록
	public String insert(ProductsDTO dto,MultipartFile[] file) throws Exception {
		
		int p_seq = service.getP_seq();
		dto.setCamp_id((String)session.getAttribute("loginID"));
		dto.setP_seq(p_seq);
		String realPath = session.getServletContext().getRealPath("/resources/imgs");
		service.insert(dto,p_seq,file,realPath);
		return "redirect:/products/selectAll?index=1";
	}

	@RequestMapping("selectAll") // 상품목록
	public String selectAll(int index, Model model) {
		// view의 이름과 service에서 가져온 list 반환
		int endNum=index*ReProductConfig.RECORD_COUNT_PER_LIST;
		int startNum =endNum -(ReProductConfig.RECORD_COUNT_PER_LIST-1);
		List<ProductsDTO> list = service.Thumbnail(startNum,endNum);
		model.addAttribute("list",list);

		return "shop/productsList";
	}

	@RequestMapping("detail") // 상품상세
	public String detail(int p_seq, Model model) {
		ProductsDTO dto = service.detail(p_seq);
		List<SummerDTO> slist = service.filesBySeq(p_seq);
		SummerDTO sdto = service.selectThumBySeq(dto.getP_seq());
		model.addAttribute("slist",slist);
		model.addAttribute("sdto",sdto);
		model.addAttribute("dto",dto);
		return "shop/productsDetail";
	}
	
	@RequestMapping("delete")
	public String delete(int p_seq) {
		service.delete(p_seq);
		return "redirect:products?index=1";
	} 
//	@RequestMapping("modify")
//	public String update(int p_seq,Model model) {
//		System.out.println("수정페이지");
//		ProductsDTO dto = service.detail(p_seq);
//		List<SummerDTO> sdto = service.filesBySeq(p_seq);
//		model.addAttribute("sdto",sdto);
//		model.addAttribute("dto",dto);
//		return "shop/productsModify";
//	} 
	
	
	@ResponseBody
	@RequestMapping(value="scrollList",produces="text/html;charset=utf8")
	public String scrollList(int index) {
		int endNum=index*ReProductConfig.RECORD_COUNT_PER_LIST;
		int startNum =endNum -(ReProductConfig.RECORD_COUNT_PER_LIST-1);
		List<ProductsDTO> list = service.selectAll(startNum, endNum);
		System.out.println(index);
		return new Gson().toJson(list);
	}

}
