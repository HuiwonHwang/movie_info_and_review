<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common_head.jsp"%>
<link href="member/member_info.css" rel="stylesheet">
<script src="js/member.js"></script>
<%@include file="../common_header.jsp"%>
<form name="mem">
<input type="hidden" name="t_gubun">
<input type="hidden" name="id" value="${dto.getId()}">
<input type="hidden" name="nickname" value="${dto.getNickname()}">
	<div id="memberInfo">

    <h2>내 정보</h2>

    <p class="infoText">
        내 정보
    </p>

    <table>

        <tr>
            <th>아이디</th>
            <td>
                ${dto.getId() }
            </td>
        </tr>

        <tr>
            <th>닉네임</th>
            <td>
                 ${dto.getNickname() }
            </td>
        </tr>

        <tr>
            <th>이메일</th>
            <td>
                 ${dto.getEmail_1() }

                @

                 ${dto.getEmail_2() }
            </td>
        </tr>

        <tr>
            <th>인생영화</th>
            <td>
                 ${dto.getFavorite_movie() }
            </td>
        </tr>

        <tr>
            <th>좋아하는 장르</th>
            <td>

				${dto.getGenre_name_1()},${dto.getGenre_name_2()},${dto.getGenre_name_3()}

            </td>
        </tr>

        <tr>
            <th>선호 영화관</th>
            <td>

                <c:if test="${dto.getCinema() eq 'all'}">상관없음</c:if>
                <c:if test="${dto.getCinema() eq 'mega'}">메가박스</c:if> 
                <c:if test="${dto.getCinema() eq 'lotte'}">롯데 시네마</c:if>
                <c:if test="${dto.getCinema() eq 'CGV'}">CGV</c:if>
            </td>
        </tr>

    </table>

    <div class="btnArea">

        <input type="button" onclick="movePage('Member','updateform')" value="정보 수정">

        <input type="button" onclick="memberDelete()" value="회원 탈퇴">

    </div>

</div>
</form>
<footer>
	<%@include file="../common_footer.jsp"%>
</footer>
</body>
</html>