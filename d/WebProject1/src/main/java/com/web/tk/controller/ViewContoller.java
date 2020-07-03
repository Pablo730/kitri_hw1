package com.web.tk.controller;
 
import java.util.*;
import java.text.*;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.*;

import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.web.bind.annotation.*;


import com.web.tk.board.*;

import com.web.tk.user.*;

@Controller
public class ViewContoller {
	@Autowired
	private UserService userService;
	@Autowired
	private BoardService boardService;
	@Autowired
	private JavaMailSender mailSender;
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat format2 = new SimpleDateFormat("HH");
	SimpleDateFormat format3 = new SimpleDateFormat("mm");
	

	@RequestMapping(value = "/main")
	public String main(String page, BoardVO boardVO, HttpServletRequest request) {
		if(page==null || page.equals("1")) {
			page="1";
			boardVO.setSTART(0);
			boardVO.setEND(10);
		} 
		else {
			boardVO.setSTART((Integer.parseInt(page)-1)*10);
			boardVO.setEND(10);
		}
		request.setAttribute("boardList", boardService.boardList(boardVO)); 
		request.setAttribute("page", page);
		request.setAttribute("cnt", boardService.boardAllCount());
		return "main.jsp";
	}
	
	@RequestMapping(value = "/signInPage")
	public String signInPage() {
		return "signIn.jsp";
	}
	
	@RequestMapping(value = "/signUpPage")
	public String signUpPage() {
		return "signUp.jsp";
	}
	
	@RequestMapping(value = "/inforPage")
	public String inforPage(HttpSession session, HttpServletRequest request) {
		UserVO userVO = userService.getUser(String.valueOf(session.getAttribute("USER_ID")));
		session.setAttribute("USER_NAME", userVO.getNAME());
		request.setAttribute("USER_EMAIL", userVO.getEMAIL());
		request.setAttribute("USER_PW", userVO.getPW());
		return "infor.jsp";
	}
	
	@RequestMapping(value = "/inforUpdate")
	public String inforUpdate(HttpSession session, HttpServletRequest request) {
		UserVO userVO = userService.getUser(String.valueOf(session.getAttribute("USER_ID")));
		userVO.setPW(request.getParameter("PW"));
		userVO.setNAME(request.getParameter("NAME"));
		userVO.setEMAIL(request.getParameter("EMAIL"));
		userService.infoUpdate(userVO);
		return "redirect:inforPage";
	}
	
	@RequestMapping(value = "/userWritePage")
	public String userWritePage(String page, HttpSession session, HttpServletRequest request) {
		BoardVO boardVO = new BoardVO();
		if(page==null || page.equals("1")) {
			page="1";
			boardVO.setSTART(0);
			boardVO.setEND(10);
		} else {
			boardVO.setSTART((Integer.parseInt(page)-1)*10);
			boardVO.setEND(10);
		}
		boardVO.setUSER_ID(String.valueOf(session.getAttribute("USER_ID")));
		request.setAttribute("boardList", boardService.userBoard(boardVO));
		request.setAttribute("page", page);
		request.setAttribute("cnt", boardService.userboardCount(String.valueOf(session.getAttribute("USER_ID"))));
		return "userWrite.jsp";
	}
	
	@RequestMapping(value = "/idpwFindPage")
	public String idpwFindPage() {
		return "idpwFind.jsp";
	}
	
	@RequestMapping(value = "/login")
	public String login(UserVO userVO, HttpSession session, HttpServletRequest request) {
		if(userService.login(userVO)!=null) {
			userVO = userService.login(userVO);
			session.setAttribute("USER_ID", userVO.getID());
			session.setAttribute("USER_NAME", userVO.getNAME());
			return "redirect:main";
		} else {
			request.setAttribute("loginFlag", "fail");
			return "signIn.jsp";
		}
	}
	
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:main";
	}
	
	@RequestMapping(value = "/write")
	public String write(BoardVO boardVO, HttpSession session) {
		boardVO.setIN_DATE(format.format(new Date()));
		boardVO.setUSER_ID(String.valueOf(session.getAttribute("USER_ID")));
		boardService.writeBoard(boardVO);
		return "redirect:main";
	}
	
	@RequestMapping(value = "/join")
	public String join(UserVO userVO, HttpSession session, HttpServletRequest request) {
		userVO.setIN_DATE(format.format(new Date()));
		userService.join(userVO);
		session.setAttribute("USER_ID", userVO.getID());
		session.setAttribute("USER_NAME", userVO.getNAME());
		return "redirect:main";
	}
	
	@ResponseBody
	@RequestMapping(value = "/idCheck")
	public HashMap<String, Object> idCheck(@RequestBody HashMap<String, Object> map) {
		String ID = String.valueOf(map.get("ID"));
		int cnt = userService.idCheck(ID);
		map.put("cnt", cnt);
		System.out.println(cnt);
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/emailCheck")
	public HashMap<String, Object> emailCheck(@RequestBody HashMap<String, Object> map, HttpSession session) {
		String EMAIL = String.valueOf(map.get("EMAIL"));
		int cnt2 = userService.emailCheck(EMAIL);
		UserVO userVO = userService.getUser(String.valueOf(session.getAttribute("USER_ID")));
		if(userVO!=null) {
			if(userVO.getEMAIL().equals(EMAIL)) {
				cnt2=0;
			}
		}
		map.put("cnt2", cnt2);
		return map;
	}
	
	@RequestMapping("/idPwFind")
	public String mailSending(UserVO userVO, HttpServletRequest request) {
		if(userService.findIdPW(userVO)!=null) {
			String setfrom = "kcm1619@naver.com";
			String tomail = userVO.getEMAIL();
			String title = "Kitri과제 ID/PW 찾기";
			String content = userVO.getNAME()+"님의 아이디: "+userService.findIdPW(userVO).getID()+" / 비밀번호: "+userService.findIdPW(userVO).getPW()+" 입니다";
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
				messageHelper.setTo(tomail); // 받는사람 이메일
				messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
				messageHelper.setText(content); // 메일 내용
				mailSender.send(message);
				request.setAttribute("findFlag", "succ");
			} catch (Exception e) {
				System.out.println(e);
			}
			return "idpwFind.jsp";
		}
		request.setAttribute("findFlag", "fail");
		return "idpwFind.jsp";
	}
	
	@RequestMapping(value = "/delete")
	public String delete(BoardVO boardVO) {
		boardService.deleteBoard(boardVO);
		return "redirect:userWritePage";
	}
}
