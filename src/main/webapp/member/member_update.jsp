<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common_head.jsp"%>
<link href="member/member_join.css" rel="stylesheet">
<script src="js/member.js"></script>
<%@include file="../common_header.jsp"%>


<form name="mem">
<input type="hidden" name="t_gubun">
<input type="hidden" name="id" value="${dto.getId() }">
<div id="join">

    <h2>정보 수정</h2>

    <p class="required">
        <span>*</span> 필수 입력 항목
    </p>

    <table>

        <tr>
            <th><span>*</span> 아이디</th>
            <td>
                ${dto.getId() }
            </td>
        </tr>

        <tr>
            <th><span>*</span> 닉네임</th>
            <td>
                <input type="text" name="nickname" size="12" value="${dto.getNickname()}">
            </td>
        </tr>


        <tr>
            <th><span>*</span> 이메일</th>
            <td>
                <input type="text" name="email_1" size="10" value="${dto.getEmail_1()}"> @

                <select name="email_2">
                	<option value="naver.com" <c:if test="${dto.getEmail_2() eq 'naver.com' }">selected</c:if>>naver.com</option>
                    <option value="gmail.com" <c:if test="${dto.getEmail_2() eq 'gmail.com' }">selected</c:if>>gmail.com</option>
                    <option value="hanmail.net" <c:if test="${dto.getEmail_2() eq 'hanmail.net' }">selected</c:if>>hanmail.net</option>
                    <option value="yahoo.net" <c:if test="${dto.getEmail_2() eq 'yahoo.net' }">selected</c:if>>yahoo.net</option>
                </select>
            </td>
        </tr>

        <tr>
            <th><span>*</span> 인생영화</th>
            <td>
                <input type="text" size="20" name="favorite_movie" value="${dto.getFavorite_movie()}">
            </td>
        </tr>

       <tr>
    <th>좋아하는 장르</th> 
    <td>

		<input type="checkbox" name="genre" onclick="count_check(this)" value="1"
			<c:if test="${dto.genre_1 eq 1 or dto.genre_2 eq 1 or dto.genre_3 eq 1}">checked</c:if>> SF
		
		<input type="checkbox" name="genre" onclick="count_check(this)" value="2"
			<c:if test="${dto.genre_1 eq 2 or dto.genre_2 eq 2 or dto.genre_3 eq 2}">checked</c:if>> 가족
		
		<input type="checkbox" name="genre" onclick="count_check(this)" value="3"
			<c:if test="${dto.genre_1 eq 3 or dto.genre_2 eq 3 or dto.genre_3 eq 3}">checked</c:if>> 공연
		
		<input type="checkbox" name="genre" onclick="count_check(this)" value="4"
			<c:if test="${dto.genre_1 eq 4 or dto.genre_2 eq 4 or dto.genre_3 eq 4}">checked</c:if>> 공포(호러)
		
		<input type="checkbox" name="genre" onclick="count_check(this)" value="5"
			<c:if test="${dto.genre_1 eq 5 or dto.genre_2 eq 5 or dto.genre_3 eq 5}">checked</c:if>> 다큐멘터리
		
		<br><br>
		
		<input type="checkbox" name="genre" onclick="count_check(this)" value="6"
			<c:if test="${dto.genre_1 eq 6 or dto.genre_2 eq 6 or dto.genre_3 eq 6}">checked</c:if>> 드라마
		
		<input type="checkbox" name="genre" onclick="count_check(this)" value="7"
			<c:if test="${dto.genre_1 eq 7 or dto.genre_2 eq 7 or dto.genre_3 eq 7}">checked</c:if>> 멜로/로맨스
		
		<input type="checkbox" name="genre" onclick="count_check(this)" value="8"
			<c:if test="${dto.genre_1 eq 8 or dto.genre_2 eq 8 or dto.genre_3 eq 8}">checked</c:if>> 뮤지컬
		
		<input type="checkbox" name="genre" onclick="count_check(this)" value="9"
			<c:if test="${dto.genre_1 eq 9 or dto.genre_2 eq 9 or dto.genre_3 eq 9}">checked</c:if>> 미스터리
		
		<input type="checkbox" name="genre" onclick="count_check(this)" value="10"
			<c:if test="${dto.genre_1 eq 10 or dto.genre_2 eq 10 or dto.genre_3 eq 10}">checked</c:if>> 범죄
		
		<br><br>
		
		<input type="checkbox" name="genre" onclick="count_check(this)" value="11"
			<c:if test="${dto.genre_1 eq 11 or dto.genre_2 eq 11 or dto.genre_3 eq 11}">checked</c:if>> 사극
		
		<input type="checkbox" name="genre" onclick="count_check(this)" value="12"
			<c:if test="${dto.genre_1 eq 12 or dto.genre_2 eq 12 or dto.genre_3 eq 12}">checked</c:if>> 서부극(웨스턴)
		
		<input type="checkbox" name="genre" onclick="count_check(this)" value="13"
			<c:if test="${dto.genre_1 eq 13 or dto.genre_2 eq 13 or dto.genre_3 eq 13}">checked</c:if>> 스릴러
		
		<input type="checkbox" name="genre" onclick="count_check(this)" value="14"
			<c:if test="${dto.genre_1 eq 14 or dto.genre_2 eq 14 or dto.genre_3 eq 14}">checked</c:if>> 애니메이션
		
		<input type="checkbox" name="genre" onclick="count_check(this)" value="15"
			<c:if test="${dto.genre_1 eq 15 or dto.genre_2 eq 15 or dto.genre_3 eq 15}">checked</c:if>> 액션
		
		<br><br>
		
		<input type="checkbox" name="genre" onclick="count_check(this)" value="16"
			<c:if test="${dto.genre_1 eq 16 or dto.genre_2 eq 16 or dto.genre_3 eq 16}">checked</c:if>> 어드벤처
		
		<input type="checkbox" name="genre" onclick="count_check(this)" value="17"
			<c:if test="${dto.genre_1 eq 17 or dto.genre_2 eq 17 or dto.genre_3 eq 17}">checked</c:if>> 전쟁
		
		<input type="checkbox" name="genre" onclick="count_check(this)" value="18"
			<c:if test="${dto.genre_1 eq 18 or dto.genre_2 eq 18 or dto.genre_3 eq 18}">checked</c:if>> 코미디
		
		<input type="checkbox" name="genre" onclick="count_check(this)" value="19"
			<c:if test="${dto.genre_1 eq 19 or dto.genre_2 eq 19 or dto.genre_3 eq 19}">checked</c:if>> 판타지
			<br>
            <small>최대 3개 선택</small>
    </td>
</tr>

        <tr>
            <th>선호 영화관</th>
            <td>

                <input type="radio" name="cinema" value="all"  <c:if test="${dto.getCinema() eq 'all' }">checked</c:if>> 상관없음

                <input type="radio" name="cinema" value="CGV" <c:if test="${dto.getCinema() eq 'CGV' }">checked</c:if>> CGV

                <input type="radio" name="cinema" value="lotte" <c:if test="${dto.getCinema() eq 'lotte' }">checked</c:if>> 롯데시네마

                <input type="radio" name="cinema" value="mega" <c:if test="${dto.getCinema() eq 'mega' }">checked</c:if>> 메가박스

            </td>
        </tr>

       
        
    </table>

    <div class="btnArea">
        <input type="button" onclick="memberUpdate()" value="수정">
        <input type="button" onclick="movePage('Member','info')" value="뒤로 가기">
    </div>

</div>

</form>
<footer>
	<%@include file="../common_footer.jsp"%>
</footer>
</body>
</html>
