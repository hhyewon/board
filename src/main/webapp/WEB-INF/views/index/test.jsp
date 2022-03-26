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
    <%--    <link rel="stylesheet" href="../../css/reset.css">--%>
    <%--    <link rel="stylesheet" href="../../css/admin.css">--%>
    <script>

        // function fnPaper(){
        <%--            let lform = document.getElementById("paper_search_form");--%>
        // $('#pageNum').val(getPageNum);
        // console.log("1"+getPageNum);
        <%--            lform.method = 'post';--%>
        <%--            // lform.action = '/paper/update?paper_id='+id;--%>
        // $('#pageList').submit();
        // }
    </script>
    <style>
        body {
            padding-top: 12px;
            text-align: center;
        }

        thead {
            font-weight: bold;
        }

        /*td, th{*/
        /*    text-align: center;*/
        /*}*/
    </style>
</head>
<body>

<%--<h2> 게시글 목록 </h2>--%>

<%--<button class="btn btn-primary" onclick="location.href='/insert'">글쓰기</button>--%>

<div class="container">

    <div class="col-xs-12" style="margin:15px auto;">
        <label style="font-size:30px;">게시글 목록</label>
        <button class="btn btn-primary btn-sm" style="float:right;" onclick="location.href='/insert'">글쓰기</button>
    </div>
    <table class="table table-hover">
        <thead>
        <tr>
            <td>No</td>
            <td>Type</td>
            <td>Title</td>
            <%--            <th>Content</th>--%>
            <td>Cre_user</td>
            <td>Mod_user</td>
            <td>Cre_date</td>
            <td>Mod_date</td>
            <%--            <th>Date</th>--%>
        </tr>
        </thead>
        <tbody id="middle_tbody">

        </tbody>
        <%--        <tbody>--%>
        <%--&lt;%&ndash;        <script>&ndash;%&gt;--%>
        <%--&lt;%&ndash;            alert("dasdad");&ndash;%&gt;--%>
        <%--&lt;%&ndash;            console.log(${columns})&ndash;%&gt;--%>
        <%--&lt;%&ndash;        </script>&ndash;%&gt;--%>
        <%--        <c:forEach var="item" items="${columns.contents}">--%>
        <%--            <tr onclick="location.href='/detail/${item.board_seq}'">--%>
        <%--                <td>${item.board_seq}</td>--%>
        <%--                <td>${item.board_type}</td>--%>
        <%--                <td>${item.title}</td>--%>
        <%--&lt;%&ndash;                <td>${item.content}</td>&ndash;%&gt;--%>
        <%--                <td>${item.cre_user_id}</td>--%>
        <%--                <td>${item.mod_user_id}</td>--%>
        <%--                <td>${item.cre_date}</td>--%>
        <%--                <td>${item.mod_date}</td>--%>
        <%--&lt;%&ndash;                <td>${item.content_status}</td>&ndash;%&gt;--%>
        <%--            </tr>--%>
        <%--        </c:forEach>--%>
        <%--        </tbody>--%>
    </table>
    <div class="paging mt32" id="pageList">
    </div>
    <!-- 페이징 -->
    <div class="paging mt32">
        <a href="javascript:void(0);" class="pprev">
            <<
        </a>
        <a href="javascript:void(0);" class="prev">
            <
        </a>
        <a href="javascript:void(0);" class="on">1</a>
        <a href="javascript:void(0);">2</a>
        <a href="javascript:void(0);">3</a>
        <a href="javascript:void(0);">4</a>
        <a href="javascript:void(0);">5</a>
        <a href="javascript:void(0);">6</a>
        <a href="javascript:void(0);">7</a>
        <a href="javascript:void(0);">8</a>
        <a href="javascript:void(0);">9</a>
        <a href="javascript:void(0);">10</a>

        <a href="javascript:void(0);" class="next">
            >
        </a>
        <a href="javascript:void(0);" class="nnext">
            >>
        </a>
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

        <c:if test="${'' ne param.pageNum and not empty param.pageNum}">
        getPageNum = ${param.pageNum};
        isBack = true;
        </c:if>
        console.log("3: " + getPageNum);
        movePageImp(getPageNum);
        <%--        <c:choose>--%>
        <%--        <c:when test="${'view' eq param.inType and not empty param.inType}">--%>
        <%--        $.ajax({--%>
        <%--            url :  '/info/distinctMinorRegion?major_region=' + '${param.region1}',--%>
        <%--            type : 'get',--%>
        <%--            cache : false,--%>
        <%--            contentType : false,--%>
        <%--            processData : false,--%>
        <%--            success : function (data,jqXHR,textStatus){--%>
        <%--                $('#region2').empty();--%>
        <%--                $('#region2').append($('<option value="">전체</option>'));--%>
        <%--                $.each(data, function(idx, val){--%>
        <%--                    const isSelected = '${param.region2}' == val ? 'selected' : '';--%>
        <%--                    $('#region2').append($('<option value="' + val + '"' + isSelected +'>'+ val +'</option>'));--%>
        <%--                });--%>
        <%--                search(getPageNum);--%>
        <%--            },--%>
        <%--            error : function (jqXHR,textStatus,errorThrown){--%>
        <%--                alert(textStatus);--%>
        <%--            }--%>
        <%--        });--%>
        <%--        </c:when>--%>
        <%--        <c:otherwise>--%>

        <%--        </c:otherwise>--%>
        <%--        </c:choose>--%>
        <%--        <c:if test="${'view' eq param.contents.inType and not empty param.contents.inType}">--%>
        <%--        </c:if>--%>
    });

    function renderPage(data) {

        // $('#total_count').text(data.page_info.total_elements.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + '개');
        $('#middle_tbody').empty();
        $('#pageList').empty();
        // if(data.contents.length == 0){
        //     $('#middle_tbody').append('<td colspan="11" style="height: 40px;">검색 결과가 없습니다.</td>');
        // }
        let i = 1;

        for (const item of data) {
            // console.log(item.contents.board_type);
            let html = '';
            // console.log(data.current_page);
            <c:forEach var="test" items="${columns.contents}">
            // html += '<tr><td class="first">' + ((data.current_page-1) *10 + (i++)) + '</td>';
            html += '<tr><td>' + '${test.board_seq}' + '</td>';
            html += '<td>' + '${test.board_type}' + '</td>';
            html += '<td>' + '${test.title}' + '</td>';
            html += '<td>' + '${test.cre_user_id}' + '</td>';
            html += '<td>' + '${test.mod_user_id}' + '</td>';
            html += '<td>' + '${test.cre_date}' + '</td>';
            html += '<td>' + '${test.mod_date}' + '</td></tr>';
            </c:forEach>

            // html += '<td class="school"><a href="javascript:fnPaper(' +  paper.paper_id + ');">' + paper.school_name + '</a></td>';
            // fnPaper();
            // console.log(item.mod_user_id);
            $('#middle_tbody').append(html);
        }
        $('#pageList').append(createPageList(2, 1, 10));
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
            function (data, jqXHR, textStatus) {
                console.log("6: " + getPageNum);
                // console.log(data);
                // if(data.code == '00'){
                renderPage(data);
                // }
                // else if(data.code == '21'){
                //     alert(data.message);
                //     window.location.href = '/';
                // }else{
                //     alert("알 수 없는 오류가 발생했습니다.");
                // }
            })
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


<%@ include file="../bootstrap.jsp" %>
</body>
</html>
