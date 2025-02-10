<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, height=device-height, initial-scale=1, minimum-scale=1, user-scalable=no">
<link rel="stylesheet" href="/_next/static/css/2755837d60974b48.css"
	data-precedence="next">
<link rel="stylesheet" href="/_next/static/css/6696421566b36ddc.css"
	data-precedence="next">
<link rel="preload" as="script" fetchpriority="low"
	href="/_next/static/chunks/webpack-0e6fbe0314ad4193.js">
<script src="/_next/static/chunks/70c72a89-fadc60159b7ab3ac.js" async=""></script>
<script src="/_next/static/chunks/4701-e3f75832962af056.js" async=""></script>
<script src="/_next/static/chunks/main-app-6133bfdbc0231e54.js" async=""></script>
<script src="/_next/static/chunks/app/global-error-8791233fa56ce9ef.js"
	async=""></script>
<script src="/_next/static/chunks/app/error-617572d9b8b0d030.js"
	async=""></script>
<script src="/_next/static/chunks/app/not-found-7bb8187bd4da86c7.js"
	async=""></script>
<title>온라인 쇼핑몰</title>
<meta name="description"
	content="전문 웹디자이너들이 제작한 최고의 디자인 콘텐츠가 있는 '카페24 디자인센터'! No.1 글로벌 전자상거래 플랫폼 '카페24' 쇼핑몰 구축부터 해외마케팅, 호스팅 인프라 등 제공.">
<meta property="og:title" content="카페24 디자인센터">
<meta property="og:description"
	content="전문 웹디자이너들이 제작한 최고의 디자인 콘텐츠가 있는 '카페24 디자인센터'! No.1 글로벌 전자상거래 플랫폼 '카페24' 쇼핑몰 구축부터 해외마케팅, 호스팅 인프라 등 제공.">
<meta property="og:image"
	content="https://img.cafe24.com/images/common/og_image.png">
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:title" content="카페24 디자인센터">
<meta name="twitter:description"
	content="전문 웹디자이너들이 제작한 최고의 디자인 콘텐츠가 있는 '카페24 디자인센터'! No.1 글로벌 전자상거래 플랫폼 '카페24' 쇼핑몰 구축부터 해외마케팅, 호스팅 인프라 등 제공.">
<meta name="twitter:image"
	content="https://img.cafe24.com/images/common/og_image.png">
<link rel="shortcut icon"
	href="https://img.cafe24.com/favicon/cafe24.ico">
<link rel="apple-touch-icon"
	href="https://img.cafe24.com/favicon/cafe24.ico">
<script>
	window.CLIENT_ENV = {
		"NEXT_CLIENT_SESSION_COOKIE_NAME" : "D-IS-LOGIN",
		"NEXT_CLIENT_PARTNERS_DOMAIN" : "partners.cafe24.com",
		"NEXT_CLIENT_COM_AUTH_DOMAIN" : "user.cafe24.com",
		"NEXT_CLIENT_STORE_DOMAIN" : "store.cafe24.com",
		"NEXT_CLIENT_EXPERTS_DOMAIN" : "experts.cafe24.com",
		"NEXT_CLIENT_DCENTER_DOMAIN" : "d.cafe24.com",
		"NEXT_CLIENT_S3_DOMAIN" : "appservice-img.s3.amazonaws.com",
		"NEXT_CLIENT_DEVELOPERS_DOMAIN" : "developers.cafe24.com",
		"NEXT_CLIENT_AI_SEARCH_QA_MODE" : "OFF",
		"NEXT_CLIENT_IMG_DOMAIN" : "dcenter-img.cafe24.com",
		"NEXT_CLIENT_S3_DESIGN_RECOMMEND_DOMAIN" : "design-recommend.s3.amazonaws.com",
		"APPS_ENV" : "prod",
		"NEXT_CLIENT_DOWNLOAD_DOMAIN" : "dcenter-download.cafe24.com"
	}
</script>
<link rel="stylesheet"
	href="//img.echosting.cafe24.com/api/store/css/store.min.css">
<link rel="stylesheet" href="/css/cafe24.css">
<link rel="stylesheet" href="/css/cafe24_2.css">
<script src="/_next/static/chunks/polyfills-c67a75d1b6f99dc8.js"
	nomodule=""></script>
</head>
<%-- <head>
  <title>Bootstrap Example</title>
  <meta charset="UTF-8">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <meta id="_csrf" name="_csrf" th:content="${_csrf.token}"/>
  <meta id="_csrf_header" name="_csrf_header" th:content="${_csrf.headerName}"/>
</head> --%>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
   <link href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-bs4.min.css" rel="stylesheet">
   <script src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-bs4.min.js"></script>
  <style>
    /* Remove the navbar's default rounded borders and increase the bottom margin */ 
    .navbar {
      margin-bottom: 50px;
      border-radius: 0;
    }
    
    /* Remove the jumbotron's default bottom margin */ 
     .jumbotron {
      margin-bottom: 0;
    }
   
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
    
    .searchIcon{
        width: 23px;
    	position: absolute;
   	    right: 42px;
    }
    
    #container{
        margin-top: 100px;
    }
    .logo {
	  outline: none;
	  user-select: none; /* 텍스트 선택 방지 */
	}
	#nav-header {
	  top: 0;
	  position: sticky;
	  z-index: 1000;
	}
  </style>
<body>

<div class="jumbotron">
  <div class="container text-center">
    <h1>Online Store</h1>      
    <p>Mission, Vission & Values</p>
  </div>
</div>

<nav id="nav-header" class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <span class="navbar-brand logo" >Logo</span>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="/">Home</a></li>
        <li><a href="/products?category=outerwear">Outerwear</a></li>
        <li><a href="#">Tops</a></li>
        <li><a href="#">Dresses</a></li>
        <li><a href="#">Bottoms</a></li>
        <li><a href="#">Accessories</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><img class="searchIcon" alt="" src="/img/free-icon-magnifier-2866321.png">검색</a></li>
        <li><a href="/auth/loginForm"><span class="glyphicon glyphicon-user"></span> 로그인/회원가입</a></li>
        <li><a href="#"><span style="margin-right:5px" class="glyphicon glyphicon-shopping-cart"></span>장바구니</a></li>
      </ul>
    </div>
  </div>
</nav>
<%-- <nav class="navbar navbar-expand-md bg-dark navbar-dark">
  <a class="navbar-brand" href="/">홈</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
  <c:choose>
	  <c:when test="${empty principal}">
	    <ul class="navbar-nav">
	      <li class="nav-item">
	        <a class="nav-link" href="/auth/loginForm">로그인</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="/auth/joinForm">회원가입</a>
	      </li>
	    </ul>
	  </c:when>
	  <c:otherwise>
		  <ul class="navbar-nav">
		     <li class="nav-item">
		       <a class="nav-link" href="/board/saveForm">글쓰기</a>
		     </li>
		     <li class="nav-item">
		       <a class="nav-link" href="/auth/updateForm">회원정보</a>
		     </li>
		     <li class="nav-item">
				<c:if test="${empty principal.user.oauth}">
			       <a class="nav-link" href="/logout">로그아웃</a>
			     </c:if>
				<c:if test="${principal.user.oauth eq 'kakao'}">
			       <a class="nav-link" href="/auth/kakao/logout">로그아웃</a>
			     </c:if>
		     </li>
		   </ul>
	  </c:otherwise>
  </c:choose>
  </div>  
</nav> --%>