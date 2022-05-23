package com.pcw.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcw.user.dao.UserDAO;
import com.pcw.user.model.User;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;
	
	/**
	 * 로그인
	 * @param userId
	 * @param userPw
	 * @return
	 */
	public User getUserByUserIdAndPassword(String userIdOrEmail, String userPw) {
		return userDAO.selectUserByUserIdAndPassword(userIdOrEmail, userPw);
	}
	
}
