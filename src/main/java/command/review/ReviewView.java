package command.review;

import javax.servlet.http.HttpServletRequest;

import common.CommonExecute;
import dao.ReviewDao;
import dto.ReviewDto;

public class ReviewView implements CommonExecute {

	@Override
	public void execute(HttpServletRequest request) {
		ReviewDao dao= ReviewDao.getDao();
		String no=request.getParameter("t_no");
		 String gubun=request.getParameter("t_gubun");
	      if(gubun.equals("reviewview")) {
	    	  int result = dao.setViewCount(no);
		      if(result != 1) System.out.println("공지사항 조회수 증가 오류."); 
	      }
		ReviewDto dto = dao.getView(no);
		request.setAttribute("dto", dto);
	}

}
