package com.soldesk.Sollind.member;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.soldesk.Sollind.home.HomeDAO;

@Controller
public class MemberController {
	@Autowired
	private MemberDAO mDAO;
	@Autowired
	private HomeDAO hDAO;

	@RequestMapping(value = "/MemberHome.go", method = RequestMethod.GET)
	public String goMemberHome(HttpServletRequest req) {
		return "member/loginPage";
	}

	@RequestMapping(value = "/Memberjoin.go", method = RequestMethod.GET)
	public String memberJoinGo(HttpServletRequest req) {
		req.setAttribute("loginPage", "member/loginPage.jsp");
		return "member/joinPage";
	}

	@RequestMapping(value = "/completejoin.do", method = RequestMethod.POST)
	public String joinComplete(HttpServletRequest req) {
		hDAO.getCompany(req);
		hDAO.getFreeBoard(req);
		hDAO.getBoardPart(req);
		mDAO.join(req);
		return "home/index";
	}

	@RequestMapping(value = "/member.login", method = RequestMethod.POST)
	public String login(Member m, HttpServletRequest req) {
		mDAO.login(m, req);
		hDAO.getCompany(req);
		hDAO.getFreeBoard(req);
		hDAO.getBoardPart(req);
		return "home/index";
	}

	@RequestMapping(value = "/delete.go", method = RequestMethod.GET)
	public String delete(Member m, HttpServletRequest req) {
		if (mDAO.isLogined(req)) {
			mDAO.deleteMember(req, m);
			mDAO.isLogout(req);
		}
		hDAO.getCompany(req);
		hDAO.getFreeBoard(req);
		hDAO.getBoardPart(req);
		return "home/index";

	}

	@RequestMapping(value = "/member.logout", method = RequestMethod.GET)
	public String logout(Member m, HttpServletRequest req) {
		mDAO.isLogined(req);
		mDAO.isLogout(req);
		hDAO.getCompany(req);
		hDAO.getFreeBoard(req);
		hDAO.getBoardPart(req);
		return "home/index";

	}

	@RequestMapping(value = "/update.go", method = RequestMethod.GET)
	public String update(Member m, HttpServletRequest req) {
		if (mDAO.isLogined(req)) {
			return "member/update";
		} else {
			hDAO.getCompany(req);
			hDAO.getFreeBoard(req);
			hDAO.getBoardPart(req);
			return "home/index";
		}
	}

	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public String completeUpdate(Member m, HttpServletRequest req) {
		if (mDAO.isLogined(req)) {
			mDAO.update(m, req);
			hDAO.getCompany(req);
			hDAO.getFreeBoard(req);
			hDAO.getBoardPart(req);
			return "home/index";
		} else {
			return "member/update";
		}

	}

}
