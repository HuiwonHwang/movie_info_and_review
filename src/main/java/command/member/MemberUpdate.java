package command.member;

import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import common.CommonUtil;
import dao.MemberDao;
import dto.MemberDto;

public class MemberUpdate implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		MemberDao dao= MemberDao.getDao();
		String id=request.getParameter("id");
		String nickname=request.getParameter("nickname");
		String email_1=request.getParameter("email_1");
		String email_2=request.getParameter("email_2");
		String favorite_movie=request.getParameter("favorite_movie");
		String[] genres = request.getParameterValues("genre");
		int genre_1 = 0,genre_2=0,genre_3=0;
		if(genres!=null && genres.length<4) {
			if(genres.length >= 1) genre_1= Integer.parseInt(genres[0]);
			if(genres.length >= 2) genre_2= Integer.parseInt(genres[1]);
		    if(genres.length >= 3) genre_3= Integer.parseInt(genres[2]);
		}else {
			System.out.println("장르 등록 오류");
		}
		
		 
		String cinema=request.getParameter("cinema");
		MemberDto dto= new MemberDto(id, nickname, "password", email_1, email_2, favorite_movie, cinema, "reg_date", "sysdate", "exit_date", genre_1, genre_2, genre_3);

		int result=dao.memberUpdate(dto);
		
		String msg=result==1?"수정 성공":"수정 실패";
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "Member");
		request.setAttribute("t_gubun", "info");
		request.setAttribute("id", id);
	}

}
