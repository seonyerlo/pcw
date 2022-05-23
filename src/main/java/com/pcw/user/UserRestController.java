package com.pcw.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.pcw.user.bo.UserBO;
import com.pcw.user.model.User;

@RequestMapping("/user")
@RestController	
public class UserRestController {

	
	@Autowired
	private UserBO userBO;
	
	/**
	 * 로그인
	 * @param userId
	 * @param userPw
	 * @param session
	 * @return
	 */
	@PostMapping("/login")
	public Map<String, Object> login(
			@RequestParam("userIdOrEmail") String userIdOrEmail, 
			@RequestParam("userPw") String userPw,
			HttpSession session) {
		
		Map<String, Object> result = new HashMap<>();
		
		User user = userBO.getUserByUserIdAndPassword(userIdOrEmail, userPw);
		
		if (user != null) {
			result.put("result", "success");
			session.setAttribute("userId", user.getUserId());
		} else {
			result.put("result", "error");
			result.put("error_message", "존재하지 않는 사용자입니다.");
		}
		
		return result;
	}
	
}
