package kh.spring.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

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
import kh.spring.dto.ScheduleDTO;
import kh.spring.service.MemberService;
import kh.spring.service.ScheduleService;


@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	public MemberService ms;
	@Autowired
	public ScheduleService ss;
	
	@RequestMapping("myPage")
	public String myPage(@RequestParam("cm_id") String cm_id, HttpServletRequest req, Locale locale) throws Exception {
		HttpSession session = req.getSession();
		Date date = new Date();
		ScheduleDTO dto = new ScheduleDTO();
		
		SimpleDateFormat SDFAdd = new SimpleDateFormat("yyyy.MM.dd.");
		String toDayFormatAdd = SDFAdd.format(date);

		dto.setCm_id(cm_id);
		List<ScheduleDTO> show = ss.showSchedule(dto);
		session.setAttribute("list", show);
		session.setAttribute("today", toDayFormatAdd);
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
	
	@RequestMapping("idCheck")
	public String emailCheckPage() {
		return "/member/idCheck";
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
		MemberDTO modify = ms.modifySelect(dto);
		session.setAttribute("member", modify);
		return "/member/memberModify";
	}
	
	@RequestMapping("signProc")
	public String signProc(MemberDTO dto) throws Exception {
		
		String bcPass = BCrypt.hashpw(dto.getCm_pw(), BCrypt.gensalt());
		dto.setCm_pw(bcPass);
		ms.memberSign(dto);
		
		return "redirect:/";
	}
	
	@RequestMapping("loginProc")
	public String loginProc(@RequestParam("cm_id") String cm_id, @RequestParam("cm_pw") String cm_pw, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		HttpSession session = req.getSession();
			System.out.println(cm_id);
			System.out.println(cm_pw);
			MemberDTO login = ms.login(cm_id);
			System.out.println(login);
			if(login.getCm_id() != null) {
				String hash_password = login.getCm_pw();
				System.out.println(login.getCm_id());
				if(BCrypt.checkpw(cm_pw, hash_password)) {
				System.out.println(hash_password);
				boolean isAuthenticated = BCrypt.checkpw(cm_pw, hash_password);
				if(isAuthenticated) {
				session.setAttribute("loginID", login.getCm_id());
				} else {
				session.setAttribute("loginID", null);
				return "/member/login";
				}
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
	
	@RequestMapping("pwModifyProc")
	public String memberModifyProc(@RequestParam("cm_id") String cm_id, @RequestParam("cm_pw") String cm_pw, HttpSession session)throws Exception{
		MemberDTO dto = new MemberDTO();
		System.out.println(cm_id);
		System.out.println(cm_pw);
		String bcPass = BCrypt.hashpw(dto.getCm_pw(), BCrypt.gensalt());
		System.out.println(bcPass);
		dto.setCm_pw(bcPass);
		dto.setCm_id(cm_id);
		ms.pwUpdate(dto);
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("pwIdDuplCheck")
	public String pwIdDuplCheck(String cm_id, HttpSession session, HttpServletResponse response) throws Exception {
		int result = ms.idDuplCheck(cm_id);
		if(result > 0) {
			session.setAttribute("member", cm_id);
			return "/member/idCheckResult";
		}else {
			return "/member/login";
		}
	}

	@ResponseBody
	@RequestMapping(value="idDuplCheck", method = RequestMethod.POST)
	public int idDuplCheck(String cm_id) throws Exception {
		int result = ms.idDuplCheck(cm_id);	
		return result;
	}
}
