package com.soldesk.Sollind.board;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nms.token.generator.TokenGeneratorNMS;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.soldesk.Sollind.home.HomeBoard;
import com.soldesk.Sollind.member.Member;

@Service
public class BoardDAO {
	@Autowired
	private SqlSession ss;

	public void getBoard(HttpServletRequest req) {
		Board type = new Board();
		if (req.getParameter("type")!=null) {
			type.setB_type(req.getParameter("type"));
		} else {
			type.setB_type("");
		}
		String[] typeList = {"자유게시판","이직·커리어","헬스","회사생활","여행","알쓸신잡","연애","스포츠"};
		req.setAttribute("typeList", typeList);
		req.setAttribute("nowType", type.getB_type());
		List<HomeBoard> boardList= ss.getMapper(BoardMapper.class).getBoard(type);
		HomeBoard b = null;
		String text = null;
		for (int i = 0; i < boardList.size(); i++) {
			b = boardList.get(i);
			text = b.getB_img();
			try {
				text = URLDecoder.decode(text, "utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			b.setB_img(text);
			boardList.set(i, b);
		}
		req.setAttribute("boardTo", boardList);
	}
	
	public void getBoardForRetouch(HttpServletRequest req) {
		Board b = new Board();
		BigDecimal b_no = new BigDecimal(req.getParameter("b_no"));
		b.setB_no(b_no);
		b = ss.getMapper(BoardMapper.class).getBoardDetail(b);
		b.setB_txt(b.getB_txt().replace("<br>", "\r\n"));
		req.setAttribute("board2", b);
	}
	public void getBoardDetail(HttpServletRequest req) {
		if (req.getParameter("token") == null) {
			TokenGeneratorNMS.generator(req);
		} else {
			String token = req.getParameter("token");
			String lastToken = (String) req.getSession().getAttribute("successToken");
			if (lastToken == null || !token.equals(lastToken)) {
				TokenGeneratorNMS.generator(req);
			}
		}
		Board b = new Board();
		BigDecimal b_no = new BigDecimal(req.getParameter("b_no"));
		b.setB_no(b_no);
		List<BoardReply> boardReplyList = ss.getMapper(BoardMapper.class).getBoardReply(b);
		BoardReply br = null;
		Member m = (Member) req.getSession().getAttribute("loginMember");
		for (int i = 0; i < boardReplyList.size(); i++) {
			br = boardReplyList.get(i);
			if (m!=null&&m.getM_id().equals(br.getBr_m_id())) {
				br.setBr_txt(br.getBr_txt().replace("<br>", "\r\n"));
				boardReplyList.set(i, br);
			}
		}
		req.setAttribute("boardReply2", boardReplyList);
		req.setAttribute("board2", ss.getMapper(BoardMapper.class).getBoardDetail(b));
		if (m != null) {
			BoardDdabong bd = new BoardDdabong();
			bd.setBd_b_no(b.getB_no());
			bd.setBd_m_id(m.getM_id());
			req.setAttribute("ddabong", ss.getMapper(BoardMapper.class).getBoardDdabong(bd));
		} else {
			req.setAttribute("ddabong", null);
		}
	}

	public boolean checkBoardWriter(HttpServletRequest req) {
		Board b = new Board();
		BigDecimal b_no = new BigDecimal(req.getParameter("b_no"));
		b.setB_no(b_no);
		b = ss.getMapper(BoardMapper.class).getBoardDetail(b);
		Member m = (Member) req.getSession().getAttribute("loginMember");
		if (m.getM_id().equals(b.getB_m_id())) {
			return true;
		}
		return false;
	}

	public boolean insertBoard(Board b, HttpServletRequest req) {
		String path = req.getSession().getServletContext().getRealPath("resources/img/boardImg");
//		System.out.println(path);
		int size = 20 * 1024 * 1024;
		MultipartRequest mr = null;
		String img = "noImage";
		try {
			mr = new MultipartRequest(req, path, size, "utf-8", new DefaultFileRenamePolicy());

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("파일 업로드 문제");
			return false;
		}

		String token = mr.getParameter("token");
		String lastToken = (String) req.getSession().getAttribute("successToken");
		if (lastToken != null && token.equals(lastToken)) {
			File f = new File(path + "/" + mr.getFilesystemName("img"));
			f.delete();
			System.out.println("새로고침 중복입력 오류");
			return false;
		}

		try {
			if (mr.getFilesystemName("img") != null) {
				img = mr.getFilesystemName("img");
				img = URLEncoder.encode(img, "utf-8");
				img = img.replace("+", " ");
			}

			b.setB_type(mr.getParameter("type"));
			b.setB_title(mr.getParameter("title"));
			b.setB_txt(mr.getParameter("text").replace("\r\n", "<br>"));
			Member m = (Member) req.getSession().getAttribute("loginMember");
			b.setB_m_id(m.getM_id());
			b.setB_img(img);
			if (ss.getMapper(BoardMapper.class).insertBoard(b) == 1) {
				req.getSession().setAttribute("successToken", token);
				return true;
			} else {
				if (!img.equals("noImage")) {
					File f = new File(path + "/" + mr.getFilesystemName("img"));
					f.delete();
				}
				System.out.println("글쓰기 실패.");
				return false;
			}
		} catch (Exception e) {
			if (!img.equals("noImage")) {
				File f = new File(path + "/" + mr.getFilesystemName("img"));
				f.delete();
			}
			e.printStackTrace();
			System.out.println("글쓰기 실패.");
			return false;
		}
	}
	
	public boolean updateBoard(Board b, HttpServletRequest req) {
		String path = req.getSession().getServletContext().getRealPath("resources/img/boardImg");
//		System.out.println(path);
		int size = 20 * 1024 * 1024;
		MultipartRequest mr = null;
		String img = "noImage";
		try {
			mr = new MultipartRequest(req, path, size, "utf-8", new DefaultFileRenamePolicy());

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("파일 업로드 문제");
			return false;
		}

		String token = mr.getParameter("token");
		String lastToken = (String) req.getSession().getAttribute("successToken");
		if (lastToken != null && token.equals(lastToken)) {
			File f = new File(path + "/" + mr.getFilesystemName("img"));
			f.delete();
			System.out.println("새로고침 중복입력 오류");
			return false;
		}

		try {
			if (mr.getFilesystemName("img") != null) {
				img = mr.getFilesystemName("img");
				img = URLEncoder.encode(img, "utf-8");
				img = img.replace("+", " ");
			} else {
				img = mr.getParameter("beforeFileName");
			}
			b.setB_no(new BigDecimal(mr.getParameter("boardNo")));
			b.setB_title(mr.getParameter("title"));
			b.setB_txt(mr.getParameter("text").replace("\r\n", "<br>"));
			b.setB_img(img);
			if (ss.getMapper(BoardMapper.class).updateBoard(b) == 1) {
				req.getSession().setAttribute("successToken", token);
				if (!mr.getParameter("beforeFileName").equals("noImage")) {
					File f = new File(path + "/" + mr.getParameter("beforeFileName"));
					f.delete();
				}
				return true;
			} else {
				if (!img.equals("noImage")) {
					File f = new File(path + "/" + mr.getFilesystemName("img"));
					f.delete();
				}
				System.out.println("글 수정 실패.");
				return false;
			}
		} catch (Exception e) {
			if (!img.equals("noImage")) {
				File f = new File(path + "/" + mr.getFilesystemName("img"));
				f.delete();
			}
			e.printStackTrace();
			System.out.println("글 수정 실패.");
			return false;
		}
	}
	
	public boolean deleteBoard(Board b, HttpServletRequest req) {
		String path = req.getSession().getServletContext().getRealPath("resources/img/boardImg");
//		System.out.println(path);
		b.setB_no(new BigDecimal(req.getParameter("b_no")));
		try {
			if (ss.getMapper(BoardMapper.class).deleteBoard(b)==1) {
				File f = new File(path + "/" + req.getParameter("beforeFileName"));
				f.delete();
				return true;
			}
			return false;
		} catch (Exception e) {
			System.out.println("글 삭제 실패");
			return false;
		}
	}

	public boolean insertReply(BoardReply br, HttpServletRequest req) {
		String token = req.getParameter("token");
		String lastToken = (String) req.getSession().getAttribute("successToken");
		br.setBr_txt(br.getBr_txt().replace("\r\n", "<br>"));
		if (lastToken != null && token.equals(lastToken)) {
			System.out.println("새로고침 중복입력 오류");
			return false;
		}
		if (ss.getMapper(BoardMapper.class).insertReply(br) == 1) {
			req.getSession().setAttribute("successToken", token);
			return true;

		} else {
			System.out.println("글 입력 실패");
			return false;
		}
	}

	public boolean updateReply(BoardReply br, HttpServletRequest req) {
		br.setBr_txt(br.getBr_txt().replace("\r\n", "<br>"));
		if (!br.getBr_txt().equals(req.getParameter("beforeReply"))) {
			if (ss.getMapper(BoardMapper.class).updateReply(br) == 1) {
				return true;
			} else {
				System.out.println("글 수정 실패");
				return false;
			}
		}
		return false;
	}

	public void deleteReply(BoardReply br, HttpServletRequest req) {
		if (ss.getMapper(BoardMapper.class).deleteReply(br) == 1) {

		} else {
			System.out.println("글 삭제 실패");
		}
	}

}
