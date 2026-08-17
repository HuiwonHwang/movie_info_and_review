package dto;

public class MemberDto {
	private String id,nickname,password,email_1,email_2,favorite_movie,cinema,reg_date,update_date,exit_date;
	private int genre_1,genre_2,genre_3;
	private String genre_name_1,genre_name_2,genre_name_3;
	public String getId() {
		return id;
	}
	public String getNickname() {
		return nickname;
	}
	public String getPassword() {
		return password;
	}
	public String getEmail_1() {
		return email_1;
	}
	public String getEmail_2() {
		return email_2;
	}
	public String getFavorite_movie() {
		return favorite_movie;
	}
	public String getCinema() {
		return cinema;
	}
	public String getReg_date() {
		return reg_date;
	}
	public String getUpdate_date() {
		return update_date;
	}
	public String getExit_date() {
		return exit_date;
	}
	public int getGenre_1() {
		return genre_1;
	}
	public int getGenre_2() {
		return genre_2;
	}
	public int getGenre_3() {
		return genre_3;
	}
	public String getGenre_name_1() {
		return genre_name_1;
	}
	public void setGenre_name_1(String genre_name_1) {
		this.genre_name_1 = genre_name_1;
	}
	public String getGenre_name_2() {
		return genre_name_2;
	}
	public void setGenre_name_2(String genre_name_2) {
		this.genre_name_2 = genre_name_2;
	}
	public String getGenre_name_3() {
		return genre_name_3;
	}
	public void setGenre_name_3(String genre_name_3) {
		this.genre_name_3 = genre_name_3;
	}
	public MemberDto(String id, String nickname, String password, String email_1, String email_2, String favorite_movie,
			String cinema, String reg_date, String update_date, String exit_date, int genre_1, int genre_2,
			int genre_3) {
		super();
		this.id = id;
		this.nickname = nickname;
		this.password = password;
		this.email_1 = email_1;
		this.email_2 = email_2;
		this.favorite_movie = favorite_movie;
		this.cinema = cinema;
		this.reg_date = reg_date;
		this.update_date = update_date;
		this.exit_date = exit_date;
		this.genre_1 = genre_1;
		this.genre_2 = genre_2;
		this.genre_3 = genre_3;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setEmail_1(String email_1) {
		this.email_1 = email_1;
	}
	public void setEmail_2(String email_2) {
		this.email_2 = email_2;
	}
	public void setFavorite_movie(String favorite_movie) {
		this.favorite_movie = favorite_movie;
	}
	public void setCinema(String cinema) {
		this.cinema = cinema;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}
	public void setExit_date(String exit_date) {
		this.exit_date = exit_date;
	}
	public void setGenre_1(int genre_1) {
		this.genre_1 = genre_1;
	}
	public void setGenre_2(int genre_2) {
		this.genre_2 = genre_2;
	}
	public void setGenre_3(int genre_3) {
		this.genre_3 = genre_3;
	}
	public MemberDto() {
		super();
	}
	
	
}
