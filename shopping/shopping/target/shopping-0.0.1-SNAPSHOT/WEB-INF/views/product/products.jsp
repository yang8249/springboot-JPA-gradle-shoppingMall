<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.DecimalFormat" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    java.text.DecimalFormat df = new java.text.DecimalFormat("#,###");
%>

<%@ include file="../layout/header.jsp" %>
<div id="container" data-ez="layout-06i7law-1">
	<div id="contents" style="margin-top: 0px;">
		<span class="xans-element- xans-layout xans-layout-mobileaction RTMB "><a
			href="#none" onclick="history.go(-1);return false;"><svg
					xmlns="http://www.w3.org/2000/svg" width="24" height="24"
					fill="none" viewBox="0 0 24 24" class="icon">
	<path
						d="M7.29976 12.5L14.9998 20.1C15.3998 20.5 15.9998 20.5 16.3998 20.1C16.7998 19.7 16.7998 19.1 16.3998 18.7L9.49976 11.7L16.3998 4.7C16.7998 4.3 16.7998 3.7 16.3998 3.3C16.1998 3.1 15.9998 3 15.6998 3C15.3998 3 15.1998 3.1 14.9998 3.3L7.29976 10.9C6.89976 11.4 6.89976 12 7.29976 12.5C7.29976 12.4 7.29976 12.4 7.29976 12.5Z"
						fill="#000000"></path>
</svg> 뒤로가기</a> </span>



		<div data-ez-module="product-head-breadcrumb/1"
			data-ez="contents-0jlg23r-1"
			class="xans-element- xans-product xans-product-headcategory section path ">
			<span>현재 위치</span>
			<ol>
				<li><a href="/">홈</a></li>
				<li class=""><a href="/category/outerwear/42/">Outerwear</a></li>
				<li class="displaynone"><a href=""></a></li>
				<li class="displaynone"><a href=""></a></li>
				<li class="displaynone"><strong><a href=""></a></strong></li>
			</ol>
		</div>
		<div data-ez-module="product-list-head-title/1"
			data-ez="contents-0jjwmux-1"
			class="xans-element- xans-product xans-product-headcategory section titleArea ">
			<h2 style="text-transform: capitalize">${category}</h2>
			<span class="likeButton displaynone"><button type="button">
					<strong></strong>
				</button></span>
		</div>
		<div class="section ec-base-tab typeMenu"
			data-ez-module="product-list-subcategory/1"
			data-ez="contents-0g67i9x-1">
			<div class="display_tablet_only">
				<ul class="menuCategory menu">
					<li style="display:;"
						class="xans-element- xans-product xans-product-displaysubcategory  xans-record-"><a
						href="/category/jackets/47/" class="button">Jackets <span
							class="count displaynone">()</span></a></li>
					<li style="display:;"
						class="xans-element- xans-product xans-product-displaysubcategory  xans-record-"><a
						href="/category/coats/48/" class="button">Coats <span
							class="count displaynone">()</span></a></li>
				</ul>
			</div>
			<div class="display_pc_only">
				<ul class="menuCategory menu">
				</ul>
			</div>
		</div>
		<div data-ez-module="product-list-categoryimage/1"
			data-ez="contents-1j5uzbl-1"
			class="xans-element- xans-product xans-product-headcategory section product_top_image "></div>
		<div class="section" data-ez-module="product-listnew/1"
			data-ez-layout="grid4 list_gallery" data-ez="contents-0653wmt-1">
			<div data-ez-holder="product_list">
				<div
					class="xans-element- xans-product xans-product-listnew ec-base-product">
					<!--
				$count = 4
			-->

					<div class="listpage_title ez-align-left" data-ez-role="ez-align"
						data-ez-align="left">
						<div data-ez-role="title">New Arrival</div>
						<span data-ez-role="subtitle">카테고리별 새로운 아이템</span>
					</div>
					

					<!-- //listpage_title -->
						<!--
						※ 신상품 진열칸
						-->	
						<ul class="prdList grid4 list_gallery"
							data-ez-role="layout ez-discount-tag">
					<c:forEach var="newProduct" items="${newProducts}" varStatus="status">
						<li id="anchorBoxId_11" class="xans-record-">
							<div class="prdList__item">
								<div class="thumbnail">
									<a href="/product/detailProduct?id=${newProduct[0].productSeq}&userId=${principal.user.id}"><img
<<<<<<< HEAD
										src="http://localhost:9000/upload/img/${newProduct[1].uuid}"
=======
										src="http://localhost:9000${newProduct[1].filePath}"
>>>>>>> refs/remotes/origin/master
										id="eListPrdImage11_3" alt="그물 가방" loading="lazy"></a>
										
									<div class="likeButton displaynone">
										<button type="button">
											<strong></strong>
										</button>
									</div>
									<div class="custom_badge">
										<span>${status.count}</span>NEW
									</div>
									<div class="icon__box">
										<span class="wish"><img
											src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_wish_before.png"
											class="icon_img ec-product-listwishicon" alt="관심상품 등록 전"
											productno="11" categoryno="42" icon_status="off"
											login_status="F" individual-set="F">WISH</span> <span
											class="cart"><img
											src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_list_cart.gif"
											
											alt="장바구니 담기" class="ec-admin-icon cart">ADD</span> <span
											class="option" style="display: none;">OPTION</span>
									</div>
								</div>
								<div class="description" ec-data-custom="" ec-data-price="39000">
									<div class="name">
<<<<<<< HEAD
										<a href="/product/detailProduct?id=${product.productSeq}&userId=${principal.user.id}" class="">
=======
										<a href="/product/그물-가방/11/category/42/display/3/" class="">
>>>>>>> refs/remotes/origin/master
										 	<span style="font-size: 13px; color: #555555;">${newProduct[0].productName}</span>
									 	</a>
									</div>
									<p class="ec-base-help txtWarn txt11 displaynone">단독구매상품</p>
									<ul
										class="xans-element- xans-product xans-product-listitem spec">
										<li class=" xans-record-"><strong
											class="title displaynone"><span
												style="font-size: 13px; color: #000000; font-weight: bold;">판매가</span>
												:</strong> <span
											style="font-size: 13px; color: #000000; font-weight: bold;">
											<fmt:formatNumber value="${newProduct[0].price}" type="number" />원</span><span
											id="span_product_tax_type_text" style=""> </span></li>
									</ul>
									<div class="icon"></div>
								</div>
							</div>
						</li>
					</c:forEach>
	
			  		</ul>
			  		
			  		<%-- <!-- 페이징 처리 -->
				  <ul class="pagination justify-content-center">
				  	<c:choose>
				  		<c:when test="${products.first}">
					  		<li class="disabled"><a onclick="return false;" href="?page=${products.number-1}">Previous</a></li>
				  		</c:when>
				  		<c:otherwise>
					  		<li class=""><a href="?page=${products.number-1}">Previous</a></li>
				  		</c:otherwise>
				  	</c:choose>
				  	
				  	<c:choose>
				  		<c:when test="${products.last}">
					  		<li class="disabled"><a onclick="return false;" href="?page=${products.number+1}">Next</a></li>
				  		</c:when>
				  		<c:otherwise>
					 		<li class=""><a href="?page=${products.number+1}">Next</a></li>
				  		</c:otherwise>
				  	</c:choose>
				  </ul> --%>
						<!-- <li id="anchorBoxId_12" class="xans-record-">
							<div class="prdList__item">
								<div class="thumbnail">
									<a href="/product/선글라스/12/category/42/display/3/"><img
										src="//ecudemo276583.cafe24.com/web/product/medium/202304/b6462da5ab74ab388c6b0e5fb6663bc7.png"
										id="eListPrdImage12_3" alt="선글라스" loading="lazy"></a>
									<div class="likeButton displaynone">
										<button type="button">
											<strong></strong>
										</button>
									</div>
									<div class="custom_badge">
										<span>2</span>NEW
									</div>
									<div class="icon__box">
										<span class="wish"><img
											src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_wish_before.png"
											class="icon_img ec-product-listwishicon" alt="관심상품 등록 전"
											productno="12" categoryno="42" icon_status="off"
											login_status="F" individual-set="F">WISH</span> <span
											class="cart"><img
											src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_list_cart.gif"
											onclick="category_add_basket('12','42', '3', 'A0000', false, '1', 'P000000M', 'A', 'F', '0');"
											alt="장바구니 담기" class="ec-admin-icon cart">ADD</span> <span
											class="option" style="display: none;">OPTION</span>
									</div>
								</div>
								<div class="description" ec-data-custom=""
									ec-data-price="150000">
									<div class="name">
										<a href="/product/선글라스/12/category/42/display/3/" class=""><span
											class="title displaynone"><span
												style="font-size: 13px; color: #555555;">상품명</span> :</span> <span
											style="font-size: 13px; color: #555555;">선글라스</span></a>
									</div>
									<p class="ec-base-help txtWarn txt11 displaynone">단독구매상품</p>
									<ul
										class="xans-element- xans-product xans-product-listitem spec">
										<li class=" xans-record-"><strong
											class="title displaynone"><span
												style="font-size: 13px; color: #000000; font-weight: bold;">판매가</span>
												:</strong> <span
											style="font-size: 13px; color: #000000; font-weight: bold;">150,000원</span><span
											id="span_product_tax_type_text" style=""> </span></li>
									</ul>
									<div class="icon"></div>
								</div>
							</div>
						</li>
						<li id="anchorBoxId_13" class="xans-record-">
							<div class="prdList__item">
								<div class="thumbnail">
									<a href="/product/데일리-가죽-시계/13/category/42/display/3/"><img
										src="//ecudemo276583.cafe24.com/web/product/medium/202304/dd5ab7ffd20ec429cd786eadca35ef89.png"
										id="eListPrdImage13_3" alt="데일리 가죽 시계" loading="lazy"></a>
									<div class="likeButton displaynone">
										<button type="button">
											<strong></strong>
										</button>
									</div>
									<div class="custom_badge">
										<span>3</span>NEW
									</div>
									<div class="icon__box">
										<span class="wish"><img
											src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_wish_before.png"
											class="icon_img ec-product-listwishicon" alt="관심상품 등록 전"
											productno="13" categoryno="42" icon_status="off"
											login_status="F" individual-set="F">WISH</span> <span
											class="cart"><img
											src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_list_cart.gif"
											onclick="category_add_basket('13','42', '3', 'A0000', false, '1', 'P000000N', 'A', 'F', '0');"
											alt="장바구니 담기" class="ec-admin-icon cart">ADD</span> <span
											class="option" style="display: none;">OPTION</span>
									</div>
								</div>
								<div class="description" ec-data-custom=""
									ec-data-price="150000">
									<div class="name">
										<a href="/product/데일리-가죽-시계/13/category/42/display/3/"
											class=""><span class="title displaynone"><span
												style="font-size: 13px; color: #555555;">상품명</span> :</span> <span
											style="font-size: 13px; color: #555555;">데일리 가죽 시계</span></a>
									</div>
									<p class="ec-base-help txtWarn txt11 displaynone">단독구매상품</p>
									<ul
										class="xans-element- xans-product xans-product-listitem spec">
										<li class=" xans-record-"><strong
											class="title displaynone"><span
												style="font-size: 13px; color: #000000; font-weight: bold;">판매가</span>
												:</strong> <span
											style="font-size: 13px; color: #000000; font-weight: bold;">150,000원</span><span
											id="span_product_tax_type_text" style=""> </span></li>
									</ul>
									<div class="icon"></div>
								</div>
							</div>
						</li>
						<li id="anchorBoxId_17" class="xans-record-">
							<div class="prdList__item">
								<div class="thumbnail">
									<a href="/product/에나멜-플랫-단화/17/category/42/display/3/"><img
										src="//ecudemo276583.cafe24.com/web/product/medium/202304/6c7998d5b153bdd6bcfb83d215b460e8.png"
										id="eListPrdImage17_3" alt="에나멜 플랫 단화" loading="lazy"></a>
									<div class="likeButton displaynone">
										<button type="button">
											<strong></strong>
										</button>
									</div>
									<div class="custom_badge">
										<span>4</span>NEW
									</div>
									<div class="icon__box">
										<span class="wish"><img
											src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_wish_before.png"
											class="icon_img ec-product-listwishicon" alt="관심상품 등록 전"
											productno="17" categoryno="42" icon_status="off"
											login_status="F" individual-set="F">WISH</span> <span
											class="cart"><img
											src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_list_cart.gif"
											onclick="category_add_basket('17','42', '3', 'A0000', false, '1', 'P000000R', 'A', 'F', '0');"
											alt="장바구니 담기" class="ec-admin-icon cart">ADD</span> <span
											class="option" style="display: none;">OPTION</span>
									</div>
								</div>
								<div class="description" ec-data-custom="" ec-data-price="50000">
									<div class="name">
										<a href="/product/에나멜-플랫-단화/17/category/42/display/3/"
											class=""><span class="title displaynone"><span
												style="font-size: 13px; color: #555555;">상품명</span> :</span> <span
											style="font-size: 13px; color: #555555;">에나멜 플랫 단화</span></a>
									</div>
									<p class="ec-base-help txtWarn txt11 displaynone">단독구매상품</p>
									<ul
										class="xans-element- xans-product xans-product-listitem spec">
										<li class=" xans-record-"><strong
											class="title displaynone"><span
												style="font-size: 13px; color: #000000; font-weight: bold;">판매가</span>
												:</strong> <span
											style="font-size: 13px; color: #000000; font-weight: bold;">50,000원</span><span
											id="span_product_tax_type_text" style=""> </span></li>
									</ul>
									<div class="icon"></div>
								</div>
							</div>
						</li> -->
					</ul>
				</div>
			</div>
			<!-- //product_list -->
		</div>
		
		
		
		<div class="normalpackage_box section"
			data-ez-module="product-normalpackage/1" data-ez-layout="grid4"
			data-ez="contents-01tj6em-1">
			<div
				class="xans-element- xans-product xans-product-normalpackage product_scrollx ">
				<div class="xans-element- xans-product xans-product-normalmenu ">
					<!--
				$compare_page = /product/compare.html
			-->
					<div class="function" id="Product_ListMenu">
						<p class="prdCount">
							총<strong class="txtEm">${products.totalElements}</strong>개의 상품이 있습니다.
						</p>
						<div class="sort">
							<select id="selArray" name="selArray"
								class="xans-element- xans-product xans-product-orderby"><option
									value="">- 정렬방식 -</option>
								<option value="?cate_no=42&amp;sort_method=5#Product_ListMenu"
									class="xans-record-">신상품</option>
								<option value="?cate_no=42&amp;sort_method=3#Product_ListMenu"
									class="xans-record-">낮은가격</option>
								<option value="?cate_no=42&amp;sort_method=4#Product_ListMenu"
									class="xans-record-">높은가격</option>
								<option value="?cate_no=42&amp;sort_method=1#Product_ListMenu"
									class="xans-record-">상품명</option>
							</select>
						</div>
					</div>
					<fieldset class="condition displaynone">
						<legend>조건별 검색</legend>
						<p>

							<select
								class="xans-element- xans-product xans-product-firstselect FirstSelect"><option
									value="">-조건선택-</option>
								<option value="" class=""></option>
							</select> <select
								class="xans-element- xans-product xans-product-secondselect SecondSelect"><option
									value="">-조건선택-</option>
								<option value="" class=""></option>
							</select> <a href="#SelectSearch" class="btnSubmitFix">검색</a>
						</p>
					</fieldset>
				</div>
				<div data-ez-holder="product_list">
					<div
						class="xans-element- xans-product xans-product-listnormal ec-base-product">
						<!--
					$count = 20
					※ 상품진열갯수를 설정하는 변수입니다. 설정하지 않을 경우, 최대 200개의 상품이 진열 됩니다.
					※ 진열된 상품이 많으면, 쇼핑몰에 부하가 발생할 수 있습니다.
					$moreview = no
					$cache = yes
					$basket_result = /product/add_basket.html
					$basket_option = /product/basket_option.html
				-->
						<ul class="prdList grid4" data-ez-role="layout ez-discount-tag">
							<!--
※ 상품진열 공통소스
-->
						<c:forEach var="product" items="${products.content}" varStatus="status">
								
							<li id="anchorBoxId_14" class="xans-record-">
								<div class="prdList__item">
									<div class="thumbnail">
										<a href="/product/detailProduct?id=${product.productSeq}&userId=${principal.user.id}"><img
											src="http://localhost:9000/upload/img/${product.fileInfo[0].uuid}"
											id="eListPrdImage14_1" alt="살구색 후드티" loading="lazy"></a>
										<div class="likeButton displaynone">
											<button type="button">
												<strong></strong>
											</button>
										</div>
										<div class="custom_badge">
											<span></span>
										</div>
										<div class="icon__box">
											<span class="wish" data-productSeq="${product.productSeq}"><img
												src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_wish_before.png"
												class="icon_img ec-product-listwishicon" alt="관심상품 등록 전"
												data-productSeq="${product.productSeq}"
												productno="14" categoryno="42" icon_status="off"
												login_status="F" individual-set="F">WISH</span> 
												
												<span class="cart" data-productSeq="${product.productSeq}"
												data-productName="${product.productName}"
												data-productPrice="${product.price}">
												<img data-productSeq="${product.productSeq}"
												src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_list_cart.gif"
												
												alt="장바구니 담기" class="ec-admin-icon">ADD</span> <span
												class="option" style="display: none;">OPTION</span>
										</div>
									</div>
									<div class="description" ec-data-custom=""
										ec-data-price="80000">
										<div class="name">
											<a href="/product/detailProduct?id=${product.productSeq}&userId=${principal.user.id}" class=""><span
												class="title displaynone"><span
													style="font-size: 13px; color: #555555;">상품명</span> :</span> <span
												style="font-size: 13px; color: #555555;">${product.productName}</span></a>
										</div>
										<p class="ec-base-help txtWarn txt11 displaynone">단독구매상품</p>
										<ul
											class="xans-element- xans-product xans-product-listitem spec">
											<li class=" xans-record-"><strong
												class="title displaynone"><span
													style="font-size: 13px; color: #000000; font-weight: bold;">판매가</span>
													:</strong> <span
												style="font-size: 13px; color: #000000; font-weight: bold;">
								
                    						<fmt:formatNumber value="${product.price}" type="number" />원</span><span
												id="span_product_tax_type_text" style=""> </span></li>
										</ul>
										<div class="icon"></div>
									</div>
								</div>
							</li>
							<input type="hidden" id="hiddenPrice" value="${product.price}"/>
						</c:forEach>
							<!-- <li id="anchorBoxId_15" class="xans-record-">
								<div class="prdList__item">
									<div class="thumbnail">
										<a href="/product/와이드-데님-팬츠/15/category/42/display/1/"><img
											src="//ecudemo276583.cafe24.com/web/product/medium/202304/38346a928b6679d450b1a100c48400b8.png"
											id="eListPrdImage15_1" alt="와이드 데님 팬츠" loading="lazy"></a>
										<div class="likeButton displaynone">
											<button type="button">
												<strong></strong>
											</button>
										</div>
										<div class="custom_badge">
											<span></span>
										</div>
										<div class="icon__box">
											<span class="wish"><img
												src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_wish_before.png"
												class="icon_img ec-product-listwishicon" alt="관심상품 등록 전"
												productno="15" categoryno="42" icon_status="off"
												login_status="F" individual-set="F">WISH</span> <span
												class="cart"><img
												src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_list_cart.gif"
												onclick="CAPP_SHOP_NEW_PRODUCT_OPTIONSELECT.selectOptionCommon(15,  42, 'basket', '')"
												alt="장바구니 담기" class="ec-admin-icon cart">ADD</span> <span
												class="option" style="display: none;">OPTION</span>
										</div>
										<div class="sale_box">33%</div>
									</div>
									<div class="description" ec-data-custom="150000"
										ec-data-price="100000">
										<div class="name">
											<a href="/product/와이드-데님-팬츠/15/category/42/display/1/"
												class=""><span class="title displaynone"><span
													style="font-size: 13px; color: #555555;">상품명</span> :</span> <span
												style="font-size: 13px; color: #555555;">와이드 데님 팬츠</span></a>
										</div>
										<p class="ec-base-help txtWarn txt11 displaynone">단독구매상품</p>
										<ul
											class="xans-element- xans-product xans-product-listitem spec">
											<li class=" xans-record-"><strong
												class="title displaynone"><span
													style="font-size: 12px; color: #555555;">소비자가</span> :</strong> <span
												style="font-size: 12px; color: #555555; text-decoration: line-through;">150,000원</span>
											</li>
											<li class=" xans-record-"><strong
												class="title displaynone"><span
													style="font-size: 13px; color: #000000; font-weight: bold;">판매가</span>
													:</strong> <span
												style="font-size: 13px; color: #000000; font-weight: bold;">100,000원</span><span
												id="span_product_tax_type_text" style=""> </span></li>
											<li class=" xans-record-"><strong
												class="title displaynone"><span
													style="font-size: 12px; color: #555555;">상품색상</span> :</strong>
												<div class="color">
													<span class="chips" title="#D0AE82"
														style="background-color: #D0AE82" color_no=""
														displaygroup="1"></span><span class="chips"
														title="#9DBACA" style="background-color: #9DBACA"
														color_no="" displaygroup="1"></span>
												</div></li>
										</ul>
										<div class="icon"></div>
									</div>
								</div>
							</li>
							<li id="anchorBoxId_16" class="xans-record-">
								<div class="prdList__item">
									<div class="thumbnail">
										<a href="/product/데일리-백/16/category/42/display/1/"><img
											src="//ecudemo276583.cafe24.com/web/product/medium/202304/703325c4f2152a3ade5c992cead8c427.png"
											id="eListPrdImage16_1" alt="데일리 백" loading="lazy"></a>
										<div class="likeButton displaynone">
											<button type="button">
												<strong></strong>
											</button>
										</div>
										<div class="custom_badge">
											<span></span>
										</div>
										<div class="icon__box">
											<span class="wish"><img
												src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_wish_before.png"
												class="icon_img ec-product-listwishicon" alt="관심상품 등록 전"
												productno="16" categoryno="42" icon_status="off"
												login_status="F" individual-set="F">WISH</span> <span
												class="cart"><img
												src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_list_cart.gif"
												onclick="CAPP_SHOP_NEW_PRODUCT_OPTIONSELECT.selectOptionCommon(16,  42, 'basket', '')"
												alt="장바구니 담기" class="ec-admin-icon cart">ADD</span> <span
												class="option" style="display: none;">OPTION</span>
										</div>
										<div class="sale_box">50%</div>
									</div>
									<div class="description" ec-data-custom="100000"
										ec-data-price="50000">
										<div class="name">
											<a href="/product/데일리-백/16/category/42/display/1/" class=""><span
												class="title displaynone"><span
													style="font-size: 13px; color: #555555;">상품명</span> :</span> <span
												style="font-size: 13px; color: #555555;">데일리 백</span></a>
										</div>
										<p class="ec-base-help txtWarn txt11 displaynone">단독구매상품</p>
										<ul
											class="xans-element- xans-product xans-product-listitem spec">
											<li class=" xans-record-"><strong
												class="title displaynone"><span
													style="font-size: 12px; color: #555555;">소비자가</span> :</strong> <span
												style="font-size: 12px; color: #555555; text-decoration: line-through;">100,000원</span>
											</li>
											<li class=" xans-record-"><strong
												class="title displaynone"><span
													style="font-size: 13px; color: #000000; font-weight: bold;">판매가</span>
													:</strong> <span
												style="font-size: 13px; color: #000000; font-weight: bold;">50,000원</span><span
												id="span_product_tax_type_text" style=""> </span></li>
											<li class=" xans-record-"><strong
												class="title displaynone"><span
													style="font-size: 12px; color: #555555;">상품색상</span> :</strong>
												<div class="color">
													<span class="chips" title="#D0AE82"
														style="background-color: #D0AE82" color_no=""
														displaygroup="1"></span><span class="chips"
														title="#9DBACA" style="background-color: #9DBACA"
														color_no="" displaygroup="1"></span>
												</div></li>
										</ul>
										<div class="icon"></div>
									</div>
								</div>
							</li>
							<li id="anchorBoxId_18" class="xans-record-">
								<div class="prdList__item">
									<div class="thumbnail">
										<a href="/product/슬림핏-체크-팬츠/18/category/42/display/1/"><img
											src="//ecudemo276583.cafe24.com/web/product/medium/202304/9642d10fc2c7254546b742b3c51cfebf.png"
											id="eListPrdImage18_1" alt="슬림핏 체크 팬츠" loading="lazy"></a>
										<div class="likeButton displaynone">
											<button type="button">
												<strong></strong>
											</button>
										</div>
										<div class="custom_badge">
											<span></span>
										</div>
										<div class="icon__box">
											<span class="wish"><img
												src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_wish_before.png"
												class="icon_img ec-product-listwishicon" alt="관심상품 등록 전"
												productno="18" categoryno="42" icon_status="off"
												login_status="F" individual-set="F">WISH</span> <span
												class="cart"><img
												src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_list_cart.gif"
												onclick="category_add_basket('18','42', '1', 'A0000', false, '1', 'P000000S', 'A', 'F', '0');"
												alt="장바구니 담기" class="ec-admin-icon cart">ADD</span> <span
												class="option" style="display: none;">OPTION</span>
										</div>
									</div>
									<div class="description" ec-data-custom=""
										ec-data-price="50000">
										<div class="name">
											<a href="/product/슬림핏-체크-팬츠/18/category/42/display/1/"
												class=""><span class="title displaynone"><span
													style="font-size: 13px; color: #555555;">상품명</span> :</span> <span
												style="font-size: 13px; color: #555555;">슬림핏 체크 팬츠</span></a>
										</div>
										<p class="ec-base-help txtWarn txt11 displaynone">단독구매상품</p>
										<ul
											class="xans-element- xans-product xans-product-listitem spec">
											<li class=" xans-record-"><strong
												class="title displaynone"><span
													style="font-size: 13px; color: #000000; font-weight: bold;">판매가</span>
													:</strong> <span
												style="font-size: 13px; color: #000000; font-weight: bold;">50,000원</span><span
												id="span_product_tax_type_text" style=""> </span></li>
										</ul>
										<div class="icon"></div>
									</div>
								</div>
							</li>
							<li id="anchorBoxId_19" class="xans-record-">
								<div class="prdList__item">
									<div class="thumbnail">
										<a href="/product/블랙-워커-부츠/19/category/42/display/1/"><img
											src="//ecudemo276583.cafe24.com/web/product/medium/202304/dc35d44faf363f5f96702dd2242d8588.png"
											id="eListPrdImage19_1" alt="블랙 워커 부츠" loading="lazy"></a>
										<div class="likeButton displaynone">
											<button type="button">
												<strong></strong>
											</button>
										</div>
										<div class="custom_badge">
											<span></span>
										</div>
										<div class="icon__box">
											<span class="wish"><img
												src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_wish_before.png"
												class="icon_img ec-product-listwishicon" alt="관심상품 등록 전"
												productno="19" categoryno="42" icon_status="off"
												login_status="F" individual-set="F">WISH</span> <span
												class="cart"><img
												src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_list_cart.gif"
												onclick="category_add_basket('19','42', '1', 'A0000', false, '1', 'P000000T', 'A', 'F', '0');"
												alt="장바구니 담기" class="ec-admin-icon cart">ADD</span> <span
												class="option" style="display: none;">OPTION</span>
										</div>
										<div class="sale_box">10%</div>
									</div>
									<div class="description" ec-data-custom="100000"
										ec-data-price="90000">
										<div class="name">
											<a href="/product/블랙-워커-부츠/19/category/42/display/1/"
												class=""><span class="title displaynone"><span
													style="font-size: 13px; color: #555555;">상품명</span> :</span> <span
												style="font-size: 13px; color: #555555;">블랙 워커 부츠</span></a>
										</div>
										<p class="ec-base-help txtWarn txt11 displaynone">단독구매상품</p>
										<ul
											class="xans-element- xans-product xans-product-listitem spec">
											<li class=" xans-record-"><strong
												class="title displaynone"><span
													style="font-size: 12px; color: #555555;">소비자가</span> :</strong> <span
												style="font-size: 12px; color: #555555; text-decoration: line-through;">100,000원</span>
											</li>
											<li class=" xans-record-"><strong
												class="title displaynone"><span
													style="font-size: 13px; color: #000000; font-weight: bold;">판매가</span>
													:</strong> <span
												style="font-size: 13px; color: #000000; font-weight: bold;">90,000원</span><span
												id="span_product_tax_type_text" style=""> </span></li>
										</ul>
										<div class="icon"></div>
									</div>
								</div>
							</li>
							<li id="anchorBoxId_20" class="xans-record-">
								<div class="prdList__item">
									<div class="thumbnail">
										<a href="/product/데일리-니트/20/category/42/display/1/"><img
											src="//ecudemo276583.cafe24.com/web/product/medium/202304/8585f0c6a7b15ad4afa1735c24a5ed5f.png"
											id="eListPrdImage20_1" alt="데일리 니트" loading="lazy"></a>
										<div class="likeButton displaynone">
											<button type="button">
												<strong></strong>
											</button>
										</div>
										<div class="custom_badge">
											<span></span>
										</div>
										<div class="icon__box">
											<span class="wish"><img
												src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_wish_before.png"
												class="icon_img ec-product-listwishicon" alt="관심상품 등록 전"
												productno="20" categoryno="42" icon_status="off"
												login_status="F" individual-set="F">WISH</span> <span
												class="cart"><img
												src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_list_cart.gif"
												onclick="category_add_basket('20','42', '1', 'A0000', false, '1', 'P000000U', 'A', 'F', '0');"
												alt="장바구니 담기" class="ec-admin-icon cart">ADD</span> <span
												class="option" style="display: none;">OPTION</span>
										</div>
										<div class="sale_box">29%</div>
									</div>
									<div class="description" ec-data-custom="70000"
										ec-data-price="50000">
										<div class="name">
											<a href="/product/데일리-니트/20/category/42/display/1/" class=""><span
												class="title displaynone"><span
													style="font-size: 13px; color: #555555;">상품명</span> :</span> <span
												style="font-size: 13px; color: #555555;">데일리 니트</span></a>
										</div>
										<p class="ec-base-help txtWarn txt11 displaynone">단독구매상품</p>
										<ul
											class="xans-element- xans-product xans-product-listitem spec">
											<li class=" xans-record-"><strong
												class="title displaynone"><span
													style="font-size: 12px; color: #555555;">소비자가</span> :</strong> <span
												style="font-size: 12px; color: #555555; text-decoration: line-through;">70,000원</span>
											</li>
											<li class=" xans-record-"><strong
												class="title displaynone"><span
													style="font-size: 13px; color: #000000; font-weight: bold;">판매가</span>
													:</strong> <span
												style="font-size: 13px; color: #000000; font-weight: bold;">50,000원</span><span
												id="span_product_tax_type_text" style=""> </span></li>
										</ul>
										<div class="icon"></div>
									</div>
								</div>
							</li>
							<li id="anchorBoxId_11" class="xans-record-">
								<div class="prdList__item">
									<div class="thumbnail">
										<a href="/product/그물-가방/11/category/42/display/1/"><img
											src="//ecudemo276583.cafe24.com/web/product/medium/202304/753ffefd58ccde2991b998ac39c8a49b.png"
											id="eListPrdImage11_1" alt="그물 가방" loading="lazy"></a>
										<div class="likeButton displaynone">
											<button type="button">
												<strong></strong>
											</button>
										</div>
										<div class="custom_badge">
											<span></span>
										</div>
										<div class="icon__box">
											<span class="wish"><img
												src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_wish_before.png"
												class="icon_img ec-product-listwishicon" alt="관심상품 등록 전"
												productno="11" categoryno="42" icon_status="off"
												login_status="F" individual-set="F">WISH</span> <span
												class="cart"><img
												src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_list_cart.gif"
												onclick="category_add_basket('11','42', '1', 'A0000', false, '1', 'P000000L', 'A', 'F', '0');"
												alt="장바구니 담기" class="ec-admin-icon cart">ADD</span> <span
												class="option" style="display: none;">OPTION</span>
										</div>
									</div>
									<div class="description" ec-data-custom=""
										ec-data-price="39000">
										<div class="name">
											<a href="/product/그물-가방/11/category/42/display/1/" class=""><span
												class="title displaynone"><span
													style="font-size: 13px; color: #555555;">상품명</span> :</span> <span
												style="font-size: 13px; color: #555555;">그물 가방</span></a>
										</div>
										<p class="ec-base-help txtWarn txt11 displaynone">단독구매상품</p>
										<ul
											class="xans-element- xans-product xans-product-listitem spec">
											<li class=" xans-record-"><strong
												class="title displaynone"><span
													style="font-size: 13px; color: #000000; font-weight: bold;">판매가</span>
													:</strong> <span
												style="font-size: 13px; color: #000000; font-weight: bold;">39,000원</span><span
												id="span_product_tax_type_text" style=""> </span></li>
										</ul>
										<div class="icon"></div>
									</div>
								</div>
							</li>
							<li id="anchorBoxId_12" class="xans-record-">
								<div class="prdList__item">
									<div class="thumbnail">
										<a href="/product/선글라스/12/category/42/display/1/"><img
											src="//ecudemo276583.cafe24.com/web/product/medium/202304/b6462da5ab74ab388c6b0e5fb6663bc7.png"
											id="eListPrdImage12_1" alt="선글라스" loading="lazy"></a>
										<div class="likeButton displaynone">
											<button type="button">
												<strong></strong>
											</button>
										</div>
										<div class="custom_badge">
											<span></span>
										</div>
										<div class="icon__box">
											<span class="wish"><img
												src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_wish_before.png"
												class="icon_img ec-product-listwishicon" alt="관심상품 등록 전"
												productno="12" categoryno="42" icon_status="off"
												login_status="F" individual-set="F">WISH</span> <span
												class="cart"><img
												src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_list_cart.gif"
												onclick="category_add_basket('12','42', '1', 'A0000', false, '1', 'P000000M', 'A', 'F', '0');"
												alt="장바구니 담기" class="ec-admin-icon cart">ADD</span> <span
												class="option" style="display: none;">OPTION</span>
										</div>
									</div>
									<div class="description" ec-data-custom=""
										ec-data-price="150000">
										<div class="name">
											<a href="/product/선글라스/12/category/42/display/1/" class=""><span
												class="title displaynone"><span
													style="font-size: 13px; color: #555555;">상품명</span> :</span> <span
												style="font-size: 13px; color: #555555;">선글라스</span></a>
										</div>
										<p class="ec-base-help txtWarn txt11 displaynone">단독구매상품</p>
										<ul
											class="xans-element- xans-product xans-product-listitem spec">
											<li class=" xans-record-"><strong
												class="title displaynone"><span
													style="font-size: 13px; color: #000000; font-weight: bold;">판매가</span>
													:</strong> <span
												style="font-size: 13px; color: #000000; font-weight: bold;">150,000원</span><span
												id="span_product_tax_type_text" style=""> </span></li>
										</ul>
										<div class="icon"></div>
									</div>
								</div>
							</li>
							<li id="anchorBoxId_13" class="xans-record-">
								<div class="prdList__item">
									<div class="thumbnail">
										<a href="/product/데일리-가죽-시계/13/category/42/display/1/"><img
											src="//ecudemo276583.cafe24.com/web/product/medium/202304/dd5ab7ffd20ec429cd786eadca35ef89.png"
											id="eListPrdImage13_1" alt="데일리 가죽 시계" loading="lazy"></a>
										<div class="likeButton displaynone">
											<button type="button">
												<strong></strong>
											</button>
										</div>
										<div class="custom_badge">
											<span></span>
										</div>
										<div class="icon__box">
											<span class="wish"><img
												src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_wish_before.png"
												class="icon_img ec-product-listwishicon" alt="관심상품 등록 전"
												productno="13" categoryno="42" icon_status="off"
												login_status="F" individual-set="F">WISH</span> <span
												class="cart"><img
												src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_list_cart.gif"
												onclick="category_add_basket('13','42', '1', 'A0000', false, '1', 'P000000N', 'A', 'F', '0');"
												alt="장바구니 담기" class="ec-admin-icon cart">ADD</span> <span
												class="option" style="display: none;">OPTION</span>
										</div>
									</div>
									<div class="description" ec-data-custom=""
										ec-data-price="150000">
										<div class="name">
											<a href="/product/데일리-가죽-시계/13/category/42/display/1/"
												class=""><span class="title displaynone"><span
													style="font-size: 13px; color: #555555;">상품명</span> :</span> <span
												style="font-size: 13px; color: #555555;">데일리 가죽 시계</span></a>
										</div>
										<p class="ec-base-help txtWarn txt11 displaynone">단독구매상품</p>
										<ul
											class="xans-element- xans-product xans-product-listitem spec">
											<li class=" xans-record-"><strong
												class="title displaynone"><span
													style="font-size: 13px; color: #000000; font-weight: bold;">판매가</span>
													:</strong> <span
												style="font-size: 13px; color: #000000; font-weight: bold;">150,000원</span><span
												id="span_product_tax_type_text" style=""> </span></li>
										</ul>
										<div class="icon"></div>
									</div>
								</div>
							</li>
							<li id="anchorBoxId_17" class="xans-record-">
								<div class="prdList__item">
									<div class="thumbnail">
										<a href="/product/에나멜-플랫-단화/17/category/42/display/1/"><img
											src="//ecudemo276583.cafe24.com/web/product/medium/202304/6c7998d5b153bdd6bcfb83d215b460e8.png"
											id="eListPrdImage17_1" alt="에나멜 플랫 단화" loading="lazy"></a>
										<div class="likeButton displaynone">
											<button type="button">
												<strong></strong>
											</button>
										</div>
										<div class="custom_badge">
											<span></span>
										</div>
										<div class="icon__box">
											<span class="wish"><img
												src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_wish_before.png"
												class="icon_img ec-product-listwishicon" alt="관심상품 등록 전"
												productno="17" categoryno="42" icon_status="off"
												login_status="F" individual-set="F">WISH</span> <span
												class="cart"><img
												src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_list_cart.gif"
												onclick="category_add_basket('17','42', '1', 'A0000', false, '1', 'P000000R', 'A', 'F', '0');"
												alt="장바구니 담기" class="ec-admin-icon cart">ADD</span> <span
												class="option" style="display: none;">OPTION</span>
										</div>
									</div>
									<div class="description" ec-data-custom=""
										ec-data-price="50000">
										<div class="name">
											<a href="/product/에나멜-플랫-단화/17/category/42/display/1/"
												class=""><span class="title displaynone"><span
													style="font-size: 13px; color: #555555;">상품명</span> :</span> <span
												style="font-size: 13px; color: #555555;">에나멜 플랫 단화</span></a>
										</div>
										<p class="ec-base-help txtWarn txt11 displaynone">단독구매상품</p>
										<ul
											class="xans-element- xans-product xans-product-listitem spec">
											<li class=" xans-record-"><strong
												class="title displaynone"><span
													style="font-size: 13px; color: #000000; font-weight: bold;">판매가</span>
													:</strong> <span
												style="font-size: 13px; color: #000000; font-weight: bold;">50,000원</span><span
												id="span_product_tax_type_text" style=""> </span></li>
										</ul>
										<div class="icon"></div>
									</div>
								</div>
							</li> -->
						</ul>
					</div>

					<div
						class="xans-element- xans-product xans-product-normalpaging ec-base-paginate typeList">
						
				  	<c:choose>
				  		<c:when test="${products.first}">
							<!-- <a href="#none" class="first">첫 페이지</a> --> 
							<a onclick="return false;" href="?page=${products.number-1}">이전 페이지</a>
				  		</c:when>
				  		<c:otherwise>
							<a href="?page=${products.number-1}">이전 페이지</a>
				  		</c:otherwise>
				  	</c:choose>
				  	
					<c:forEach var="i" begin="0" end="${products.number}">
						<ol>
							<li class="xans-record-"><a href="?category=${category}&page=${products.number}" class="this">${i+1}</a></li>
						</ol>
				  	</c:forEach>
				  	
				  	<c:choose>
				  		<c:when test="${products.last}">
				  			<a onclick="return false;" href="?category=${category}&page=${products.number+1}">다음 페이지</a>
				  			<!-- <a href="#none" class="last">마지막 페이지</a> -->
				  		</c:when>
				  		<c:otherwise>
				  			<a href="?page=${products.number+1}">다음 페이지</a>
				  		</c:otherwise>
				  	</c:choose>
				  	
				  	
						<!-- <a href="#none" class="first">첫 페이지</a> <a href="#none">이전 페이지</a>
						<ol>
							<li class="xans-record-"><a href="?page=1" class="this">1</a></li>
						</ol>
						<a href="#none">다음 페이지</a> <a href="#none" class="last">마지막 페이지</a> -->
					</div>
				</div>
				<!-- //product_list -->
			</div>
			<!-- //product_normalpackage -->
		</div>
		<!--#ez="1/1"-->
	</div>
</div>


<script type="text/javascript">
	// 배열 객체 직접 생성
	let myWishArr = new Array();
 let pageable = ${products.number};
 let wishList = [
	 <c:if test="${not empty wishs}">
		<c:forEach var="wish" items="${wishs}" varStatus="status">
		      {
		        id: ${wish.id},
		        productId: ${wish.product.productSeq},
		        wishYn: "${wish.wishYn}"
		      }<c:if test="${!status.last}">,</c:if>
		</c:forEach>
 	</c:if>
	];
 let productList = [
	 <c:if test="${not empty products}">
		<c:forEach var="product" items="${products.content}" varStatus="status">
		      {
		        id: ${product.productSeq}
		      }<c:if test="${!status.last}">,</c:if>
		</c:forEach>
 	</c:if>
	];
 </script>
 
<script type="text/javascript" src="/js/product.js"></script>
<%@ include file="../layout/footer.jsp" %>