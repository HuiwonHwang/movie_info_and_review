package command.member;

import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import common.CommonExecute;
import common.CommonUtil;
import dao.MemberDao;

public class MemberLogin implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		MemberDao dao= MemberDao.getDao();
		String id=request.getParameter("id");
		String password=request.getParameter("password");
		try {
			password=CommonUtil.encryptSHA256(password);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String nickname=dao.getNickname(id,password);
		String msg="",url="";
		if(!nickname.equals("")) {
			msg=nickname+"님 환영합니다.";
			url="Index";
			HttpSession session = request.getSession();
			session.setAttribute("sessionId", id);
			session.setAttribute("sessionName", nickname);
			if(id.equals("manager")) {
				session.setAttribute("sessionLevel", "top");
			}
			session.setMaxInactiveInterval(60*60*4);
		}else {
			msg="ID나 비밀번호가 일치하지 않습니다.";
			url="Member";
		}
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", url);
	}

}
