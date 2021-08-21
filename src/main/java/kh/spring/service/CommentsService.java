package kh.spring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.CommentsDAO;
import kh.spring.dto.CommentsDTO;


@Service
public class CommentsService {
	
	@Autowired
	private CommentsDAO dao;
	
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private HttpSession session;
	
	public void insert(String comments,int gallery_seq) throws Exception {

		
		String writer = (String) session.getAttribute("loginID");
		System.out.println(writer);
		Map<String,String> param = new HashMap<>();
		
		param.put("writer", writer);
		param.put("seq", String.valueOf(gallery_seq));
		param.put("comments", comments);
		
		
		dao.insert(param);
	
	}
	
	
	public int update(String comments,int seq) throws Exception {
		
		
		
		System.out.println("service : "+seq);
		Map<String,Object> param = new HashMap<>();
		param.put("comments", comments);
		param.put("seq", seq);
		
		return dao.update(param);
	}

	public int delete(int seq) throws Exception {
		
		System.out.println("delete service : " + seq);
		
		return dao.delete(seq);
	}
	
	
	public List<CommentsDTO> list(int seq)throws Exception{
		return dao.list(seq); 
	}
}
