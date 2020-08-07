<%@page import="model.news"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="model.news"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="UTF-8">
<title>${searchtexttext}的查询结果</title>
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
<a href="news3.jsp">首页</a>
<form class="form-inline" action="FindNewsServlet" method="post">
		<div class="searchdiv">
          <input type="text" id="searchinput" class="form-control" name="searchtext" placeholder="输入搜索内容">
<button class="btn btn-primary" type="submit" id="search" onclick="test1();"></button>
       </div>
</form>

      <c:if test="${searchnewscount!=0}"> 
      <div class="sdiv">  <b>共${searchnewscount}条记录;
          共${searchpageCount}页;
          当前在${searchcurrentPageIndex}页;</b></div>   
    <table  class="table table-hover" id="all">

			<c:forEach items="${searchpageNews}" var="news1">
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
		
	
		<form class="form-inline" action="FindNewsServlet?searchtext=${searchtexttext}" class="form-signin"  method="post" style="margin:0px;display:inline;">
		<div class="fdiv">
       <a href="FindNewsServlet?searchpageIndex=1&searchtext=${searchtexttext}" class="btn btn-primary">首页</a>
       <c:if test="${searchcurrentPageIndex!=1}">
       <a href="FindNewsServlet?searchpageIndex=${searchcurrentPageIndex-1}&searchtext=${searchtexttext}"class="btn btn-success">上一页</a></c:if>
       <c:if test="${searchcurrentPageIndex==3}">
       <a href="FindNewsServlet?searchpageIndex=${searchcurrentPageIndex-2}&searchtext=${searchtexttext}"class="btn btn-default">${searchcurrentPageIndex-2}</a>
       <a href="FindNewsServlet?searchpageIndex=${searchcurrentPageIndex-1}&searchtext=${searchtexttext}"class="btn btn-default">${searchcurrentPageIndex-1}</a>
       <a href="FindNewsServlet?searchpageIndex=${searchcurrentPageIndex}&searchtext=${searchtexttext}"class="btn btn-warning">${searchcurrentPageIndex}</a></c:if>
   		<c:if test="${searchcurrentPageIndex==2}">
       <a href="FindNewsServlet?searchpageIndex=${searchcurrentPageIndex-1}&searchtext=${searchtexttext}"class="btn btn-default">${searchcurrentPageIndex-1}</a>
       <a href="FindNewsServlet?searchpageIndex=${searchcurrentPageIndex}&searchtext=${searchtexttext}"class="btn btn-warning">${searchcurrentPageIndex}</a></c:if>
   		<c:if test="${searchcurrentPageIndex==1}">
       <a href="FindNewsServlet?searchpageIndex=${searchcurrentPageIndex}&searchtext=${searchtexttext}"class="btn btn-warning">${searchcurrentPageIndex}</a></c:if>
   		<c:if test="${searchcurrentPageIndex>3}">
       <a href="FindNewsServlet?searchpageIndex=${searchcurrentPageIndex-3}&searchtext=${searchtexttext}"class="btn btn-default">${searchcurrentPageIndex-3}</a>
       <a href="FindNewsServlet?searchpageIndex=${searchcurrentPageIndex-2}&searchtext=${searchtexttext}"class="btn btn-default">${searchcurrentPageIndex-2}</a>
       <a href="FindNewsServlet?searchpageIndex=${searchcurrentPageIndex-1}&searchtext=${searchtexttext}"class="btn btn-default">${searchcurrentPageIndex-1}</a>
       <a href="FindNewsServlet?searchpageIndex=${searchcurrentPageIndex}&searchtext=${searchtexttext}"class="btn btn btn-warning">${searchcurrentPageIndex}</a></c:if>
       <c:if test="${searchcurrentPageIndex<=searchpageCount-3}">
       <a href="FindNewsServlet?searchpageIndex=${searchcurrentPageIndex+1}&searchtext=${searchtexttext}"class="btn btn-default">${searchcurrentPageIndex+1}</a>
       <a href="FindNewsServlet?searchpageIndex=${searchcurrentPageIndex+2}&searchtext=${searchtexttext}"class="btn btn-default">${searchcurrentPageIndex+2}</a>
       <a href="FindNewsServlet?searchpageIndex=${searchcurrentPageIndex+3}&searchtext=${searchtexttext}"class="btn btn-default">${searchcurrentPageIndex+3}</a>
       </c:if>
        <c:if test="${searchcurrentPageIndex==searchpageCount-2}">
       
       <a href="FindNewsServlet?searchpageIndex=${searchcurrentPageIndex+1}&searchtext=${searchtexttext}"class="btn btn-default">${searchcurrentPageIndex+1}</a>
       <a href="FindNewsServlet?searchpageIndex=${searchcurrentPageIndex+2}&searchtext=${searchtexttext}"class="btn btn-default">${searchcurrentPageIndex+2}</a></c:if>
   		<c:if test="${searchcurrentPageIndex==searchpageCount-1}">
       
       <a href="FindNewsServlet?searchpageIndex=${searchcurrentPageIndex+1}&searchtext=${searchtexttext}"class="btn btn-default">${searchcurrentPageIndex+1}</a></c:if>
   		
        <c:if test="${searchcurrentPageIndex!=searchpageCount}">
       <a href="FindNewsServlet?searchpageIndex=${searchcurrentPageIndex+1}&searchtext=${searchtexttext}"class="btn btn-success">下一页</a></c:if>
       <a href="FindNewsServlet?searchpageIndex=${searchpageCount}&searchtext=${searchtexttext}"class="btn btn-danger">尾页</a>
        
       <input type="number" class="form-control" name="searchpageIndex" id="pageIndex" onmouseleave="checkInput()" oninput="changeBtnable()">

       <button class="btn btn-primary" type="submit" disabled  id="go" onclick="test1();">GO</button>
    
       </div>
       
       </form>
       
       </c:if>
       <c:if test="${searchnewscount==0}">
          <br><br><br>
        <center><font color="red" size="+1">对不起！没有找到……</font></center>
</c:if>
       <br>
       <script src="js/news.js"></script>
</div>
</body>
</html>