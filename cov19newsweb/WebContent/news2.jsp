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
<table id="table" class="table table-hover">
<caption>新闻列表</caption>
<tr>
  <td class="active"><a href="detail.jsp">详细新闻</a></td>
  
  <td class="active">article</td>
</tr>
</table>
<form action="FindNewsServlet" method="post">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                        学号：<input type="text" name="searchId" placeholder="学生学号...">
         <button type="submit" class="btn btn-inverse"> 查找</button>
        </form>
        <form action="ShowAllNewsServlet" method="post">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                        学号：<input type="text" name="searchId" placeholder="学生学号...">
         <button type="submit" class="btn btn-inverse"> show</button>
        </form>
      <div class="sdiv">  共${newscount}条记录;
          共${pageCount}页;
          当前在${currentPageIndex}页;</div>
        
		<table  class="table table-bordered">
		<caption>新闻列表</caption>
		    <tr>
				<td align="center">
					<strong>#</strong>
				</td>
				<td align="center">
					<strong>标题</strong>
				</td>
				<td align="center">
					<strong>日期</strong>
				</td>
				<td align="center">
					<strong>评论数</strong>
				</td>
				<td align="center">
					<strong>源url</strong>
				</td>
			</tr>
			<c:forEach items="${pageNews}" var="news1">
				<tr>
					<td>
						<c:out value="${news1.id}" />
					</td>
					<td>
						<c:out value="${news1.title}" />
					</td>
					<td>
						<c:out value="${news1.date}" />
					</td>
					<td>
						<c:out value="${news1.commentcount}" />
					</td>
					<td>
						<c:out value="${news1.sourceurl}" />
					</td>
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