<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<div class="container py-3">
    <h4>문의 채팅방 목록</h4>
    <table class="table table-hover align-middle">
        <thead>
        <tr>
            <th>방ID</th>
            <th>고객</th>
            <th>최근 메시지</th>
            <th>시간</th>
            <th>상태</th>
            <th>열기</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="room" items="${rooms}" varStatus="status">
        
            <tr>
                <td>${room.id }</td>
                <td>${room.user.name }</td>
                <td>${room.lastMessagePreview}</td>
                <td>${room.lastMessageAt.toString().substring(0, 10)}</td>
                <td>
				    <c:choose>
				        <c:when test="${not empty room.lastMessageAt}">
				            <span class="badge bg-secondary">응답완료</span>
				        </c:when>
				        <c:otherwise>
				            <span class="badge bg-danger">미응답</span>
				        </c:otherwise>
				    </c:choose>
				</td>
                <td>
                    <button class="btn btn-outline-primary btn-sm"
                            onclick="window.open('/inquiry/room?roomId=${room.id}','inqwin_${room.id}','width=520,height=720');">
                    새 창
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<script>
    // 관리자가 특정 방을 새 창으로 열 때 사용하는 라우트 보조:
    // 아래 추가 라우트를 만들어두면 좋습니다. (/inquiry/room?roomId=inq-123)
</script>
<%@ include file="../layout/footer.jsp" %>