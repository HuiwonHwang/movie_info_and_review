package command.member;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import common.CommonExecute;
import dao.MemberDao;

public class MemberDelete implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		MemberDao dao = MemberDao.getDao();
		String id=request.getParameter("id");
		String nickname=request.getParameter("nickname");
		int result=dao.memberDelete(id);
		String msg=result==1?nickname+"님 회원 탈퇴 되셨습니다. ":"탈퇴 실패";		
		HttpSession session = request.getSession();
		session.invalidate();
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "Index");
	}

}
