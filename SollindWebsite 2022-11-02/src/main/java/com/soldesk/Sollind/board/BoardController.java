package com.soldesk.Sollind.board;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nms.token.generator.TokenGeneratorNMS;
import com.soldesk.Sollind.home.HomeDAO;
import com.soldesk.Sollind.member.MemberDAO;

@Controller
public class BoardController {
	@Autowired
	private BoardDAO bDAO;
	@Autowired
	private MemberDAO mDAO;
	@Autowired
	private HomeDAO hDAO;

	@RequestMapping(value = "/goBoardHome", method = RequestMethod.GET)
	public String goBoardHome(HttpServletRequest req) {
		bDAO.getBoard(req);
		req.setAttribute("boardPage", "boardMain.jsp");
		return "board/board";
	}

	@RequestMapping(value = "/goBoardDetail", method = RequestMethod.GET)
	public String goBoardDetail(HttpServletRequest req) {
		bDAO.getBoardDetail(req);
		req.setAttribute("boardPage", "boardDetail.jsp");
		return "board/board";
	}

	@RequestMapping(value = "/goBoardWrite", method = RequestMethod.GET)
	public String goBoardWrite(HttpServletRequest req) {
		if (mDAO.isLogined(req)) {
			TokenGeneratorNMS.generator(req);
			req.setAttribute("boardPage", "boardWrite.jsp");
			return "board/board";
		} else {
			hDAO.getCompany(req);
			hDAO.getFreeBoard(req);
			return "home/index";
		}
	}

	@RequestMapping(value = "/boardWriteResult", method = RequestMethod.POST)
	public String boardWriteResult(Board b, HttpServletRequest req) {
		if (mDAO.isLogined(req)) {
			bDAO.insertBoard(b, req);
			bDAO.getBoard(req);
			req.setAttribute("boardPage", "boardMain.jsp");
		} else {
			bDAO.getBoard(req);
			req.setAttribute("boardPage", "boardMain.jsp");
		}
		return "board/board";
	}
	
	@RequestMapping(value = "/goBoardRetouch", method = RequestMethod.GET)
	public String goBoardRetouch(HttpServletRequest req) {
		if (mDAO.isLogined(req)&&bDAO.checkBoardWriter(req)) {
			TokenGeneratorNMS.generator(req);
			bDAO.getBoardForRetouch(req);
			req.setAttribute("boardPage", "boardRetouch.jsp");
			return "board/board";
		} else {
			hDAO.getCompany(req);
			hDAO.getFreeBoard(req);
			return "home/index";
		}
	}
	
	@RequestMapping(value = "/boardRetouchResult", method = RequestMethod.POST)
	public String boardRetouchResult(Board b, HttpServletRequest req) {
		if (mDAO.isLogined(req)) {
			bDAO.updateBoard(b, req);
			bDAO.getBoard(req);
			req.setAttribute("boardPage", "boardMain.jsp");
		} else {
			bDAO.getBoard(req);
			req.setAttribute("boardPage", "boardMain.jsp");
		}
		return "board/board";
	}
	
	@RequestMapping(value = "/boardDeleteResult", method = RequestMethod.POST)
	public String boardDeleteResult(Board b, HttpServletRequest req) {
		if (mDAO.isLogined(req)&&bDAO.checkBoardWriter(req)) {
			bDAO.deleteBoard(b, req);
			bDAO.getBoard(req);
			req.setAttribute("boardPage", "boardMain.jsp");
		} else {
			bDAO.getBoard(req);
			req.setAttribute("boardPage", "boardMain.jsp");
		}
		return "board/board";
	}

	@RequestMapping(value = "/replyWriteResult", method = RequestMethod.POST)
	public String replyWriteResult(BoardReply br, HttpServletRequest req) {
		if (mDAO.isLogined(req)) {
			bDAO.insertReply(br, req);
			bDAO.getBoardDetail(req);
			req.setAttribute("boardPage", "boardDetail.jsp");
		} else {
			bDAO.getBoard(req);
			req.setAttribute("boardPage", "boardMain.jsp");
		}
		return "board/board";
	}

	@RequestMapping(value = "/replyUpdateResult", method = RequestMethod.POST)
	public String replyUpdateResult(BoardReply br, HttpServletRequest req) {
		if (mDAO.isLogined(req)) {
			bDAO.updateReply(br, req);
			bDAO.getBoardDetail(req);
			req.setAttribute("boardPage", "boardDetail.jsp");
		} else {
			bDAO.getBoard(req);
			req.setAttribute("boardPage", "boardMain.jsp");
		}
		return "board/board";
	}

	@RequestMapping(value = "/replyDeleteResult", method = RequestMethod.POST)
	public String replyDeleteResult(BoardReply br, HttpServletRequest req) {
		if (mDAO.isLogined(req)) {
			bDAO.deleteReply(br, req);
			bDAO.getBoardDetail(req);
			req.setAttribute("boardPage", "boardDetail.jsp");
		} else {
			bDAO.getBoard(req);
			req.setAttribute("boardPage", "boardMain.jsp");
		}
		return "board/board";
	}
}
