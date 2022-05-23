package com.pcw.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.pcw.user.dao.UserDAO;
import com.pcw.user.model.User;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;
	
	/**
	 * 로그인 중복 확인
	 * @param userId
	 * @return
	 */
	public int getUserByUserId(String userId) {
		return userDAO.selectUserByUserId(userId);
	}
	
	/**
	 * 로그인
	 * @param userId
	 * @param userPw
	 * @return
	 */
	public User getUserByUserIdAndPassword(String userIdOrEmail, String userPw) {
		return userDAO.selectUserByUserIdAndPassword(userIdOrEmail, userPw);
	}
	
	/**
	 * 회원가입
	 * @param userId
	 * @param userPw
	 * @param userName
	 * @param userEmail
	 * @param userPhoneNumber
	 * @param userAddress
	 * @return
	 */
	public int addUser(String userId, String userPw, String userName,
			String userEmail, String userPhoneNumber, String userAddress) {
		return userDAO.insertUser(userId, userPw, userName, userEmail, userPhoneNumber, userAddress);
	}
}
