<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">구매현황</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
          <div class="btn-group me-2">
            <button type="button" class="btn btn-sm btn-outline-secondary">Share</button>
            <button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
          </div>
          <button type="button" class="btn btn-sm btn-outline-secondary dropdown-toggle d-flex align-items-center gap-1">
            <svg class="bi"><use xlink:href="#calendar3"/></svg>
            주차별 현황
          </button>
        </div>
      </div>

      <canvas class="chartJS-myChart1 my-4 w-100" id="chartJS-myChart" width="900" height="380px" style="height: 380px; overflow: hidden;"></canvas>

      <h2>최근 구매 목록 (10개)</h2>
      <div class="table-responsive small">
        <table class="table table-striped table-sm">
          <thead>
            <tr>
              <th scope="col">순번</th>
              <th scope="col">제품 명</th>
              <th scope="col">카테고리</th>
              <th scope="col">가격</th>
              <th scope="col">수량</th>
            </tr>       
          </thead>
          <tbody>
           <c:forEach var="recentlyBuy" items="${recentlyDelivery}" varStatus="status">
           <tr>
              <td>${status.count}</td>
              <td>${recentlyBuy.product.productName}</td>
              <td>${recentlyBuy.product.category}</td>
              <td>
              	<fmt:formatNumber value="${recentlyBuy.totalPrice}" type="number" groupingUsed="true" />
      		  </td>
              <td>${recentlyBuy.itemCount}</td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
      </div>