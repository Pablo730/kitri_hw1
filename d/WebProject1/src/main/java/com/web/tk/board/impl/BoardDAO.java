package com.web.tk.board.impl;
 
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.tk.board.BoardVO;

@Repository
public class BoardDAO {
	@Autowired
	public SqlSessionTemplate mybatis;
	
	public List<BoardVO> boardList(BoardVO boardVO) {
		return mybatis.selectList("boardDAO.boardList",boardVO);
	}
	
	public void writeBoard(BoardVO boardVO) {
		mybatis.insert("boardDAO.writeBoard", boardVO);
	}
	
	public List<BoardVO> userBoard(BoardVO boardVO) {
		return mybatis.selectList("boardDAO.userBoard",boardVO);
	}
	
	public void deleteBoard(BoardVO boardVO) {
		mybatis.update("boardDAO.deleteBoard", boardVO);
	}
	
	public int boardAllCount() {
		return mybatis.selectOne("boardDAO.boardAllCount");
	}
	
	public int userboardCount(String USER_ID) {
		return mybatis.selectOne("boardDAO.userboardCount",USER_ID);
	}
}
