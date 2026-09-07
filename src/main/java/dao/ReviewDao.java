package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import common.DBConnection;
import dto.ReviewDto;

public class ReviewDao {
	private ReviewDao(){}
	private static ReviewDao dao= new ReviewDao();
	public static ReviewDao getDao() {
		return dao;
	}
	
	Connection con= null;
	//PreparedStatement ps=null;
	LogPreparedStatement ps= null;
	ResultSet rs=null;
	
	public String getMovieCd(String movie) {
		String movieCd=null;
		String sql="select movieCd from my_황희원_movie where movieNm=?";
		try {
			con=DBConnection.getConnection();
			ps=new LogPreparedStatement(con, sql);
			ps.setString(1, movie);
			rs=ps.executeQuery();
			if(rs.next()) {
				movieCd=rs.getString("movieCd");
			}
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error: "+ ps.toString());
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return movieCd;
	}

	/**
	 * 영화명이 이미 있으면 기존 코드를 반환하고, 없으면 영화를 등록한 뒤 새 코드를 반환한다.
	 */
	public String getOrCreateMovieCd(String movieNm) {
		String movieCd = getMovieCd(movieNm);
		if (movieCd != null) {
			return movieCd;
		}

		String seqSql = "select my_황희원_movie_seq.nextval from dual";
		String insertSql = "insert into my_황희원_movie (movieCd, movieNm, openDt) values (?, ?, sysdate)";
		try {
			con = DBConnection.getConnection();

			ps = new LogPreparedStatement(con, seqSql);
			rs = ps.executeQuery();
			if (rs.next()) {
				// 기존 영화 코드(영화진흥위원회 코드 등)는 숫자일 수 있으므로 새 코드는 별도 접두어를 사용한다.
				movieCd = "U" + rs.getString(1);
			}
			rs.close();
			ps.close();
			rs = null;
			ps = null;

			ps = new LogPreparedStatement(con, insertSql);
			ps.setString(1, movieCd);
			ps.setString(2, movieNm);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			movieCd = null;
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return movieCd;
	}

	public int insertReview(ReviewDto dto) {

	    int reviewNo = 0;
	    int generatedReviewNo = 0;

	    String seqSql =
	        "select my_황희원_review_seq.nextval from dual";

	    String sql =
	        "insert into my_황희원_review "
	      + "(review_no, movieCd, member_id, review_title, review_content, score) "
	      + "values (?, ?, ?, ?, ?, ?)";

	    try {

	        con = DBConnection.getConnection();

	        // 시퀀스 번호 가져오기
	        ps = new LogPreparedStatement(con, seqSql);
	        rs = ps.executeQuery();

	        if (rs.next()) {
	            generatedReviewNo = rs.getInt(1);
	        }

	        rs.close();
	        ps.close();

	        rs = null;
	        ps = null;

	        // 리뷰 등록
	        ps = new LogPreparedStatement(con, sql);

	        ps.setInt(1, generatedReviewNo);
	        ps.setString(2, dto.getMovieCd());
	        ps.setString(3, dto.getMember_id());
	        ps.setString(4, dto.getReview_title());
	        ps.setString(5, dto.getReview_content());
	        ps.setDouble(6, dto.getScore());

	        if (ps.executeUpdate() == 1) {
	            reviewNo = generatedReviewNo;
	        }

	    } catch (Exception e) {

	        e.printStackTrace();

	    } finally {

	        DBConnection.closeDB(con, ps, rs);

	    }

	    return reviewNo;
	}

	public ReviewDto getView(String no) {
		ReviewDto dto = null;
		String sql="select v.movieNm,r.review_no,r.review_title,r.review_content,r.score,r.reg_date,m.nickname,r.view_count from my_황희원_movie v,my_황희원_member m,my_황희원_review r where v.movieCd=r.movieCd and m.id=r.member_id and r.review_no=? order by r.reg_date desc";
		try {
			con=DBConnection.getConnection();
			ps=new LogPreparedStatement(con, sql);
			ps.setString(1, no);
			rs=ps.executeQuery();
			if(rs.next()) {
				int review_no=rs.getInt("review_no");
				int view_count=rs.getInt("view_count");
				String movieNm=rs.getString("movieNm");
				String review_title=rs.getString("review_title");
				String review_content=rs.getString("review_content");
				Double score=rs.getDouble("score");
				Timestamp reg_date=rs.getTimestamp("reg_date");
				String nickname=rs.getString("nickname");
				dto= new ReviewDto();
				dto.setReview_no(review_no);
				dto.setView_count(view_count);
				dto.setMovieNm(movieNm);
				dto.setReview_title(review_title);
				dto.setReview_content(review_content);
				dto.setScore(score);
				dto.setReg_date(reg_date);
				dto.setNickname(nickname);
			}
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error: "+ps.toString());
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return dto;
	}

	/**
	 * 목록 정렬(작성일 내림차순) 기준으로 이전글 또는 다음글을 조회한다.
	 * 이전글은 한 단계 오래된 글(+1), 다음글은 한 단계 최신 글(-1)이다.
	 */
	public ReviewDto getPreNextReview(String no, int direction) {
		ReviewDto dto = null;
		String orderedReviews = "select review_no, review_title, "
				+ "row_number() over (order by reg_date desc, review_no desc) as row_num "
				+ "from my_황희원_review";
		String sql = "select review_no, review_title from (" + orderedReviews + ") "
				+ "where row_num = (select row_num + ? from (" + orderedReviews + ") where review_no = ?)";
		try {
			con = DBConnection.getConnection();
			ps = new LogPreparedStatement(con, sql);
			ps.setInt(1, direction);
			ps.setString(2, no);
			rs = ps.executeQuery();
			if (rs.next()) {
				dto = new ReviewDto();
				dto.setReview_no(rs.getInt("review_no"));
				dto.setReview_title(rs.getString("review_title"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getPreNextReview() 오류: " + ps);
		} finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return dto;
	}

	public List<ReviewDto> getList() {
		return getList(null);
	}

	public List<ReviewDto> getList(String movieSearch) {
		return getList(movieSearch, 1, Integer.MAX_VALUE);
	}

	public List<ReviewDto> getList(String movieSearch, int start, int end) {
		List<ReviewDto> dtos=new ArrayList<>();
		String sql="select * from (select rownum as rnum, a.* from ("
				+ "select v.movieNm,r.review_no,r.review_title,r.score,r.reg_date,m.nickname,r.recommend_count,r.view_count "
				+ "from my_황희원_movie v,my_황희원_member m,my_황희원_review r "
				+ "where v.movieCd=r.movieCd and m.id=r.member_id";
		if (movieSearch != null && !movieSearch.isEmpty()) {
			sql += " and v.movieNm like ?";
		}
		sql += " order by r.reg_date desc) a where rownum <= ?) where rnum >= ?";
		try {
			con=DBConnection.getConnection();
			ps=new LogPreparedStatement(con, sql);
			int parameterIndex = 1;
			if (movieSearch != null && !movieSearch.isEmpty()) {
				ps.setString(parameterIndex++, "%" + movieSearch + "%");
			}
			ps.setInt(parameterIndex++, end);
			ps.setInt(parameterIndex, start);
			rs=ps.executeQuery();
			while(rs.next()) {
				int review_no=rs.getInt("review_no");
				String movieNm = rs.getString("movieNm");
				double score = rs.getDouble("score");
				String review_title= rs.getString("review_title");
				Timestamp reg_date= rs.getTimestamp("reg_date");
				String nickname= rs.getString("nickname");
				int view_count= rs.getInt("view_count");
				int recommend_count= rs.getInt("recommend_count");
				
				ReviewDto dto=new ReviewDto();
				dto.setReview_no(review_no);
				dto.setMovieNm(movieNm);
				dto.setReview_title(review_title);
				dto.setScore(score);
				dto.setReg_date(reg_date);
				dto.setNickname(nickname);
				dto.setRecommend_count(recommend_count);
				dto.setView_count(view_count);
				dtos.add(dto);
			}
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error: "+ps.toString());
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return dtos;
	}

	public int deleteReview(String review_no) {
		int result=0;
		String sql="delete from my_황희원_review where review_no=?";
		try {
			con=DBConnection.getConnection();
			ps=new LogPreparedStatement(con, sql);
			ps.setString(1, review_no);
			result=ps.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error: "+ps.toString());
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return result;
	}

	public int updateReview(ReviewDto dto) {
		int result=0;
		String sql="update my_황희원_review set review_title=?,review_content=?,score=?,update_date=sysdate  where review_no=?";
		try {
			con=DBConnection.getConnection();
			ps=new LogPreparedStatement(con, sql);
			ps.setString(1, dto.getReview_title());
			ps.setString(2, dto.getReview_content());
			ps.setDouble(3, dto.getScore());
			ps.setInt(4, dto.getReview_no());
			result=ps.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error: "+ps.toString());
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return result;
	}
	public int setViewCount(String no) {
		int result=0;
		String sql="update my_황희원_review set view_count=view_count+1 where review_no=? ";
		try {
			con=DBConnection.getConnection();
			ps=new LogPreparedStatement(con, sql);
			ps.setString(1,no);
			result=ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("Error: "+sql);
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return result;
	}
	public int getTotalCount(String search) {
		int count=0;
		String sql="select count(*) as count from my_황희원_review r,my_황희원_movie v where r.movieCd=v.movieCd";
		if (search != null && !search.isEmpty()) {
			sql += " and v.movieNm like ?";
		}
		try {
			con=DBConnection.getConnection();
			ps=new LogPreparedStatement(con, sql);
			if (search != null && !search.isEmpty()) {
				ps.setString(1, "%" + search + "%");
			}
			rs=ps.executeQuery();
			if(rs.next()) {
				count=rs.getInt("count");
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("Error: "+sql);
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}		
		return count;
	}
	
	
	
	
}
