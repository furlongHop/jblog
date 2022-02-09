package com.javaex.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javaex.service.UserService;
import com.javaex.vo.UserVo;

@RequestMapping(value = "/user", method = { RequestMethod.GET, RequestMethod.POST })
@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	
	//회원가입 폼
	@RequestMapping(value="/joinForm")
	public String joinForm() {
		System.out.println("UserController/joinForm()");
		
		return "user/joinForm";
	}
	
	//회원가입
	@RequestMapping(value="/join")
	public String join(@ModelAttribute UserVo userVo) {
		System.out.println("UserController/join()");
		
		userService.join(userVo);
		
		return "user/joinSuccess";
	}	
	
	//로그인 폼
	@RequestMapping(value="/loginForm")
	public String loginForm() {
		System.out.println("UserController/loginForm()");
		
		return "user/loginForm";
	}
	
	//로그인
	@RequestMapping(value="/login")
	public String login(@ModelAttribute UserVo userVo, HttpSession session, Model model) {
		System.out.println("UserController/login()");
		
		UserVo authUser = userService.login(userVo);
		System.out.println(authUser);

		if (authUser != null) {// 로그인 성공
			System.out.println("로그인 성공");

			// 세션 주소를 받아 세션 어트리뷰트에 로그인한 유저 정보 저장
			session.setAttribute("authUser", authUser);
		
			// 메인으로 리다이렉트
			return "redirect:/";
		} else {// 로그인 실패
			
			// 로그인 폼으로 리다이렉트
			return "redirect:/user/loginForm?result=fail";
		}
		
	}
	
	//로그아웃
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) {
		System.out.println("UserController/logout()");
		
		session.removeAttribute("authUser");//해당 세션 어트리뷰트 데이터 삭제
		session.invalidate();//세션 무효화(해당 세션 주소 삭제)
		
		return "redirect:/";
	}
}
