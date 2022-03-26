<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Detail</title>
<style>
    .container {
        position: relative;
        width: 1200px;
        margin: 0 auto;
    }

    .container .page_tit {
        font-size: 24px;
        line-height: 35px;
        color: #000000;
        font-weight: 600;
        padding-top: 40px;
        padding-bottom: 24px;
    }

    body {
        background-color: #f6f6f6;
        padding-top: 12px;
        text-align: center;
    }

    .btn_div{
        margin-top: 40px;
    }
    .btn-primary{
        margin-right: 15px;
    }

</style>
</head>
<body>



<div class="container">
<h2 class="page_tit"> 게시글 상세 </h2>


    <form action="/insertProc" method="post">
        <div class="form-group">
            <label>Type</label>
            <p>${detail.param.board_type}</p>
        </div>
        <div class="form-group">
            <label>제목</label>
            <p>${detail.param.title}</p>
        </div>
        <div class="form-group">
            <label>내용</label>
            <p>${detail.param.content}</p>
        </div>
        <div class="form-group">
            <label>작성자</label>
            <p>${detail.param.cre_user_id}</p>
        </div>
        <div class="form-group">
            <label>수정자</label>
            <p>${detail.param.mod_user_id}</p>
        </div>
        <div class="form-group">
            <label>작성일자</label>
            <p>${detail.param.cre_date}</p>
        </div>

    </form>
    <div class="btn_div">
        <button class="btn btn-primary" onclick="location.href='/update/${detail.param.board_seq}'">수정</button>
        <button class="btn btn-danger" onclick="location.href='/delete/${detail.param.board_seq}'">삭제</button>
    </div>
<%--    </c:forEach>--%>

</div>


<%@ include file="../bootstrap.jsp" %>
</body>
</html>