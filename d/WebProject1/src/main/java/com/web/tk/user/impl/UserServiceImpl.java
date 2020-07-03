package com.web.tk.user.impl;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.tk.user.*;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDAO userDAO;
 
	@Override
	public UserVO login(UserVO userVO) {
		return userDAO.login(userVO);
	}

	@Override
	public void join(UserVO userVO) {
		userDAO.join(userVO);
	}

	@Override
	public int idCheck(String ID) {
		return userDAO.idCheck(ID);
	}

	@Override
	public int emailCheck(String EMAIL) {
		return userDAO.emailCheck(EMAIL);
	}
	
	@Override
	public UserVO getUser(String ID) {
		return userDAO.getUser(ID);
	}
	
	@Override
	public UserVO findIdPW(UserVO userVO) {
		return userDAO.findIdPW(userVO);
	}
	
	@Override
	public void infoUpdate(UserVO userVO) {
		userDAO.infoUpdate(userVO);
	}

}