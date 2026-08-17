<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
</head>
<body>
<form name="go">
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