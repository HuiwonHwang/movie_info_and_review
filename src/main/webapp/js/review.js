function goSave(){
	if(checkEmpty(review.movie,"영화 제목을 입력하세요!"))return;
	if(checkEmpty(review.title,"리뷰 제목을 입력하세요!"))return;
	if(checkEmpty(review.score,"평점을 입력하세요!"))return;
	//if(checkEmpty(review.content,"리뷰 내용을 입력하세요!"))return;
	review.t_gubun.value="reviewsave";
	review.method="post";
	review.action="Review";
	review.submit();
}

function searchMovie(){
	review.t_nowPage.value="1";
	review.t_gubun.value="list";
	review.method="get";
	review.action="Review";
	review.submit();;
}

function showAllReviews(){
	review.movieSearch.value="";
	review.t_nowPage.value="1";
	review.t_gubun.value="list";
	review.method="get";
	review.action="Review";
	review.submit();
}

function goListPage(page){
	review.t_nowPage.value=page;
	review.t_gubun.value="list";
	review.method="get";
	review.action="Review";
	review.submit();
}

function goView(no){
	review.t_no.value=no;
	review.t_gubun.value="reviewview";
	review.method="post";
	review.action="Review";
	review.submit();
}
function deleteReview(){
	if(confirm("정말 삭제하시겠습니까?")){
		review.t_gubun.value="deletereview";
		review.method="post";
		review.action="Review";
		review.submit();	
	}
	
}
function updateReviewForm(no){
	review.t_no.value=no;
	review.t_gubun.value="updatereviewform";
	review.method="post";
	review.action="Review";
	review.submit();
}
function updateReview(no){
	if(checkEmpty(review.title,"리뷰 제목을 입력하세요!"))return;
	if(checkEmpty(review.score,"평점을 입력하세요!"))return;
	review.t_no.value=no;
	review.t_gubun.value="updatereview";
	review.method="post";
	review.action="Review";
	review.submit();
}

function goListPage(pageNum){
	review.t_gubun.value="list";
	review.t_nowPage.value=pageNum;
	review.method="post";
	review.action="Review";
	review.submit();
}