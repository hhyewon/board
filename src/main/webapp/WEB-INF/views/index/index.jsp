<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>List</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <%--    <script type="text/javascript" src="../../js/admin.js"></script>--%>
    <%--        <script type="text/javascript" src="../../js/pagination/pagination.js"></script>--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.16.9/xlsx.full.min.js"></script>
    <%--        <link rel="stylesheet" href="../../css/reset.css">--%>
    <link rel="stylesheet" href="../../css/admin.css">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400,500,700,900&display=swap" rel="stylesheet">
    <style>
        .tbl_view {
            width: 100%;
            table-layout: fixed;
            border: 1px solid #cccccc;
            background: #ffffff;
        }

        .tbl_view th, .tbl_view td {
            border-bottom: 1px solid #cccccc;
            border-left: 1px solid #cccccc;
        }

        .tbl_view th {
            font-weight: bold;
            padding: 16px 10px;
            /*font-weight: 400;*/
            background: #f0f0f0;
            color: #333333;
        }

        .tbl_view td {
            padding: 15px 10px;
            color: #333333;
        }

        .mt15 {
            margin-top: 15px !important;
        }

        .acenter {
            text-align: center;
        }

        .btn {
            display: inline-block;
            text-align: center;
            font-size: 14px;
            height: 32px;
            line-height: 30px;
            border: 1px solid #000;
            border-radius: 4px;
            text-decoration: none;
            font-weight: 400;
            background-color: #ffffff;
        }

        .btn_color3 {
            border: none;
            background-color: #777777;
            color: #fff;
        }

        .w80 {
            width: 80px !important;
            font-weight: 500;
        }

        .aleft {
            text-align: left !important;
        }

        .mt32 {
            margin-top: 32px !important;
        }

        #content_wide {
            width: 1200px;
            margin: 0 auto;
        }

        #wrap {
            padding-bottom: 40px;
        }

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

        thead {
            font-weight: bold;
        }

        .paging {
            text-align: center;
            font-size: 0;
            margin-bottom: 40px;
        }

        .paging a {
            display: inline-block;
            font-size: 13px;
            color: #aaaaaa;
            vertical-align: top;
            margin-right: 20px;
        }

        .paging a.pprev {
            margin-right: 10px;
            color: #000000;
        }

        .paging a.prev {
            margin-right: 20px;
            color: #000000;
        }

        .paging a.next {
            margin-left: 6px;
            margin-right: 10px;
            color: #000000;
        }

        .paging a.nnext {
            color: #000000;
        }

        .paging a.on {
            color: #000000;
            font-weight: bolder;
            text-decoration: none;
        }

        .justify_between {
            display: flex;
            justify-content: right;
            align-items: center;
        }

    </style>
</head>
<body>

<div class="wrap">
    <div class="container">
        <h1 class="page_tit">게시글 목록</h1>

        <div id="content_wide">
            <div class="con_case">
                <div class="justify_between">
                    <a class="btn w80 btn_color3" onclick="location.href='/insert'">글쓰기</a>
                </div>
                <table class="tbl_view mt15 acenter">
                    <caption></caption>
                    <colgroup>
                        <col width="3%">
                        <col width="5%">
                        <col width="23%">
                        <col width="5%">
                        <col width="5%">
                        <col width="6%">
                        <col width="6%">
                    </colgroup>
                    <thead>
                    <tr>
                        <th>No</th>
                        <th>Type</th>
                        <th>제목</th>
                        <%--            <th>Content</th>--%>
                        <th>작성자</th>
                        <th>수정자</th>
                        <th>작성일자</th>
                        <th>수정일자</th>
                        <%--            <th>Date</th>--%>
                    </tr>
                    </thead>
                    <tbody id="middle_tbody">
                    </tbody>
                </table>
                <div class="paging mt32" id="pageList">
                </div>
            </div>
        </div>
    </div>

</div>


<script>
    let formData = null;
    let isProcessing = 0;
    let getPageNum = 1;
    let isBack = false;
    console.log("2" + getPageNum);

    $(document).ready(function () {
        // console.log(param.criteria.pageNum);
        console.log("3: " + getPageNum);
        movePageImp(getPageNum);
    });

    function renderPage(data) {
        $('#middle_tbody').empty();
        $('#pageList').empty();

        let i = 1;

        for (const item of data.contents) {
            let html = '';

            html += '<tr onclick="location.href=\'/detail/' + item.board_seq + '\'">';
            // console.log('<tr onclick="location.href=\'/detail/' + item.board_seq + '\'">');
            html += '<td class="first">' + ((data.page_info.current_page - 1) * 10 + (i++)) + '</td>';
            if (item.board_type = 1) {
                html += '<td>' + '일반' + '</td>';
            } else {
                html += '<td>' + '-' + '</td>';
            }
            html += '<td class="aleft">' + item.title + '</td>';
            html += '<td>' + item.cre_user_id + '</td>';
            if (item.mod_user_id == '') {
                html += '<td>' + '-' + '</td>';
            } else {
                html += '<td>' + item.mod_user_id + '</td>';
            }
            html += '<td>' + item.cre_date + '</td>';
            if (item.mod_date == '0000-00-00') {
                html += '<td>' + '-' + '</td></tr>';
            } else {
                html += '<td>' + item.mod_date + '</td></tr>';
            }
            $('#middle_tbody').append(html);
        }
        $('#pageList').append(createPageList(data.page_info.total_page, data.page_info.current_page, 10));
    }

    function movePageImp(pageNo) {
        const search_url = '/list/page/' + pageNo;
        getPageNum = pageNo;
        console.log("5: " + getPageNum);

        $.ajax({
            url: search_url,
            type: 'post',
            data: formData,
            cache: false,
            contentType: false,
            processData: false
        }).done(
            function (data) {
                console.log("6: " + getPageNum);
                renderPage(data);
            });
    }


    function createPageList(totalPageCount, currentPage, pageRangeSize = 10, value = 0) {
        const output = document.createElement('div');
        output.append(createPageElement(1, '<<'));
        output.append(createPageElement(currentPage - 1, '<'));
        // page nav range 시작 점 (inclusive)
        const sectionStart = currentPage - ((currentPage - 1) % pageRangeSize);
        // page nav range 끝 점 (non-inclusive)
        const sectionEnd = sectionStart + pageRangeSize;

        // 각 페이지들을 밖으로 보냄
        for (let i = sectionStart; i < sectionEnd; i++) {
            if (i > totalPageCount) {
                break;
            }
            output.append(createPageElement(i, i, i === currentPage));
        }
        // 다음 페이지 네비
        output.append(createPageElement(currentPage + 1, '>'));
        output.append(createPageElement(totalPageCount, '>>'));

        return output;

        function createPageElement(name, content, isActive = false) {
            const temp = document.createElement('a');
            temp.innerText = content;
            temp.classList.add('number', 'page-nav-elem');

            if (Number.isInteger(content)) {
                temp.id = 'nav-to-page-' + content;
                if (isActive) temp.classList.add('on');
                temp.dataset.value = content;
            } else {
                temp.id = name;
                temp.classList.add(name);
                temp.dataset.value = name;
            }
            temp.style.cursor = 'pointer';
            temp.addEventListener('click', (event) => {
                movePage(temp.dataset.value, value);
            })
            return temp;
        }

        function movePage(pageNo, value) {
            if (pageNo > 0 && pageNo <= totalPageCount) {
                movePageImp(pageNo, value); //이 함수는 필요에 따라 적절한 형태로 구현 //데이터를 추가로 전달하는 value 추가
            }
        }
    }

</script>

</body>
</html>
