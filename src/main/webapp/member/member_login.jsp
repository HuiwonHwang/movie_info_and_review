<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common_head.jsp"%>
<link href="member/member_login.css" rel="stylesheet">
<script type="text/javascript" src="js/member.js"></script>

<%@include file="../common_header.jsp"%>
<form name="mem">
<input type="hidden" name="t_gubun">
<div id="login">

    <h2>로그인</h2>

    <table>

        <tr>
            <th>아이디</th>
            <td>
                <input type="text" name="id">
            </td>
        </tr>

        <tr>
            <th>비밀번호</th>
            <td>
                <input type="password" name="password">
            </td>
        </tr>

    </table>
<label>
    <input type="checkbox" name="saveId">
    아이디 저장
</label>
    <div class="loginBtn">
        <input type="button" onclick="goLogin()" value="로그인">
    </div>

    <div class="loginMenu">
        <a href="javascript:movePage('Member','join')">회원가입</a>
        <span>|</span>
        <a href="javascript:movePage('Member','findIdForm')">아이디 찾기</a>
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