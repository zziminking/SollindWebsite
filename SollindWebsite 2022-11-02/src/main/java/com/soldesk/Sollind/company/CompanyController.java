package com.soldesk.Sollind.company;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nms.token.generator.TokenGeneratorNMS;
import com.soldesk.Sollind.board.BoardDAO;
import com.soldesk.Sollind.member.MemberDAO;

@Controller
public class CompanyController {
	
	@Autowired
	private CompanyDAO cDAO;
	
	@Autowired
	private MemberDAO mDAO;
	
	@RequestMapping(value = "/goCompanyAI", method = RequestMethod.GET)
	public String goCompanyAI(HttpServletRequest req) {
		return "company/companyAI";
	}
	
	@RequestMapping(value = "/goCompanyHome", method = RequestMethod.GET)
	public String goCompanyHome(HttpServletRequest req) {
		cDAO.getCompanyInfo(req);
		return "company/companyHome";
	}
	
	@RequestMapping(value = "/goCompanyDetailInfo", method = RequestMethod.GET)
	public String goCompanyDetail(Company c, HttpServletRequest req) {
		cDAO.getCompanyCount(c, req);
		cDAO.getCompanyInfoAll(c, req);
		cDAO.getCompanyReview(c, req);
		cDAO.getCompanyBoard(c, req);
		return "company/companyDetail";
	}
	
	@RequestMapping(value = "/goCompanyWriteReview", method = RequestMethod.GET)
	public String goCompanyReview(Company c, HttpServletRequest req) {
		cDAO.getCompanyInfoAll(c, req);
		if (mDAO.isLogined(req)) {
			TokenGeneratorNMS.generator(req);
			return "company/companyWriteReview";
		} else {
			cDAO.getCompanyReview(c, req);
			cDAO.getCompanyBoard(c, req);
			return "company/companyDetail";
		}
	}
	
	@RequestMapping(value = "/goCompanyDetailBoard", method = RequestMethod.GET)
	public String goCompanyDetailBoard(Company c, HttpServletRequest req) {
		cDAO.getCompanyInfoAll(c, req);
		cDAO.getCompanyReview(c, req);
		cDAO.getCompanyBoard(c, req);
		if (mDAO.isLogined(req)) {
			return "company/companyDetailBoard";
		} else {
			return "company/companyDetail";
		}
	}
	
	@RequestMapping(value = "/goCompanyDetailReview", method = RequestMethod.GET)
	public String goCompanyDetailReview(Company c, HttpServletRequest req) {
		cDAO.getCompanyInfoAll(c, req);
		cDAO.getCompanyReview(c, req);
		cDAO.getCompanyBoard(c, req);
		if (mDAO.isLogined(req)) {
			return "company/companyDetailReview";
		} else {
			return "company/companyDetail";
		}
	}
	
	@RequestMapping(value = "/deleteCompanyReview", method = RequestMethod.GET)
	public String deleteCompanyReview(Company c, CompanyReview cr, HttpServletRequest req) {
		if (mDAO.isLogined(req)) {
			cDAO.deleteCompanyReview(c, cr, req);
			cDAO.getCompanyInfoAll(c, req);
			cDAO.getCompanyReview(c, req);
			cDAO.getCompanyBoard(c, req);
			return "company/companyDetailReview";
		} else {
			cDAO.getCompanyInfoAll(c, req);
			cDAO.getCompanyReview(c, req);
			cDAO.getCompanyBoard(c, req);
			return "company/companyDetail";
		}
	}
	
	@RequestMapping(value = "/WriteCompanyReview", method = RequestMethod.POST)
	public String writeCompanyReview(Company c, CompanyReview cr, HttpServletRequest req) {
		if (mDAO.isLogined(req)) {
			cDAO.writeCompanyReview(c, cr, req);
			cDAO.getCompanyInfoAll(c, req);
			cDAO.getCompanyReview(c, req);
			cDAO.getCompanyBoard(c, req);
			return "company/companyDetail";
		} else {
			cDAO.getCompanyInfoAll(c, req);
			cDAO.getCompanyReview(c, req);
			cDAO.getCompanyBoard(c, req);
			return "company/companyDetail";
		}
	}
	
	
}
