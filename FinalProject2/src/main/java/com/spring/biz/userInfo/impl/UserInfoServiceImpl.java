package com.spring.biz.userInfo.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.userInfo.UserInfoService;
import com.spring.biz.userInfo.UserInfoVO;

@Service("UserInfoService")
public class UserInfoServiceImpl implements UserInfoService{
	@Autowired
	private UserInfoDAO userInfoDAO;

	@Override
	public UserInfoVO getNickname(UserInfoVO vo) {
		return userInfoDAO.nickNameCheck(vo);
		
	}

	@Override
	public void insertUserInfo(UserInfoVO vo) {
		// TODO Auto-generated method stub
		userInfoDAO.insertUserInfo(vo);
	}

	@Override
	public UserInfoVO getUserInfo(UserInfoVO vo) {
		
		return userInfoDAO.getUserInfo(vo);
	}

	
}
