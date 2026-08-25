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
		String movieSearch = request.getParameter("movieSearch");
		if (movieSearch != null) {
			movieSearch = movieSearch.trim();
		}
		List<ReviewDto> dtos=dao.getList(movieSearch);
		request.setAttribute("dtos", dtos);
		request.setAttribute("movieSearch", movieSearch);
		
	}

}
