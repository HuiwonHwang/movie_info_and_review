<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common_head.jsp"%>
<link href="member/member_join.css" rel="stylesheet">
<script src="js/member.js"></script>
<%@include file="../common_header.jsp"%>


<form name="mem">
<input type="hidden" name="t_gubun">
<div id="join">

    <h2>회원가입</h2>

    <p class="required">
        <span>*</span> 필수 입력 항목
    </p>

    <table>

        <tr>
            <th><span>*</span> 아이디</th>
            <td>
                <input type="text" name="id" oninput="setEmpty()" size="12">
                <input type="button" onclick="checkId()" value="중복확인">
                <input type="text" name="id_check" disabled size="5">
                <br>
                <small>영문, 숫자 4~12자</small>
            </td>
        </tr>

        <tr>
            <th><span>*</span> 닉네임</th>
            <td>
                <input type="text" name="nickname" size="12">
            </td>
        </tr>

        <tr>
            <th><span>*</span> 비밀번호</th>
            <td>
                <input type="password" name="password" size="15">
            </td>
        </tr>

        <tr>
            <th><span>*</span> 비밀번호 확인</th>
            <td>
                <input type="password" name="password_check" size="15">
            </td>
        </tr>

        <tr>
            <th><span>*</span> 이메일</th>
            <td>
                <input type="text" name="email_1" size="10"> @

                <select name="email_2">
                    <option value="naver.com">naver.com</option>
                    <option value="gmail.com">gmail.com</option>
                    <option value="hanmail.net">hanmail.net</option>
                    <option value="yahoo.net">yahoo.net</option>
                </select>
            </td>
        </tr>

        <tr>
            <th><span>*</span> 인생영화</th>
            <td>
                <input type="text" size="20" name="favorite_movie">
            </td>
        </tr>

       <tr>
    <th>좋아하는 장르</th>
    <td>

  			<input type="checkbox" name="genre" onclick="count_check(this)" value="1"> SF
			<input type="checkbox" name="genre" onclick="count_check(this)"  value="2"> 가족
			<input type="checkbox" name="genre" onclick="count_check(this)"  value="3"> 공연
			<input type="checkbox" name="genre" onclick="count_check(this)"  value="4"> 공포(호러)
			<input type="checkbox" name="genre" onclick="count_check(this)"  value="5"> 다큐멘터리
			
			<br><br>
			
			<input type="checkbox" name="genre" onclick="count_check(this)"  value="6"> 드라마
			<input type="checkbox" name="genre" onclick="count_check(this)"  value="7"> 멜로/로맨스
			<input type="checkbox" name="genre" onclick="count_check(this)"  value="8"> 뮤지컬
			<input type="checkbox" name="genre" onclick="count_check(this)"  value="9"> 미스터리
			<input type="checkbox" name="genre" onclick="count_check(this)"  value="10"> 범죄
			
			<br><br>
			
			<input type="checkbox" name="genre" onclick="count_check(this)"  value="11"> 사극
			<input type="checkbox" name="genre" onclick="count_check(this)"  value="12"> 서부극(웨스턴)
			<input type="checkbox" name="genre" onclick="count_check(this)"  value="13"> 스릴러
			<input type="checkbox" name="genre" onclick="count_check(this)"  value="14"> 애니메이션
			<input type="checkbox" name="genre" onclick="count_check(this)"  value="15"> 액션
			
			<br><br>
			
			<input type="checkbox" name="genre" onclick="count_check(this)"  value="16"> 어드벤처
			<input type="checkbox" name="genre" onclick="count_check(this)"  value="17"> 전쟁
			<input type="checkbox" name="genre" onclick="count_check(this)"  value="18"> 코미디
			<input type="checkbox" name="genre" onclick="count_check(this)"  value="19"> 판타지
			<br>
            <small>최대 3개 선택</small>
    </td>
</tr>

        <tr>
            <th>선호 영화관</th>
            <td>

                <input type="radio" name="cinema" value="all" checked> 상관없음

                <input type="radio" name="cinema" value="CGV"> CGV

                <input type="radio" name="cinema" value="lotte"> 롯데시네마

                <input type="radio" name="cinema" value="mega"> 메가박스

            </td>
        </tr>

        <tr>
            <th><span>*</span> 약관동의</th>
            <td>
                <input type="checkbox" name="agree">
                개인정보 수집 및 이용에 동의합니다.
            </td>
        </tr>

    </table>

    <div class="btnArea">
        <input type="button" onclick="memberJoin()" value="회원가입">
        <input type="reset" value="다시작성">
    </div>

</div>

</form>
<footer>
	<%@include file="../common_footer.jsp"%>
</footer>
</body>
</html>
