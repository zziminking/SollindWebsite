package com.soldesk.Sollind.home;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HomeController {
	
	@Autowired
	private HomeDAO hDAO; 
	
	@RequestMapping(value = "/MainHome.go", method = RequestMethod.GET)
	public String goMainHome(HttpServletRequest req) {
		hDAO.getBoardPart(req);
		hDAO.getCompany(req);
		hDAO.getFreeBoard(req);
		return "home/index";
	}
	@RequestMapping(value = "/Search.go", method = RequestMethod.GET)
	public String goSearch(HttpServletRequest req, Search2 search) {
		hDAO.search(req, search);
		hDAO.getSearch(req);
		return "home/search";
	}
	
}
