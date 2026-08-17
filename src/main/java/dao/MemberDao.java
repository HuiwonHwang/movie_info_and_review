package dao;

import java.sql.Connection;
import java.sql.ResultSet;

import common.DBConnection;
import dto.MemberDto;

public class MemberDao {
	private MemberDao(){}
	private static MemberDao dao= new MemberDao();
	public static MemberDao getDao() {
		return dao;
	}
	
	Connection con= null;
	//PreparedStatement ps=null;
	LogPreparedStatement ps= null;
	ResultSet rs=null;
	
	
	public int checkId(String id) {
		int count=0;
		String sql="select count(*) as count from my_황희원_member where id=?";
		try {
			con=DBConnection.getConnection();
			ps=new LogPreparedStatement(con, sql);
			ps.setString(1, id);
			rs=ps.executeQuery();
			if(rs.next())count=rs.getInt("count");
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error: "+ ps.toString());
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return count;
	}


	public int memberSave(MemberDto dto) {
		int result=0;
		String sql="insert into my_황희원_member ( id, nickname, password,email_1, email_2, reg_date,favorite_movie,cinema) values (?,?,?,?,?,sysdate,?,?)";
		String sqlGenre ="insert into my_황희원_member_genre (id, genre_no) values (?, ?)";

		try {

		    con = DBConnection.getConnection();
		    con.setAutoCommit(false);

		    // 회원 INSERT
		    ps = new LogPreparedStatement(con, sql);

		    ps.setString(1, dto.getId());
		    ps.setString(2, dto.getNickname());
		    ps.setString(3, dto.getPassword());
		    ps.setString(4, dto.getEmail_1());
		    ps.setString(5, dto.getEmail_2());
		    ps.setString(6, dto.getFavorite_movie());
		    ps.setString(7, dto.getCinema());

		    ps.executeUpdate();


		    // 장르 INSERT
		    ps = new LogPreparedStatement(con, sqlGenre);

		    if(dto.getGenre_1() != 0) {
		        ps.setString(1, dto.getId());
		        ps.setInt(2, dto.getGenre_1());
		        ps.executeUpdate();
		    }

		    if(dto.getGenre_2() != 0) {
		        ps.setString(1, dto.getId());
		        ps.setInt(2, dto.getGenre_2());
		        ps.executeUpdate();
		    }

		    if(dto.getGenre_3() != 0) {
		        ps.setString(1, dto.getId());
		        ps.setInt(2, dto.getGenre_3());
		        ps.executeUpdate();
		    }


		    con.commit();

		        result = 1;

		    } catch (Exception e) {

		        e.printStackTrace();

		        try {
		            con.rollback();
		        } catch (Exception e2) {
		            e2.printStackTrace();
		        }

		    } finally {

		        DBConnection.closeDB(con, ps, rs);

		    }

		    return result;
			}


	public String getNickname(String id, String password) {
		String nickname="";
		String sql="select nickname from my_황희원_member where id=? and password=? ";
		try {
			con=DBConnection.getConnection();
			ps=new LogPreparedStatement(con, sql);
			ps.setString(1, id);
			ps.setString(2, password);
			rs=ps.executeQuery();
			if(rs.next()) {
				nickname=rs.getString("nickname");
			}
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error:"+ps.toString());
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return nickname;
	}


	public MemberDto getMemberInfo(String id) {

	    MemberDto dto = null;

	    String sql =
	        "select m.id, m.nickname,m.password, m.email_1, m.email_2, " +
	        "m.favorite_movie, m.cinema, " +
	        "g.genre_no, g.genre_name " +
	        "from my_황희원_member m " +
	        "left join my_황희원_member_genre mg " +
	        "on m.id = mg.id " +
	        "left join my_황희원_genre g " +
	        "on mg.genre_no = g.genre_no " +
	        "where m.id = ? " +
	        "order by g.genre_no";

	    try {

	        con = DBConnection.getConnection();

	        ps = new LogPreparedStatement(con, sql);
	        ps.setString(1, id);

	        rs = ps.executeQuery();

	        int count = 0;

	        while (rs.next()) {

	            // 회원 기본정보
	            if (dto == null) {

	                dto = new MemberDto();

	                dto.setId(rs.getString("id"));
	                dto.setNickname(rs.getString("nickname"));
	                dto.setPassword(rs.getString("password"));
	                dto.setEmail_1(rs.getString("email_1"));
	                dto.setEmail_2(rs.getString("email_2"));
	                dto.setFavorite_movie(rs.getString("favorite_movie"));
	                dto.setCinema(rs.getString("cinema"));

	                // 장르 기본값
	                dto.setGenre_1(0);
	                dto.setGenre_2(0);
	                dto.setGenre_3(0);

	                dto.setGenre_name_1("");
	                dto.setGenre_name_2("");
	                dto.setGenre_name_3("");
	            }

	            // 장르를 선택하지 않은 회원
	            if (rs.getObject("genre_no") == null) {
	                continue;
	            }

	            int genreNo = rs.getInt("genre_no");
	            String genreName = rs.getString("genre_name");

	            // 첫 번째 장르
	            if (count == 0) {

	                dto.setGenre_1(genreNo);
	                dto.setGenre_name_1(genreName);

	            // 두 번째 장르
	            } else if (count == 1) {

	                dto.setGenre_2(genreNo);
	                dto.setGenre_name_2(genreName);

	            // 세 번째 장르
	            } else if (count == 2) {

	                dto.setGenre_3(genreNo);
	                dto.setGenre_name_3(genreName);
	            }

	            count++;
	        }

	    } catch (Exception e) {

	        e.printStackTrace();
	        System.out.println("Error : " + e.getMessage());

	    } finally {

	        DBConnection.closeDB(con, ps, rs);
	    }

	    return dto;
	}


	public int memberUpdate(MemberDto dto) {
		int result=0;
		String sql="update my_황희원_member set nickname=?, email_1=?, email_2=?, update_date=sysdate,favorite_movie=?,cinema=? where id=?";
		String delGenre="delete from MY_황희원_MEMBER_GENRE where id=?";
		String sqlGenre ="insert into my_황희원_member_genre (id, genre_no) values (?, ?)";

		try {

		    con = DBConnection.getConnection();
		    con.setAutoCommit(false);

		    // 회원 INSERT
		    ps = new LogPreparedStatement(con, sql);

		    ps.setString(1, dto.getNickname());
		    ps.setString(2, dto.getEmail_1());
		    ps.setString(3, dto.getEmail_2());
		    ps.setString(4, dto.getFavorite_movie());
		    ps.setString(5, dto.getCinema());
		    ps.setString(6, dto.getId());
		    ps.executeUpdate();

		    //회원 선호장르 DELETE
		    ps= new LogPreparedStatement(con, delGenre);
		    ps.setString(1, dto.getId());
		    ps.executeUpdate();
		    
		    // 장르 INSERT
		    ps = new LogPreparedStatement(con, sqlGenre);

		    if(dto.getGenre_1() != 0) {
		        ps.setString(1, dto.getId());
		        ps.setInt(2, dto.getGenre_1());
		        ps.executeUpdate();
		    }

		    if(dto.getGenre_2() != 0) {
		        ps.setString(1, dto.getId());
		        ps.setInt(2, dto.getGenre_2());
		        ps.executeUpdate();
		    }

		    if(dto.getGenre_3() != 0) {
		        ps.setString(1, dto.getId());
		        ps.setInt(2, dto.getGenre_3());
		        ps.executeUpdate();
		    }


		    con.commit();

		        result = 1;

		    } catch (Exception e) {

		        e.printStackTrace();

		        try {
		            con.rollback();
		        } catch (Exception e2) {
		            e2.printStackTrace();
		        }

		    } finally {

		        DBConnection.closeDB(con, ps, rs);

		    }

		    return result;
			}


	public int memberDelete(String id) {
		int result=0;
		//String delGenre="delete from MY_황희원_MEMBER_GENRE where id=?";
		//String sql="delete from my_황희원_member where id=?";
		String sql="update my_황희원_member set exit_date=sysdate where id=?";
		

		try {

		    con = DBConnection.getConnection();
//		    con.setAutoCommit(false);

		    
//		    //회원 선호장르 DELETE
//		    ps= new LogPreparedStatement(con, delGenre);
//		    ps.setString(1, id);
//		    ps.executeUpdate();
//		    
		    // 회원 exit_date update
		    ps = new LogPreparedStatement(con, sql);

		    ps.setString(1, id);
		    ps.executeUpdate();

		   
		    con.commit();

		        result = 1;

		    } catch (Exception e) {

		        e.printStackTrace();

		        try {
		            con.rollback();
		        } catch (Exception e2) {
		            e2.printStackTrace();
		        }

		    } finally {

		        DBConnection.closeDB(con, ps, rs);

		    }

		    return result;
			}


	public String getId(String email_1, String email_2, String favorite_movie) {
		String id="";
		String sql="select id from my_황희원_member where email_1=? and email_2=? and favorite_movie =?";
		try {
			con=DBConnection.getConnection();
			ps= new LogPreparedStatement(con, sql);
			ps.setString(1,email_1 );
			ps.setString(2, email_2);
			ps.setString(3, favorite_movie);
			rs=ps.executeQuery();
			if(rs.next()) {
				id=rs.getString("id");
			}
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error:"+ps.toString());
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return id;
	}
	
	
	
}
