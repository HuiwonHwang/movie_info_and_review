<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common_head.jsp"%>
<link href="review/review_write.css" rel="stylesheet">
<%@include file="../common_header.jsp"%>

<form name="review">
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
			
			        <div class="rating">
			
			            <label class="rating__label rating__label--half">
			                <input type="radio" name="rating" value="0.5">
			                <span class="star-icon"></span>
			            </label>
			
			            <label class="rating__label rating__label--full">
			                <input type="radio" name="rating" value="1">
			                <span class="star-icon"></span>
			            </label>
			
			            <label class="rating__label rating__label--half">
			                <input type="radio" name="rating" value="1.5">
			                <span class="star-icon"></span>
			            </label>
			
			            <label class="rating__label rating__label--full">
			                <input type="radio" name="rating" value="2">
			                <span class="star-icon"></span>
			            </label>
			
			            <label class="rating__label rating__label--half">
			                <input type="radio" name="rating" value="2.5">
			                <span class="star-icon"></span>
			            </label>
			
			            <label class="rating__label rating__label--full">
			                <input type="radio" name="rating" value="3">
			                <span class="star-icon"></span>
			            </label>
			
			            <label class="rating__label rating__label--half">
			                <input type="radio" name="rating" value="3.5">
			                <span class="star-icon"></span>
			            </label>
			
			            <label class="rating__label rating__label--full">
			                <input type="radio" name="rating" value="4">
			                <span class="star-icon"></span>
			            </label>
			
			            <label class="rating__label rating__label--half">
			                <input type="radio" name="rating" value="4.5">
			                <span class="star-icon"></span>
			            </label>
			
			            <label class="rating__label rating__label--full">
			                <input type="radio" name="rating" value="5">
			                <span class="star-icon"></span>
			            </label>
			
			        </div>
			
			        <span id="score">0점</span>
			
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

            <input type="submit" value="등록">

            <input type="button"
                   value="취소"
                   onclick="history.back()">

        </div>
    

</div>
</form>
<footer>
	<%@include file="../common_footer.jsp"%>
</footer>
<script type="text/javascript" src="js/review.js"></script>

</body>
</html>
