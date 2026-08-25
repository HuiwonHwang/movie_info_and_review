package command.review;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.ReviewDao;
import dto.ReviewDto;

public class ReviewList implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		ReviewDao dao = ReviewDao.getDao();
		List<ReviewDto> dtos=dao.getList();
		request.setAttribute("dtos", dtos);
		
	}

}
