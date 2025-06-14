<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp" %>

<div class="container">
	<c:forEach var="board" items="${boards.content}">
	  <div class="card m-2">
	    <div class="card-body">
	      <h4 class="card-title">${board.title}</h4>
	      <p class="card-text">${board.content}</p>
	      <a href="/board/${board.id}" class="btn btn-primary">상세보기</a>
	    </div>
	  </div>
	</c:forEach>
	
  <ul class="pagination justify-content-center">
  	<c:choose>
  		<c:when test="${boards.first}">
	  		<li class="disabled"><a onclick="return false;" href="?page=${boards.number-1}">Previous</a></li>
  		</c:when>
  		<c:otherwise>
	  		<li class=""><a href="?page=${boards.number-1}">Previous</a></li>
  		</c:otherwise>
  	</c:choose>
  	
  	<c:choose>
  		<c:when test="${boards.last}">
	  		<li class="disabled"><a onclick="return false;" href="?page=${boards.number+1}">Next</a></li>
  		</c:when>
  		<c:otherwise>
	 		<li class=""><a href="?page=${boards.number+1}">Next</a></li>
  		</c:otherwise>
  	</c:choose>
  </ul>
  <br>
</div>
<%@ include file="layout/footer.jsp" %>