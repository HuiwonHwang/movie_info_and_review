package command.member;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.MemberDao;

public class MemberFindId implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		MemberDao dao=MemberDao.getDao();
		String email=request.getParameter("email");
		String favorite_movie=request.getParameter("favorite_movie");
		String email_1 = email.substring(0, email.indexOf("@"));   
		String email_2 = email.substring(email.indexOf("@")+ 1);
		
		String id=dao.getId(email_1,email_2,favorite_movie);
		request.setAttribute("t_msg","ID는 "+ id+" 입니다!");
		request.setAttribute("t_url","Member");
		
	}

}
