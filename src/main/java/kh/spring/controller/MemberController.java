package kh.spring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
	
	@RequestMapping("myPage")
	public String myPage() {
		return "/member/myPage";
	}
	
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
	
	@RequestMapping("pwChange")
	public String pwChange() {
		return "/member/pwChange";
	}
	
	@RequestMapping("memberModify")
	public String memberModify(@RequestParam("cm_id") String cm_id,HttpServletRequest req) {
		HttpSession session = req.getSession();
		MemberDTO dto = new MemberDTO();
		dto.setCm_id(cm_id);
		MemberDTO modify = ms.login(dto);
		session.setAttribute("member", modify);
		return "/member/memberModify";
	}
	
	@RequestMapping("signProc")
	public String signProc(MemberDTO dto) throws Exception {
		
		String bcPass = BCrypt.hashpw(dto.getCm_pw(), BCrypt.gensalt());
		dto.setCm_pw(bcPass);
		ms.memberSign(dto);
		System.out.println("성공!");
		
		return "redirect:/";
	}
	
	@RequestMapping("loginProc")
	public String loginProc(@RequestParam("cm_id") String cm_id, @RequestParam("cm_pw") String cm_pw, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		HttpSession session = req.getSession();
		MemberDTO dto = new MemberDTO();	
		
			dto.setCm_id(cm_id);
			MemberDTO login = ms.login(dto);
			if(login != null) {
				System.out.println(login.getCm_pw());
				String hash_password = login.getCm_pw();
				System.out.println(login.getCm_id());
				if(BCrypt.checkpw(cm_pw, hash_password)) {
				session.setAttribute("loginID", login.getCm_id());
				} else {
				session.setAttribute("loginID", null);
				}
			}
		return "redirect:/";
	}
	
	@RequestMapping("logOutProc")
	public String logOutProc(HttpSession session, HttpServletResponse response) throws Exception {
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping("memberOutProc")
	public String memberOutProc(String cm_id, HttpSession session) throws Exception {
		ms.memberOut(cm_id);
		session.invalidate();
		return "index";
	}
	
	@RequestMapping("memberModifyProc")
	public String memberModifyProc(@RequestParam("") String cm_id,@RequestParam("cm_email") String cm_email,
			@RequestParam("cm_phone") String cm_phone, @RequestParam("cm_zipcode") String cm_zipcode,@RequestParam("cm_address1") String cm_address1, @RequestParam("cm_address2") String cm_address2)throws Exception{
		MemberDTO dto = new MemberDTO();
	
		dto.setCm_email(cm_email);
		dto.setCm_phone(cm_phone);
		dto.setCm_zipcode(cm_zipcode);
		dto.setCm_address1(cm_address1);
		dto.setCm_address2(cm_address2);
		dto.setCm_id(cm_id);
		ms.memberUpdate(dto);
		return "/member/myPage";
	}

	@ResponseBody
	@RequestMapping(value="idDuplCheck", method = RequestMethod.POST)
	public int idDuplCheck(String cm_id) throws Exception {
		int result = ms.idDuplCheck(cm_id);	
		return result;
	}
}
