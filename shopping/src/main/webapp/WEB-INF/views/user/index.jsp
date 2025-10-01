<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<style>

	.card-body{
	    border: 1px solid black;
	    display: flex;
	    flex-direction: row;
	    justify-content: space-around;
	}


  table {
    border-collapse: collapse;
    width: 100%;
  }

  tr, td {
    vertical-align: middle; /* 세로 가운데 정렬 */
    padding: 10px;
    border-bottom: 1px solid #ccc; /* 하단 줄 */
  }


</style>
<div class="container">

	<div class="card m-2" style="
    text-align: center;
">
	  <div class="card-body">
	    <table style="width: 100%;">
	    	<thead>
		    <tr>
		      <th style="width: 20%; text-align: center;">제목</th>
		      <th style="width: 35%; text-align: center;">내용</th>
		      <th style="width: 35%; text-align: center;">답변 여부</th>
		      <th style="width: 15%; text-align: center;">상세보기</th>
		    </tr>
		  </thead>
		    <tbody>
		    <c:forEach var="board" items="${boards.content}">
		      <tr>
		        <td>${board.title}</td>
		        <td>${board.content}</td>
		        <c:choose>
				  <c:when test="${not empty board.answer}">
				    <td style="color : blue">답변완료</td>
				  </c:when>
				  <c:otherwise>
				    <td style="color : red">답변대기중</td>
				  </c:otherwise>
				</c:choose>
		        <td>
		          <a href="/board/${board.id}" class="btn btn-primary btn-sm">상세보기</a>
		        </td>
		      </tr>
		    </c:forEach>
		  </tbody>
	    </table>
	  </div>
	</div>
	
  <ul class="pagination justify-content-center">
  	<c:choose>
  		<c:when test="${boards.first}">
	  		<li class="disabled"><a onclick="return false;" href="?userId=${principal.user.id}&page=${boards.number-1}">Previous</a></li>
  		</c:when>
  		<c:otherwise>
	  		<li class=""><a href="?userId=${principal.user.id}&page=${boards.number-1}">Previous</a></li>
  		</c:otherwise>
  	</c:choose>
  	
  	<c:choose>
  		<c:when test="${boards.last}">
	  		<li class="disabled"><a onclick="return false;" href="?userId=${principal.user.id}&page=${boards.number+1}">Next</a></li>
  		</c:when>
  		<c:otherwise>
	 		<li class=""><a href="?userId=${principal.user.id}&page=${boards.number+1}">Next</a></li>
  		</c:otherwise>
  	</c:choose>
  </ul>
  <br>
  <a href="/board/saveForm"><button type="button" id="btn-save" class="btn btn-primary">
  	문의하기
  </button></a>
</div>
<%@ include file="../layout/footer.jsp" %>