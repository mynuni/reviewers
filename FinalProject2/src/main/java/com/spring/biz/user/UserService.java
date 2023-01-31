package com.spring.biz.user;

import java.util.List;

public interface UserService {
	public UserVO getUser(UserVO vo);
	public void insertUser(UserVO vo);
	public UserVO idCheck(UserVO vo);
	public UserVO telCheck(UserVO vo);
	public UserVO emailCheck(UserVO vo);
	public UserVO FindPassword(UserVO vo);
	public void updatePassword(UserVO vo);
	List<UserVO> getUserLIst(UserVO vo);
}
