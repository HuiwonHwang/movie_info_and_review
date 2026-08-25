<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common_head.jsp"%>
<link href="review/review_write.css" rel="stylesheet">
<script type="text/javascript" src="js/review.js"></script>
<%@include file="../common_header.jsp"%>
<c:if test="${empty sessionId }">
	<script>
		alert("로그인이 필요한 기능입니다.");
		location.href="Member";
	</script>
</c:if>
<c:if test="${not empty sessionId }">
<form name="review">
<input type="hidden" name="t_gubun">
<input type="hidden" name="t_no" value="${dto.getReview_no() }">
<div id="reviewWrite">

    <h2>리뷰 수정</h2>

    

     <table>

            <tr>
                <th>영화</th>
                <td colspan="3">
                    ${dto.getMovieNm()}
                </td>
            </tr>

            <tr>
                <th>제목</th>
                <td colspan="3">
                    <input type="text" name="title"
                           class="titleInput"
                            value="${dto.getReview_title()}">
                </td>
            </tr>

			<tr>
			    <th>별점</th>
			    <td colspan="3">
			
			      <div class="rating-box">
				
				    <div class="rating-control">
				        <input
				            type="range"
				            id="rating"
				            min="0.5"
				            max="5"
				            step="0.5"
				            value="${dto.getScore() }"
				        >
				        <span id="ratingValue">${dto.getScore()}점</span>
				         <input type="hidden" id="score" name="score" value="${dto.getScore()}">
				    </div>
				
				    <div class="rating-range">
				        <span>0.5</span>
				        <span>5.0</span>
				    </div>
				</div>
				<script type="text/javascript" src="js/review_Rating.js"></script>
			    </td>
			</tr>

            <tr>
                <th>내용</th>
                <td colspan="3">
                    <textarea name="content"> ${dto.getReview_content()}</textarea>
                </td>
            </tr>
			<tr>
                <th>작성자</th>
                <td>
                    ${dto.getNickname() }
                </td>
                <th>작성 일자</th>
                <td>
                    ${dto.getReg_date() }
                </td>
            </tr>
        </table>


        <div class="btnArea">

            <input type="button" onclick="updateReview('${dto.getReview_no()}')" value="수정">

            <input type="button"
                   value="취소"
                   onclick="history.back()">

        </div>
    

</div>
</form>
</c:if>
<footer>
	<%@include file="../common_footer.jsp"%>
</footer>


</body>
</html>
