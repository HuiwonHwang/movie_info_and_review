<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common_head.jsp"%>
<link href="review/review_list.css" rel="stylesheet">
<script src="js/review.js"></script>
<%@include file="../common_header.jsp"%>


<form name="review" onsubmit="searchMovie(); return false;">
	<input type="hidden" name="t_gubun">
	<input type="hidden" name="t_no">
	<input type="hidden" name="t_nowPage">
<div id="reviewList">

    <h2>리뷰 게시판</h2>

    <div class="searchArea">

        <span>영화 검색</span>

        <input type="text" name="movieSearch"
               value="<c:out value='${movieSearch}'/>"
               placeholder="영화명을 입력하세요">

        <input type="button" onclick="searchMovie()" value="검색">

        <input type="button" value="전체보기" onclick="showAllReviews()">

		<input type="button" value="글쓰기" onclick="movePage('Review','writeform')" class="writeBtn">

       <!--  <select name="sort">
            <option value="latest">최신글 순</option>
            <option value="view">조회수 순</option>
            <option value="recommend">추천수 순</option>
        </select> -->

        

    </div>


    <table class="reviewTable">

      <tr>
    <th width="60">No</th>
    <th width="200">영화</th>
    <th>리뷰 제목</th>
    <th width="70">평점</th>
    <th width="100">작성자</th>
    <th width="70">조회</th>
   <!--  <th width="70">추천</th> -->
    <th width="100">작성일</th>
</tr><c:set var="no" value="${order}"/>
<c:forEach items="${dtos }" var="dto">
      <tr>
    <td>${no}</td>
    <c:set value="${no - 1}" var="no"/>
    <td>${dto.getMovieNm()}</td>
    <td>
        <a href="javascript:goView('${dto.getReview_no()}')">
            ${dto.getReview_title()}
        </a>
    </td>
    <td>${dto.getScore()}점</td>
    <td>${dto.getNickname()}</td>
    <td>${dto.getView_count()}</td>
    <!-- <td>${dto.getRecommend_count()}</td> -->
    <td><fmt:formatDate value="${dto.getReg_date()}" pattern="yyyy-MM-dd"/></td>
</tr>
</c:forEach>
     

    </table>


    <div class="paging">
		${pageDisplay}
        <!-- <a href="">◀</a>
        <a href="">1</a>
        <a href="">2</a>
        <a href="">3</a>
        <a href="">4</a>
        <a href="">5</a>
        <a href="">▶</a> -->

    </div>

</div>

</form>

<footer>
	<%@include file="../common_footer.jsp"%>
</footer>
</body>
</html>
