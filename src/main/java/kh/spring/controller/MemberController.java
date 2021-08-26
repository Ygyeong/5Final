package kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.spring.dto.Camp_wishlistDTO;
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
	public String myPage(@RequestParam("cm_id") String cm_id, HttpServletRequest req) throws Exception {
		HttpSession session = req.getSession();
		ScheduleDTO dto = new ScheduleDTO();

		dto.setCm_id(cm_id);
		int result = ms.wishCount(cm_id);
		List<ScheduleDTO> show = ss.showSchedule(dto);
		session.setAttribute("wish", result);
		session.setAttribute("list", show);
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
		BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder();
		System.out.println(dto.getCm_pw());
		String password = scpwd.encode(dto.getCm_pw());
		dto.setCm_pw(password);
		ms.memberSign(dto);
		return "redirect:/";
	}

	@RequestMapping("loginProc")
	public String loginProc(@RequestParam("cm_id") String cm_id, @RequestParam("cm_pw") String cm_pw, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		HttpSession session = req.getSession();

			MemberDTO login = ms.login(cm_id);
			if(login.getCm_id() != null) {
				String hash_password = login.getCm_pw();

				
				if(BCrypt.checkpw(cm_pw, hash_password) == true) {

				session.setAttribute("loginID", login.getCm_id());

				} else {
					session.setAttribute("loginID", null);
					return "/member/login";
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
		return "redirect:/";
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
	public String memberModifyProc(MemberDTO dto, HttpSession session)throws Exception{
		BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder();
		System.out.println(dto.getCm_pw());
		String password = scpwd.encode(dto.getCm_pw());
		dto.setCm_pw(password);
		dto.setCm_id(dto.getCm_id());
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
	
	@RequestMapping("wishlist")
	public String wishListSelectAll(@RequestParam("cm_id") String cm_id,HttpServletRequest req) {
		HttpSession session = req.getSession();
		Camp_wishlistDTO dto = new Camp_wishlistDTO();

		dto.setCm_id(cm_id);
		List<Camp_wishlistDTO> wish = ms.wishListSelectAll(dto);
		session.setAttribute("list", wish);
		return "/member/wishPopup";
	}
}
