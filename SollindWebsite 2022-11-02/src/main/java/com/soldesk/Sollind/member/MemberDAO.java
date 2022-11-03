package com.soldesk.Sollind.member;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.xml.ws.soap.AddressingFeature;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class MemberDAO {

	@Autowired
	private SqlSession ss;

	public boolean isLogined(HttpServletRequest req) {
		Member m = (Member) req.getSession().getAttribute("loginMember");
		if (m != null) {
			return true;
		}
		return false;
	}

	public void isLogout(HttpServletRequest req) {
		req.getSession().setAttribute("loginMember", null);
	}

	public void join(HttpServletRequest req) {
		String path = req.getSession().getServletContext().getRealPath("resources/img");
		MultipartRequest mr = null;
		try {
			mr = new MultipartRequest(req, path, 31457280, "utf-8", new DefaultFileRenamePolicy());
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "가입실패(프사)");
			return;
		}
		Member m = new Member();

		try {
			String id = mr.getParameter("m_id");
			m.setM_id(id);
			String pw = mr.getParameter("m_pw");
			m.setM_pw(pw);
			String name = mr.getParameter("m_name");
			m.setM_name(name);
			String birth1 = mr.getParameter("m_birth1");
			String birth2 = mr.getParameter("m_birth2");
			String addr1 = mr.getParameter("m_addr1");
			String addr2 = mr.getParameter("m_addr2");
			String addr3 = mr.getParameter("m_addr3");
			String addr = addr2 + "!" + addr3 + "!" + addr1;
			m.setM_addr(addr);
			String photo = mr.getFilesystemName("m_photo");
			photo = URLEncoder.encode(photo, "utf-8").replace("+", " ");
			m.setM_photo(photo);

			int birth22 = Integer.parseInt(birth2);
			birth22 = (birth22 % 2 == 0) ? birth22 - 1 : birth22;
			if (birth22 == 1) {
				birth1 = 19 + birth1;
			} else {
				birth1 = 20 + birth1;
			}
			Date birth = new SimpleDateFormat("yyyyMMdd").parse(birth1);
			m.setM_birth(birth);

			if (ss.getMapper(MemberMapper.class).mJoin(m) == 1) {
				req.setAttribute("r", "가입성공");
			} else {
				req.setAttribute("r", "가입실패[DB]");
				File f = new File(path + "/" + mr.getFilesystemName("m_photo"));
				f.delete();
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "가입실패[프사]");
			File f = new File(path + "/" + mr.getFilesystemName("m_photo"));
			f.delete();

		}
	}

	public void login(Member m, HttpServletRequest req) {
		try {
			Member dbMember = ss.getMapper(MemberMapper.class).getMemberByID(m);
			if (dbMember != null) {
				if (m.getM_pw().equals(dbMember.getM_pw())) {
					req.getSession().setAttribute("loginMember", dbMember);
					req.setAttribute("r", "로그인성공");
				} else {
					req.setAttribute("r", "로그인실패[PW]");
				}
			} else {
				req.setAttribute("r", "로그인실패[ID]");
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "로그인실패[DB]");
		}
	}

	public void deleteMember(HttpServletRequest req, Member m) {
		try {
			m = (Member) req.getSession().getAttribute("loginMember");
			if (ss.getMapper(MemberMapper.class).deleteID(m) == 1) {
				req.setAttribute("r", "탈퇴성공");
				String path = req.getSession().getServletContext().getRealPath("resources/img");
				String photo= URLDecoder.decode(m.getM_photo(),"utf-8");
				new File(path+"/"+photo).delete();
			}else {
				req.setAttribute("r", "탈퇴실패");
			}

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "탈퇴실패");
		}

	}

	public void getInfo(HttpServletRequest req) {
		Member m = (Member) req.getSession().getAttribute("loginMember");
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");
		String birth = sdf.format(m.getM_birth());
		req.setAttribute("birth", birth);
		String[] addr = m.getM_addr().split("!");
		req.setAttribute("addr1", addr[2]);
		req.setAttribute("addr2", addr[0]);
		req.setAttribute("addr3", addr[1]);
	}

	public void update(Member m,HttpServletRequest req) {
		String path = req.getSession().getServletContext().getRealPath("resources/img");
		MultipartRequest mr = null;
		try {
			mr = new MultipartRequest(req, path, 31457280, "utf-8", new DefaultFileRenamePolicy());
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "수정실패[프사]");
			return;
		}
		Member m2 = (Member) req.getSession().getAttribute("loginMember");
		String oldFile = m2.getM_photo();
		String newFile = null;
		try {
			String id = mr.getParameter("m_id");
			m.setM_id(id);
			String pw = mr.getParameter("m_pw");
			m.setM_pw(pw);
			String name = mr.getParameter("m_name");
			m.setM_name(name);
			String birth1 = mr.getParameter("m_birth1");
			String birth2 = mr.getParameter("m_birth2");
			String addr1 = mr.getParameter("m_addr1");
			String addr2 = mr.getParameter("m_addr2");
			String addr3 = mr.getParameter("m_addr3");
			String addr = addr2 + "!" + addr3 + "!" + addr1;
			m.setM_addr(addr);
			int birth22 = Integer.parseInt(birth2);
			birth22 = (birth22 % 2 == 0) ? birth22 - 1 : birth22;
			if (birth22 == 1) {
				birth1 = 19 + birth1;
			} else {
				birth1 = 20 + birth1;
			}
			Date birth = new SimpleDateFormat("yyyyMMdd").parse(birth1);
			m.setM_birth(birth);

			newFile = mr.getFilesystemName("m_photo");
			if (newFile == null) {
				newFile = oldFile;
			} else {
				newFile = URLEncoder.encode(newFile, "utf-8").replace("+", " ");
			}
			m.setM_photo(newFile);
			//
			if (ss.getMapper(MemberMapper.class).update(m) == 1) {
				req.getSession().setAttribute("loginMember", m);
				// 성공
				if (!newFile.equals(oldFile)) { // 프사수정
					// 순수 java
					// 웹상의 상대경로를 못알아봄 : 절대경로 사용해야
					// 톰캣때문에 해놓은 한글처리 못알어봄 : 원상복구
					oldFile = URLDecoder.decode(oldFile, "utf-8");
					File f = new File(path + "/" + oldFile);
					f.delete();
				}
			} else {
				// 실패
				if (!newFile.equals(oldFile)) {
					newFile = URLDecoder.decode(newFile, "utf-8");
					File f = new File(path + "/" + newFile);
					f.delete();
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			if (!newFile.equals(oldFile)) {
				try {
					newFile = URLDecoder.decode(newFile, "utf-8");
				} catch (Exception e1) {
					e1.printStackTrace();
				}
				File f = new File(path + "/" + newFile);
				f.delete();
			}
		}
	}
}

