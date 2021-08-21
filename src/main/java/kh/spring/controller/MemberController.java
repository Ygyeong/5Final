package kh.spring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.spring.dto.MemberDTO;
import kh.spring.service.MemberService;


@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	public MemberService ms;
	
	@RequestMapping("loginPage")
	public String loginPage() {
		return "/member/login";
	}
	
	@RequestMapping("signPage")
	public String signPage() {
		return "/member/signUp";
	}
	
	@RequestMapping("emailCheck")
	public String emailCheckPage() {
		return "/member/emailCheck";
	}
	
	@RequestMapping("signProc")
	public String signProc(MemberDTO dto) throws Exception {
		
		String bcPass = BCrypt.hashpw(dto.getCm_pw(), BCrypt.gensalt());
		dto.setCm_pw(bcPass);
		ms.memberSign(dto);
		System.out.println("성공!");
		
		return "home";
	}
	
	@RequestMapping("loginProc")
	public String loginProc(@RequestParam("cm_id") String cm_id, @RequestParam("cm_pw") String cm_pw, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		HttpSession session = req.getSession();
		MemberDTO dto = new MemberDTO();
		String passwordHashed = BCrypt.hashpw(dto.getCm_pw(), BCrypt.gensalt());
		boolean bcPass = BCrypt.checkpw(dto.getCm_pw(), passwordHashed);
		
		if(bcPass == true) {
			dto.setCm_id(cm_id);
			MemberDTO login = ms.login(dto);
			if(login != null) {
				session.setAttribute("member", login);
				System.out.println("성공");
			}
			session.setAttribute("member", login);
			System.out.println("성공");
		} else {
			session.setAttribute("member", null);
			System.out.println("실패ㅠ;");
		}
		
		return "redirect:/";
	}

	@ResponseBody
	@RequestMapping(value="idDuplCheck", method = RequestMethod.POST)
	public int idDuplCheck(String cm_id) throws Exception {
		int result = ms.idDuplCheck(cm_id);	
		return result;
	}
}
