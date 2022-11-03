package com.soldesk.Sollind;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.soldesk.Sollind.home.HomeDAO;
import com.soldesk.Sollind.member.Member;

@Controller
public class StartController {
	
	@Autowired
	private HomeDAO hDAO;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest req) {
		hDAO.getCompany(req);
		hDAO.getFreeBoard(req);
		hDAO.getBoardPart(req);
		return "home/index";
	}
	
}
