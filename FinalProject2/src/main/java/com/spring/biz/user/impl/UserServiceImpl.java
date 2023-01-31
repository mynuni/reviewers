package com.spring.biz.user.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.user.UserService;
import com.spring.biz.user.UserVO;

@Service("UserService")
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDAO userDAO;
	

	@Override
	public UserVO getUser(UserVO vo) {
		return userDAO.getUser(vo);
		
	}
	@Override
	public void insertUser(UserVO vo) {
		userDAO.insertUser(vo);
		
	}
	@Override
	public UserVO idCheck(UserVO vo) {
		
		return userDAO.idCheck(vo);
	}
	@Override
	public UserVO telCheck(UserVO vo) {
		// TODO Auto-generated method stub
		return userDAO.telCheck(vo);
	}
	@Override
	public UserVO emailCheck(UserVO vo) {
		// TODO Auto-generated method stub
		return  userDAO.emailCheck(vo);
	}
	@Override
	public UserVO FindPassword(UserVO vo) {
		// TODO Auto-generated method stub
		return userDAO.FindPassword(vo);
	}
	@Override
	public void updatePassword(UserVO vo) {
		userDAO.updatePassword(vo);
	}
	@Override
	public List<UserVO> getUserLIst(UserVO vo) {
		// TODO Auto-generated method stub
		return userDAO.getAllUser(vo);
	}
	
}
