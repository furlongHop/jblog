package com.javaex.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.UserDao;
import com.javaex.vo.UserVo;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;
	
	
	//아이디 중복 체크
	public String checkId(String id) {
		System.out.println("UserService/checkId()");
		
		int count = userDao.checkId(id);
		
		if(count>0) {
			return "1"; 
		}else {
			return "0";
		}
	}
	
	//회원가입
	public void join(UserVo userVo) {
		System.out.println("UserService/join()");
		
		userDao.userInsert(userVo);
	}
	
	//로그인
	public UserVo login(UserVo userVo) {
		System.out.println("UserService/login()");
		
		return userDao.userSelect(userVo);
	}
	
}
