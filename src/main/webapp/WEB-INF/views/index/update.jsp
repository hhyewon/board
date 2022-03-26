<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert Form</title>
    <style>
        .container {
            position: relative;
            width: 1200px;
            margin: 0 auto;
        }

        .container .page_tit {
            text-align: center;
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
        }

    </style>
    </head>
<body>


<div class="container">
    <h2 class="page_tit"> 게시글 수정 </h2>
    <form action="/updateProc" method="post">
        <div class="form-group">
            <label for="board_type">타입</label>
            <select class="form-control" id="board_type" name="board_type" for="board_type">
                <option value="1">일반</option>
            </select>
        </div>
        <div class="form-group">
            <label for="title">제목</label>
            <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요." value="${detail.param.title}">
        </div>
        <div class="form-group">
            <label for="mod_user_id">작성자</label>
            <input type="text" class="form-control" id="mod_user_id" name="mod_user_id" placeholder="작성자를 입력하세요." value="${detail.param.cre_user_id}">
        </div>
        <div class="form-group">
            <label for="content">내용</label>
            <textarea class="form-control" id="content" name="content" rows="3">${detail.param.content}</textarea>
        </div>
        <input type="hidden" name="board_seq" value="${detail.param.board_seq}" />
        <button type="submit" class="btn btn-primary">작성</button>
    </form>
</div>
<%@ include file="../bootstrap.jsp" %>
</body>
</html>
