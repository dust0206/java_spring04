package com.example.spring04.controller.member;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.spring04.model.member.AdminDAO;
import com.example.spring04.model.member.MemberDTO;

@Controller
@RequestMapping("/admin/*")		// 공통적인 url pattern
public class AdminController {
	
	@Inject
	AdminDAO adminDao;
	
	@RequestMapping("login.do")
	public String login() {
		return "admin/login";	// views/admin/login.jsp
	}
	
	@RequestMapping("login_check.do")	// 세부적인 url
	public ModelAndView login_check(MemberDTO dto, HttpSession session, ModelAndView mav) {
		String name = adminDao.login(dto);
		if(name != null) {	//로그인 성공
			// 세션에 변수 저장
			session.setAttribute("admin_userid", dto.getUserid());
			session.setAttribute("admin_name", name);
			session.setAttribute("userid", dto.getUserid());
			session.setAttribute("name", name);
			mav.setViewName("admin/login");		// 페이지 이름
			mav.addObject("message", "success");	// 자료 저장
		} else {	// 로그인 실패
			mav.setViewName("admin/login");
			mav.addObject("message", "error");
		}
		
		return mav;
	}
	@RequestMapping("login_check1.do")
	public String log_check_1(MemberDTO dto, HttpSession session, Model model) {
		String name = adminDao.login(dto);
		if(name != null) {	//로그인 성공
			// 세션에 변수 저장
			session.setAttribute("admin_userid", dto.getUserid());
			session.setAttribute("admin_name", name);
			session.setAttribute("userid", dto.getUserid());
			session.setAttribute("name", name);
			model.addAttribute("message", "success");	// 자료 저장
		} else {	// 로그인 실패
			model.addAttribute("message","error");
		}
		
		return "admin/login";
	}
	
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();	// 세션 클리어
		return "redirect:/admin/login.do";
	}
	
	
}
