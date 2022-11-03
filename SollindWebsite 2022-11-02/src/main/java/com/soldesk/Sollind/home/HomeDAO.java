package com.soldesk.Sollind.home;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soldesk.Sollind.board.Board;
import com.soldesk.Sollind.company.Company;

@Service
public class HomeDAO {
	
	@Autowired
	private SqlSession ss;
	
	public void getBoardPart(HttpServletRequest req) {
		String type = "자유게시판";
		List<HomeBoard> boardPart = ss.getMapper(HomeMapper.class).getBoardPart(type);
		req.setAttribute("boardPartFree", boardPart);
		type = "회사생활";
		boardPart = ss.getMapper(HomeMapper.class).getBoardPart(type);
		req.setAttribute("boardPartCompany", boardPart);
		type = "이직·커리어";
		boardPart = ss.getMapper(HomeMapper.class).getBoardPart(type);
		req.setAttribute("boardPartCareer", boardPart);
		type = "헬스";
		boardPart = ss.getMapper(HomeMapper.class).getBoardPart(type);
		req.setAttribute("boardPartHealth", boardPart);
		type = "여행";
		boardPart = ss.getMapper(HomeMapper.class).getBoardPart(type);
		req.setAttribute("boardPartTravel", boardPart);
		type = "알쓸신잡";
		boardPart = ss.getMapper(HomeMapper.class).getBoardPart(type);
		req.setAttribute("boardPartInfo", boardPart);
		type = "연애";
		boardPart = ss.getMapper(HomeMapper.class).getBoardPart(type);
		req.setAttribute("boardPartLove", boardPart);
		type = "스포츠";
		boardPart = ss.getMapper(HomeMapper.class).getBoardPart(type);
		req.setAttribute("boardPartSport", boardPart);

	}
	
	public void getCompany(HttpServletRequest req) {

		HttpURLConnection huc = null;
		try {
			URL u = new URL("http://192.168.0.126:7665/company.get");
			huc = (HttpURLConnection) u.openConnection();
			InputStream is = huc.getInputStream();
			InputStreamReader isr = new InputStreamReader(is);

			JSONParser jp = new JSONParser();
			JSONObject jo = (JSONObject) jp.parse(isr);
			JSONArray ja = (JSONArray) jo.get("result");
			req.setAttribute("companys", ja);
		} catch (Exception e) {
			huc.disconnect();
			huc = null;
			try {
				URL u = new URL("http://192.168.0.126:7665/company.get.spare");
				huc = (HttpURLConnection) u.openConnection();
				InputStream is = huc.getInputStream();
				InputStreamReader isr = new InputStreamReader(is);

				JSONParser jp = new JSONParser();
				JSONObject jo = (JSONObject) jp.parse(isr);
				JSONArray ja = (JSONArray) jo.get("result");
				req.setAttribute("companys", ja);
			} catch (Exception e2) {
				System.out.println("진짜 에러");
			}
		}
		huc.disconnect();
	}
	
	public void getFreeBoard(HttpServletRequest req) {
		try {
			List<Board> boards = ss.getMapper(HomeMapper.class).getBestBoard();
			req.setAttribute("boards", boards);

		} catch (Exception e) {
		}
	}

	public void getSearch(HttpServletRequest req) {
		Search2 se2 = new Search2();
		if (req.getParameter("type")!=null) {
			se2.setType(req.getParameter("type"));
		} else {
			se2.setType("");
		}
		se2.setSearch(req.getParameter("search"));
		se2.setSearch((String) req.getSession().getAttribute("search"));
		List<Company> searchCompanys = ss.getMapper(HomeMapper.class).searchCompany(se2);
		ss.getMapper(HomeMapper.class).searchBoard(se2);
		
		List<HomeBoard> searchBoards = ss.getMapper(HomeMapper.class).searchBoard(se2);
		
		if (searchBoards.size() == 0 && searchCompanys.size() == 0) {
			req.setAttribute("searchEmpty", 0);
		}
		HomeBoard b = null;
		String text = null;
		for (int i = 0; i < searchBoards.size(); i++) {
			b = searchBoards.get(i);
			text = b.getB_img();
			try {
				text = URLDecoder.decode(text, "utf-8");
			} catch (UnsupportedEncodingException e) {
			}
			b.setB_img(text);
			searchBoards.set(i, b);
		}
		String[] typeList = {"자유게시판","이직·커리어","헬스","회사생활","여행","알쓸신잡","연애","스포츠"};
		req.setAttribute("typeList", typeList);
		req.setAttribute("boardType", se2.getType());
		req.setAttribute("searchBoards", searchBoards);
		req.setAttribute("searchCompanys", searchCompanys);
	}
	
	public void search(HttpServletRequest req, Search2 search) {
		req.getSession().setAttribute("search", search.getSearch());
	}
}
