<%@page import="model.news"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="model.news"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>疫情新闻</title>
<script src="js/jquery.min.js"> </script>
 <link href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
 <link href="css/news.css" rel="stylesheet">
 <script src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
 <script type="text/javascript" src="js/jquery.min.js"></script>
</head>
<body>
<a href="#" class="btn btn-primary btn-lg active" role="button">Primary link</a>
<a href="#" class="btn btn-default btn-lg active" role="button">Link</a>
<a href="main.jsp" class="btn btn-success">返回主菜单</a>
 <div class="form-group">
    <label for="InputEmail1">Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Email">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
<button class="btn btn-danger" >提交</button>
<button type="button" class="btn btn-default">（默认样式）Default</button>

<!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
<button type="button" class="btn btn-primary">（首选项）Primary</button>

<!-- Indicates a successful or positive action -->
<button type="button" class="btn btn-success">（成功）Success</button>

<!-- Contextual button for informational alert messages -->
<button type="button" class="btn btn-info">（一般信息）Info</button>

<!-- Indicates caution should be taken with this action -->
<button type="button" class="btn btn-warning">（警告）Warning</button>

<!-- Indicates a dangerous or potentially negative action -->
<button type="button" class="btn btn-danger">（危险）Danger</button>

<!-- Deemphasize a button by making it look like a link while maintaining button behavior -->
<button type="button" class="btn btn-link">（链接）Link</button>
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
        <c:if test="${currentPageIndex!=pageCount}">
       <a href="ShowAllNewsServlet?pageIndex=${currentPageIndex+1}"class="btn btn-success">下一页</a></c:if>
       <a href="ShowAllNewsServlet?pageIndex=${pageCount}"class="btn btn-danger">尾页</a>
        <form action="ShowAllNewsServlet" class="form-signin"  method="post" style="margin:0px;display:inline;">
       <input type="number" class="form-control" name="pageIndex" id="pageIndex">

       <button class="btn btn-primary" type="submit">GO</button>
       </form>
       </div>
       </form>
       <br>
</body>
</html>