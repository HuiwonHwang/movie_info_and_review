package command.review;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import common.CommonUtil;
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
		/* paging 설정 start*/
		int totalCount = dao.getTotalCount(movieSearch);
		int list_setup_count = 5;  //한페이지당 출력 행수 
		int pageNumber_count = 3;  //한페이지당 출력 페이지 갯수
		
		String nowPage = request.getParameter("t_nowPage");
		int current_page = 0; // 현재페이지 번호
		int total_page = 0;    // 전체 페이지 수
		
		if(nowPage == null || nowPage.equals("")) current_page = 1; 
		else current_page = Integer.parseInt(nowPage);
		
		total_page = totalCount / list_setup_count;  // 몫 : 2
		int rest = 	totalCount % list_setup_count;   // 나머지:1
		if(rest !=0) total_page = total_page + 1;     // 3
		if (total_page > 0 && current_page > total_page) {
			current_page = total_page;
		}
		
		int start = (current_page -1) * list_setup_count + 1;
		int end   = current_page * list_setup_count;
		/* paging 설정 end*/	
		int order = totalCount - (start-1);
		
		List<ReviewDto> dtos=dao.getList(movieSearch, start, end);
		String pageDisplay=CommonUtil.getPageSetting(current_page, total_page, pageNumber_count);
		request.setAttribute("pageDisplay", pageDisplay);
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("order", order);
		request.setAttribute("dtos", dtos);
		request.setAttribute("movieSearch", movieSearch);
		
	}

}
