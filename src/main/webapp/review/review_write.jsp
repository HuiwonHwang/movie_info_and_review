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
<div id="reviewWrite">

    <h2>리뷰 작성</h2>

    

     <table>

            <tr>
                <th>영화</th>
                <td>
                    <input type="text" name="movie"
                           placeholder="영화 제목을 입력하세요">
                    <input type="button" value="영화 검색">
                </td>
            </tr>

            <tr>
                <th>제목</th>
                <td>
                    <input type="text" name="title"
                           class="titleInput"
                           placeholder="리뷰 제목을 입력하세요">
                </td>
            </tr>

			<tr>
			    <th>별점</th>
			    <td>
			
			      <div class="rating-box">
				
				    <div class="rating-control">
				        <input
				            type="range"
				            id="rating"
				            min="0.5"
				            max="5"
				            step="0.5"
				            value="0.5"
				        >
				        <span id="ratingValue">평점을 선택해주세요</span>
				         <input type="hidden" id="score" name="score" value="">
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
                <td>
                    <textarea name="content"
                              placeholder="영화에 대한 리뷰를 작성해주세요."></textarea>
                </td>
            </tr>

        </table>


        <div class="btnArea">

            <input type="button" onclick="goSave()" value="등록">

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
