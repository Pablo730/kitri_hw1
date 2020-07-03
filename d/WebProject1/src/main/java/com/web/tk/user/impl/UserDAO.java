package com.web.tk.user.impl;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.tk.user.*;
@Repository
public class UserDAO {
	@Autowired
	public SqlSessionTemplate mybatis;
	 
	public UserVO login(UserVO userVO) {
		return mybatis.selectOne("userDAO.login", userVO);
	}
	
	public void join(UserVO userVO) {
		mybatis.insert("userDAO.join", userVO);
	}
	
	public int idCheck(String ID) {
		return mybatis.selectOne("userDAO.idCheck", ID);
	}
	
	public int emailCheck(String EMAIL) {
		return mybatis.selectOne("userDAO.emailCheck", EMAIL);
	}
	
	public UserVO getUser(String ID) {
		return mybatis.selectOne("userDAO.getUser", ID);
	}
	
	public UserVO findIdPW(UserVO userVO) {
		return mybatis.selectOne("userDAO.findIdPW", userVO);
	}
	
	public void infoUpdate(UserVO userVO) {
		mybatis.update("userDAO.infoUpdate", userVO);
	}
}