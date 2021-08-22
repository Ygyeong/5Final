package kh.spring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.ReCommentsDAO;
import kh.spring.dto.ReCommentsDTO;

@Service
public class ReCommentService {

	@Autowired
	private ReCommentsDAO cdao;
	
//	댓글기능
	public int cmtInsert(ReCommentsDTO dto) {
		return cdao.insert(dto);
	}
	public List<ReCommentsDTO> getAll(int recmt_rep_seq){
		return cdao.getAll(recmt_rep_seq);
	}
	public int cmtDelete(int recmt_seq) {
		return cdao.delete(recmt_seq);
	}
	public int getSeq() {
		return cdao.getSeq();
	}
	public ReCommentsDTO getCmt(int recmt_seq){
		return cdao.getCmt(recmt_seq);
	}
	public int update(String recmt_comments,int recmt_seq) {
		Map<String,Object> param = new HashMap<>();
		param.put("recmt_comments",recmt_comments);
		param.put("recmt_seq",recmt_seq);
		return cdao.update(param);
	}
	public List<ReCommentsDTO> getWriter(int recmt_rep_seq){
		return cdao.getWriter(recmt_rep_seq);
	}
	
	
}
