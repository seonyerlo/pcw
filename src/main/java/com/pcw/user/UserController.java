package com.pcw.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

	/** 회원가입
	 * @param model
	 * @return
	 */
	
	// 요청 URL : http://localhost/user/sign_up
	@RequestMapping("/sign_up")
	public String SignUpView(Model model) {
		model.addAttribute("viewContent", "/user/sign_up");
		
		return "template/sign_layout";
	}

	/** 로그인
	 * @param model
	 * @return
	 */
	// 요청 URL : http://localhost/user/sign_in
	@RequestMapping("/sign_in")
	public String SignInView(Model model) {
		model.addAttribute("viewContent", "/user/sign_in");
		
		return "template/sign_layout";
	}
}
