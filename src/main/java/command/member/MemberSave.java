package command.member;

import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import common.CommonUtil;
import dao.MemberDao;
import dto.MemberDto;

public class MemberSave implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		MemberDao dao= MemberDao.getDao();
		String id=request.getParameter("id");
		String nickname=request.getParameter("nickname");
		String password=request.getParameter("password");
		try {
			password=CommonUtil.encryptSHA256(password);
		} catch (NoSuchAlgorithmException e) {
			System.out.println("회원가입 비밀번호 암호화 실패");
			e.printStackTrace();
		}
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
		
		
		MemberDto dto= new MemberDto(id, nickname, password, email_1, email_2, favorite_movie, cinema, "reg_date", "update_date", "exit_date", genre_1, genre_2, genre_3);
		
		int result=dao.memberSave(dto);
		
		String msg=result==1?nickname+"님 가입되셨습니다!":"가입실패!";
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "Member");

	}

}
