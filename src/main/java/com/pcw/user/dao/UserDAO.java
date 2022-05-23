package com.pcw.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.pcw.user.model.User;

@Repository
public interface UserDAO {

	public User selectUserByUserIdAndPassword (
			@Param("userId") String userId, 
			@Param("userPw") String userPw);
}