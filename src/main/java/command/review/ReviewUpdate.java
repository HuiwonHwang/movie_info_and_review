package command.review;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.ReviewDao;
import dto.ReviewDto;

public class ReviewUpdate implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		ReviewDao dao= ReviewDao.getDao();
		String no=request.getParameter("t_no");
		int review_no=Integer.parseInt(no);
		String title=request.getParameter("title");
		double score=Double.parseDouble(request.getParameter("score"));
		String content=request.getParameter("content");
		ReviewDto dto = new ReviewDto();
		dto.setReview_no(review_no);
		dto.setReview_title(title);
		dto.setScore(score);
		dto.setReview_content(content);
		int result=dao.updateReview(dto);
		String msg=result==1?"수정 되었습니다.":"수정 실패!";
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "Review");
		request.setAttribute("t_gubun", "reviewview");
		request.setAttribute("t_no", review_no);
		

	}

}
