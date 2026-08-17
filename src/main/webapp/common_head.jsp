<%@ page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link href="common_header.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Track27 황희원</title>
<script type="text/javascript" src="js/jquery-1.8.1.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>

<script type="text/javascript">
function movePage(servlet,gubun){
	go.t_gubun.value=gubun;
	go.method="post";
	go.action=servlet;
	go.submit();
}
</script>