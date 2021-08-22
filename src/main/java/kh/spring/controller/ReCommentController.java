package kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kh.spring.dto.ReCommentsDTO;
import kh.spring.service.ReCommentService;

@Controller
@RequestMapping("/recmt")
public class ReCommentController {

	@Autowired
	private ReCommentService service;
	
	@Autowired
	private HttpSession session;
	
	@ResponseBody
	@RequestMapping("insertProc")
	public String insertProc(ReCommentsDTO dto) {
		int seq = service.getSeq();
		System.out.println(dto.getRecmt_rep_seq()+":"+dto.getRecmt_comments());
		dto.setRecmt_seq(seq);
		dto.setRecmt_writer((String)session.getAttribute("id"));
		service.cmtInsert(dto);
		ReCommentsDTO cmt = service.getCmt(seq);
		
		return new Gson().toJson(cmt);
	}
	
	@ResponseBody
	@RequestMapping("list")
	public String list(int rep_seq) {
		List<ReCommentsDTO> clist = service.getAll(rep_seq);
		return new Gson().toJson(clist);
	}
	
	@ResponseBody
	@RequestMapping("delete")
	public String delete(int recmt_seq) {
		System.out.println("댓글삭제");
		service.cmtDelete(recmt_seq);
		return new Gson().toJson(recmt_seq);
	}
	
	@ResponseBody
	@RequestMapping("update")
	public void update(String recmt_comments,int recmt_seq) {
		System.out.println(recmt_comments+recmt_seq);
		service.update(recmt_comments, recmt_seq);
	}
}
