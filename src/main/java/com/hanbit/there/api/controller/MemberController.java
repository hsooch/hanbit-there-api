package com.hanbit.there.api.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.WebUtils;

import com.hanbit.there.api.HanbitConstatns;
import com.hanbit.there.api.service.MemberService;
import com.hanbit.there.api.vo.MemberVO;

@RestController
@RequestMapping("/api/member")
public class MemberController {
	
	// Logger 객체 생성
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService memberService;
	
	@PostMapping("/signup")
	public Map<Object, Object> signUp(@RequestParam("email") String email,
									  @RequestParam("password") String password) {
		
		MemberVO memberVO = new MemberVO();
		memberVO.setEmail(email);
		memberVO.setPassword(password);
		
		memberService.signUp(memberVO);
		
		Map<Object, Object> result = new HashMap<>();
		result.put("status", "ok");
		
		return result;
	}
	
	@PostMapping("/signin")
	public Map<Object, Object> signIn(@RequestParam("email") String email,
									  @RequestParam("password") String password,
									  @RequestParam("remember") boolean remember,
									  HttpSession session,				// session 에 아무값이나 담을 수 있다
									  HttpServletResponse response) {	// 쿠키를 주려면 이 객체가 있어야함
		
		MemberVO memberVO = memberService.signIn(email, password);
		
		logger.debug(memberVO.getEmail() + " has signed in.");
		
		if (remember) {
			Cookie cookie = new Cookie("rid", "1234");
			cookie.setMaxAge(600);
			response.addCookie(cookie);
		}
		
		// 세션 범위동안 이 값들을 가져다 쓸 수 있다
		session.setAttribute(HanbitConstatns.SIGNIN_KEY, true);
		session.setAttribute("uid", memberVO.getUid());
		session.setAttribute("email", memberVO.getEmail());
		
		Map<Object, Object> result = new HashMap<>();
		result.put("email", memberVO.getEmail());
		
		return result;
	}
	
	@RequestMapping("/get")
	public Map<Object, Object> getMember(HttpSession session) {
		
		Map<Object, Object> member = new HashMap<>();
		
		if (session.getAttribute(HanbitConstatns.SIGNIN_KEY) == null) {
			member.put(HanbitConstatns.SIGNIN_KEY, false);
		}
		else {
			member.put(HanbitConstatns.SIGNIN_KEY, true);
			member.put("email", session.getAttribute("email"));
		}
		
		return member;
	}
	
	@RequestMapping("/signout")
	public Map<Object, Object> signOut(HttpSession session,
									   HttpServletRequest request,	// 쿠키를 가져오려면
									   HttpServletResponse response) {
		
		session.invalidate();	// 비활성 = 로그아웃. 이 세션을 폐기함
		
		Cookie cookie = WebUtils.getCookie(request, "rid");
		
		if (cookie != null) {
			cookie.setValue(null);
			response.addCookie(cookie);
		}
		
		Map<Object, Object> result = new HashMap<>();
		result.put("status", "ok");
		
		return result;
	}
	
}
