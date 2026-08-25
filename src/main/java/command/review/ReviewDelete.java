package command.review;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.ReviewDao;
import dto.ReviewDto;

public class ReviewDelete implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		ReviewDao dao= ReviewDao.getDao();
		String review_no=request.getParameter("t_no");
		int result=dao.deleteReview(review_no);
		String msg=result==1?"삭제되었습니다.":"삭제 실패!";
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "Review");
	}

}
