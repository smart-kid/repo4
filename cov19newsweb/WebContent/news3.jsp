<%@page import="model.news"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="model.news"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="UTF-8">
<title>疫情新闻</title>
<script src="js/jquery.min.js"> </script>
 <link href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
 <link href="css/news.css" rel="stylesheet">
 <script src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
 <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript">  
    
    function changeBtnable(){
        $("#go").removeAttr("disabled");
    }
    function changeBtndisable(){
        $("#go").attr("disabled","true");
    }
    function checkInput(){
        var text = $("#pageIndex").val();
        if(text==null||text==""){
            changeBtndisable();
        }
    }
        </script>  
</head>
<body>
<div class="divdiv">
<form class="form-inline" action="FindNewsServlet" method="post">
		<div class="searchdiv">
          <input type="text" id="searchinput" class="form-control" name="searchtext" placeholder="输入搜索内容">
<button class="btn btn-primary" type="submit" id="search" onclick="test1();"></button>
       </div>
        
        </form>
        	</div>
        	<div class="hotdiv">
        		<table  class="table table-hover" id="hot"><caption>热度榜top10</caption>
        		<c:forEach items="${hotlist}" var="news1">
        		<tr>
        		<td> <div class="hotnews"><h6><a href="${news1.sourceurl}"><c:out value="${news1.title}" /></a></h6></div></td>
        		</tr>
        		</c:forEach>
        		</table>
        		</div>	
      <div class="sdiv">  <b>共${newscount}条记录;
          共${pageCount}页;
          当前在${currentPageIndex}页;</b></div>
        
		<table  class="table table-hover" id="all">

			<c:forEach items="${pageNews}" var="news1">
				<tr>
				<td>
	<div id="result">
    <div><h4><a href="${news1.sourceurl}"><c:out value="${news1.title}" /></a></h4></div>
    <div>来源：<c:out value="${news1.source}" /></div>
    <div>日期：<c:out value="${news1.date}" /></div>
    <div><a href="${news1.sourceurl}"><img alt="" src="${news1.imgsrc}" width="120px;"></a></div>
    <div><a href="${news1.sourceurl}">摘要：<c:out value="${news1.abstract_text}" /></a></div>
    <div><img alt="" src="images/redu.png" width="20px;"><div class="comment"><c:out value="${news1.commentcount}"/></div></div>
</div></td>
				</tr>
			</c:forEach>
			
		</table>
		
	
		<form class="form-inline">
		<div class="fdiv">
       <a href="ShowAllNewsServlet?pageIndex=1" class="btn btn-primary">首页</a>
       <c:if test="${currentPageIndex!=1}">
       <a href="ShowAllNewsServlet?pageIndex=${currentPageIndex-1}"class="btn btn-success">上一页</a></c:if>
       <c:if test="${currentPageIndex==3}">
       <a href="ShowAllNewsServlet?pageIndex=${currentPageIndex-2}"class="btn btn-default">${currentPageIndex-2}</a>
       <a href="ShowAllNewsServlet?pageIndex=${currentPageIndex-1}"class="btn btn-default">${currentPageIndex-1}</a>
       <a href="ShowAllNewsServlet?pageIndex=${currentPageIndex}"class="btn btn-warning">${currentPageIndex}</a></c:if>
   		<c:if test="${currentPageIndex==2}">
       <a href="ShowAllNewsServlet?pageIndex=${currentPageIndex-1}"class="btn btn-default">${currentPageIndex-1}</a>
       <a href="ShowAllNewsServlet?pageIndex=${currentPageIndex}"class="btn btn-warning">${currentPageIndex}</a></c:if>
   		<c:if test="${currentPageIndex==1}">
       <a href="ShowAllNewsServlet?pageIndex=${currentPageIndex}"class="btn btn-warning">${currentPageIndex}</a></c:if>
   		<c:if test="${currentPageIndex>3}">
       <a href="ShowAllNewsServlet?pageIndex=${currentPageIndex-3}"class="btn btn-default">${currentPageIndex-3}</a>
       <a href="ShowAllNewsServlet?pageIndex=${currentPageIndex-2}"class="btn btn-default">${currentPageIndex-2}</a>
       <a href="ShowAllNewsServlet?pageIndex=${currentPageIndex-1}"class="btn btn-default">${currentPageIndex-1}</a>
       <a href="ShowAllNewsServlet?pageIndex=${currentPageIndex}"class="btn btn btn-warning">${currentPageIndex}</a></c:if>
       <c:if test="${currentPageIndex<=pageCount-3}">
       <a href="ShowAllNewsServlet?pageIndex=${currentPageIndex+1}"class="btn btn-default">${currentPageIndex+1}</a>
       <a href="ShowAllNewsServlet?pageIndex=${currentPageIndex+2}"class="btn btn-default">${currentPageIndex+2}</a>
       <a href="ShowAllNewsServlet?pageIndex=${currentPageIndex+3}"class="btn btn-default">${currentPageIndex+3}</a>
       </c:if>
        <c:if test="${currentPageIndex==pageCount-2}">
       
       <a href="ShowAllNewsServlet?pageIndex=${currentPageIndex+1}"class="btn btn-default">${currentPageIndex+1}</a>
       <a href="ShowAllNewsServlet?pageIndex=${currentPageIndex+2}"class="btn btn-default">${currentPageIndex+2}</a></c:if>
   		<c:if test="${currentPageIndex==pageCount-1}">
       
       <a href="ShowAllNewsServlet?pageIndex=${currentPageIndex+1}"class="btn btn-default">${currentPageIndex+1}</a></c:if>
   		
        <c:if test="${currentPageIndex!=pageCount}">
       <a href="ShowAllNewsServlet?pageIndex=${currentPageIndex+1}"class="btn btn-success">下一页</a></c:if>
       <a href="ShowAllNewsServlet?pageIndex=${pageCount}"class="btn btn-danger">尾页</a>
        <form action="ShowAllNewsServlet" class="form-signin"  method="get" style="margin:0px;display:inline;">
       <input type="number" class="form-control" name="pageIndex" id="pageIndex" onmouseleave="checkInput()" oninput="changeBtnable()">

       <button class="btn btn-primary" type="submit" disabled  id="go" onclick="test1();">GO</button>
       </form>
       </div>
       </form>
       <br>
       <script src="js/news.js"></script>
</body>
</html>