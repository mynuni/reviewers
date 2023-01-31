package com.spring.biz.user.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.user.UserVO;

@Repository
public class UserDAO {
	@Autowired
	private SqlSessionTemplate myBatis;
	
	public void insertUser(UserVO vo) {
		myBatis.insert("UserDAO.insertUser", vo);
	}
	public UserVO getUser(UserVO vo) {
		return (UserVO)myBatis.selectOne("UserDAO.getUser", vo);
	}
	public UserVO idCheck(UserVO vo) {
		return (UserVO) myBatis.selectOne("UserDAO.idCheck",vo);
		
	}
	public UserVO telCheck(UserVO vo) {
		return (UserVO) myBatis.selectOne("UserDAO.telCheck", vo);
	}
	
	public UserVO emailCheck(UserVO vo) {
		return (UserVO) myBatis.selectOne("UserDAO.emailCheck",vo); 
	}
	
	public UserVO FindPassword(UserVO vo) {
		return (UserVO) myBatis.selectOne("UserDAO.FindPassword",vo);
	}
	public void updatePassword(UserVO vo) {
		myBatis.update("UserDAO.updatePassword", vo);
	}
	
	public List<UserVO> getAllUser(UserVO vo){
		return myBatis.selectList("UserDAO.getAllUser",vo);
	}
	
}
