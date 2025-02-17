<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<style>
	.container { position:relative; } 
	.img_wrap { position: relative; width: 400px; height:400px; } 
	.img_wrap .img { position: absolute; top: 0; left: 0; width: 100%; height: 100%; z-index: 1; } 
	.zoom_lens { display: none; position:absolute; width:150px; height:150px; background: #000; border: 1px solid #fff; z-index: 2; opacity: 0.2; } 
	.zoom_result { display: none; position: absolute; top: 0; left:520px; width:400px; height:400px; } 
	.img_wrap:hover ~ .zoom_result,
	.img_wrap:hover .zoom_lens { display: block; } 
	#btn-update{
		position: absolute;
	    right: 20%;
    }
</style>

<div id="container" data-ez="layout-06i7law-1">

      	<c:if test="${principal.user.role eq 'ADMIN'}">
			<a href="/product/modifyProduct?id=${productSeq}"><button id="btn-update" class="btn btn-primary">제품 수정</button></a>
      	</c:if>
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
			data-ez="contents-1jwfwof-1"
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
		<div class="titleArea display_tablet_only"
			data-ez-module="product-detail-head-title-mobile/1"
			data-ez="contents-12flu73-1">
			<h2>상품상세 정보</h2>
		</div>
		<div data-ez="contents-1ddkr5s-1"
			class="xans-element- xans-product xans-product-detail section">
			<!--
		$coupon_download_page = /coupon/coupon_productdetail.html
    -->
			<div class="detailArea ">
				<div class="xans-element- xans-product xans-product-image imgArea">
					<div class="RW ">
									
						<div class="prdImg ">
							<div class="img_wrap thumbnail" style="width: 500px;">
								<img src="//ecudemo276583.cafe24.com/web/product/big/202304/e366d126ee2a0e92a6946993f101d633.png"
									alt="살구색 후드티" class="img" loading="lazy" ez-prevent="img"
										style="height: auto; width: 100%;">
							</div>
							<div class="zoom_result" style="z-index: 100;"></div>
						</div>
						<hr>
						<div style="margin-top: 300px;"
							class="xans-element- xans-product xans-product-addimage listImg">
							<div class="inner">
								<ul class="list">
									<li class="xans-record-"><img
										src="//ecudemo276583.cafe24.com/web/product/small/202304/5cd910e271dfa7e7ef4fd49ed5f5487f.png"
										class="ThumbImage" alt=""></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="RTMB ">
						<p class="prdImg">
							<a href="#none" id="prdDetailImg"
								data-param="?product_no=14&amp;cate_no=42&amp;display_group=1"
								class="thumbnail"> <img
								src="//ecudemo276583.cafe24.com/web/product/big/202304/e366d126ee2a0e92a6946993f101d633.png"
								class="bigImage" alt="살구색 후드티" loading="lazy" ez-prevent="img">
								<span class="wish"><img
									src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/btn_wish_before.png"
									class="icon_img ec-product-listwishicon" alt="관심상품 등록 전"
									productno="14" categoryno="42" icon_status="off"
									login_status="F" individual-set="F"></span>
							</a>
						</p>
					</div>
				</div>

				<div class="infoArea" data-ez-role="ez-discount-tag">
					<div class="headingArea">
						<div class="icon"></div>
						<h1>살구색 후드티</h1>
						<span class="delivery displaynone">(해외배송 가능상품)</span>
					</div>
					<div class="topLogo displaynone">
						<span></span> <a href="#none" onclick=""><img src=""
							alt="공급사 바로가기" loading="lazy" ez-prevent="img"></a>
					</div>
					<div class="xans-element- xans-product xans-product-detaildesign">
						<!--
                    출력 갯수 지정 변수, 없으면 설정된 전체가 나옵니다.
                    count = 10
                -->
						<table border="1">
							<caption>기본 정보</caption>
							<tbody>
								<tr class=" xans-record-">
									<th scope="row"><span
										style="font-size: 16px; color: #555555;">상품명</span></th>
									<td><span style="font-size: 16px; color: #555555;">살구색
											후드티</span></td>
								</tr>
								<tr class=" xans-record-">
									<th scope="row"><span
										style="font-size: 13px; color: #000000; font-weight: bold;">판매가</span></th>
									<td><span
										style="font-size: 13px; color: #000000; font-weight: bold;"><strong
											id="span_product_price_text">80,000원</strong><input
											id="product_price" name="product_price" value=""
											type="hidden"></span></td>
								</tr>
								<tr class=" xans-record-">
									<th scope="row"><span
										style="font-size: 13px; color: #555555;">국내·해외배송</span></th>
									<td><span style="font-size: 13px; color: #555555;">국내배송</span></td>
								</tr>
								<tr class=" xans-record-">
									<th scope="row"><span
										style="font-size: 13px; color: #555555;">배송방법</span></th>
									<td><span style="font-size: 13px; color: #555555;">택배</span></td>
								</tr>
								<tr class=" xans-record-">
									<th scope="row"><span
										style="font-size: 13px; color: #555555;">배송비</span></th>
									<td><span style="font-size: 13px; color: #555555;"><span
											class="delv_price_B"><input id="delivery_cost_prepaid"
												name="delivery_cost_prepaid" value="P" type="hidden"><strong>2,500원</strong>
												(50,000원 이상 구매 시 무료)</span></span></td>
								</tr>
							</tbody>
						</table>
					</div>

					<!--- 렌탈서비스 -->
					<table border="1" summary="" class="displaynone">
						<tbody>
							<tr class="rental">
								<th scope="row">월 렌탈 금액</th>
								<td>
									<p class="rental-maximum">
										월 <span class="rental-maximum-price"></span>원
									</p> <span>(<span class="rental-maximum-term"></span>개월 기준)
								</span>
									<ul class="xans-element- xans-product xans-product-rental">
										<li class=""><span class="rental-term"></span>개월 / 월 <span
											class="rental-price"></span>원</li>
									</ul>
								</td>
							</tr>
						</tbody>
					</table>

					<div class="regularDelivery displaynone">
						<table border="1" summary="정기결제">
							<caption>정기결제</caption>
							<tbody>
								<tr>
									<th scope="row">구매방법</th>
									<td><label class="gLabel"><span
											class="displaynone"></span> 정기배송<span
											class="badge displaynone"> <i class="icoDown">할인</i></span></label> <label
										class="gLabel displaynone"> 1회구매</label></td>
								</tr>
								<tr class="shippingCycle displaynone" id="">
									<th scope="row">배송주기</th>
									<td></td>
								</tr>
								<tr class="shippingNum displaynone" id="">
									<th scope="row">정기배송 횟수</th>
									<td></td>
								</tr>
								<tr class="shippingGuide" id="">
									<th scope="row"><span class="displaynone">안내사항</span></th>
									<td>
										<div class="info displaynone" id="">
											<p class="title">
												<strong>정기배송 할인</strong> <span class="icoSave">save</span>
											</p>
											<ul
												class="xans-element- xans-product xans-product-regulardiscount">
												<li class="">차 이상 구매 시 : <span class="icoDown">할인</span>
												</li>
											</ul>
										</div>
										<div class="info">
											<ul class="ec-base-help typeDash txt11">
												<li>배송주기, 정기배송 횟수는 상품 전체에 동일하게 적용됩니다.</li>
											</ul>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>

					<p class="displaynone">
						<img
							src="//img.echosting.cafe24.com/skin/base_ko_KR/product/txt_naver.gif"
							alt="개인결제창을 통한 결제 시 네이버 마일리지 적립 및 사용이 가능합니다." loading="lazy"
							ez-prevent="img">
					</p>

					<table border="1"
						class="xans-element- xans-product xans-product-option xans-record-">
						<!--
                $use_per_add_option = yes
                -->
						<caption>상품 옵션</caption>
						<tbody>
						</tbody>
						<tbody>
							<tr class="displaynone" id="">
								<td colspan="2" class="selectButton"><a href="#none"
									class="btnSubmit sizeS" onclick="">옵션선택</a></td>
							</tr>
						</tbody>
					</table>


					<div class="guideArea">
						<p class="info ">
							(최소주문수량 1개 이상<span class="displaynone"> / 최대주문수량 0개 이하</span>)
						</p>
						<span class="sizeGuide displaynone"><a href="#none"
							class="size_guide_info" product_no="14">사이즈 가이드 <i
								aria-hidden="true" class="icon icoArrowRight"></i></a></span>
					</div>




					<div id="totalProducts" class="">
						<table border="1">
							<caption>상품 목록</caption>
							<colgroup>
								<col style="width: auto;">
								<col style="width: 100px;">
								<col style="width: 50px;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">상품명</th>
									<th scope="col">상품수</th>
									<th scope="col">가격</th>
								</tr>
							</thead>
							<tbody class="">
								<tr>
									<td>살구색 후드티</td>
									<td><span class="quantity"> <input id="quantity"
											name="quantity_opt[]" style="" value="1" type="text">
											<a href="javascript:;" class="up QuantityUp countEvent">수량증가</a> <a
											href="javascript:;" class="down QuantityDown countEvent">수량감소</a>
									</span></td>
									<td class="right"><span class="quantity_price">80,000원<input
											type="hidden" name="option_box_price"
											class="option_box_price" value="80000"
											item_code="P000000O000A"></span> <span
										class="mileage displaynone" style="display: none;">(<img
											src="" loading="lazy" ez-prevent="img"> &nbsp;<span
											class="mileage_price"></span>)
									</span></td>
								</tr>
								<tr id="totalProductsOption"
									class="xans-element- xans-product xans-product-option option xans-record-">
									<!--
                            $use_per_add_option = yes
                            $default_option = yes
                            -->
									<td class="middle" colspan="3">
										<table border="1">
											<caption>옵션 정보</caption>
											<colgroup>
												<col style="width: 30%;">
												<col style="width: auto;">
											</colgroup>
											<tbody>

											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
							<!-- 옵션선택 또는 세트상품 선택시 상품이 추가되는 영역입니다. 쇼핑몰 화면에는 아래와 같은 마크업구조로 표시됩니다. 삭제시 기능이 정상동작 하지 않습니다. -->
							<tbody>
								<!-- tr>
                            <td>
                                <p class="product">
                                    $상품명<br />
                                    <span>$옵션</span>
                                </p>
                            </td>
                            <td>
                                <span class="quantity">
                                    <input type="text" class="quantity_opt" />
                                    &nbsp;<a href="javascript:;" class="up eProductQuantityUpClass"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_up.gif" alt="수량증가"  loading="lazy" ez-prevent="img"></a>
                                    <a href="javascript:;" class="down eProductQuantityDownClass"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_down.gif" alt="수량감소"  loading="lazy" ez-prevent="img"></a>
                                </span>
                                <a href="#none"><img src="//img.echosting.cafe24.com/design/skin/default/product/btn_price_delete.gif" alt="삭제" class="option_box_del"  loading="lazy" ez-prevent="img"></a>
                            </td>
                            <td class="right">
                                <span>$가격</span>
                                <span class="mileage">(<img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/product/ico_pay_point.gif"  loading="lazy" ez-prevent="img"> &nbsp;<span class="mileage_price">$적립금</span>)</span>
                            </td>
                        </tr -->
							</tbody>

							<!-- // 옵션선택 또는 세트상품 선택시 상품이 추가되는 영역입니다. 쇼핑몰 화면에는 아래와 같은 마크업구조로 표시됩니다. 삭제시 기능이 정상동작 하지 않습니다. -->
						</table>
					</div>

					<div id="totalPrice" class="totalPrice">
						<p class="ec-base-help txtWarn txt11 displaynone">단독구매상품</p>
						<strong class="title">TOTAL <span class="qty">(QUANTITY)</span></strong><span
							class="total"><strong><em>80,000원</em></strong> (1개)</span>
					</div>
					<p class="ec-base-help displaynone EC-price-warning">할인가가 적용된
						최종 결제예정금액은 주문 시 확인할 수 있습니다.</p>

					<div id=""
						class="xans-element- xans-product xans-product-action productAction">
						<div id="ec-product-price-info" class="displaynone"
							ec-data-custom="0원" ec-data-price="80000"></div>
						<div class=" action_button ">
							<span class="sub_sold displaynone">SOLD OUT</span> <a
								href="#none" class="btnSubmit sizeL "
								onclick="product_submit(1, '/exec/front/order/basket/', this)"><span
								id="actionBuy">구매하기</span><span class="displaynone"
								id="actionReserve">예약주문</span><span id="" class="displaynone">REGULAR
									DELIVERY</span></a>
							<button type="button" class="btnNormal sizeL actionCart "
								onclick="product_submit(2, '/exec/front/order/basket/', this)"
								id="actionCart">장바구니 담기</button>
							<button type="button" class="btnNormal sizeL actionWish "
								onclick="add_wishlist_nologin('/member/login.html');"
								id="actionWish">찜하기</button>
						</div>
						<div class="ec-base-button soldout displaynone ">
							<button type="button" class="btnSubmit gFull sizeL displaynone">SOLD
								OUT</button>
							<button type="button" class="btnNormal gFull sizeL "
								onclick="add_wishlist_nologin('/member/login.html');"
								id="actionWishSoldout">WISH LIST</button>
						</div>
						<a href="/board/inquiry/write.html"
							class="btnNormal gFull sizeL mrt10 displaynone">대량구매문의</a>
						<!-- 네이버 체크아웃 구매 버튼  -->
						<div id="NaverChk_Button"></div>
						<div id="appPaymentButtonBox"></div>
						<div class="eventArea displaynone "></div>
					</div>
					<div id="orderFixArea"
						class="xans-element- xans-product xans-product-action ec-base-button gFixed ">
						<div class="ec-base-button gColumn ">
							<a href="#none" class="btnSubmit sizeM "
								onclick="product_submit(1, '/exec/front/order/basket/', this)"><span
								id="actionBuy">BUY IT NOW</span><span class="displaynone"
								id="actionReserve">예약주문</span><span id="" class="displaynone">REGULAR
									DELIVERY</span></a>
							<button type="button" class="btnNormal sizeM actionCart "
								onclick="product_submit(2, '/exec/front/order/basket/', this)">CART</button>
						</div>
						<div class="ec-base-button gColumn displaynone">
							<button type="button" class="btnSubmit sizeM displaynone">SOLD
								OUT</button>
							<button type="button" class="btnNormal sizeM "
								onclick="add_wishlist_nologin('/member/login.html');"
								id="actionWishSoldout">WISH LIST</button>
						</div>
					</div>
				</div>
			</div>
			<div class="eventArea displaynone ">
				<h3>EVENT</h3>
				<div class="event"></div>
			</div>
		</div>
		<!--#ez="1/1"-->
		<div data-ez="contents-0cj5ojo-1"
			class="xans-element- xans-product xans-product-additional section">
			<div class="boardReport displaynone ec-base-layer typeModal ">


				<div class="header">
					<h3>게시글 신고하기</h3>
				</div>
				<div class="content">
					<h4>신고사유</h4>
					<div class="box">
						<div class="selectBox">
							<ul>
								<li><label class="label"><input type="radio"
										name="report_reason" value="1" class="radio" checked="">관련없는
										내용</label></li>
								<li><label class="label"><input type="radio"
										name="report_reason" value="2" class="radio">욕설/비방</label></li>
								<li><label class="label"><input type="radio"
										name="report_reason" value="3" class="radio">개인정보유출</label></li>
								<li><label class="label"><input type="radio"
										name="report_reason" value="4" class="radio">광고/홍보글</label></li>
								<li><label class="label"><input type="radio"
										name="report_reason" value="5" class="radio">기타</label></li>
							</ul>
						</div>
					</div>
					<p class="summary">신고해주신 내용은 쇼핑몰 운영자의 검토 후 내부 운영 정책에 의해 처리가
						진행됩니다.</p>
				</div>

				<div class="ec-base-button report-button">
					<a href="#none" class="btnSubmit ecReportAction" onclick="">신고</a>
					<a href="#none" class="btnNormal ecReportCloseLayer" onclick="">취소</a>
				</div>
				<a href="#none" class="btnClose ecReportCloseLayer" onclick="">닫기</a>
			</div>
			<div id="detail" class="cboth"></div>
			<div class="detail_tab ">
				<ul class="cboth title_detail">
					<li class="tab_open"><a href="#detail">상세정보</a></li>
					<li><a href="#review">상품후기 <span>0</span></a></li>
					<li><a href="#qna">상품문의 <span>0</span></a></li>
					<li><a href="#guide">배송/교환/환불 안내</a></li>
				</ul>
				<!-- //title_detail -->
			</div>
			<!-- //detail_tab -->
			<div id="tabProduct" class="tabProduct display_tablet_only ">
				<ul>
					<li class="selected"><a href="#prdDetail" target="_self">상세정보</a></li>
					<li><a href="#prdInfo">구매안내</a></li>
					<li class=""><a href="#prdReview" name="use_review_mobile">상품후기
							<span>0</span>
					</a></li>
					<li class=""><a href="#prdQnA" name="use_qna_mobile">상품문의
							<span>0</span>
					</a></li>
				</ul>
			</div>
			<div id="prdDetail" class="productDetail">
				<div>
					<p>
						<br>
					</p>
				</div>

				<!-- //product_relation -->
			</div>
			<!-- //prdDetail -->
			<div id="prdReview" class="">
				<div id="review" class="pdt150 cboth"></div>
				<div class="detail_tab">
					<ul class="cboth title_detail">
						<li><a href="#detail">상세정보</a></li>
						<li class="tab_open"><a href="#review">상품후기 <span>0</span></a></li>
						<li><a href="#qna">상품문의 <span>0</span></a></li>
						<li><a href="#guide">배송/교환/환불 안내</a></li>
					</ul>
					<!-- //title_detail -->
				</div>
				<!-- //detail_tab -->

				<div class="">
					<div class="board_title">
						<h2>REVIEW</h2>
						<div class="ec-base-button">
							<a
								href="/board/product/list.html?board_no=4&amp;link_product_no=14"
								class="btnNormalFix">LIST</a> <a
								href="/board/product/write.html?board_no=4&amp;product_no=14&amp;cate_no=42&amp;display_group=1"
								class="btnNormalFix">WRITE</a>
						</div>
					</div>
					<div class="contents">
						<p class="nodata">게시물이 없습니다</p>
					</div>
				</div>
				<!-- //상품리뷰 -->
			</div>
			<!-- //prdReview -->
			<div id="prdQnA" class="">
				<div id="qna" class="pdt150 cboth"></div>
				<div class="detail_tab">
					<ul class="cboth title_detail">
						<li><a href="#detail">상세정보</a></li>
						<li><a href="#review">상품후기 <span>0</span></a></li>
						<li class="tab_open"><a href="#qna">상품문의 <span>0</span></a></li>
						<li><a href="#guide">배송/교환/환불 안내</a></li>
					</ul>
					<!-- //title_detail -->
				</div>
				<!-- //detail_tab -->

				<div class="">
					<div class="board_title">
						<h2>Q&amp;A</h2>
						<div class="ec-base-button">
							<a
								href="/board/product/list.html?board_no=6&amp;link_product_no=14"
								class="btnNormalFix">LIST</a> <a
								href="/board/product/write.html?board_no=6&amp;product_no=14&amp;cate_no=42&amp;display_group=1"
								class="btnNormalFix">WRITE</a>
						</div>
					</div>
					<div class="contents">
						<p class="nodata">게시물이 없습니다</p>
					</div>
				</div>
				<!-- //상품문의 -->
			</div>
			<!-- //prdQnA -->
			<div id="prdInfo" class="">
				<div id="guide" class="pdt150 cboth"></div>
				<div class="detail_tab">
					<ul class="cboth title_detail">
						<li><a href="#detail">상세정보</a></li>
						<li><a href="#review">상품후기 <span>0</span></a></li>
						<li><a href="#qna">상품문의 <span>0</span></a></li>
						<li class="tab_open"><a href="#guide">배송/교환/환불 안내</a></li>
					</ul>
					<!-- //title_detail -->
				</div>
				<!-- //detail_tab -->

				<div class="detail_guide">
					<div class="ec-base-fold theme1 selected eToggle">
						<div class="title">
							<h2>PAYMENT INFO</h2>
						</div>
						<div class="contents">
							<div class="info">
								고액결제의 경우 안전을 위해 카드사에서 확인전화를 드릴 수도 있습니다. 확인과정에서 도난 카드의 사용이나 타인
								명의의 주문등 정상적인 주문이 아니라고 판단될 경우 임의로 주문을 보류 또는 취소할 수 있습니다. &nbsp; <br>
								<br> 무통장 입금은 상품 구매 대금은 PC뱅킹, 인터넷뱅킹, 텔레뱅킹 혹은 가까운 은행에서 직접
								입금하시면 됩니다. &nbsp;<br> 주문시 입력한&nbsp;입금자명과 실제입금자의 성명이 반드시
								일치하여야 하며, 7일 이내로 입금을 하셔야 하며&nbsp;입금되지 않은 주문은 자동취소 됩니다. <br>
							</div>
						</div>
					</div>

					<div class="ec-base-fold theme1 selected eToggle">
						<div class="title">
							<h2>DELIVERY INFO</h2>
						</div>
						<div class="contents">
							<ul class="info delivery">
								<li>배송 방법 : 택배</li>
								<li>배송 지역 : 전국지역</li>
								<li>배송 비용 : 2,500원</li>
								<li>배송 기간 : 3일 ~ 7일</li>
								<li>배송 안내 : - 산간벽지나 도서지방은 별도의 추가금액을 지불하셔야 하는 경우가 있습니다.<br>
									고객님께서 주문하신 상품은 입금 확인후 배송해 드립니다. 다만, 상품종류에 따라서 상품의 배송이 다소 지연될 수
									있습니다.<br></li>
							</ul>
						</div>
					</div>

					<div class="ec-base-fold theme1 selected eToggle">
						<div class="title">
							<h2>EXCHANGE INFO</h2>
						</div>
						<div class="contents">
							<div class="info">
								<strong>교환 및 반품 주소</strong><br>&nbsp;- <br>&nbsp;<br>
								<strong>교환 및 반품이 가능한 경우</strong><br>&nbsp;-&nbsp;계약내용에 관한
								서면을 받은 날부터&nbsp;7일.&nbsp;단,&nbsp;그 서면을 받은 때보다 재화등의 공급이 늦게 이루어진
								경우에는 재화등을 공급받거나 재화등의 공급이 시작된 날부터&nbsp;7일 이내<br>&nbsp;
								-&nbsp;공급받으신 상품 및 용역의 내용이 표시.광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 당해 재화
								등을 공급받은 날 부터&nbsp;3월이내,&nbsp;그사실을 알게 된 날 또는 알 수 있었던
								날부터&nbsp;30일이내<br>&nbsp;<br>
								<strong>교환 및 반품이 불가능한 경우</strong><br>&nbsp;-&nbsp;이용자에게 책임
								있는 사유로 재화 등이 멸실 또는 훼손된 경우(다만,&nbsp;재화 등의 내용을 확인하기 위하여 포장 등을 훼손한
								경우에는 청약철회를 할 수 있습니다)<br>&nbsp; -&nbsp;이용자의 사용 또는 일부 소비에 의하여
								재화 등의 가치가 현저히 감소한 경우<br>&nbsp; -&nbsp;시간의 경과에 의하여 재판매가 곤란할
								정도로 재화등의 가치가 현저히 감소한 경우<br>&nbsp; -&nbsp;복제가 가능한 재화등의 포장을
								훼손한 경우<br>&nbsp; -&nbsp;개별 주문 생산되는 재화 등 청약철회시 판매자에게 회복할 수
								없는 피해가 예상되어 소비자의 사전 동의를 얻은 경우<br>&nbsp; -&nbsp;디지털 콘텐츠의 제공이
								개시된 경우, (다만,&nbsp;가분적 용역 또는 가분적 디지털콘텐츠로 구성된 계약의 경우 제공이 개시되지 아니한
								부분은 청약철회를 할 수 있습니다.)<br>&nbsp;<br>※ 고객님의 마음이 바뀌어
								교환,&nbsp;반품을 하실 경우 상품반송 비용은 고객님께서 부담하셔야 합니다.<br>&nbsp;(색상
								교환,&nbsp;사이즈 교환 등 포함)<br>
							</div>
						</div>
					</div>

					<div class="ec-base-fold theme1 selected eToggle">
						<div class="title">
							<h2>SERVICE INFO</h2>
						</div>
						<div class="contents">
							<div class="info"></div>
						</div>
					</div>
				</div>
				<!-- //detail_guide -->
			</div>
			<!-- //prdInfo -->
		</div>

		<!--#ez="1/1"-->
	</div>
</div>
<script type="text/javascript" src="/js/product/detailProduct.js"></script>
<%@ include file="../layout/footer.jsp" %>