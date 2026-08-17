<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common_head.jsp"%>
<link href="review/review_list.css" rel="stylesheet">
<%@include file="../common_header.jsp"%>
<script>
	function goView(gubun){
		review.t_gubun.value=gubun;
		review.method="post";
		review.action="Review";
		review.submit();
	}
</script>


<form name="review">
	<input type="hidden" name="t_gubun">
<div id="reviewList">

    <h2>리뷰 게시판</h2>

    <div class="searchArea">

        <span>영화 검색</span>

        <input type="text" name="movieSearch"
               placeholder="영화명을 입력하세요">

        <input type="button" value="검색">

        <input type="button" value="전체보기">

		<input type="button" value="글쓰기" onclick="movePage('Review','writeform')" class="writeBtn">

        <select name="sort">
            <option value="latest">최신글 순</option>
            <option value="view">조회수 순</option>
            <option value="recommend">추천수 순</option>
        </select>

        

    </div>


    <table class="reviewTable">

        <tr>
            <th width="60">No</th>
            <th width="150">영화</th>
            <th>리뷰 제목</th>
            <th width="100">작성자</th>
            <th width="70">조회</th>
            <th width="70">추천</th>
            <th width="100">작성일</th>
        </tr>

        <tr>
            <td>15</td>
            <td>HOPE</td>
            <td>
                <a href="javascript:goView('view')">반전이 엄청난 영화였습니다.</a>
            </td>
            <td>황희원</td>
            <td>182</td>
            <td>27</td>
            <td>26-08-07</td>
        </tr>

        <tr>
            <td>14</td>
            <td>도라에몽</td>
            <td>
                <a href="">어른도 재미있게 볼 수 있네요.</a>
            </td>
            <td>홍길동</td>
            <td>154</td>
            <td>21</td>
            <td>26-08-06</td>
        </tr>

        <tr>
            <td>13</td>
            <td>큐어</td>
            <td>
                <a href="">여운이 오래 남습니다.</a>
            </td>
            <td>김철수</td>
            <td>131</td>
            <td>15</td>
            <td>26-08-06</td>
        </tr>

        <tr>
            <td>12</td>
            <td>건담</td>
            <td>
                <a href="">팬이라면 꼭 봐야 합니다.</a>
            </td>
            <td>박영희</td>
            <td>95</td>
            <td>12</td>
            <td>26-08-05</td>
        </tr>

        <tr>
            <td>11</td>
            <td>위대한 쇼맨</td>
            <td>
                <a href="">OST가 정말 좋았습니다.</a>
            </td>
            <td>이민수</td>
            <td>83</td>
            <td>11</td>
            <td>26-08-04</td>
        </tr>

    </table>


    <div class="paging">

        <a href="">◀</a>
        <a href="">1</a>
        <a href="">2</a>
        <a href="">3</a>
        <a href="">4</a>
        <a href="">5</a>
        <a href="">▶</a>

    </div>

</div>

</form>

<footer>
	<%@include file="../common_footer.jsp"%>
</footer>
</body>
</html>