package com.soldesk.Sollind.company;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soldesk.Sollind.board.Board;
import com.soldesk.Sollind.member.Member;

@Service
public class CompanyDAO {
	
	@Autowired
	private SqlSession ss;
	
	public void deleteCompanyReview(Company c, CompanyReview cr, HttpServletRequest req) {
		if (ss.getMapper(companyMapper.class).deleteCompanyReview(cr) == 1) {
			ss.getMapper(companyMapper.class).updateCompanyScore(c);
			req.setAttribute("result", "삭제 완료");
		} else {
			req.setAttribute("result", "삭제 실패");
		}
	}
	
	public void getCompanyBoard(Company c, HttpServletRequest req) {
		c = ss.getMapper(companyMapper.class).getCompanyAllInfo(c);
		c.setC_name(c.getC_name().replace("주식회사", "").replace("(주)", ""));
		List<Board> boards = ss.getMapper(companyMapper.class).getCompanyBoard(c);
		req.setAttribute("companyBoards", boards);
	}
	
	public void getCompanyCount(Company c, HttpServletRequest req) {
		c = ss.getMapper(companyMapper.class).getCompanyAllInfo(c);
		BigDecimal count = c.getC_count();
		count = count.add(new BigDecimal(1));
		c.setC_count(count);
		ss.getMapper(companyMapper.class).updateCompanyCount(c);
	}
	
	public void getCompanyInfo(HttpServletRequest req) {
		List<Company> companys = ss.getMapper(companyMapper.class).getCompanyInfo();
		req.setAttribute("companys", companys);
	}
	
	public void getCompanyInfoAll(Company c, HttpServletRequest req) {
		Company companyInfo = ss.getMapper(companyMapper.class).getCompanyAllInfo(c);
		req.setAttribute("companyInfo", companyInfo);
	}
	
	public void getCompanyReview(Company c, HttpServletRequest req) {
		List<CompanyReview> companyReviews = ss.getMapper(companyMapper.class).getCompanyReview(c);
		req.setAttribute("companyReviews", companyReviews);
	}
	
	public void writeCompanyReview(Company c, CompanyReview cr, HttpServletRequest req) {
		try {
			Member m = (Member) req.getSession().getAttribute("loginMember");
			cr.setCr_m_id(m.getM_id());
			cr.setCr_title(cr.getCr_title().replace("\r\n", "<br>"));
			cr.setCr_advantage(cr.getCr_advantage().replace("\r\n", "<br>"));
			cr.setCr_weakness(cr.getCr_weakness().replace("\r\n", "<br>"));
			String token = req.getParameter("companyWriteToken");
			System.out.println(token);
			String lastToken = (String) req.getSession().getAttribute("successToken");
			System.out.println(lastToken);
			if (lastToken != null && token.equals(lastToken)) {
				req.setAttribute("result", "작성실패(새로고침)");
				System.out.println("작성실패");
				return;
			}
			if (ss.getMapper(companyMapper.class).insertCompanyReview(cr) == 1) {
				ss.getMapper(companyMapper.class).updateCompanyScore(c);
				req.setAttribute("result", "작성 완료");
				req.getSession().setAttribute("successToken", token);
			} else {
				req.setAttribute("result", "작성 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
