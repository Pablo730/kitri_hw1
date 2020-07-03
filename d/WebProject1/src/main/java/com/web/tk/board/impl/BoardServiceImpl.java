package com.web.tk.board.impl;
 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.tk.board.*;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired	
	private BoardDAO boardDAO;

	@Override
	public List<BoardVO> boardList(BoardVO boardVO) {
		return boardDAO.boardList(boardVO);
	}

	@Override
	public void writeBoard(BoardVO boardVO) {
		boardDAO.writeBoard(boardVO);
	}

	@Override
	public List<BoardVO> userBoard(BoardVO boardVO) {
		return boardDAO.userBoard(boardVO);
	}
	
	@Override
	public void deleteBoard(BoardVO boardVO) {
		boardDAO.deleteBoard(boardVO);
	}

	@Override
	public int boardAllCount() {
		return boardDAO.boardAllCount();
	}

	@Override
	public int userboardCount(String USER_ID) {
		return boardDAO.userboardCount(USER_ID);
	}
}