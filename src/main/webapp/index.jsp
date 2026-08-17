<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link href="index.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Track27 황희원</title>
<script src="js/index.js"></script>
<script type="text/javascript">
	function movePage(servlet,gubun){
		mem.t_gubun.value=gubun;
		mem.method="post";
		mem.action=servlet;
		mem.submit();
	}
</script>
</head>
<body>
<form name="mem">
	<input type="hidden" name="t_gubun">
</form>
<header>
	<span><a href="Index" id="logo">CINELOG</a></span>
	<div id="account">
		<c:if test="${empty sessionId }">
		<ul>
			<li><a href="Member">로그인</a> </li>
			<li><a href="javascript:movePage('Member','join')">회원가입</a></li>
		</ul>
		</c:if>
		<c:if test="${not empty sessionId }">
		<ul>
			<li><a href="javascript:movePage('Member','info')">${sessionName}님</a></li>
			<li><a href="javascript:movePage('Member','logout')">logout</a></li>
		</ul>
		</c:if>
	</div>
</header>
<nav id="nav">
<ul>
	<li><a href="">현재상영작</a></li>
	<li><a href="">개봉예정작</a></li>
	<li><a href="Review">리뷰</a></li>
	<li><a href="">굿즈 및 특전</a></li>
	<li><a href="">커뮤니티</a></li>
</ul>
<div id="searchbox">
    <span>🔍</span>
    <input type="text" id="search" placeholder="영화 검색">
</div>
</nav>
<div>
	<div id="boxoffice">
		<span>박스오피스 TOP10</span>
		<button type="button" onclick="moviePrev()">◀</button>
    	<button type="button" onclick="movieNext()">▶</button>
		<ul id="movieview">
			<li class="movie"><img src="img/poster/hope.webp" alt="설명" />hope</li>
			<li class="movie"><img src="img/poster/토이스토리5.webp" alt="설명" />토이스토리 5</li>
			<li class="movie"><img src="img/poster/군체.webp" alt="설명" />군체</li>
			<li class="movie"><img src="img/poster/마이클.jpg" alt="설명" />마이클</li>
			<li class="movie"><img src="img/poster/건담.jpg" alt="설명" />기동전사 건담</li>
			<li class="movie"><img src="img/poster/위대한 쇼맨.jpg" alt="설명" />위대한 쇼맨</li>
			<li class="movie"><img src="img/" alt="설명" />영화 7</li>
			<li class="movie"><img src="img/" alt="설명" />영화 8</li>
			<li class="movie"><img src="img/" alt="설명" />영화 9</li>
			<li class="movie"><img src="img/" alt="설명" />영화 10</li>
		</ul>
	</div>

<div id="goods">

    <span>굿즈 현황</span>
    

    <ul class="multiflex">
        <li>전체</li>
        <li>CGV</li>
        <li>롯데시네마</li>
        <li>메가박스</li>
    </ul>

    <ul class="goodsList">

        <li class="goodsphoto">
            <img src="img/goods/도라에몽 손거울 롯시.jpg">
            <div class="goodsInfo">
                <p class="movieName">도라에몽</p>
                <span class="cinema">롯데시네마</span>
                <p>손거울</p>
            </div>
        </li>

        <li class="goodsphoto">
            <img src="img/goods/메이플 키링런칭 롯시.jpg">
            <div class="goodsInfo">
                <p class="movieName">메이플스토리</p>
                <span class="cinema">롯데시네마</span>
                <p>키링</p>
            </div>
        </li>

        <li class="goodsphoto">
            <img src="img/goods/큐어 포스터 cgv.jpg">
            <div class="goodsInfo">
                <p class="movieName">큐어</p>
                <span class="cinema">CGV</span>
                <p>포스터</p>
            </div>
        </li>

        <li class="goodsphoto">
            <img src="img/goods/호프 포스터 롯시.jpg">
            <div class="goodsInfo">
                <p class="movieName">HOPE</p>
                <span class="cinema">롯데시네마</span>
                <p>포스터</p>
            </div>
        </li>

        <li class="goodsphoto">
            <img src="img/goods/호프 돌비 메박.jpg">
            <div class="goodsInfo">
                <p class="movieName">HOPE</p>
                <span class="cinema">메가박스</span>
                <p>돌비포스터</p>
            </div>
        </li>

        <li class="goodsphoto">
            <img src="img/goods/뱀의 길 포스터 cgv.jpg">
            <div class="goodsInfo">
                <p class="movieName">뱀의 길</p>
                <span class="cinema">CGV</span>
                <p>A3포스터</p>
            </div>
        </li>

    </ul>
<input type="button" class="seeMore" value="더보기">
</div>
	
	<div class="bottom">
		<div id="review">
    <div class="title">
        <span>리뷰 인기글</span>
        
    </div>

    <table class="reviewTable">
        <tr>
            <td class="movieTitle">호프</td>
            <td class="reviewTitle">
                <a href="">반전이 엄청난 영화였습니다.</a>
            </td>
            <td class="writer">최민식</td>
            <td class="like">❤ 25</td>
        </tr>

        <tr>
            <td>도라에몽</td>
            <td><a href="">어른도 재미있게 볼 수 있네요.</a></td>
            <td>홍길동</td>
            <td>❤18</td>
        </tr>

        <tr>
            <td>큐어</td>
            <td><a href="">여운이 오래 남습니다.</a></td>
            <td>김철수</td>
            <td>❤15</td>
        </tr>

        <tr>
            <td>건담</td>
            <td><a href="">팬이라면 꼭 보세요.</a></td>
            <td>박영희</td>
            <td>❤12</td>
        </tr>

        <tr>
            <td>위대한 쇼맨</td>
            <td><a href="">OST가 정말 좋았습니다.</a></td>
            <td>이민수</td>
            <td>❤11</td>
        </tr>
    </table>
    <input type="button" class="seeMore" value="더보기">
</div>

		<div id="community">

    <div class="title">
        <span>커뮤니티 인기글</span>
        
    </div>

    <table class="reviewTable">

        <tr>
            <td>[자유]</td>
            <td><a href="">오늘 호프 보고 왔습니다.</a></td>
            <td>조회 158</td>
        </tr>

        <tr>
            <td>[정보]</td>
            <td><a href="">CGV 특전 업데이트</a></td>
            <td>조회 123</td>
        </tr>

        <tr>
            <td>[후기]</td>
            <td><a href="">토이스토리5 후기</a></td>
            <td>조회 101</td>
        </tr>

        <tr>
            <td>[질문]</td>
            <td><a href="">메가박스 굿즈 남아있나요?</a></td>
            <td>조회 97</td>
        </tr>

        <tr>
            <td>[자유]</td>
            <td><a href="">다음달 기대작 뭐 보시나요?</a></td>
            <td>조회 86</td>
        </tr>

    </table>
<input type="button" class="seeMore" value="더보기">
</div>
	</div>
</div>
<footer>

    <div id="footerTop">

        <a href="">회사소개</a>
        <span>|</span>

        <a href="">이용약관</a>
        <span>|</span>

        <a href="">개인정보처리방침</a>
        <span>|</span>

        <a href="">고객센터</a>

    </div>

    <div id="footerBottom">

        <p><strong>CINELOG</strong></p>
        <p class="footerText">영화를 기록하고, 리뷰를 공유하는 공간 CINELOG</p>

        <p>대표 : 황희원</p>

        <p>주소 : 대전광역시 중구 오류동 131-10 그레이스빌 303호</p>

        <p>Copyright © 2026 CINELOG. All Rights Reserved.</p>

    </div>

</footer>
</body>
</html>