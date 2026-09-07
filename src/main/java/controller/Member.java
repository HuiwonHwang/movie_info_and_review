package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.member.MemberDelete;
import command.member.MemberFindId;
import command.member.MemberLogin;
import command.member.MemberLogout;
import command.member.MemberMyInfo;
import command.member.MemberSave;
import command.member.MemberUpdate;

/**
 * Servlet implementation class Member
 */
@WebServlet("/Member")
public class Member extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Member() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String viewPage = "";
		String gubun=request.getParameter("t_gubun");
		if(gubun==null)gubun="login";
		if(gubun.equals("login")) {
			viewPage="member/member_login.jsp";
		}else if(gubun.equals("findIdForm")) {
			viewPage="member/member_findId.jsp";
		}else if(gubun.equals("findId")) {
			MemberFindId mem=new MemberFindId();
			mem.execute(request);
			viewPage="common_alert.jsp";
		}else if(gubun.equals("join")) {
			viewPage="member/member_join.jsp";
		}else if(gubun.equals("info")) {
			String id= (String)request.getSession().getAttribute("sessionId");
			if(id==null) {
				String msg="로그인 정보가 만료되었습니다.";
				request.setAttribute("t_msg", msg);
				request.setAttribute("t_url", "Member");
				viewPage ="common_alert.jsp";
			}else {
				MemberMyInfo mem=new MemberMyInfo();
				mem.execute(request);
				viewPage="member/member_info.jsp";
			}

		}else if(gubun.equals("info")) {
			viewPage="member/member_info.jsp";
		}else if(gubun.equals("updateform")) {
			MemberMyInfo mem=new MemberMyInfo();
			mem.execute(request);
			viewPage="member/member_update.jsp";
		}else if(gubun.equals("memberUpdate")) {
			MemberUpdate mem=new MemberUpdate();
			mem.execute(request);
			viewPage="common_alert_view.jsp";
			}else if(gubun.equals("memberSave")) {
			MemberSave mem = new MemberSave();
			mem.execute(request);
			viewPage="common_alert.jsp";
		}else if(gubun.equals("memberlogin")) {
			MemberLogin mem = new MemberLogin();
			mem.execute(request);
			viewPage="common_alert.jsp";
		}else if(gubun.equals("logout")) {
			MemberLogout mem=new MemberLogout();
			mem.execute(request);
			viewPage="common_alert.jsp";
		}else if(gubun.equals("memberDelete")) {
			MemberDelete mem=new MemberDelete();
			mem.execute(request);
			viewPage="common_alert.jsp";
		}else if(gubun.equals("findPasswordForm")) {
			viewPage="member/member_findPassword.jsp";
		}else if(gubun.equals("findPassword")) {
			
		}

		
		
		RequestDispatcher rd= request.getRequestDispatcher(viewPage);
		rd.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
