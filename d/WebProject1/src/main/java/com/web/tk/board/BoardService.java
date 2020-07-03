package com.web.tk.board;

import java.util.*;
 
public interface BoardService {
	public List<BoardVO> boardList(BoardVO boardVO);
	public void writeBoard(BoardVO boardVO);
	public List<BoardVO> userBoard(BoardVO boardVO);
	public void deleteBoard(BoardVO boardVO);
	public int boardAllCount();
	public int userboardCount(String USER_ID);
}

