<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common_head.jsp"%>
<link href="review/review_view.css" rel="stylesheet">
<%@include file="../common_header.jsp"%>

<form name="review">
<input type="hidden" name="t_no" value="${dto.getReview_no()}">
<input type="hidden" name="t_gubun">
<div id="reviewWrite">

    <h2>리뷰</h2>

    

     <table>

            <tr>
                <th>영화</th>
                <td colspan="3">
                    ${dto.getMovieNm() }
                </td>
            </tr>

            <tr>
                <th>제목</th>
                <td colspan="3">
                    ${dto.getReview_title() }
                </td>
            </tr>

			<tr>
			    <th>별점</th>
			    <td colspan="3">
			
			        <span id="score">${dto.getScore() }점</span>
			
			    </td>
			</tr>

            <tr>
                <th>내용</th>
                <td colspan="3">
                    <textarea name="content" disabled>${dto.getReview_content() }</textarea>
                </td>
            </tr>

        </table>
<div class="reviewInfo">
    <span>작성자 ${dto.getNickname()}</span>
    <span>작성일 <fmt:formatDate value="${dto.getReg_date()}" pattern="yyyy-MM-dd HH:mm"/></span>
    <span>조회 ${dto.getView_count()}</span>
</div>
<div class="recommendArea">
    <div class="recommendCount">
        👍 <span>${dto.getRecommend_count()}</span>
    </div>

    <input type="button"
           value="추천"
           onclick="recommendReview('${dto.getReview_no()}')">
</div>
        <div class="btnArea">
	<c:if test="${sessionName eq dto.getNickname()}">
            <input type="button" onclick="updateReviewForm('${dto.getReview_no()}')" value="수정">
			<input type="button" onclick="deleteReview()" value="삭제">
	</c:if>
        </div>
    

</div>
</form>
<footer>
	<%@include file="../common_footer.jsp"%>
</footer>
<script type="text/javascript" src="js/review.js"></script>

</body>
</html>
