package com.javaex.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.UserVo;

@Repository
public class UserDao {
	
	@Autowired
	private SqlSession sqlSession;

	
	//회원가입
	public int userInsert(UserVo userVo) {
		System.out.println("UserDao/userInsert()");
		
		System.out.println(userVo);
		
		int count = sqlSession.insert("user.insert", userVo);
		System.out.println(count + "명이 가입되었습니다.");
		
		return count;
	}
	
	//로그인
	public UserVo userSelect(UserVo userVo) {
		System.out.println("UserDao/userSelect()");
		
		UserVo authUser = sqlSession.selectOne("user.selectOne", userVo);
		
		
		return authUser;
	}
}
