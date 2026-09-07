package command.member;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.MemberDao;

public class MemberFindPassword implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		MemberDao dao=MemberDao.getDao();
		String id=request.getParameter("id");
		String email=request.getParameter("email");
		String email_1 = email.substring(0, email.indexOf("@"));   
		String email_2 = email.substring(email.indexOf("@")+ 1);
		
		String password=dao.getPassword(id,email_1,email_2);
		request.setAttribute("t_msg","비밀번호는 는 "+ password+" 입니다!");
		request.setAttribute("t_url","Member");
		
	}

}
