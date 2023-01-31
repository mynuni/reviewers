package com.spring.biz.userInfo;

public interface UserInfoService {
	UserInfoVO getNickname(UserInfoVO vo);
	public void insertUserInfo(UserInfoVO vo);
	UserInfoVO getUserInfo(UserInfoVO vo);
}
