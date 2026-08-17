<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common_head.jsp"%>
<link href="member/member_login.css" rel="stylesheet">
<script type="text/javascript" src="js/member.js"></script>

<%@include file="../common_header.jsp"%>
<form name="mem">
<input type="hidden" name="t_gubun">
<div id="login">

    <h2>ID 찾기</h2>

    <table>

        <tr>
            <th>이메일</th>
            <td>
				<input type="text" name="email"> 
                
            </td>
        </tr>

        <tr>
            <th>최애 영화</th>
            <td>
                <input type="text" name="favorite_movie">
            </td>
        </tr>

    </table>
    <div class="loginBtn">
        <input type="button" onclick="goFindId()" value="아이디 찾기">
    </div>

    <div class="loginMenu">
        <a href="javascript:movePage('Member','join')">회원가입</a>
        <span>|</span>
        <a href="javascript:movePage('Member','login')">로그인</a>
        <span>|</span>
        <a href="">비밀번호 찾기</a>
    </div>

</div>

</form>
<footer>
	<%@include file="../common_footer.jsp"%>
</footer>
</body>
</html>