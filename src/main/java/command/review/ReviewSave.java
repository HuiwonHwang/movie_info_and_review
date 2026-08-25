package command.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import common.CommonExecute;
import dao.ReviewDao;
import dto.ReviewDto;

public class ReviewSave implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		ReviewDao dao= ReviewDao.getDao();
		
		String member_id=(String)request.getSession().getAttribute("sessionId");
		String movie=request.getParameter("movie");
		if (movie != null) {
			movie = movie.trim();
		}
		String movieCd=(movie == null || movie.isEmpty()) ? null : dao.getOrCreateMovieCd(movie);
		String title=request.getParameter("title");
		double score=Double.parseDouble(request.getParameter("score"));
		String content=request.getParameter("content");
		ReviewDto dto = new ReviewDto();
		dto.setMember_id(member_id);
		dto.setMovieCd(movieCd);
		dto.setReview_title(title);
		dto.setScore(score);
		dto.setReview_content(content);
		int review_no=movieCd != null ? dao.insertReview(dto) : 0;
		String msg=review_no!=0?"작성 성공!":"작성 실패!";
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "Review");
		request.setAttribute("t_gubun", "reviewview");
		request.setAttribute("t_no", review_no);
		
		
	}

}
