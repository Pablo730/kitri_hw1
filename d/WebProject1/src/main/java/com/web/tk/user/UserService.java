package com.web.tk.user;
 
public interface UserService {
	public UserVO login(UserVO userVO);
	public void join(UserVO userVO);
	public int idCheck(String ID);
	public int emailCheck(String EMAIL);
	public UserVO getUser(String ID);
	public UserVO findIdPW(UserVO userVO);
	public void infoUpdate(UserVO userVO);
}