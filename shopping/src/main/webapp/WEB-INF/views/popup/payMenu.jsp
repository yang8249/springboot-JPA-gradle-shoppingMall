<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<div id="mCafe24Order"
		class="xans-element- xans-order xans-order-form typeHeader xans-record-">
		<!-- 이값은 지우면 안되는 값입니다. ($move_order_after 주문완료페이지 주소 / $move_basket 장바구니페이지 주소)
	            $move_order_after=/order/order_result.html
	            $move_basket=/order/basket.html
	            $paymethod_selector = textButton
	            $email_type=emailcompact
	            $product_weight_display=F
	        -->
		<!-- [바로구매 주문상품] -->
		<!--
	        이 파일은 원터치 주문서의 읽기 전용 파일입니다.
	        이 파일은 기능 업그레이드 시, 자동으로 개선된 소스가 적용되어 별도로 디자인 수정을 하지 않아도 됩니다 .
	        원터치 주문서 조각 html 파일을 수정할 경우, 작성한 정보가 유실되거나 주문서 최신 기능이 자동 업그레이드되지 않을 수 있으니 유의해 주세요.
	-->
		<div id="ec-jigsaw-area-productdetail"></div>
		<!-- [주문배송정보] 주문자정보, 배송지정보, 배송정보 -->
		<!--
	        이 파일은 원터치 주문서의 읽기 전용 파일입니다.
	        이 파일은 기능 업그레이드 시, 자동으로 개선된 소스가 적용되어 별도로 디자인 수정을 하지 않아도 됩니다 .
	        원터치 주문서 조각 html 파일을 수정할 경우, 작성한 정보가 유실되거나 주문서 최신 기능이 자동 업그레이드되지 않을 수 있으니 유의해 주세요.
	-->
		<!-- 이값은 지우면 안되는 값입니다.
	    $delivery_list_type=embeded
	    $isRuleBasedAddrForm = T
	    $isOneTouch = T
	-->
		<div class="billingNshipping">
			<!-- 주문자정보 -->
			<div id="ec-jigsaw-area-billingInfo"
				class="ec-base-fold eToggle selected displaynone">
				<div id="ec-jigsaw-title-billingInfo" class="title">
					<h2>주문 정보</h2>
					<span id="ec-jigsaw-heading-billingInfo" class="txtEm gRight"
						style="display: none;"></span>
				</div>
	
			</div>
	
			<!-- 배송정보  -->
			<div id="lShippingCompanyLists"
				class="ec-area-shipping-companies ec-base-fold eToggle selected displaynone">
				<div class="title">
					<h2>상품 수령</h2>
				</div>
				<div class="contents">
					<div class="segment">
						<!-- 배송업체(방식) 선택 -->
						<p class="ec-base-help displaynone">스토어픽업을 사용할 수 없는 상품이 포함되어 있어
							일반 배송사만 선택 가능합니다.</p>
						<span class="ec-base-label" id="delivery_app_list"></span>
						<ul class="ec-base-help " id="deliv_info_view">
							<li class="txtEm ">배송비 : <span
								id="deliv_company_price_custom_type">0</span></li>
							<li class="displaynone">
								<div class="ec-shop-shipping_additional_fee_show displaynone">
									<span class="txtEm">배송비 : <span
										id="f_addr_total_ship_fee_id" class="myTotalPay"></span>원
									</span> = 해외배송비 <span id="f_addr_delv_price_id"></span>원 + 보험료 <span
										id="f_addr_insurance_price_id"></span>원 <span
										class="ec-shop-shipping_additional_fee_name_show">+ <span
										id="f_addr_shipping_additional_fee_name_id"></span> <span
										id="f_addr_shipping_additional_fee_id"></span>원
									</span>
									<p class="ec-base-help typeDash gIndent10">보험료는 배송과정에서 발생하는
										분실, 도난, 파손 등으로 인한 손해에 대하여 규정에 따라 배상해 드리는 서비스입니다.</p>
								</div>
								<div class="ec-shop-shipping_additional_fee_hide ">
									<span class="txtEm">배송비 : <span
										id="f_addr_total_ship_fee_id"></span>원
									</span> = 해외배송비 <span id="f_addr_delv_price_id"></span>원 + 보험료 <span
										id="f_addr_insurance_price_id"></span>원
									<ul class="ec-base-help typeDash gIndent10">
										<li>배송비에는 관세 및 세금 등의 각종 비용은 포함되어 있지 않습니다. 상품수령 시 고객님이 추가로
											지불하셔야 합니다.</li>
										<li>보험료는 배송과정에서 발생하는 분실, 도난, 파손 등으로 인한 손해에 대하여 규정에 따라 배상해
											드리는 서비스입니다.</li>
									</ul>
								</div>
							</li>
							<li class="ec-deliv-company-shipping-info">배송안내 : <span
								id="deliv_company_shipping_info"></span></li>
							<li>배송소요기간 : <span id="deliv_company_period_custom_type"></span></li>
							<li class="displaynone" id="ordertime">주문가능 시간 : <span
								id="deliv_company_ordertime_custom_type"></span></li>
							<li class="displaynone" id="areaname">
								<div>
									배송가능 지역 : <span id="deliv_company_areaname_custom_type"></span>
								</div>
								<div class="ec-base-button">
									<button type="button" id="" class="btnNormal mini">배송가능지역</button>
								</div>
							</li>
							<li></li>
						</ul>
						<ul class="ec-base-help displaynone" id="store_info_view">
							<li class="txtEm"><span id="store_receive_period"></span></li>
							<li><span id="store_receive_addr"></span></li>
							<li>영업시간 : <span id="store_office_hour"></span></li>
							<li><span id="store_receive_map"></span></li>
							<li><div class="ec-base-button">
									<button type="button" id="btnStoreListOpen"
										class="btnNormal mini">수령지 안내</button>
								</div></li>
						</ul>
						<ul class="ec-base-help" id="delivery_app_info">
							<li class="txtEm" id="delivery_app_shipfee_div">배송비 : <span
								id="delivery_app_shipfee"></span></li>
							<li id="delivery_app_description_div">배송안내 : <span
								id="delivery_app_description"></span></li>
						</ul>
					</div>
				</div>
			</div>
	
			<!-- 수령자 정보   -->
			<div id="ec-jigsaw-area-shippingInfo"
				class="ec-base-fold eToggle selected">
				<div class="title">
					<h2>배송지</h2>
					<div id="closeBtn">
						<h2>X</h2>
					</div>
				</div>
				<div class="contents">
					<!-- app tag -->
					<div id="ec-orderform-billingNshipping-head"></div>
					<!-- 국내배송 정보 -->
					<div class="">
						<div id="ec-jigsaw-tab-shippingInfo"
							class="ec-base-tab displaynone">
							<ul>
								<li id="ec-jigsaw-tab-shippingInfo-recentAddress" class=""><a
									href="#none">최근 배송지</a></li>
								<li id="ec-jigsaw-tab-shippingInfo-newAddress" class="selected"><a
									href="#none">직접입력</a></li>
							</ul>
						</div>
						<!-- 최근배송지 -->
						<div id="ec-shippingInfo-recentAddress"
							class="tabCont recentShipArea " style="display: none;">
							<div id="ec-shippingInfo-recentAddressText" class="segment">
								<div class="ec-shop-deliveryInfoText recent">
									<strong class="name"><span class="txtEm"
										id="ec-shop-deliveryInfoMainLabel"></span><span
										id="ec-shop-deliveryInfoName"></span></strong>
									<p class="address gBlank10">
										[<span id="ec-shop-deliveryInfoZipcode"></span>] <span
											id="ec-shop-deliveryInfoAddress"> </span>
									</p>
									<dl class="contact">
										<dt class="">휴대전화</dt>
										<dd class="" id="ec-shop-deliveryInfoCell">010</dd>
										<dt class="displaynone">일반전화</dt>
										<dd class="displaynone" id="ec-shop-deliveryInfoTel"></dd>
									</dl>
								</div>
								<span class="sideRight"><button type="button"
										id="ec-shippingInfo-showRecentAddressList"
										class="btnNormal mini">배송지 목록</button></span>
							</div>
	
							<div id="ec-shippingInfo-recentAddressList" class="segment"
								style="display: none;">
								<ul class="shippingList">
									<li class="xans-element- xans-order xans-order-deliverylist "><strong
										class="name"><span
											id="ec-shippingInfo-recentAddressList-mainLabel-"
											class="txtEm"></span> </strong>
										<div class="description">
											<span class="choice"><input type="radio"
												id="ec-shippingInfo-recentAddressList-choice-select-"
												name="ec-shippingInfo-recentAddressList-choice" value=""
												class="fRadio" autocomplete="off"></span>
											<p class="address gBlank10">
												[<span class="ec-shippingInfo-recentAddressList-zipcode-"></span>]
												<span class="ec-shippingInfo-recentAddressList-addr1-"></span><br>
												<span class="ec-shippingInfo-recentAddressList-addr2-"></span>
											</p>
											<dl class="contact">
												<dt>휴대전화</dt>
												<dd></dd>
												<dt>일반전화</dt>
												<dd></dd>
											</dl>
										</div> <span class="button">
											<button type="button"
												id="ec-shippingInfo-recentAddressList-choice-modify-"
												class="btnText">수정</button>
									</span></li>
								</ul>
								<span class="sideRight"><button type="button"
										id="ec-shippingInfo-closeRecentAddressList"
										class="btnBase mini">닫기</button></span>
							</div>
						</div>
	
						<!-- 새 배송지 -->
						<div id="ec-shippingInfo-newAddress" class="tabCont newShipArea ">
							<div class="segment ec-shippingInfo-sameaddr displaynone">
								<input id="sameaddr0" name="sameaddr" fw-filter="" fw-label="1"
									fw-msg="" value="M" type="radio" autocomplete="off" disabled=""><label
									for="sameaddr0">회원 정보와 동일</label> <input id="sameaddr1"
									name="sameaddr" fw-filter="" fw-label="1" fw-msg="" value="F"
									type="radio" checked="checked" autocomplete="off" disabled=""><label
									for="sameaddr1">새로운 배송지</label>
							</div>
							<div class="ec-base-table typeWrite">
								<table border="1">
									<caption>배송 정보 입력</caption>
									<colgroup>
										<col style="width: 102px">
										<col style="width: auto">
									</colgroup>
									<tbody>
										<tr class="ec-shippingInfo-newAddress-name">
											<th scope="row">받는사람 <span class="icoRequired">필수</span>
											</th>
											<td><input id="rname" data-info="받는사람" name="rname" fw-filter="isFill"
												fw-label="수취자 성명" fw-msg="" class="inputTypeText"
												placeholder="" size="15" value="" type="text"></td>
										</tr>
										<tr id="ec-receiver-address">
											<th scope="row">주소 <span class=""><span
													class="icoRequired">필수</span></span>
											</th>
											<td>
												<ul class="ec-address">
													<li id="receiver_country_wrap" class="displaynone"
														style="display: none;"><select id="" name=""
														class="displaynone gCheckbox60" disabled=""><option
																value="">국가를 선택해주세요.</option>
															<option value="GH">가나(GHANA)</option>
															<option value="GA">가봉(GABON)</option>
															<option value="GY">가이아나(GUYANA)</option>
															<option value="GM">감비아(GAMBIA)</option>
															<option value="GT">과테말라(GUATEMALA)</option>
															<option value="GD">그레나다(GRENADA)</option>
															<option value="GE">그루지야(GEORGIA)</option>
															<option value="GR">그리스(GREECE)</option>
															<option value="GN">기니(GUINEA)</option>
															<option value="GW">기니비소(GUINEA-BISSAU)</option>
															<option value="NA">나미비아(NAMIBIA)</option>
															<option value="NG">나이지리아(NIGERIA)</option>
															<option value="ZA">남아프리카공화국(SOUTH AFRICA)</option>
															<option value="AN">네덜란드(네덜란드령앤틸리스)(NETHERLANDS(ANTILLES))</option>
															<option value="NL">네덜란드(네델란드)(NETHERLANDS)</option>
															<option value="AW">네덜란드(아루바섬)(ARUBA)</option>
															<option value="NP">네팔(NEPAL)</option>
															<option value="NO">노르웨이(NORWAY)</option>
															<option value="NZ">뉴질란드(NEW ZEALAND)</option>
															<option value="NE">니제르(NIGER)</option>
															<option value="NI">니카라과(NICARAGUA)</option>
															<option value="KR" selected="">대한민국(KOREA (REP
																OF,))</option>
															<option value="DK">덴마크(DENMARK)</option>
															<option value="GL">덴마크(그린란드)(GREENLAND)</option>
															<option value="FO">덴마크(페로즈제도)(FAROE ISLANDS)</option>
															<option value="DO">도미니카공화국(DOMINICAN REPUBLIC)</option>
															<option value="DM">도미니카연방(DOMINICA)</option>
															<option value="DE">독일(GERMANY)</option>
															<option value="TL">동티모르(TIMOR-LESTE)</option>
															<option value="LA">라오스(LAO PEOPLE'S DEM REP)</option>
															<option value="LR">라이베리아(LIBERIA)</option>
															<option value="LV">라트비아(LATVIA)</option>
															<option value="RU">러시아(RUSSIAN FEDERATION)</option>
															<option value="LB">레바논(LEBANON)</option>
															<option value="LS">레소토(LESOTHO)</option>
															<option value="RO">루마니아(ROMANIA)</option>
															<option value="LU">룩셈부르크(LUXEMBOURG)</option>
															<option value="RW">르완다(RWANDA)</option>
															<option value="LY">리비아(LIBYAN ARAB JAMAHIRIYA)</option>
															<option value="LI">리첸쉬테인(LIECHTENSTEIN)</option>
															<option value="LT">리투아니아(LITHUANIA)</option>
															<option value="MG">마다가스카르(MADAGASCAR)</option>
															<option value="MK">마케도니아(MACEDONIA)</option>
															<option value="MW">말라위(MALAWI)</option>
															<option value="MY">말레이지아(MALAYSIA)</option>
															<option value="ML">말리(MALI)</option>
															<option value="MX">멕시코(MEXICO)</option>
															<option value="MC">모나코(MONACO)</option>
															<option value="MA">모로코(MOROCCO)</option>
															<option value="MU">모리셔스(MAURITIUS)</option>
															<option value="MR">모리타니(MAURITANIA)</option>
															<option value="MZ">모잠비크(MOZAMBIQUE)</option>
															<option value="ME">몬테네그로(MONTENEGRO)</option>
															<option value="MD">몰도바(MOLDOVA, REPUBLIC OF)</option>
															<option value="MV">몰디브(MALDIVES)</option>
															<option value="MT">몰타(MALTA)</option>
															<option value="MN">몽고(MONGOLIA)</option>
															<option value="US">미국(U.S.A)</option>
															<option value="GU">미국(괌)(GUAM)</option>
															<option value="MH">미국(마아샬제도)(MARSHALL ISLANDS)</option>
															<option value="VI">미국(버진제도)(VIRGIN ISLANDS U.S.)</option>
															<option value="WS">미국(사모아, 구 서사모아)(SAMOA)</option>
															<option value="AS">미국(사모아제도)(AMERICAN SAMOA)</option>
															<option value="MP">미국(사이판)(NORTHERN MARIANA
																ISLANDS)</option>
															<option value="PW">미국(팔라우섬)(PALAU)</option>
															<option value="PR">미국(푸에르토리코섬)(PUERTO RICO)</option>
															<option value="MM">미얀마(MYANMAR)</option>
															<option value="FM">미크로네시아(마이크로네시아)(MICRONESIA)</option>
															<option value="VU">바누아투(VANUATU)</option>
															<option value="BH">바레인(BAHRAIN)</option>
															<option value="BB">바베이도스(BARBADOS)</option>
															<option value="BS">바하마(BAHAMAS)</option>
															<option value="BD">방글라데시(BANGLADESH)</option>
															<option value="VE">베네수엘라(VENEZUELA)</option>
															<option value="BJ">베넹(BENIN)</option>
															<option value="VN">베트남(VIET NAM)</option>
															<option value="BE">벨기에(BELGIUM)</option>
															<option value="BY">벨라루스(BELARUS)</option>
															<option value="BZ">벨리세(BELIZE)</option>
															<option value="BA">보스니아헤르체코비나(Bosnia and
																Herzegovina)</option>
															<option value="BW">보츠와나(BOTSWANA)</option>
															<option value="BO">볼리비아(BOLIVIA)</option>
															<option value="BF">부르키나파소(BURKINA FASO)</option>
															<option value="BT">부탄(BHUTAN)</option>
															<option value="BG">불가리아(BULGARIA(REP))</option>
															<option value="BR">브라질(BRAZIL)</option>
															<option value="BN">브루네이(나이)(BRUNEI DARUSSALAM)</option>
															<option value="BI">브룬디(BURUNDI)</option>
															<option value="SA">사우디아라비아(SAUDI ARABIA)</option>
															<option value="CY">사이프러스(CYPRUS)</option>
															<option value="SM">산마리노(SAN MARINO)</option>
															<option value="SN">세네갈(SENEGAL)</option>
															<option value="RS">세르비아/코소보(SERBIA/KOSOVO)</option>
															<option value="SC">세이셸(SEYCHELLES)</option>
															<option value="LC">세인트 루시아(SAINT LUCIA)</option>
															<option value="VC">세인트빈센트그레나딘(SAINT VINCENT AND
																THE GRENADINES)</option>
															<option value="KN">세인트키츠네비스(SAINT KITTS AND
																NEVIS)</option>
															<option value="SB">솔로몬아일란드(SOLOMON ISLANDS)</option>
															<option value="SR">수리남(SURINAME)</option>
															<option value="LK">스리랑카(SRI LANKA)</option>
															<option value="SZ">스와질랜드(SWAZILAND)</option>
															<option value="SE">스웨덴(SWEDEN)</option>
															<option value="CH">스위스(SWITZERLAND)</option>
															<option value="ES">스페인(에스파니아)(SPAIN)</option>
															<option value="SK">슬로바키아(SLOVAKIA)</option>
															<option value="SI">슬로베니아(SLOVENIA)</option>
															<option value="SL">시에라리온(SIERRA LEONE)</option>
															<option value="SG">싱가포르(SINGAPORE)</option>
															<option value="AE">아랍에미레이트연합국(UNITED ARAB
																EMIRATES)</option>
															<option value="AM">아르메니아(ARMENIA)</option>
															<option value="AR">아르헨티나(ARGENTINA)</option>
															<option value="IS">아이슬란드(ICELAND)</option>
															<option value="HT">아이티(HAITI)</option>
															<option value="IE">아일란드(에이레)(IRELAND)</option>
															<option value="AZ">아제르바이잔(AZERBAIJAN)</option>
															<option value="AF">아프가니스탄(AFGHANISTAN)</option>
															<option value="AD">안도라(ANDORRA)</option>
															<option value="AL">알바니아(ALBANIA)</option>
															<option value="DZ">알제리(ALGERIA)</option>
															<option value="AO">앙골라(ANGOLA)</option>
															<option value="AG">앤티과바부다(ANTIGUA AND BARBUDA)</option>
															<option value="ER">에리트리아(ERITREA)</option>
															<option value="EE">에스토니아(ESTONIA)</option>
															<option value="EC">에콰도르(ECUADOR)</option>
															<option value="SV">엘살바도르(EL SALVADOR)</option>
															<option value="GB">영국(UNITED KINGDOM)</option>
															<option value="MS">영국(몽세라)(MONTSERRAT)</option>
															<option value="BM">영국(버뮤다섬)(BERMUDA)</option>
															<option value="VG">영국(버진제도)(VIRGIN ISLANDS
																BRITISH)</option>
															<option value="AI">영국(안귈라섬)(ANGUILLA)</option>
															<option value="GI">영국(지브롤터)(GIBRALTAR)</option>
															<option value="KY">영국(케이만제도)(CAYMAN ISLANDS)</option>
															<option value="TC">영국(터크스케이코스제도)(TURKS AND CAICOS
																ISLANDS)</option>
															<option value="YE">예멘(YEMEN)</option>
															<option value="OM">오만(OMAN)</option>
															<option value="NF">오스트레일리아(노퍽섬)(NORFOLK ISLAND)</option>
															<option value="AU">오스트레일리아(호주)(AUSTRALIA)</option>
															<option value="AT">오스트리아(AUSTRIA)</option>
															<option value="HN">온두라스(HONDURAS)</option>
															<option value="JO">요르단(JORDAN)</option>
															<option value="UG">우간다(UGANDA)</option>
															<option value="UY">우루과이(URUGUAY)</option>
															<option value="UZ">우즈베크(UZBEKISTAN)</option>
															<option value="UA">우크라이나(UKRAINE)</option>
															<option value="ET">이디오피아(ETHIOPIA)</option>
															<option value="IQ">이라크(IRAQ)</option>
															<option value="IR">이란(IRAN(ISLAMIC REP))</option>
															<option value="IL">이스라엘(ISRAEL)</option>
															<option value="EG">이집트(EGYPT)</option>
															<option value="IT">이탈리아(이태리)(ITALY)</option>
															<option value="IN">인도(INDIA)</option>
															<option value="ID">인도네시아(INDONESIA)</option>
															<option value="JP">일본(JAPAN)</option>
															<option value="JM">자메이카(JAMAICA)</option>
															<option value="ZM">잠비아(ZAMBIA)</option>
															<option value="CN">중국(CHINA(PEOPLE'S REP))</option>
															<option value="MO">중국(마카오)(MACAU)</option>
															<option value="HK">중국(홍콩)(HONG KONG)</option>
															<option value="CF">중앙 아프리카(CENTRAL AFRICAN
																REPUBLIC)</option>
															<option value="DJ">지부티(DJIBOUTI)</option>
															<option value="ZW">짐바브웨(ZIMBABWE)</option>
															<option value="TD">차드(CHAD)</option>
															<option value="CZ">체코(CZECH REP)</option>
															<option value="CL">칠레(CHILE)</option>
															<option value="CM">카메룬(CAMEROON)</option>
															<option value="CV">카보베르데(CAPE VERDE)</option>
															<option value="KZ">카자흐(KAZAKHSTAN)</option>
															<option value="QA">카타르(QATAR)</option>
															<option value="KH">캄보디아(CAMBODIA)</option>
															<option value="CA">캐나다(CANADA)</option>
															<option value="KE">케냐(KENYA)</option>
															<option value="CR">코스타리카(COSTA RICA)</option>
															<option value="CI">코트디봐르(COTE D IVOIRE)</option>
															<option value="CO">콜롬비아(COLOMBIA)</option>
															<option value="CG">콩고(CONGO)</option>
															<option value="CU">쿠바(CUBA)</option>
															<option value="KW">쿠웨이트(KUWAIT)</option>
															<option value="HR">크로아티아(CROATIA)</option>
															<option value="KG">키르키즈스탄(KYRGYZSTAN)</option>
															<option value="KI">키리바티(KIRIBATI)</option>
															<option value="TH">타이(태국)(THAILAND)</option>
															<option value="TW">타이완(대만)(TAIWAN)</option>
															<option value="TJ">타지키스탄(TAJIKISTAN)</option>
															<option value="TZ">탄자니아(TANZANIA(UNITED REP))</option>
															<option value="TR">터키(TURKEY)</option>
															<option value="TG">토고(TOGO)</option>
															<option value="TO">통가(TONGA)</option>
															<option value="TM">투르크메니스탄(TURKMENISTAN)</option>
															<option value="TV">투발루(TUVALU)</option>
															<option value="TN">튀니지(TUNISIA)</option>
															<option value="TT">트리니다드토바고(TRINIDAD AND TOBAGO)</option>
															<option value="PA">파나마(PANAMA(REP))</option>
															<option value="PY">파라과이(PARAGUAY)</option>
															<option value="PK">파키스탄(PAKISTAN)</option>
															<option value="PG">파푸아뉴기니(PAPUA NEW GUINEA)</option>
															<option value="PE">페루(PERU)</option>
															<option value="PT">포르투갈(PORTUGAL)</option>
															<option value="PL">폴란드(POLAND(REP))</option>
															<option value="FR">프랑스(FRANCE)</option>
															<option value="GP">프랑스(과데루프섬)(GUADELOUPE)</option>
															<option value="GF">프랑스(기아나)(FRENCH GUIANA)</option>
															<option value="NC">프랑스(뉴칼레도니아섬)(NEW CALEDONIA)</option>
															<option value="RE">프랑스(레위니옹섬)(REUNION)</option>
															<option value="MQ">프랑스(마르티니크섬)(MARTINIQUE)</option>
															<option value="PF">프랑스(폴리네시아)(FRENCH POLYNESIA)</option>
															<option value="FJ">피지(FIJI)</option>
															<option value="FI">필란드(FINLAND)</option>
															<option value="PH">필리핀(PHILIPPINES)</option>
															<option value="HU">헝가리(HUNGARY(REP))</option></select> <span
														id="receiver_directInputCheck_wrap" class="ec-base-label">
															<input id="receiver_directInputCheck"
															name="receiver_directInputCheck" type="checkbox"
															disabled=""> <label
															id="receiver_directInputCheckLabel"
															for="receiver_directInputCheckLabel">직접입력</label>
													</span></li>
	
	
	
	
	
													<li id="receiver_state_wrap" class="displaynone"
														style="display: none;"><select id="ju_do_us_r"
														name="ju_do_us_r" class="displaynone" disabled=""
														fw-filter="" style="display: none;">
															<option value="">주/도를 선택해주세요</option>
													</select><select id="ju_do_ca_r" name="ju_do_ca_r"
														class="displaynone" disabled="" style="display: none;"
														fw-filter="">
															<option value="">주/도를 선택해주세요</option>
													</select><input id="ju_do_r" name="ju_do_r" placeholder="주/도"
														fw-filter="" class="inputTypeText displaynone" type="text"
														size="30" maxlength="50" disabled="" style="display: none;">
													</li>
	
													<li id="receiver_city_wrap" class="displaynone"
														style="display: none;"><input id="si_gun_dosi_r"
														name="si_gun_dosi_r" placeholder="시/군/도시" fw-filter=""
														class="inputTypeText displaynone" type="text" size="30"
														maxlength="50" disabled="" style="display: none;">
													</li>
	
													<li id="receiver_street_wrap" class="displaynone"><input
														id="gu_name_addr_r" name="gu_name_addr_r"
														placeholder="ADDR.COMMON.FORMATSTREET.KR" fw-filter=""
														class="inputTypeText displaynone" type="text" size="30"
														maxlength="50" disabled="" style="display: none;">
													</li>
	
													<li id="receiver_area_wrap"
														class="ec-address-area displaynone" style="display: none;">
														<select id="si_name_r" name="si_name_r" class="displaynone"
														disabled="" fw-filter="" style="display: none;">
															<option value="">ADDR.COMMON.FORMATSELECT.STATE.KR</option>
													</select><select id="ci_name_r" name="ci_name_r" class="displaynone"
														disabled="" style="display: none;" fw-filter="">
															<option value="">ADDR.COMMON.FORMATSELECT.CITY.KR</option>
													</select><select id="gu_name_r" name="gu_name_r" class="displaynone"
														disabled="" style="display: none;" fw-filter="">
															<option value="">ADDR.COMMON.FORMATSELECT.STREET.KR</option>
													</select>
													</li>
	
													<li id="receiver_zipcode_wrap" class="ec-address-zipcode"
														style=""><input id="rzipcode1" name="rzipcode1" data-info="주소"
														placeholder="우편번호" fw-filter="isLengthRange[1][14]"
														class="inputTypeText" type="text" maxlength="14"
														readonly="" fw-label="우편번호" style="">
														<button id="btn_search_rzipcode" class="btnBasic"
															type="button" style="cursor: pointer;">주소검색</button> <span
														class="ec-base-label"> <input id="no_rzipcode0"
															name="no_rzipcode0" class="displaynone" type="checkbox"
															disabled="" fw-filter=""
															style="display: none; cursor: unset;"> <label
															id="receiver_zipcode_check_label" for="no_rzipcode0"
															class="displaynone" disabled="" style="display: none;"
															fw-filter="">우편번호 없음</label>
													</span><span id="receiver_zipcodeNotFoundMsg_wrap"
														class="ec-base-label displaynone"> 우편번호가 정확하지 않습니다.
															다시 확인해 주세요. </span></li>
													<li id="receiver_baseAddr_wrap" class="" style=""><input
														id="raddr1" name="raddr1" placeholder="기본주소" data-info="주소"
														fw-filter="isFill" class="inputTypeText" type="text"
														size="60" maxlength="100" readonly="" fw-label="기본주소"
														style=""></li>
													<li id="receiver_detailAddr_wrap" class="" style=""><input
														id="raddr2" name="raddr2" placeholder="나머지 주소(선택 입력 가능)"
														fw-filter="" class="inputTypeText" type="text" size="60" 
														maxlength="255" fw-label="나머지 주소(선택 입력 가능)" style="">
													</li>
												</ul>
											</td>
										</tr>
										<tr class="ec-shippingInfo-receiverPhone displaynone">
											<th scope="row">일반전화 <span class="displaynone"><span
													class="icoRequired">필수</span></span>
											</th>
											<td><div class="ec-base-mail"></div></td>
										</tr>
										<tr class="ec-shippingInfo-receiverCell ">
											<th scope="row">휴대전화 <span class=""><span
													class="icoRequired">필수</span></span>
											</th>
											<td><div class="ec-base-mail">
													<select id="rphone2_1" name="rphone2_[]"
														fw-filter="isNumber&amp;isFill" fw-label="수취자 핸드폰번호"
														fw-alone="N" fw-msg="">
														<option value="010">010</option>
														<option value="011">011</option>
														<option value="016">016</option>
														<option value="017">017</option>
														<option value="018">018</option>
														<option value="019">019</option>
													</select>-<input id="rphone2_2" data-info="휴대전화" name="rphone2_[]" maxlength="4"
														fw-filter="isNumber&amp;isFill" fw-label="수취자 핸드폰번호"
														fw-alone="N" fw-msg="" placeholder="" size="4" value=""
														type="text">-<input id="rphone2_3" data-info="휴대전화"
														name="rphone2_[]" maxlength="4"
														fw-filter="isNumber&amp;isFill" fw-label="수취자 핸드폰번호"
														fw-alone="N" fw-msg="" placeholder="" size="4" value=""
														type="text">
												</div></td>
										</tr>
										<tr class="ec-orderform-emailRow ec-shop-deliverySimpleForm ">
											<th scope="row">이메일 <span
												class="icoRequired icon_order_email" style="">필수</span>
											</th>
											<td>
												<div class="ec-base-mail">
													<input id="oemail1" data-info="이메일" name="oemail1" fw-filter="isFill"
														fw-label="주문자 이메일" fw-alone="N" fw-msg="" class="mailId"
														value="" type="text">@ <span class="mailAddress">
														<select id="oemail3" data-info="이메일" fw-filter="isFill" fw-label="주문자 이메일"
														fw-alone="N" fw-msg="">
															<option value="" selected="selected">-이메일 선택-</option>
															<option value="naver.com">naver.com</option>
															<option value="daum.net">daum.net</option>
															<option value="nate.com">nate.com</option>
															<option value="hotmail.com">hotmail.com</option>
															<option value="yahoo.com">yahoo.com</option>
															<option value="empas.com">empas.com</option>
															<option value="korea.com">korea.com</option>
															<option value="dreamwiz.com">dreamwiz.com</option>
															<option value="gmail.com">gmail.com</option>
															<option value="etc">직접입력</option>
													</select> <span class="directInput ec-compact-etc"><input
															id="oemail2" name="oemail2" data-info="이메일" fw-filter="isFill"
															fw-label="주문자 이메일" fw-alone="N" fw-msg=""
															placeholder="직접입력" value="" type="text"></span>
													</span>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<!-- 안심번호 서비스 사용 -->
						<div class="ec-shippingInfo-safePhone segment unique displaynone">
							<div class="safePhone">
								<span class="useCheck"></span> <a
									href="/order/ec_orderform/popup/safePhone.html" target="_blank"
									class="txtLink">안내</a>
							</div>
						</div>
					</div>
	
					<!-- 해외배송 정보 -->
					<div id="ec-shippingInfo-overseaAddress" class="displaynone">
						<div class="ec-base-table typeWrite">
							<table border="1">
								<caption>배송 정보 입력</caption>
								<colgroup>
									<col style="width: 102px">
									<col style="width: auto">
								</colgroup>
								<tbody>
									<tr class="ec-shippingInfo-newAddress-name">
										<th scope="row">받는사람 <span class="icoRequired">필수</span>
										</th>
										<td>
											<p class="ec-base-help">해외배송인 경우 영문으로 작성해 주세요.</p>
										</td>
									</tr>
									<tr id="ec-freceiver-address">
										<th scope="row">주소 <span class="displaynone"><span
												class="icoRequired">필수</span></span>
										</th>
										<td></td>
									</tr>
									<tr class="ec-shippingInfo-receiverPhone displaynone">
										<th scope="row">일반전화 <span class="icoRequired">필수</span>
										</th>
										<td><div class="ec-base-mail"></div></td>
									</tr>
									<tr class="ec-shippingInfo-receiverCell ">
										<th scope="row">휴대전화 <span class="icoRequired">필수</span>
										</th>
										<td><div class="ec-base-mail"></div></td>
									</tr>
	
									<tr id="ec-shop-receiver_id_card_key" class="displaynone">
										<th scope="row">통관정보 <span class="icoRequired">필수</span>
										</th>
										<td><span class="gBlank10"></span>
											<p id="ec-shop-receiver_id_card_type_msg" class="ec-base-help"></p>
										</td>
									</tr>
									<tr class="ec-shop-overseaShippingFee shippingPrice ">
										<th scope="row">배송비 <span class="icoRequired">필수</span>
										</th>
										<td>
											<div class="ec-shop-shipping_additional_fee_show displaynone">
												<p class="gBreak5">
													<span class="txtEm"><span
														id="f_addr_total_ship_fee_id"></span>원</span>
												</p>
												<div class="ec-base-table gCellNarrow">
													<table border="1">
														<caption>배송비 상세</caption>
														<colgroup>
															<col style="width: 113px">
															<col style="width: auto">
														</colgroup>
														<tbody>
															<tr>
																<th scope="row">해외배송비</th>
																<td class="right"><span id="f_addr_delv_price_id"></span>원</td>
															</tr>
															<tr class="displaynone">
																<th scope="row">보험료</th>
																<td class="right">+<span
																	id="f_addr_insurance_price_id"></span>원
																</td>
															</tr>
															<tr class="ec-shop-shipping_additional_fee_name_show">
																<th scope="row"><span
																	id="f_addr_shipping_additional_fee_name_id"></span></th>
																<td class="right">+<span
																	id="f_addr_shipping_additional_fee_id"></span>원
																</td>
															</tr>
														</tbody>
													</table>
												</div>
												<p class="ec-base-help typeDash displaynone">보험료는 배송과정에서
													발생하는 분실, 도난, 파손 등으로 인한 손해에 대하여 규정에 따라 배상해 드리는 서비스입니다.</p>
											</div>
											<div class="ec-shop-shipping_additional_fee_hide ">
												<p class="gBreak5">
													<span class="txtEm"><span
														id="f_addr_total_ship_fee_id"></span>원</span>
												</p>
												<div class="ec-base-table gCellNarrow">
													<table border="1">
														<caption>배송비 상세</caption>
														<colgroup>
															<col style="width: 113px">
															<col style="width: auto">
														</colgroup>
														<tbody>
															<tr>
																<th scope="row">해외배송비</th>
																<td class="right"><span id="f_addr_delv_price_id"></span>원</td>
															</tr>
															<tr class="displaynone">
																<th scope="row">보험료</th>
																<td class="right">+<span
																	id="f_addr_insurance_price_id"></span>원
																</td>
															</tr>
														</tbody>
													</table>
												</div>
												<ul class="ec-base-help typeDash">
													<li>배송비에는 관세 및 세금 등의 각종 비용은 포함되어 있지 않습니다. 상품수령 시 고객님이
														추가로 지불하셔야 합니다.</li>
													<li class="displaynone">보험료는 배송과정에서 발생하는 분실, 도난, 파손 등으로
														인한 손해에 대하여 규정에 따라 배상해 드리는 서비스입니다.</li>
												</ul>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
	
					<!-- app 배송지정보 -->
					<div id="ec-appshippingInfo" style="display: none;"></div>
	
					<!-- 국내배송 메시지 -->
					<div class="ec-shippingInfo-shippingMessage segment unique  ">
						<select id="omessage_select" data-info="배송지" name="omessage_select" fw-filter=""
							fw-label="배송 메세지" fw-msg="">
							<option value="oMessage-0" selected="selected">-- 메시지 선택
								(선택사항) --</option>
							<option value="oMessage-1">배송 전에 미리 연락바랍니다.</option>
							<option value="oMessage-2">부재 시 경비실에 맡겨주세요.</option>
							<option value="oMessage-3">부재 시 문 앞에 놓아주세요.</option>
							<option value="oMessage-4">빠른 배송 부탁드립니다.</option>
							<option value="oMessage-5">택배함에 보관해 주세요.</option>
							<option value="oMessage-input">직접 입력</option>
						</select>
						<div id="messageInput" class="ec-shippingInfo-omessageInput gBlank10"
							style="display: none;">
							<textarea id="omessage" name="omessage" fw-filter=""
								fw-label="배송 메세지" data-info="배송 메세지" fw-msg="" maxlength="255" cols="70"></textarea>
							
						</div>
					</div>
	
					<!-- 해외배송 메시지 -->
					<div
						class="ec-shippingInfo-shippingMessage segment unique displaynone ">
						<div class="ec-shippingInfo-omessageInput gBlank10"
							style="display: none;">
							<div class="gBlank10 displaynone">
								<label>[]에 자동 저장</label>
								<ul class="ec-base-help">
									<li>게시글은 비밀글로 저장되며 비밀번호는 주문번호 뒷자리로 자동 지정됩니다.</li>
								</ul>
							</div>
						</div>
					</div>
	
					<!-- 국내배송 기본 배송지 사용 -->
	<!-- 				<div class="ec-shippingInfo-newAddress-setMain segment displaynone"
						style="display: block;">
						<input id="set_main_address0" name="set_main_address[]"
							fw-filter="" fw-label="기본 배송지로 저장" fw-msg="" value="T"
							type="checkbox" disabled=""><label for="set_main_address0">기본
							배송지로 저장</label>
					</div> -->
	
					<!-- app tag -->
					<div id="ec-orderform-billingNshipping-tail"></div>
	
					<!-- [비회원주문] 간편 회원가입, 비회원 비밀번호 입력 -->
	
					<ec-jigsaw id="guest"> <ec-jigsawpiece
						id="simpleJoinByOrderForm"> <!--
	                이 파일은 원터치 주문서의 읽기 전용 파일입니다.
	                이 파일은 기능 업그레이드 시, 자동으로 개선된 소스가 적용되어 별도로 디자인 수정을 하지 않아도 됩니다 .
	                원터치 주문서 조각 html 파일을 수정할 경우, 작성한 정보가 유실되거나 주문서 최신 기능이 자동 업그레이드되지 않을 수 있으니 유의해 주세요.
	        --> <!-- 주문서 간편 회원가입 -->
					<!-- <div id="eSimpleJoinByOrderForm"
						class="xans-element- xans-member xans-member-simplejoin joinArea ">
						<div class="agreeJoin">
							<input type="checkbox" id="simple_join_is_check" value="F"><label
								for="simple_join_is_check">배송지 정보로 간편 회원가입</label>
						</div>
						<div id="simpleJoinGuide" class="guide">
							<ul class="ec-base-help">
								<li>이메일, 아이디, 비밀번호만으로 간편하게 회원가입이 가능합니다.</li>
								<li>회원가입 후 쿠폰, 이벤트 등 할인혜택을 받으실 수 있습니다.</li>
							</ul>
						</div>
						<div id="simpleJoinDataForm" class="ec-base-table typeWrite"
							style="display: none;">
							<table border="1">
								<caption>간편 회원가입 정보 입력</caption>
								<colgroup>
									<col style="width: 102px">
									<col style="width: auto">
								</colgroup>
								<tbody>
									<tr class="emailCheck ">
										<th scope="row">이메일 <span class="icoRequired">필수</span>
										</th>
										<td>
											<div class="displayFlex">
												<input id="useCheckEmailDuplication"
													name="useCheckEmailDuplication" fw-filter=""
													fw-label="useCheckEmailDuplication" fw-msg="" value="F"
													type="hidden" disabled=""><input
													id="etc_subparam_email1" name="etc_subparam_email1"
													fw-filter="isFill" fw-label="이메일" fw-alone="N" fw-msg=""
													placeholder="" value="" type="text" disabled=""> <input
													id="emailDuplCheck" name="emailDuplCheck" fw-filter=""
													fw-label="email 중복 체크" fw-msg="" value="F" type="hidden"
													disabled=""><input id="login_id_type"
													name="login_id_type" fw-filter="" fw-label="로그인 아이디 타입"
													fw-msg="" value="id" type="hidden" disabled="">
											</div>
											<ul class="ec-base-help">
												<li id="emailMsg"></li>
											</ul>
										</td>
									</tr>
									<tr class="idCheck ">
										<th scope="row">아이디 <span class="icoRequired">필수</span>
										</th>
										<td>
											<div class="displayFlex">
												<input id="etc_subparam_member_id"
													name="etc_subparam_member_id"
													fw-filter="isFill&amp;isFill&amp;isMin[4]&amp;isMax[16]&amp;isIdentity"
													fw-label="아이디" fw-msg="" class="inputTypeText"
													placeholder="" value="" type="text" disabled=""> <input
													id="idDuplCheck" name="idDuplCheck" fw-filter=""
													fw-label="id 중복 체크" fw-msg="" value="" type="hidden"
													disabled="">
											</div>
											<p id="idMsg" class="ec-base-help"></p>
										</td>
									</tr>
									<tr>
										<th scope="row">비밀번호 <span class="icoRequired">필수</span>
										</th>
										<td><input id="etc_subparam_passwd"
											name="etc_subparam_passwd"
											fw-filter="isFill&amp;isMin[4]&amp;isMax[16]" fw-label="비밀번호"
											fw-msg="" autocomplete="off" maxlength="16"
											0="disabled" value="" type="password" disabled=""> <input
											id="etc_subparam_passwd_type" name="etc_subparam_passwd_type"
											fw-filter="" fw-label="etc_subparam_passwd_type" fw-msg=""
											value="C" type="hidden" disabled="">
											<p class="ec-base-help">(영문 대소문자/숫자/특수문자 중 2가지 이상 조합,
												10자~16자)</p></td>
									</tr>
									<tr>
										<th scope="row">비밀번호 <br>확인 <span class="icoRequired">필수</span>
										</th>
										<td><input id="etc_subparam_user_passwd_confirm"
											name="etc_subparam_user_passwd_confirm"
											fw-filter="isFill&amp;isMatch[etc_subparam_passwd]"
											fw-label="비밀번호 확인" fw-msg="비밀번호가 일치하지 않습니다."
											autocomplete="off" maxlength="16" 0="disabled" value=""
											type="password" disabled="">
											<p id="pwConfirmMsg" class="ec-base-help txtWarn"></p></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div> -->
					</ec-jigsawpiece> <ec-jigsawpiece print="always"> <!-- app tag -->
					<div id="ec-orderform-guest-head"></div>
	
					<!-- 비회원 주문조회 -->
					<!-- <div class="pannelArea ec-orderform-NoMemberPasswdRow ">
						<div class="title">
							<h2>비회원 주문조회 비밀번호</h2>
						</div>
						<div class="contents">
							<div class="ec-base-table typeWrite">
								<table border="1">
									<caption>비회원 주문조회</caption>
									<colgroup>
										<col style="width: 122px">
										<col style="width: auto">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">비밀번호</th>
											<td><input id="order_password" name="order_password"
												fw-filter="isFill" fw-label="비회원결제 비밀번호" fw-msg="" size="7"
												maxlength="16" value="" type="password"> <span
												id="order_password_alert"
												class="ec-base-help txtWarn gBlank5"></span> <span
												id="order_password_msg" class="ec-base-help gBlank5">
													(영문대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자)</span></td>
										</tr>
										<tr>
											<th scope="row">비밀번호 확인</th>
											<td><input id="order_password_confirm"
												name="order_password_confirm"
												fw-filter="isFill&amp;isMatch[order_password]"
												fw-label="비회원결제 비밀번호 확인" fw-msg="" size="7" maxlength="16"
												value="" type="password"> <span
												id="order_password_confirm_alert"
												class="ec-base-help txtWarn gBlank5"></span></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div> -->
	
					<!-- app tag -->
					<div id="ec-orderform-guest-tail"></div>
					</ec-jigsawpiece> </ec-jigsaw>
				</div>
			</div>
	
			<!-- 정기배송 -->
			<div id="ec-jigsaw-area-subscriptionStartDate"
				class="ec-base-fold eToggle displaynone selected">
				<div id="ec-jigsaw-title-subscriptionStartDate" class="title">
					<h2>정기배송시작일</h2>
					<span id="ec-jigsaw-heading-subscriptionStartDate"
						class="txtStrong gRight" style="display: none;"> <span
						id="ec-subscriptionStartDate-date"> <span
							id="ec-subscriptionStartDate"></span> <span id=""></span>요일
					</span>
					</span>
				</div>
				<div class="contents">
					<div class="deliveryDate">
						<strong class="heading">배송시작일 <span class="txtEm">*</span></strong>
						<p class="ec-base-help txtEm">(결제일 : 주기별 배송시작일의 1일 전)</p>
					</div>
				</div>
			</div>
	
			<!-- 희망배송일   -->
			<div id="ec-jigsaw-area-hopeShippingDate"
				class="ec-base-fold eToggle displaynone">
				<div id="ec-jigsaw-title-hopeShippingDate" class="title">
					<h2>희망배송일</h2>
					<span id="ec-jigsaw-heading-hopeShippingDate"
						class="txtStrong gRight"> <span
						id="ec-hopeShippingDate-date"> <span
							id="ec-hopeShippingDate"></span> <span id="ec-hopeShippingDay"></span>요일
					</span> <span id="ec-hopeShippingDate-fast"></span>
					</span>
				</div>
				<div class="contents">
					<!-- 국내배송 희망배송일 -->
					<div class="segment ">
						<div class="hopeDeliveryDate"></div>
						<p class="ec-base-help">
							<span class="txtEm"> 이후로 선택 가능합니다.</span>
						</p>
						<span class="gBlank20"></span>
					</div>
					<!-- 해외배송 희망배송일 -->
					<div class="segment displaynone">
						<div class="hopeDeliveryDate"></div>
						<p class="ec-base-help">
							<span class="txtEm"> 이후로 선택 가능합니다.</span>
						</p>
						<span class="gBlank20"></span>
					</div>
				</div>
			</div>
	
			<!-- 희망배송시간  -->
			<div id="ec-jigsaw-area-hopeShippingTime"
				class="ec-base-fold eToggle displaynone">
				<div id="ec-jigsaw-title-hopeShippingTime" class="title">
					<h2>희망배송시간</h2>
					<span id="ec-jigsaw-heading-hopeShippingTime"
						class="txtStrong gRight"></span>
				</div>
				<div class="contents">
					<!-- 국내배송 희망배송시간 -->
					<div class="segment ">
						<span class="gBlank20"></span>
					</div>
					<!-- 해외배송 희망배송시간 -->
					<div class="segment displaynone">
						<span class="gBlank20"></span>
					</div>
				</div>
			</div>
	
			<!-- 배송MSA_APP 배송 방법 -->
			<div
				class="ec-base-fold eToggle selected appShippingMethod displaynone">
				<div class="title">
					<h2>배송 방법</h2>
				</div>
				<div class="contents info shipping_method_message">
					<p>
						<span id="shipping_method_message"></span>
					</p>
				</div>
				<div class="contents" style="display: none;">
					<div class="segment split shipping_method_select_template">
						<label class="gStretch"><input id="app_shipping_method"
							name="app_shipping_method" type="radio" autocomplete="off"
							disabled=""></label> <strong class="price"></strong>
					</div>
				</div>
				<div class="contents shipping_method_select"
					id="shipping_method_select"></div>
			</div>
		</div>
		<!-- [추가정보입력] 추가입력, 기타문의사항 -->
		<!--
	        이 파일은 원터치 주문서의 읽기 전용 파일입니다.
	        이 파일은 기능 업그레이드 시, 자동으로 개선된 소스가 적용되어 별도로 디자인 수정을 하지 않아도 됩니다 .
	        원터치 주문서 조각 html 파일을 수정할 경우, 작성한 정보가 유실되거나 주문서 최신 기능이 자동 업그레이드되지 않을 수 있으니 유의해 주세요.
	-->
		<div id="ec-jigsaw-area-additionalInput"
			class="ec-base-fold eToggle selected displaynone">
			<div id="ec-jigsaw-title-additionalInput" class="title">
				<h2>추가입력</h2>
			</div>
			<div class="contents">
				<!-- app tag -->
				<div id="ec-orderform-additionalInput-head"></div>
				<!-- 추가입력 -->
				<div class="addArea displaynone">
					<div class="ec-base-table typeWrite">
						<table border="1">
							<caption>추가입력</caption>
							<colgroup>
								<col style="width: 115px">
								<col style="width: auto">
							</colgroup>
							<tbody class="xans-element- xans-order xans-order-ordadd">
								<tr class="">
									<th scope="row"><span class=""></span></th>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<!-- 기타 문의사항 -->
				<div class="questionArea displaynone">
					<div class="ec-base-table typeWrite">
						<table border="1">
							<caption>기타 문의사항</caption>
							<colgroup>
								<col style="width: 115px">
								<col style="width: auto">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">기타 문의사항</th>
									<td><textarea id="question" name="question" fw-filter=""
											fw-label="기타문의사항" fw-msg="" maxlength="255" cols="70"></textarea>
										<p class="ec-base-help">
											<a href="/board/product/list.html?board_no=6" target="_blank">상품
												Q&amp;A</a>에 자동 저장됩니다.
										</p></td>
								</tr>
								<tr>
									<th scope="row">비밀번호</th>
									<td><input id="question_passwd" name="question_passwd"
										fw-filter="" fw-label="기타문의사항 비밀번호" fw-msg="" value=""
										type="password" disabled="">
										<p class="ec-base-help displaynone">영문 대소문자/숫자/특수문자 중 2가지
											이상 조합, 10자~16자</p></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<!-- app tag -->
				<div id="ec-orderform-additionalInput-tail"></div>
			</div>
		</div>
		<!-- [주문상품] -->
		<!--
	        이 파일은 원터치 주문서의 읽기 전용 파일입니다.
	        이 파일은 기능 업그레이드 시, 자동으로 개선된 소스가 적용되어 별도로 디자인 수정을 하지 않아도 됩니다 .
	        원터치 주문서 조각 html 파일을 수정할 경우, 작성한 정보가 유실되거나 주문서 최신 기능이 자동 업그레이드되지 않을 수 있으니 유의해 주세요.
	-->
		<div id="ec-jigsaw-area-orderProduct"
			class="ec-base-fold eToggle selected">
			<div id="ec-jigsaw-title-orderProduct" class="title">
				<h2>주문상품</h2>
				<span id="ec-jigsaw-heading-orderProduct" class="txtStrong gRight"
					style="display: none;">1개</span>
			</div>
			<div class="contents">
				<!-- app tag -->
				<div id="ec-orderform-orderProduct-head"></div>
	
				<!-- 국내배송상품 주문내역 -->
				<div class="orderArea ">
					<!-- 기본배송 -->
					<div class="xans-element- xans-order xans-order-normallist">
						<!-- 참고: 상품반복 -->
						<div class="ec-base-prdInfo xans-record-">
							<div class="prdBox">
								<div class="displaynone">
									<input id="chk_order_cancel_list0"
										name="chk_order_cancel_list_basic0" value="14:000A:F:249"
										type="checkbox" disabled="">
								</div>
								<div class="thumbnail">
									<img
										src="${pageContext.request.contextPath}/image?filename=${product.fileInfo[0].uuid}"
										alt="" width="90" height="90"></a>
								</div>
								<div class="description">
									<strong class="prdName" title="상품명"> <a
										href="/product/살구색-후드티/14/category/1/" class="ec-product-name">살구색
											후드티</a></strong>
									<ul class="info">
										<li class="displaynone">무이자할부 상품</li>
										<li title="유효기간" class="displaynone">내 사용</li>
										<li title="옵션">
											<p class="option displaynone"></p>
										</li>
										<li>수량: 1개</li>
										<li id="" class="displaynone">할인금액: <span class="txtWarn">-<span
												id="">0</span>원
										</span> <span class="txtWarn displaynone">()</span>
										</li>
										<li class="displaynone" title="배송">[무료] / 기본배송</li>
										<li class="displaynone" title="배송주기">배송주기 : <span
											class="txtEm"></span>
										</li>
										<li class="displaynone" title="배송횟수">배송횟수 : <span
											class="txtEm">-</span>
										</li>
										<li id="product_mileage0" class="mileage displaynone"
											title="적립금">-</li>
										<li class="displaynone">상품중량 : 1.00kg * 1개 = 1.00kg</li>
									</ul>
									<div class="proPrice">
										<span class="displaynone"></span> <span
											class="displaynone"></span> <span class="display"> <span class="myTotalPay">원</span> <span class="displaynone">()</span>
										</span>
									</div>
								</div>
								<button type="button" class="btnRemove "
									id="btn_product_one_delete_id0" prd="14:000A:F:249"
									set_prd_type="">삭제</button>
							</div>
						</div>
						<!-- //참고 -->
						<!-- 참고: 상품반복 -->
						<!-- //참고 -->
					</div>
					<div class="totalPrice ">
						<div class="title">
							<h3>배송비</h3>
							<span class="deliveryFee"><span id="domestic_ship_fee" class="myTotalPay">0
									(무료)</span>(무료)</span>
						</div>
					</div>
	
					<!-- 업체기본배송 -->
					<div class="totalPrice displaynone">
						<div class="title">
							<h3>배송비</h3>
							<span class="deliveryFee"><span id="" class="myTotalPay"></span></span>
						</div>
					</div>
	
					<!-- 개별배송 -->
					<div class="totalPrice displaynone">
						<div class="title">
							<h3>배송비</h3>
							<span class="deliveryFee"><span id="" class="myTotalPay"></span></span>
						</div>
					</div>
				</div>
	
				<!-- 해외배송상품 주문내역 -->
				<div class="orderArea displaynone">
					<div class="totalPrice ">
						<div class="title">
							<h3>배송비</h3>
							<span class="deliveryFee"><span
								id="f_list_total_delv_price_id" class="myTotalPay"></span></span>
						</div>
					</div>
				</div>
				<div class="totalWeight displaynone">
					전체 상품중량 : <span>1.00kg</span>
				</div>
	
				<!-- app tag -->
				<div id="ec-orderform-orderProduct-tail"></div>
			</div>
			<div id="ec-shop-directbuy-order-product-info" class="displaynone"></div>
		</div>
		<!-- [사은품] -->
		<div id="ec-shop-gift_orderform">
			<!--
	        이 파일은 원터치 주문서의 읽기 전용 파일입니다.
	        이 파일은 기능 업그레이드 시, 자동으로 개선된 소스가 적용되어 별도로 디자인 수정을 하지 않아도 됩니다 .
	        원터치 주문서 조각 html 파일을 수정할 경우, 작성한 정보가 유실되거나 주문서 최신 기능이 자동 업그레이드되지 않을 수 있으니 유의해 주세요.
	-->
			<!-- 이값은 지우면 안되는 값입니다.
	    $easyform_gift=T
	-->
		</div>
		<!-- [할인/부가결제] 할인/부가결제, 자동 할인내역 레이어 팝업 -->
		<!--
	        이 파일은 원터치 주문서의 읽기 전용 파일입니다.
	        이 파일은 기능 업그레이드 시, 자동으로 개선된 소스가 적용되어 별도로 디자인 수정을 하지 않아도 됩니다 .
	        원터치 주문서 조각 html 파일을 수정할 경우, 작성한 정보가 유실되거나 주문서 최신 기능이 자동 업그레이드되지 않을 수 있으니 유의해 주세요.
	-->
		<div class="ec-jigsawWrapper">
			<!-- app tag -->
			<div id="ec-orderform-discount-head"></div>
	
			<div id="ec-jigsaw-area-discount"
				class="ec-base-fold eToggle selected displaynone">
				<div id="ec-jigsaw-title-discount" class="title">
					<h2>할인/부가결제</h2>
					<span id="ec-jigsaw-heading-discount" class="txtStrong gRight"
						style="display: none;"> -<span
						id="discount_total_sale_price_view">0</span>원 <span
						class="displaynone"><span
							id="discount_total_sale_price_ref_view"><span
								class="eRefPrice"></span></span></span>
					</span>
				</div>
				<div class="contents">
					<div class="discountDetail displaynone"
						id="ec-shop-orderfom-total-benefit-view-id" style="display: none;">
						<div class="discountList eToggle">
							<div class="title">
								<div class="heading">자동 할인</div>
								<div class="control">
									<span class="txtEm"><span id="total_benefit_price_view">0</span>원</span>
								</div>
							</div>
							<div class="contents">
								<ul id="total_benefit_list">
									<li class="displaynone "><span class="discountName">정기배송할인</span>
										<span class="discountPrice"><span
											id="mBenefitSubscriptionPayseqSale">0원</span></span></li>
									<li class="displaynone ec-shop-mBenefitPeriodSale"><span
										class="discountName">기간할인</span> <span class="discountPrice"><span
											id="mBenefitPeriodSale">0원</span></span></li>
									<li class="displaynone ec-shop-mBenefitMemberSale"><span
										class="discountName">회원할인</span> <span class="discountPrice"><span
											id="mBenefitMemberSale">0원</span></span></li>
									<li class="displaynone ec-shop-mBenefitRebuySale"><span
										class="discountName">재구매할인</span> <span class="discountPrice"><span
											id="mBenefitRebuySale">0원</span></span></li>
									<li class="displaynone ec-shop-mBenefitBulkSale"><span
										class="discountName">대량구매할인</span> <span class="discountPrice"><span
											id="mBenefitBulkSale">0원</span></span></li>
									<li class="displaynone"><span class="discountName">바로가기(링콘)할인</span>
										<span class="discountPrice"><span
											id="mBenefitLivelinkonSale">0원</span></span></li>
									<li class="displaynone ec-shop-mBenefitNewproductSale"><span
										class="discountName">신규상품할인</span> <span class="discountPrice"><span
											id="mBenefitNewproductSale">0원</span></span></li>
									<li class="displaynone ec-shop-mBenefitSetproductSale"><span
										class="discountName">세트할인</span> <span class="discountPrice"><span
											id="mBenefitSetproductSale">0원</span></span></li>
									<li class="displaynone ec-shop-mBenefitShipfeeSale"
										style="display: none;"><span class="discountName">배송비할인</span>
										<span class="discountPrice"><span
											id="mBenefitShipfeeSale">0원</span></span></li>
									<li class="displaynone ec-shop-mBenefitMembergroupSale"
										style="display: none;"><span class="discountName">회원등급할인</span>
										<span class="discountPrice"><span
											id="mBenefitMembergroupSale">0원</span></span></li>
								</ul>
							</div>
						</div>
						<span class="summary"><span
							id="total_only_mobile_sale_price_display_id" class="displaynone">(모바일
								혜택 <span id="total_only_mobile_sale_price_id" class="txtEm">0원</span>)
						</span><span id="mTotalOnlyMobileSaleTmp" class="displaynone">(모바일
								혜택 <span class="txtEm">[TOTAL_ONLY_MOBILE_SALE]</span>)
						</span></span>
					</div>
					<div class="discountDetail displaynone mDiscountcodeSelect"
						style="display: block;">
						<div class="displayblock">
							<strong class="heading">할인코드 적용</strong>
							<div class="control">
								<input type="text" name="ec_discountcode" class="inputTypeText"><a
									href="#none" id="ec_discountcode" class="btnNormal">적용</a>
							</div>
						</div>
					</div>
					<div class="discountDetail mDiscountcodeModify"
						style="display: none;">
						<div class="displayFlex">
							<strong class="heading">할인코드 적용</strong>
							<div class="control">
								<span class="discountPrice"><span
									id="ec_discountcode_price" class="discountStrong"></span></span><a
									href="#none" class="btnNormal" id="ec_discountcode_clear">초기화</a>
							</div>
						</div>
						<ul id="ec_discountcode_info"
							class="ec-base-help ec-order-expandwrap">
						</ul>
					</div>
					<div class="discountDetail displaynone mCouponSelect"
						style="display: block;">
						<div class="displayFlex">
							<strong class="heading">쿠폰 할인</strong>
							<div class="control">
								<span class="discountPrice"><span id=""
									class="mTotalCouponDiscount discountStrong">0원</span></span> <a
									href="#none" id="btn_coupon_select" class="btnNormal">쿠폰 적용</a>
							</div>
						</div>
						<span class="summary">보유쿠폰 <span class="txtEm">개</span></span>
						<p class="discountMsg ec-autoApplyMsg txtEm" style="display: none;">자동
							적용된 할인 쿠폰을 확인해 주세요.</p>
					</div>
					<div class="discountDetail mCouponModify" style="display: none;">
						<div class="displayFlex">
							<strong class="heading">쿠폰 할인</strong>
							<div class="control">
								<span class="discountPrice"><span
									class="mTotalCouponDiscount discountStrong">0원</span></span> <a
									href="#none" id="eCouponModify" class="btnNormal">쿠폰 적용</a>
							</div>
						</div>
						<span class="summary">보유쿠폰 <span class="txtEm">개</span></span>
						<p class="discountMsg ec-autoApplyMsg txtEm" style="display: none;">자동
							적용된 할인 쿠폰을 확인해 주세요.</p>
						<ul class="couponWrap displaynone">
							<li id="divCpnView" class="coupon ec-order-expandwrap">
								<div class="couponList">
									<span id="txt_cpn_name" class="ec-coupon-expand"><span
										class="txt_info"></span></span> <span id="txt_cpn_price"></span> <span
										id="txt_cpn_attr_D"></span> <span id="txt_cpn_attr_M"></span> <span
										id="txt_cpn_attr_C"></span> <span class="displaynone"
										id="mProductCouponDiscount">0원</span> <span class="displaynone"
										id="txt_cpn_sale2">0원</span> <span class="displaynone"
										id="mDeliveryCouponDiscount">0원</span>
									<button type="button" class="btnRemove" id="txt_cpn_delete">x</button>
								</div>
								<ul class="coupon-help-info">
									<li>사용 기간 : <span id="txt_cpn_period"></span>
									</li>
									<li id="txt_cpn_paymethod_display">결제 조건 : <span
										id="txt_cpn_paymethod"></span>
									</li>
								</ul>
							</li>
						</ul>
						<ul id="divCpn" style="display: none;" class="couponWrap"></ul>
					</div>
					<div id="mileage_use_area" class="discountDetail displaynone">
						<div class="displayblock">
							<strong class="heading">적립금</strong>
							<div class="control">
								<input type="hidden" name="ori_total_avail_mileage"
									id="ori_total_avail_mileage" value="" disabled="">
								<button type="button" class="btnNormal" id="all_use_mileage">전액
									사용</button>
							</div>
						</div>
						<span class="summary">보유 잔액 <span class="txtEm">원</span></span>
						<ul class="ec-base-help ec-order-expandwrap">
							<li id="mileage_max_limit" class="ec-order-expand">1회 구매시 적립금
								최대 사용금액은 0원입니다.</li>
							<li>최소 적립금 원 이상일 때 사용 가능합니다.</li>
							<li id="mileage_max_unlimit" class="displaynone">최대 사용금액은 제한이
								없습니다.</li>
							<li>적립금으로만 결제할 경우, 결제금액이 0으로 보여지는 것은 정상이며 [결제하기] 버튼을 누르면 주문이
								완료됩니다.</li>
							<li id="mileage_shipfee" class="displaynone">적립금 사용 시 배송비는
								적립금으로 사용 할 수 없습니다.</li>
							<li id="mileage_exception" class="displaynone">적립금 사용 시 해당
								상품에 대한 적립금은 적립되지 않습니다.</li>
						</ul>
					</div>
					<div class="discountDetail displaynone">
						<div class="displayblock">
							<strong class="heading">예치금</strong>
							<div class="control">
								<input type="hidden" name="ori_total_deposit"
									id="ori_total_deposit" value="" disabled="">
								<button type="button" class="btnNormal" id="all_use_deposit">전액
									사용</button>
							</div>
						</div>
						<span class="summary">보유 잔액 <span class="txtEm">원</span></span>
						<ul class="ec-base-help ec-order-expandwrap">
							<li class="ec-order-expand">예치금은 사용제한 없이 언제든 결제가 가능합니다.</li>
							<li>예치금으로만 결제할 경우, 결제금액이 0으로 보여지는 것은 정상이며 [결제하기] 버튼을 누르면 주문이
								완료됩니다.</li>
						</ul>
					</div>
					<div class="discountDetail discount_affiliate_template"
						style="display: none;">
						<div class="displayblock">
							<strong class="heading">''</strong>
							<div class="control">
								<input id="input_affiliate" name="input_affiliate" fw-filter=""
									fw-label="" fw-msg="" class="inputTypeText affiliateInput"
									placeholder="" size="10" value="" type="text" readonly=""
									disabled=""> &nbsp;<input id="paymethod_affiliate"
									name="paymethod_affiliate" value="" type="hidden" disabled=""><input
									id="receiptIssuer_affiliate" name="receiptIssuer_affiliate"
									value="" type="hidden" disabled=""> &nbsp;
								<button type="button" class="btnNormal affiliate_balance"
									value="">조회</button>
								<button type="button" class="btnNormal btn_reset affiliate_reset">초기화</button>
							</div>
						</div>
					</div>
					<div class="totalPay">
						<h3 class="heading">적용금액</h3>
						<div class="txtEm">
							-<span id="total_sale_price_view">0</span>원 <span
								class="refer displaynone">(<span
								id="total_sale_price_ref_view"><span class="eRefPrice"></span></span>)
							</span>
						</div>
						<span class="displaynone" id="total_addpay_price_view">0</span>
					</div>
				</div>
			</div>
	
			<!-- app tag -->
			<div id="ec-orderform-discount-tail"></div>
		</div>
		<!-- [결제정보] -->
		<!--
	        이 파일은 원터치 주문서의 읽기 전용 파일입니다.
	        이 파일은 기능 업그레이드 시, 자동으로 개선된 소스가 적용되어 별도로 디자인 수정을 하지 않아도 됩니다 .
	        원터치 주문서 조각 html 파일을 수정할 경우, 작성한 정보가 유실되거나 주문서 최신 기능이 자동 업그레이드되지 않을 수 있으니 유의해 주세요.
	-->
		<div id="ec-jigsaw-area-payment" class="ec-base-fold eToggle selected">
			<div id="ec-jigsaw-title-payment" class="title">
				<h2>결제정보</h2>
			</div>
			<div class="contents">
				<!-- app tag -->
				<div id="ec-orderform-payment-head"></div>
	
				<div class="segment">
					<div class="ec-base-table gCellNarrow">
						<table border="1">
							<caption>결제정보 상세</caption>
							<colgroup>
								<col style="width: 155px">
								<col style="width: auto">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">주문상품</th>
									<td class="right"><span id="total_product_base_price_id"
										class="price myTotalPay"></span></td>
								</tr>
								<tr class="displaynone">
									<th scope="row">부가세</th>
									<td class="right"><span class="price"><span
											id="total_vat_price_id">+0원</span></span></td>
								</tr>
								<tr class="">
									<th scope="row">배송비 <span class="displaynone info">(착불
											상품 포함)</span>
									</th>
									<td class="right"><span class="price">+<span
											id="total_ship_price_id">0원</span></span></td>
								</tr>
								<tr id="total_local_ship_price_area" style="display: none;">
									<th scope="row">지역별 배송비</th>
									<td class="right"><span class="price">+<span
											id="total_local_ship_price_id">0원</span></span></td>
								</tr>
								<tr class="discountView">
									<th scope="row">할인/부가결제</th>
									<td class="right"><span class="price"><span
											class="txtRed">-<span class="eRefPrice"
												id="payment_total_sale_price_view">0</span></span>원</span></td>
								</tr>
								<tr id="ec-shop-payment_discount_list_view" class="paymentList"
									style="display: none;">
									<td colspan="2">
										<ul>
											<li id="ec-shop-payment_benefit_price2_area"
												style="display: none;"><span class="discountName"><i
													class="ico_auto"></i> 기본 할인</span> <span class="price">-<span
													id="ec-shop-payment_benefit_price2_view"></span>원
											</span></li>
											<li id="ec-shop-payment_shipfee_area" style="display: none;">
												<span class="discountName"><i class="ico_delivery"></i>
													배송비 할인</span> <span class="price">-<span
													id="ec-shop-payment_shipfee_view"></span>원
											</span>
											</li>
											<li id="ec-shop-payment_coupon_price2_area"
												style="display: none;"><span class="discountName"><i
													class="ico_copon"></i> 쿠폰 할인</span> <span class="price">-<span
													id="ec-shop-payment_coupon_price2_view"></span>원
											</span></li>
											<li id="ec-shop-payment_discountcode_price_area"
												style="display: none;"><span class="discountName"><i
													class="ico_code"></i> 할인 코드</span> <span class="price">-<span
													id="ec-shop-payment_discountcode_price_view"></span>원
											</span></li>
											<li id="ec-shop-payment_used_mileage_area"
												style="display: none;"><span class="discountName"><i
													class="ico_accumulate"></i> 적립금</span> <span class="price">-<span
													id="ec-shop-payment_used_mileage_view"></span>원
											</span></li>
											<li id="ec-shop-payment_used_deposit_area"
												style="display: none;"><span class="discountName"><i
													class="ico_deposit"></i> 예치금</span> <span class="price">-<span
													id="ec-shop-payment_used_deposit_view"></span>원
											</span></li>
											<li class="payment_affiliate_template" style="display: none;">
												<span class="discountName"></span> <span class="price">-<span
													id="ec-shop-payment_used_affiliate_view"></span>원
											</span>
											</li>
										</ul>
									</td>
								</tr>
								<tr id="total_tax_area_id" class="displaynone">
									<th scope="row"><span id="total_tax_name_id"></span></th>
									<td class="right"><span class="price">+<span
											id="total_tax_id">0원</span></span></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="totalPay paymentPrice">
					<h3 class="heading">최종 결제 금액</h3>
					<strong class="txtStrong"> 
						<span
						id="payment_total_order_sale_price_view" class="myTotalPay"></span>
					</strong> <span class="displaynone"><input id="total_price"
						name="total_price" fw-filter="isFill" fw-label="결제금액" fw-msg=""
						class="inputTypeText" placeholder=""
						style="text-align: right; ime-mode: disabled; clear: none; border: 0px; float: none;"
						size="10" readonly="1" value="80000" type="text" disabled=""></span>
				</div>
	
				<!-- app tag -->
				<div id="ec-orderform-payment-tail"></div>
			</div>
		</div>
		<!-- [결제수단] -->
		<!--
	        이 파일은 원터치 주문서의 읽기 전용 파일입니다.
	        이 파일은 기능 업그레이드 시, 자동으로 개선된 소스가 적용되어 별도로 디자인 수정을 하지 않아도 됩니다 .
	        원터치 주문서 조각 html 파일을 수정할 경우, 작성한 정보가 유실되거나 주문서 최신 기능이 자동 업그레이드되지 않을 수 있으니 유의해 주세요.
	-->
		<div id="ec-jigsaw-area-paymethod"
			class="ec-base-fold eToggle selected">
			<div id="ec-jigsaw-title-paymethod" class="title">
				<h2>결제수단</h2>
			</div>
			<div class="contents">
				<!-- app tag -->
				<div id="ec-orderform-paymethod-head"></div>
	
				<div class="segment">
					<ul class="payMethod">
						<li class="ec-paymethod-recentArea displaynone"><input
							type="radio" name="paymethod" id="paymethod-recent" class=""
							autocomplete="off" disabled=""><label
							for="paymethod-recent">최근 결제수단</label>
							<div id="ec-payment-recentPaymethodText" class="inner"></div></li>
						<li class="ec-paymethod-newArea selected"><input type="radio"
							name="paymethod" id="paymethod-new" class="displaynone" checked=""
							autocomplete="off"><label for="paymethod-new"><span
								class="displaynone">다른 </span>결제수단 선택</label>
							<div class="inner">
								<span class="ec-base-label"><input id="addr_paymethod0"
									name="addr_paymethod" fw-filter="isFill" fw-label="결제방식"
									fw-msg="" value="cash" type="radio" checked="checked"
									autocomplete="off"><label for="addr_paymethod0">무통장입금</label></span>
							</div></li>
						<li class="ec-paymethod-widgetArea displaynone "><input
							type="radio" name="paymethod" id="paymethod-widget" class=""
							autocomplete="off" disabled=""><label
							for="paymethod-widget"></label> <input id="addr_paymethod_widget"
							class="displaynone" name="addr_paymethod" fw-filter="isFill"
							fw-label="결제방식" fw-msg="" value="" type="radio" autocomplete="off">
							&nbsp;
							<div id="ec-payment-widget" class="inner"></div></li>
					</ul>
				</div>
	
				<div class="ec-paymethod-input-detail">
					<div id="payment_input_cash" class="ec-base-table typeWrite"
						style="">
						<table border="1">
							<caption>무통장입금 정보 입력</caption>
							<colgroup>
								<col style="width: 100px">
								<col style="width: auto">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">입금은행 <span class="icoRequired">필수</span>
									</th>
									<td><select id="bankaccount" data-info="입금은행" name="bankaccount"
										fw-filter="" fw-label="무통장 입금은행" fw-msg="">
											<option value="">::: 선택해 주세요. :::</option>
											<option value='SC제일은행'>SC제일은행</option>       
											<option value='경남은행'>경남은행</option>       
											<option value='광주은행'>광주은행</option>       
											<option value='국민은행'>국민은행</option>       
											<option value='굿모닝신한증권'>굿모닝신한증권</option>       
											<option value='기업은행'>기업은행</option>       
											<option value='농협중앙회'>농협중앙회</option>       
											<option value='농협회원조합'>농협회원조합</option>       
											<option value='대구은행'>대구은행</option>       
											<option value='대신증권'>대신증권</option>       
											<option value='대우증권'>대우증권</option>       
											<option value='동부증권'>동부증권</option>       
											<option value='동양종합금융증권'>동양종합금융증권</option>       
											<option value='메리츠증권'>메리츠증권</option>       
											<option value='미래에셋증권'>미래에셋증권</option>       
											<option value='뱅크오브아메리카(BOA)'>뱅크오브아메리카(BOA)</option>       
											<option value='부국증권'>부국증권</option>       
											<option value='부산은행'>부산은행</option>       
											<option value='산림조합중앙회'>산림조합중앙회</option>       
											<option value='산업은행'>산업은행</option>       
											<option value='삼성증권'>삼성증권</option>       
											<option value='상호신용금고'>상호신용금고</option>       
											<option value='새마을금고'>새마을금고</option>       
											<option value='수출입은행'>수출입은행</option>       
											<option value='수협중앙회'>수협중앙회</option>       
											<option value='신영증권'>신영증권</option>       
											<option value='신한은행'>신한은행</option>       
											<option value='신협중앙회'>신협중앙회</option>       
											<option value='에스케이증권'>에스케이증권</option>       
											<option value='에이치엠씨투자증권'>에이치엠씨투자증권</option>       
											<option value='엔에이치투자증권'>엔에이치투자증권</option>       
											<option value='엘아이지투자증권'>엘아이지투자증권</option>       
											<option value='외환은행'>외환은행</option>       
											<option value='우리은행'>우리은행</option>       
											<option value='우리투자증권'>우리투자증권</option>       
											<option value='우체국'>우체국</option>       
											<option value='유진투자증권'>유진투자증권</option>       
											<option value='전북은행'>전북은행</option>       
											<option value='제주은행'>제주은행</option>       
											<option value='키움증권'>키움증권</option>       
											<option value='하나대투증권'>하나대투증권</option>       
											<option value='하나은행'>하나은행</option>       
											<option value='하이투자증권'>하이투자증권</option>       
											<option value='한국씨티은행'>한국씨티은행</option>       
											<option value='한국투자증권'>한국투자증권</option>       
											<option value='한화증권'>한화증권</option>       
											<option value='현대증권'>현대증권</option>       
											<option value='홍콩상하이은행'>홍콩상하이은행</option>
									</select></td>
								</tr>
								<tr>
									<th scope="row">입금자명 <span class="icoRequired">필수</span>
									</th>
									<td><input id="pname" name="pname" fw-filter=""
										fw-label="무통장 입금자명" data-info="입금자명" fw-msg="" class="inputTypeText"
										placeholder="" size="15" maxlength="20" value="" type="text"></td>
								</tr>
							</tbody>
						</table>
					</div>
	
					<div id="payment_input_tcash" class="ec-base-table typeWrite"
						style="display: none;">
						<table border="1">
							<caption>실시간 계좌이체 정보 입력</caption>
							<colgroup>
								<col style="width: 100px">
								<col style="width: auto">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">예금주명 <span class="icoRequired">필수</span>
									</th>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
	
					<!-- 에스크로(가상계좌) -->
					<div id="payment_input_icash" class="ec-base-table typeWrite"
						style="display: none;">
						<table border="1">
							<caption>에스크로(가상계좌)</caption>
							<colgroup>
								<col style="width: 100px">
								<col style="width: auto">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">에스크로</th>
									<td><input id="flagEscrowIcashUse0"
										name="flagEscrowIcashUse" fw-filter="" fw-label="에스크로(구매안전)"
										fw-msg="" value="T" type="checkbox"><label
										for="flagEscrowIcashUse0"></label><label
										for="flagEscrowIcashUse0">에스크로(구매안전)서비스를 적용합니다.</label></td>
								</tr>
							</tbody>
						</table>
					</div>
	
					<!-- 카드사 직접결제: 카드/할부선택 -->
					<div class="ec-base-table typeWrite"></div>
	
					<!-- 결제수단 도움말 -->
					<div class="helpArea displaynone">
						<!-- 무통장입금, 카드결제, 휴대폰결제, 실시간계좌이체, 페이팔, 엑심베이, 엑시즈, 알리페이 -->
						<ul id="pg_paymethod_info" class="ec-base-help typeDash"
							style="display: none;">
							<li id="pg_paymethod_info_shipfee">최소 결제 가능 금액은 총 결제금액에서 배송비를
								제외한 금액입니다.</li>
							<li id="pg_paymethod_info_pg">소액 결제의 경우 PG사 정책에 따라 결제 금액 제한이
								있을 수 있습니다.</li>
						</ul>
	
						<!-- 케이페이 도움말 -->
						<ul id="kpay_info" class="ec-base-help typeDash"
							style="display: none;">
							<li>케이페이 앱을 설치한 후, 최초 1회 카드정보를 등록하셔야 사용 가능합니다.</li>
						</ul>
	
						<!-- 페이나우 도움말 -->
						<ul id="paynow_info" class="ec-base-help typeDash"
							style="display: none;">
							<li>페이나우 앱을 설치한 후, 최초 1회 카드 및 계좌 정보를 등록하셔야 사용 가능합니다.</li>
						</ul>
	
						<!-- 페이코 도움말 -->
						<ul id="payco_info" class="ec-base-help typeDash"
							style="display: none;">
							<li>페이코(<a href="//www.payco.com" target="_blank">www.payco.com</a>)에
								회원가입 후, 최초 1회 카드 및 계좌 정보를 등록하셔야 사용 가능합니다.
							</li>
						</ul>
	
						<!-- 카카오페이 도움말 -->
						<ul id="kakaopay_info" class="ec-base-help typeDash"
							style="display: none;">
							<li>카카오톡 앱을 설치한 후, 최초 1회 카드정보를 등록하셔야 사용 가능합니다.</li>
							<li>인터넷 익스플로러는 8 이상에서만 결제 가능합니다.</li>
							<li>카카오머니로 결제 시, 현금영수증 발급은 ㈜카카오페이에서 발급가능합니다.</li>
						</ul>
	
						<!-- 스마일페이 도움말 -->
						<ul id="smilepay_info" class="ec-base-help typeDash"
							style="display: none;">
							<li>앱 설치없이 회원가입 또는 G마켓/옥션/G9 ID 로그인 후 바로 이용 가능합니다.</li>
							<li>최초 1회 카드 정보를 등록하셔야 사용 가능합니다.</li>
							<li>결제시 스마일캐시 0.5% 자동적립되며(최대5천원), 스마일캐시는 스마일페이 전 가맹점에서 적립과
								사용이 가능합니다.</li>
						</ul>
	
						<!-- 네이버페이 도움말 -->
						<ul id="naverpay_info" class="ec-base-help typeDash"
							style="display: none;">
							<li>주문 변경 시 카드사 혜택 및 할부 적용 여부는 해당 카드사 정책에 따라 변경될 수 있습니다.</li>
							<li>네이버페이는 네이버ID로 별도 앱 설치 없이 신용카드 또는 은행 계좌 정보를 등록하여 네이버페이
								비밀번호로 결제할 수 있는 간편결제 서비스입니다.</li>
							<li>네이버페이 카드 간편결제는 네이버페이에서 제공하는 카드사별 무이자, 청구 할인 혜택을 받을 수
								있습니다.</li>
						</ul>
	
						<!-- 토스 도움말 -->
						<ul id="toss_info" class="ec-base-help typeDash"
							style="display: none;">
							<li>토스는 간편하게 지문 또는 비밀번호만으로 결제할 수 있는 빠르고 편리한 간편 결제 서비스입니다.</li>
							<li>토스 결제 후 취소/반품 등이 발생할 경우 토스를 통한 신용카드 취소/토스머니 환불이 이루어집니다.</li>
							<li>토스 이용가능 결제수단 : 국내 발행 신용/체크카드, 토스머니</li>
						</ul>
	
						<!-- 카페24페이 도움말 -->
						<ul id="cafe24pay_info" class="ec-base-help typeDash"
							style="display: none;">
							<li>카페24페이는 카페24에 회원가입 또는 로그인 후 별도 앱 설치 없이 결제 가능합니다.</li>
							<li>최초 1회 카드 정보를 등록하여야 사용 가능합니다.</li>
						</ul>
	
						<!-- 후불 결제 도움말 -->
						<div id="pg_paymethod_info_defer" class="displaynone"
							style="display: none;">
							<!-- NP Postpay/GMO Payment After Delivery -->
							<ul id="pg_paymethod_info_defer_type_a"
								class="ec-base-help typeDash" style="display: none;">
								<li>상품 수령과 동시에 배송 직원에게 결제 수수료를 지불하는 후불 결제수단입니다.</li>
								<li>최종 결제금액은 후불 결제 수수료가 포함된 금액으로 계산됩니다.</li>
								<li>희망배송업체/방식을 선택하시면 배송업체별 후불 결제 수수료가 적용됩니다.</li>
								<li>결제 수수료 정보를 확인 후 결제하시기 바랍니다.<a
									href="#ec-orderform-defer-layer"
									class="txtWord ec-order-deffered-payment-popup ec-jigsaw-showLayer"
									style="cursor: pointer;">확인하기</a>
								</li>
							</ul>
							<!-- Daibiki (COD) -->
							<ul id="pg_paymethod_info_defer_type_b"
								class="ec-base-help typeDash" style="display: none;">
								<li>상품 수령과 동시에 배송 직원에게 결제 수수료를 지불하는 후불 결제수단입니다.</li>
								<li>최종 결제금액은 후불 결제 수수료가 포함된 금액으로 계산됩니다.</li>
								<li>희망배송업체/방식을 선택하시면 배송업체별 후불 결제 수수료가 적용됩니다.</li>
								<li>결제 수수료 정보를 확인 후 결제하시기 바랍니다. <a
									href="#ec-orderform-defer-layer"
									class="txtWord ec-order-deffered-payment-popup ec-jigsaw-showLayer"
									style="cursor: pointer;">확인하기</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="receiptWrap">
					<div id="" class="receiptArea displaynone">
						<div class="title">
							<h3>현금영수증</h3>
						</div>
						<div class="ec-cashreceipt-textAndForm">
							<div class="ec-cashreceipt-textArea ec-base-box gBlank10">
								<div class="taxView">
									<span class="number"><span
										id="ec-cashreceipt-userTypeText"></span> <span
										id="ec-cashreceipt-numberText"></span></span>
								</div>
								<span class="sideRight"><a href="#none"
									id="ec-show-cashreceipt-form" class="btnNormal mini">정보변경</a></span>
							</div>
	
							<div class="ec-cashreceipt-formArea">
								<div id="" class="gBlank10">
									<div class="inputArea" id=""></div>
									<div class="inputArea" id=""></div>
								</div>
							</div>
						</div>
					</div>
	
					<!-- <div id="tax_request_display_area" class="receiptArea displaynone"
						style="display: block;">
						<div class="title">
							<h3>세금계산서</h3>
						</div>
						<div class="ec-taxRequest-textAndForm">
							<div class="ec-taxRequest-textArea ec-base-box gBlank10">
								<div class="taxView">
									<span id="ec-taxRequest-regnoText"></span><br> <span
										id="ec-taxRequest-companyNameText"></span> <span
										id="ec-taxRequest-presidentNameText"></span><br> <span
										id="ec-taxRequest-address1Text"></span><br> <span
										id="ec-taxRequest-address2Text"></span><br> <span
										id="ec-taxRequest-emailText"></span>
								</div>
								<span class="sideRight"><a href="#none"
									id="ec-show-taxRequest-form" class="btnNormal mini">정보변경</a></span>
							</div>
	
							<div class="ec-taxRequest-formArea">
								<div id="tax_request_form_area" class="infoForm">
									<ul class="ec-base-help typeDash gBreak10">
										<li>세금 계산서 발행 신청을 위해 아래 모든 입력사항을 빠짐없이 입력하십시오.</li>
										<li>신청양식 작성 후 사업자 등록증 사본을 팩스()로 보내주십시오.</li>
									</ul>
	
									<h4 class="blind">사업자 정보</h4>
									<div class="ec-base-table typeWrite gCellNarrow">
										<table border="1">
											<caption>사업자 정보 입력</caption>
											<colgroup>
												<col style="width: 92px">
												<col style="width: auto">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">사업자구분 <span class="icoRequired">필수</span>
													</th>
													<td></td>
												</tr>
												<tr>
													<th scope="row">사업자<br>등록번호 <span
														class="icoRequired">필수</span>
													</th>
													<td></td>
												</tr>
												<tr>
													<th scope="row">상호명<br>(법인명) <span
														class="icoRequired">필수</span>
													</th>
													<td></td>
												</tr>
												<tr>
													<th scope="row">대표자명 <span class="icoRequired">필수</span>
													</th>
													<td></td>
												</tr>
												<tr>
													<th scope="row">주소 <span class="icoRequired">필수</span>
													</th>
													<td><ul class="ec-address">
															<li id="orderTax_country_wrap" class="displaynone"
																style="display: none;"><select id="" name=""
																class="displaynone gCheckbox60" disabled=""><option
																		value="">국가를 선택해주세요.</option>
																	<option value="GH">가나(GHANA)</option>
																	<option value="GA">가봉(GABON)</option>
																	<option value="GY">가이아나(GUYANA)</option>
																	<option value="GM">감비아(GAMBIA)</option>
																	<option value="GT">과테말라(GUATEMALA)</option>
																	<option value="GD">그레나다(GRENADA)</option>
																	<option value="GE">그루지야(GEORGIA)</option>
																	<option value="GR">그리스(GREECE)</option>
																	<option value="GN">기니(GUINEA)</option>
																	<option value="GW">기니비소(GUINEA-BISSAU)</option>
																	<option value="NA">나미비아(NAMIBIA)</option>
																	<option value="NG">나이지리아(NIGERIA)</option>
																	<option value="ZA">남아프리카공화국(SOUTH AFRICA)</option>
																	<option value="AN">네덜란드(네덜란드령앤틸리스)(NETHERLANDS(ANTILLES))</option>
																	<option value="NL">네덜란드(네델란드)(NETHERLANDS)</option>
																	<option value="AW">네덜란드(아루바섬)(ARUBA)</option>
																	<option value="NP">네팔(NEPAL)</option>
																	<option value="NO">노르웨이(NORWAY)</option>
																	<option value="NZ">뉴질란드(NEW ZEALAND)</option>
																	<option value="NE">니제르(NIGER)</option>
																	<option value="NI">니카라과(NICARAGUA)</option>
																	<option value="KR" selected="">대한민국(KOREA (REP
																		OF,))</option>
																	<option value="DK">덴마크(DENMARK)</option>
																	<option value="GL">덴마크(그린란드)(GREENLAND)</option>
																	<option value="FO">덴마크(페로즈제도)(FAROE ISLANDS)</option>
																	<option value="DO">도미니카공화국(DOMINICAN REPUBLIC)</option>
																	<option value="DM">도미니카연방(DOMINICA)</option>
																	<option value="DE">독일(GERMANY)</option>
																	<option value="TL">동티모르(TIMOR-LESTE)</option>
																	<option value="LA">라오스(LAO PEOPLE'S DEM REP)</option>
																	<option value="LR">라이베리아(LIBERIA)</option>
																	<option value="LV">라트비아(LATVIA)</option>
																	<option value="RU">러시아(RUSSIAN FEDERATION)</option>
																	<option value="LB">레바논(LEBANON)</option>
																	<option value="LS">레소토(LESOTHO)</option>
																	<option value="RO">루마니아(ROMANIA)</option>
																	<option value="LU">룩셈부르크(LUXEMBOURG)</option>
																	<option value="RW">르완다(RWANDA)</option>
																	<option value="LY">리비아(LIBYAN ARAB JAMAHIRIYA)</option>
																	<option value="LI">리첸쉬테인(LIECHTENSTEIN)</option>
																	<option value="LT">리투아니아(LITHUANIA)</option>
																	<option value="MG">마다가스카르(MADAGASCAR)</option>
																	<option value="MK">마케도니아(MACEDONIA)</option>
																	<option value="MW">말라위(MALAWI)</option>
																	<option value="MY">말레이지아(MALAYSIA)</option>
																	<option value="ML">말리(MALI)</option>
																	<option value="MX">멕시코(MEXICO)</option>
																	<option value="MC">모나코(MONACO)</option>
																	<option value="MA">모로코(MOROCCO)</option>
																	<option value="MU">모리셔스(MAURITIUS)</option>
																	<option value="MR">모리타니(MAURITANIA)</option>
																	<option value="MZ">모잠비크(MOZAMBIQUE)</option>
																	<option value="ME">몬테네그로(MONTENEGRO)</option>
																	<option value="MD">몰도바(MOLDOVA, REPUBLIC OF)</option>
																	<option value="MV">몰디브(MALDIVES)</option>
																	<option value="MT">몰타(MALTA)</option>
																	<option value="MN">몽고(MONGOLIA)</option>
																	<option value="US">미국(U.S.A)</option>
																	<option value="GU">미국(괌)(GUAM)</option>
																	<option value="MH">미국(마아샬제도)(MARSHALL ISLANDS)</option>
																	<option value="VI">미국(버진제도)(VIRGIN ISLANDS
																		U.S.)</option>
																	<option value="WS">미국(사모아, 구 서사모아)(SAMOA)</option>
																	<option value="AS">미국(사모아제도)(AMERICAN SAMOA)</option>
																	<option value="MP">미국(사이판)(NORTHERN MARIANA
																		ISLANDS)</option>
																	<option value="PW">미국(팔라우섬)(PALAU)</option>
																	<option value="PR">미국(푸에르토리코섬)(PUERTO RICO)</option>
																	<option value="MM">미얀마(MYANMAR)</option>
																	<option value="FM">미크로네시아(마이크로네시아)(MICRONESIA)</option>
																	<option value="VU">바누아투(VANUATU)</option>
																	<option value="BH">바레인(BAHRAIN)</option>
																	<option value="BB">바베이도스(BARBADOS)</option>
																	<option value="BS">바하마(BAHAMAS)</option>
																	<option value="BD">방글라데시(BANGLADESH)</option>
																	<option value="VE">베네수엘라(VENEZUELA)</option>
																	<option value="BJ">베넹(BENIN)</option>
																	<option value="VN">베트남(VIET NAM)</option>
																	<option value="BE">벨기에(BELGIUM)</option>
																	<option value="BY">벨라루스(BELARUS)</option>
																	<option value="BZ">벨리세(BELIZE)</option>
																	<option value="BA">보스니아헤르체코비나(Bosnia and
																		Herzegovina)</option>
																	<option value="BW">보츠와나(BOTSWANA)</option>
																	<option value="BO">볼리비아(BOLIVIA)</option>
																	<option value="BF">부르키나파소(BURKINA FASO)</option>
																	<option value="BT">부탄(BHUTAN)</option>
																	<option value="BG">불가리아(BULGARIA(REP))</option>
																	<option value="BR">브라질(BRAZIL)</option>
																	<option value="BN">브루네이(나이)(BRUNEI DARUSSALAM)</option>
																	<option value="BI">브룬디(BURUNDI)</option>
																	<option value="SA">사우디아라비아(SAUDI ARABIA)</option>
																	<option value="CY">사이프러스(CYPRUS)</option>
																	<option value="SM">산마리노(SAN MARINO)</option>
																	<option value="SN">세네갈(SENEGAL)</option>
																	<option value="RS">세르비아/코소보(SERBIA/KOSOVO)</option>
																	<option value="SC">세이셸(SEYCHELLES)</option>
																	<option value="LC">세인트 루시아(SAINT LUCIA)</option>
																	<option value="VC">세인트빈센트그레나딘(SAINT VINCENT AND
																		THE GRENADINES)</option>
																	<option value="KN">세인트키츠네비스(SAINT KITTS AND
																		NEVIS)</option>
																	<option value="SB">솔로몬아일란드(SOLOMON ISLANDS)</option>
																	<option value="SR">수리남(SURINAME)</option>
																	<option value="LK">스리랑카(SRI LANKA)</option>
																	<option value="SZ">스와질랜드(SWAZILAND)</option>
																	<option value="SE">스웨덴(SWEDEN)</option>
																	<option value="CH">스위스(SWITZERLAND)</option>
																	<option value="ES">스페인(에스파니아)(SPAIN)</option>
																	<option value="SK">슬로바키아(SLOVAKIA)</option>
																	<option value="SI">슬로베니아(SLOVENIA)</option>
																	<option value="SL">시에라리온(SIERRA LEONE)</option>
																	<option value="SG">싱가포르(SINGAPORE)</option>
																	<option value="AE">아랍에미레이트연합국(UNITED ARAB
																		EMIRATES)</option>
																	<option value="AM">아르메니아(ARMENIA)</option>
																	<option value="AR">아르헨티나(ARGENTINA)</option>
																	<option value="IS">아이슬란드(ICELAND)</option>
																	<option value="HT">아이티(HAITI)</option>
																	<option value="IE">아일란드(에이레)(IRELAND)</option>
																	<option value="AZ">아제르바이잔(AZERBAIJAN)</option>
																	<option value="AF">아프가니스탄(AFGHANISTAN)</option>
																	<option value="AD">안도라(ANDORRA)</option>
																	<option value="AL">알바니아(ALBANIA)</option>
																	<option value="DZ">알제리(ALGERIA)</option>
																	<option value="AO">앙골라(ANGOLA)</option>
																	<option value="AG">앤티과바부다(ANTIGUA AND BARBUDA)</option>
																	<option value="ER">에리트리아(ERITREA)</option>
																	<option value="EE">에스토니아(ESTONIA)</option>
																	<option value="EC">에콰도르(ECUADOR)</option>
																	<option value="SV">엘살바도르(EL SALVADOR)</option>
																	<option value="GB">영국(UNITED KINGDOM)</option>
																	<option value="MS">영국(몽세라)(MONTSERRAT)</option>
																	<option value="BM">영국(버뮤다섬)(BERMUDA)</option>
																	<option value="VG">영국(버진제도)(VIRGIN ISLANDS
																		BRITISH)</option>
																	<option value="AI">영국(안귈라섬)(ANGUILLA)</option>
																	<option value="GI">영국(지브롤터)(GIBRALTAR)</option>
																	<option value="KY">영국(케이만제도)(CAYMAN ISLANDS)</option>
																	<option value="TC">영국(터크스케이코스제도)(TURKS AND
																		CAICOS ISLANDS)</option>
																	<option value="YE">예멘(YEMEN)</option>
																	<option value="OM">오만(OMAN)</option>
																	<option value="NF">오스트레일리아(노퍽섬)(NORFOLK ISLAND)</option>
																	<option value="AU">오스트레일리아(호주)(AUSTRALIA)</option>
																	<option value="AT">오스트리아(AUSTRIA)</option>
																	<option value="HN">온두라스(HONDURAS)</option>
																	<option value="JO">요르단(JORDAN)</option>
																	<option value="UG">우간다(UGANDA)</option>
																	<option value="UY">우루과이(URUGUAY)</option>
																	<option value="UZ">우즈베크(UZBEKISTAN)</option>
																	<option value="UA">우크라이나(UKRAINE)</option>
																	<option value="ET">이디오피아(ETHIOPIA)</option>
																	<option value="IQ">이라크(IRAQ)</option>
																	<option value="IR">이란(IRAN(ISLAMIC REP))</option>
																	<option value="IL">이스라엘(ISRAEL)</option>
																	<option value="EG">이집트(EGYPT)</option>
																	<option value="IT">이탈리아(이태리)(ITALY)</option>
																	<option value="IN">인도(INDIA)</option>
																	<option value="ID">인도네시아(INDONESIA)</option>
																	<option value="JP">일본(JAPAN)</option>
																	<option value="JM">자메이카(JAMAICA)</option>
																	<option value="ZM">잠비아(ZAMBIA)</option>
																	<option value="CN">중국(CHINA(PEOPLE'S REP))</option>
																	<option value="MO">중국(마카오)(MACAU)</option>
																	<option value="HK">중국(홍콩)(HONG KONG)</option>
																	<option value="CF">중앙 아프리카(CENTRAL AFRICAN
																		REPUBLIC)</option>
																	<option value="DJ">지부티(DJIBOUTI)</option>
																	<option value="ZW">짐바브웨(ZIMBABWE)</option>
																	<option value="TD">차드(CHAD)</option>
																	<option value="CZ">체코(CZECH REP)</option>
																	<option value="CL">칠레(CHILE)</option>
																	<option value="CM">카메룬(CAMEROON)</option>
																	<option value="CV">카보베르데(CAPE VERDE)</option>
																	<option value="KZ">카자흐(KAZAKHSTAN)</option>
																	<option value="QA">카타르(QATAR)</option>
																	<option value="KH">캄보디아(CAMBODIA)</option>
																	<option value="CA">캐나다(CANADA)</option>
																	<option value="KE">케냐(KENYA)</option>
																	<option value="CR">코스타리카(COSTA RICA)</option>
																	<option value="CI">코트디봐르(COTE D IVOIRE)</option>
																	<option value="CO">콜롬비아(COLOMBIA)</option>
																	<option value="CG">콩고(CONGO)</option>
																	<option value="CU">쿠바(CUBA)</option>
																	<option value="KW">쿠웨이트(KUWAIT)</option>
																	<option value="HR">크로아티아(CROATIA)</option>
																	<option value="KG">키르키즈스탄(KYRGYZSTAN)</option>
																	<option value="KI">키리바티(KIRIBATI)</option>
																	<option value="TH">타이(태국)(THAILAND)</option>
																	<option value="TW">타이완(대만)(TAIWAN)</option>
																	<option value="TJ">타지키스탄(TAJIKISTAN)</option>
																	<option value="TZ">탄자니아(TANZANIA(UNITED REP))</option>
																	<option value="TR">터키(TURKEY)</option>
																	<option value="TG">토고(TOGO)</option>
																	<option value="TO">통가(TONGA)</option>
																	<option value="TM">투르크메니스탄(TURKMENISTAN)</option>
																	<option value="TV">투발루(TUVALU)</option>
																	<option value="TN">튀니지(TUNISIA)</option>
																	<option value="TT">트리니다드토바고(TRINIDAD AND
																		TOBAGO)</option>
																	<option value="PA">파나마(PANAMA(REP))</option>
																	<option value="PY">파라과이(PARAGUAY)</option>
																	<option value="PK">파키스탄(PAKISTAN)</option>
																	<option value="PG">파푸아뉴기니(PAPUA NEW GUINEA)</option>
																	<option value="PE">페루(PERU)</option>
																	<option value="PT">포르투갈(PORTUGAL)</option>
																	<option value="PL">폴란드(POLAND(REP))</option>
																	<option value="FR">프랑스(FRANCE)</option>
																	<option value="GP">프랑스(과데루프섬)(GUADELOUPE)</option>
																	<option value="GF">프랑스(기아나)(FRENCH GUIANA)</option>
																	<option value="NC">프랑스(뉴칼레도니아섬)(NEW CALEDONIA)</option>
																	<option value="RE">프랑스(레위니옹섬)(REUNION)</option>
																	<option value="MQ">프랑스(마르티니크섬)(MARTINIQUE)</option>
																	<option value="PF">프랑스(폴리네시아)(FRENCH POLYNESIA)</option>
																	<option value="FJ">피지(FIJI)</option>
																	<option value="FI">필란드(FINLAND)</option>
																	<option value="PH">필리핀(PHILIPPINES)</option>
																	<option value="HU">헝가리(HUNGARY(REP))</option></select> <span
																id="orderTax_directInputCheck_wrap" class="ec-base-label">
																	<input id="orderTax_directInputCheck"
																	name="orderTax_directInputCheck" type="checkbox"
																	disabled=""> <label
																	id="orderTax_directInputCheckLabel"
																	for="orderTax_directInputCheckLabel">직접입력</label>
															</span></li>
	
	
	
	
	
															<li id="orderTax_state_wrap" class="displaynone"
																style="display: none;"><select id="ju_do_us_tax"
																name="ju_do_us_tax" class="displaynone" disabled=""
																fw-filter="" style="display: none;">
																	<option value="">주/도를 선택해주세요</option>
															</select><select id="ju_do_ca_tax" name="ju_do_ca_tax"
																class="displaynone" disabled="" style="display: none;"
																fw-filter="">
																	<option value="">주/도를 선택해주세요</option>
															</select><input id="ju_do_tax" name="ju_do_tax" placeholder="주/도"
																fw-filter="" class="inputTypeText displaynone"
																type="text" size="30" maxlength="50" disabled=""
																style="display: none;"></li>
	
															<li id="orderTax_city_wrap" class="displaynone"
																style="display: none;"><input id="si_gun_dosi_tax"
																name="si_gun_dosi_tax" placeholder="시/군/도시" fw-filter=""
																class="inputTypeText displaynone" type="text" size="30"
																maxlength="50" disabled="" style="display: none;">
															</li>
	
															<li id="orderTax_street_wrap" class="displaynone"><input
																id="gu_name_addr_tax" name="gu_name_addr_tax"
																placeholder="ADDR.COMMON.FORMATSTREET.KR" fw-filter=""
																class="inputTypeText displaynone" type="text" size="30"
																maxlength="50" disabled="" style="display: none;">
															</li>
	
															<li id="orderTax_area_wrap"
																class="ec-address-area displaynone"
																style="display: none;"><select id="si_name_tax"
																name="si_name_tax" class="displaynone" disabled=""
																fw-filter="" style="display: none;">
																	<option value="">ADDR.COMMON.FORMATSELECT.STATE.KR</option>
															</select><select id="ci_name_tax" name="ci_name_tax"
																class="displaynone" disabled="" style="display: none;"
																fw-filter="">
																	<option value="">ADDR.COMMON.FORMATSELECT.CITY.KR</option>
															</select><select id="gu_name_tax" name="gu_name_tax"
																class="displaynone" disabled="" style="display: none;"
																fw-filter="">
																	<option value="">ADDR.COMMON.FORMATSELECT.STREET.KR</option>
															</select></li>
	
															<li id="orderTax_zipcode_wrap" class="ec-address-zipcode"
																style=""><input id="tax_request_zipcode"
																name="tax_request_zipcode" placeholder="우편번호"
																fw-filter="isLengthRange[1][14]" class="inputTypeText"
																type="text" maxlength="14" readonly="" fw-label="우편번호"
																disabled="" style="">
																<button id="btn_search_tzipcode" class="btnBasic"
																	type="button" style="cursor: pointer;">주소검색</button> <span
																class="ec-base-label"> <input id="no_tax_zipcode"
																	name="no_tax_zipcode" class="displaynone"
																	type="checkbox" disabled="" fw-filter=""
																	style="display: none; cursor: unset;"> <label
																	id="orderTax_zipcode_check_label" for="no_tax_zipcode"
																	class="displaynone" disabled="" style="display: none;"
																	fw-filter="">우편번호 없음</label>
															</span><span id="orderTax_zipcodeNotFoundMsg_wrap"
																class="ec-base-label displaynone"> 우편번호가 정확하지
																	않습니다. 다시 확인해 주세요. </span></li>
															<li id="orderTax_baseAddr_wrap" class="" style=""><input
																id="tax_request_address1" name="tax_request_address1"
																placeholder="기본주소" fw-filter="isFill"
																class="inputTypeText" type="text" size="60"
																maxlength="100" readonly="" fw-label="기본주소" disabled=""
																style=""></li>
															<li id="orderTax_detailAddr_wrap" class="" style="">
																<input id="tax_request_address2"
																name="tax_request_address2" placeholder="나머지 주소"
																fw-filter="isFill" class="inputTypeText" type="text"
																size="60" maxlength="255" fw-label="나머지 주소" disabled=""
																style="">
															</li>
														</ul></td>
												</tr>
												<tr>
													<th scope="row">업태 <span class="icoRequired">필수</span>
													</th>
													<td></td>
												</tr>
												<tr>
													<th scope="row">종목 <span class="icoRequired">필수</span>
													</th>
													<td></td>
												</tr>
											</tbody>
										</table>
									</div>
	
									<h4 class="blind">신청자 정보</h4>
									<div class="ec-base-table typeWrite gCellNarrow">
										<table border="1">
											<caption>신청자 정보 입력</caption>
											<colgroup>
												<col style="width: 92px">
												<col style="width: auto">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">신청자명 <span class="icoRequired">필수</span>
													</th>
													<td></td>
												</tr>
												<tr>
													<th scope="row">전화번호 <span class="icoRequired">필수</span>
													</th>
													<td><div class="phoneFlex"></div></td>
												</tr>
												<tr>
													<th scope="row">이메일 <span class="icoRequired">필수</span>
													</th>
													<td>
														<div class="ec-base-mail"></div>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div> -->
				</div>
	
				<!-- 결제수단 저장 -->
				<div class="saveArea segment unique displaynone">
					<input type="checkbox" id="save_paymethod" name="save_paymethod"
						value="" disabled=""><label for="save_paymethod">결제수단과
						입력정보를 다음에도 사용</label>
				</div>
	
				<!-- app tag -->
				<div id="ec-orderform-paymethod-tail"></div>
			</div>
		</div>
		<!-- [적립 혜택] -->
		<!--
	        이 파일은 원터치 주문서의 읽기 전용 파일입니다.
	        이 파일은 기능 업그레이드 시, 자동으로 개선된 소스가 적용되어 별도로 디자인 수정을 하지 않아도 됩니다 .
	        원터치 주문서 조각 html 파일을 수정할 경우, 작성한 정보가 유실되거나 주문서 최신 기능이 자동 업그레이드되지 않을 수 있으니 유의해 주세요.
	-->
		<div id="ec-jigsaw-area-benefit"
			class="ec-base-fold eToggle displaynone">
			<div id="ec-jigsaw-title-benefit" class="title">
				<h2>적립 혜택</h2>
				<span id="ec-jigsaw-heading-benefit" class="txtStrong gRight"><span
					id="mAllMileageSum-title">0원</span> 예정</span>
			</div>
			<div class="contents">
				<!-- app tag -->
				<div id="ec-orderform-benefit-head"></div>
				<div class="segment">
					<div class="ec-base-table gCellNarrow">
						<table border="1">
							<caption>적립 혜택 상세</caption>
							<colgroup>
								<col style="width: 160px">
								<col style="width: auto">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">상품별 적립금</th>
									<td class="right"><span id="mProductMileage" class="price">0원</span></td>
								</tr>
								<tr>
									<th scope="row">회원 적립금</th>
									<td class="right"><span id="mMemberMileage" class="price">0원</span></td>
								</tr>
								<tr>
									<th scope="row">쿠폰 적립금</th>
									<td class="right"><span id="mCouponMileage" class="price">0원</span></td>
								</tr>
								<tr class="displaynone">
									<th scope="row">플러스앱주문 적립금</th>
									<td class="right"><span id="mPlusappMileage" class="price">0원</span></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="totalPay">
					<h3 class="heading">적립 예정금액</h3>
					<strong class="txtEm"><span id="mAllMileageSum" style="">0원</span></strong>
				</div>
				<!-- app tag -->
				<div id="ec-orderform-benefit-tail"></div>
			</div>
		</div>
		<!-- [약관동의] -->
		<!--
	        이 파일은 원터치 주문서의 읽기 전용 파일입니다.
	        이 파일은 기능 업그레이드 시, 자동으로 개선된 소스가 적용되어 별도로 디자인 수정을 하지 않아도 됩니다 .
	        원터치 주문서 조각 html 파일을 수정할 경우, 작성한 정보가 유실되거나 주문서 최신 기능이 자동 업그레이드되지 않을 수 있으니 유의해 주세요.
	-->
		<!-- 이값은 지우면 안되는 값입니다.
	    $easyform_agreement=T
	-->
		<div id="ec-jigsaw-area-agreement">
			<div class="agreeArea" id="all_agreement_checkbox">
				<div class="allAgree">
					<input type="checkbox" id="allAgree"><label for="allAgree"><strong>모든
							약관 동의</strong></label>
				</div>
				<div class="agreement">
					<!-- app tag -->
					<ul id="ec-orderform-agreement-head"></ul>
					<ul>
						<!-- 구매조건 확인 및 결제진행 동의 -->
						<li id="chk_purchase_agreement" class="displaynone"
							style="display: list-item;">
							<div class="agree">
								<span class="check" style=""><input
									id="chk_purchase_agreement0" data-info="이용약관" name="chk_purchase_agreement"
									fw-filter="" fw-label="구매진행 동의" fw-msg="" value="T"
									type="checkbox" style=""><label
									for="chk_purchase_agreement0"><span class="txtEm">[필수]</span>
										구매조건 확인 및 결제진행 동의</label></span>
							</div>
						</li>
						<!-- 결제대행서비스 약관 동의 -->
						<li id="ec-order-payment-directpay-card-agree" class="displaynone"
							style="display: none;">
							<div class="agree">
								<span class="check"><input type="checkbox"
									id="directpay_card_agree_financial" 
									class="directpay_card_agree_checkbox" disabled=""><label
									for="directpay_card_agree_financial"><span class="txtEm">[필수]</span>
										결제대행서비스 약관 동의</label></span>
								<button type="button" class="btnAgree"
									onclick="window.open('/protected/order/payment_agree_financial.html')">내용보기</button>
							</div>
						</li>
						<!-- 쇼핑몰 이용약관 동의 -->
						<li class="">
							<div class="agree">
								<span class="check"><input id="mallAgree" name="mallAgree" data-info="이용약관"
									type="checkbox"><label for="mallAgree"><span
										class="txtEm">[필수]</span> 쇼핑몰 이용약관 동의</label></span> <span
									style="display: none;"><input id="mall_agreement_radio0" 
									name="mall_agreement" fw-filter="isFill" fw-label="쇼핑몰 이용약관 동의"
									fw-msg="" value="T" type="radio" autocomplete="off"><label
									for="mall_agreement_radio0">동의함</label> <input
									id="mall_agreement_radio1" name="mall_agreement"
									fw-filter="isFill" fw-label="쇼핑몰 이용약관 동의" fw-msg="" value="F"
									type="radio" checked="checked" autocomplete="off"><label
									for="mall_agreement_radio1">동의안함</label></span>
								<button type="button" class="btnAgree" onclick="viewMallAgree();">내용보기</button>
							</div>
						</li>
						<!-- 개인정보 수집 및 이용 동의 (구매시) -->
						<li id="ec-orderform-OrderAgreementRow" class="">
							<div class="agree">
								<span class="check"><input id="personAgree"
									name="personAgree" data-info="이용약관" type="checkbox"><label
									for="personAgree"><span class="txtEm">[필수]</span> 개인정보
										수집 및 이용 동의</label></span> <span style="display: none;"><input
									id="nm_agreement0" name="nm_agreement" fw-filter="isFill" 
									fw-label="개인정보 수집 및 이용 동의" fw-msg="" value="T" type="radio"
									autocomplete="off"><label for="nm_agreement0">동의함</label>
									<input id="nm_agreement1" name="nm_agreement" fw-filter="isFill"
									fw-label="개인정보 수집 및 이용 동의" fw-msg="" value="F" type="radio"
									checked="checked" autocomplete="off"><label
									for="nm_agreement1">동의안함</label></span>
								<button type="button" class="btnAgree"
									onclick="viewPersonAgree();">내용보기</button>
							</div>
						</li>
						<!-- 고유식별정보 수집 동의 -->
						<li id="ec-shop-privacy_agreement_for_identification"
							class="displaynone">
							<div class="agree">
								<span class="check"><input
									id="privacy_agreement_for_identification_check_box0"
									name="privacy_agreement_for_identification_check_box"
									fw-filter="" fw-label="" fw-msg="" value="T" type="checkbox"
									disabled=""><label
									for="privacy_agreement_for_identification_check_box0"></label><label
									for="privacy_agreement_for_identification_check_box0"><span
										class="txtEm">[필수]</span> 고유식별정보 수집 동의</label></span>
								<button type="button" class="btnAgree"
									onclick="viewIdentification();">내용보기</button>
							</div>
						</li>
						<!-- 개인정보 수집 및 이용 동의 (회원가입) -->
						<li id="ec-orderform-PrivacyAgreementRow" class="displaynone"
							style="display: none;">
							<div class="agree">
								<span class="check"><input
									id="privacy_agreement_check_box0"
									name="privacy_agreement_check_box" fw-filter="" fw-label=""
									fw-msg="" value="T" type="checkbox" disabled=""><label
									for="privacy_agreement_check_box0"></label><label
									for="privacy_agreement_check_box0"><span class="txtEm">[필수]</span>
										개인정보 수집 및 이용 동의</label></span> <span style="display: none;"><textarea
										id="privacy_agreement" name="privacy_agreement" fw-filter=""
										fw-label="개인정보수집이용동의" fw-msg="" maxlength="250" cols="70"
										readonly="1"></textarea></span>
								<button type="button" class="btnAgree"
									onclick="viewMemberJoinAgree();">내용보기</button>
							</div>
						</li>
						<!-- 개인정보 수집 및 이용 동의(선택) -->
						<li id="ec-orderform-privacyOptionalAgreementRow"
							class="displaynone" style="display: none;">
							<div class="agree">
								<span class="check"><label
									for="privacy_optional_agreement_check_box0"><span
										class="txtEm">[선택]</span> 개인정보 수집 및 이용 동의</label></span> <span
									style="display: none;"></span>
								<button type="button" class="btnAgree"
									onclick="viewPrivacyOptionalAgree();">내용보기</button>
							</div>
						</li>
						<!-- 개인정보 수집 및 이용 동의 (주문서 간단 회원가입 시)-->
						<li id="ec-orderform-privacySimpleOrderAgreementRow"
							class="displaynone" style="display: none;">
							<div class="agree">
								<span class="check"><label
									for="simple_order_agreement_check_box0"><span
										class="txtEm">[필수]</span> 개인정보 수집 및 이용 동의 (주문서 간단 회원가입 시)</label></span> <span
									style="display: none;"></span>
								<button type="button" class="btnAgree"
									onclick="viewPrivacySimpleOrderAgree();">내용보기</button>
							</div>
						</li>
						<!-- 간편 회원가입 정보 및 배송정보(이름, 주소, 이메일, 전화번호) 회원정보에 사용동의 -->
						<li id="ec-orderform-delivery_agreement_row" style="display: none;">
							<div class="agree">
								<span class="check"><input id="simple_join_agree_use_info"
									name="simple_join_agree_use_info" type="checkbox"><label
									for="simple_join_agree_use_info"><span class="txtEm">[필수]</span>
										간편 회원가입 정보 및 배송정보(이름, 주소, 이메일, 전화번호) 회원정보에 사용동의</label></span>
							</div>
						</li>
						<!-- 개인정보 제3자 제공 동의-->
						<li id="ec-orderform-thirdPartyProvidetRow" class="displaynone"
							style="display: none;">
							<div class="agree">
								<span class="check"><label
									for="third_party_providet_agreement_check_box0"><span
										class="txtEm">[선택]</span> 개인정보 제3자 제공 동의</label></span> <span
									style="display: none;"></span>
								<button type="button" class="btnAgree"
									onclick="viewThirdPartyProvideAgree();">내용보기</button>
							</div>
						</li>
						<!-- 개인정보 제3자 제공 동의 (글로벌몰은 기존걸로 나와야됨)-->
						<li id="ec-orderform-informationAgreementRow" class="displaynone"
							style="display: none;">
							<div class="agree">
								<span class="check"><label
									for="information_agreement_check_box0">[선택] 개인정보 제3자 제공
										동의</label></span>
								<button type="button" class="btnAgree"
									onclick="viewInformationAgree();">내용보기</button>
							</div>
						</li>
						<!-- 개인정보 처리 위탁 동의 -->
						<li id="ec-orderform-ConsignmentAgreementRow" class="displaynone"
							style="display: none;">
							<div class="agree">
								<span class="check"><label
									for="consignment_agreement_check_box0"><span
										class="txtEm">[선택]</span> 개인정보 처리 위탁 동의</label></span>
								<button type="button" class="btnAgree"
									onclick="viewConsignmentAgree();">내용보기</button>
							</div>
						</li>
						<!-- 회원 가입시 사용자 지정 N개 항목 동의-->
						<!-- 배송정보 제공방침 -->
						<li class="displaynone displaynone">
							<div class="agree">
								<span class="check"><label
									for="delivery_info_offer_check_box0"><span class="txtEm">[필수]</span>
										배송정보 제공방침 동의</label></span>
								<button type="button" class="btnAgree" onclick="viewDelivery();">내용보기</button>
							</div>
						</li>
						<!-- 정기결제 서비스 이용 동의 -->
						<li class="displaynone">
							<div class="agree">
								<span class="check"><label
									for="subscription_info_checkbox0"><span class="txtEm">[필수]</span>
										정기결제 서비스 이용 동의</label></span>
								<button type="button" class="btnAgree"
									onclick="viewRegularDelivery();">내용보기</button>
							</div>
						</li>
						<!-- 예약결제 이용 동의 -->
						<li class="displaynone">
							<div class="agree">
								<span class="check"><label
									for="crowdfunding_info_check_box"><span class="txtEm">[필수]</span>
										예약결제 이용 동의</label></span>
								<button type="button" class="btnAgree"
									onclick="viewCrowdfunding();">내용보기</button>
							</div>
						</li>
						<!-- 청약철회방침 -->
						<li class="displaynone displaynone">
							<div class="agree">
								<span class="check"><input
									id="subscription_agreement_chk0"
									name="subscription_agreement_chk" fw-filter="" fw-label=""
									fw-msg="" value="T" type="checkbox" disabled=""><label
									for="subscription_agreement_chk0"></label><label
									for="subscription_agreement_chk0"><span
										class="txtEm displaynone">[필수]</span><span class="">[선택]</span>
										청약철회방침 동의</label></span>
								<button type="button" class="btnAgree"
									onclick="viewSubscription();">내용보기</button>
							</div>
						</li>
						<!-- [선택] 마케팅 목적의 개인정보 수집 및 이용 동의 [회원가입 시]-->
						<li id="ec-orderform-marketing_agreement_row" class="displaynone"
							style="display: none;">
							<div class="agree">
								<span class="check"><input id="etc_is_marketing"
									name="etc_is_marketing" type="checkbox" disabled=""><label
									for="etc_is_marketing"><span class="txtEm">[선택]</span>&nbsp;마케팅
										목적의 개인정보 수집 및 이용 동의</label></span>
								<button type="button" class="btnAgree"
									onclick="viewMarketingAgree();">내용보기</button>
							</div>
						</li>
						<!-- SMS로 쇼핑정보 수신 동의-->
						<li id="ec-orderform-smsAgreementRow" class=""
							style="display: none;">
							<div class="agree">
								<span class="check"><input id="etc_subparam_is_sms"
									name="etc_subparam_is_sms" type="checkbox"><label
									for="etc_subparam_is_sms"><span class="txtEm">[선택]</span>
										SMS로 쇼핑정보 수신 동의</label></span>
							</div>
						</li>
						<!-- 이메일로 쇼핑정보 수신 동의 -->
						<li id="ec-orderform-email_agreement_row" class=""
							style="display: none;">
							<div class="agree">
								<span class="check"><input id="etc_subparam_is_news_mail"
									name="etc_subparam_is_news_mail" type="checkbox"><label
									for="etc_subparam_is_news_mail"><span class="txtEm">[선택]</span>
										이메일로 쇼핑정보 수신 동의</label></span>
							</div>
						</li>
						<!-- 전자보증보험 -->
						<li id="insurance_agreement_chk" class="insurance displaynone"
							style="display: none;">
							<div class="agree">
								<span class="check"><input id="insurance_agreement_chk0"
									name="eguarantee_flag" fw-filter="" fw-label="" fw-msg=""
									value="T" type="checkbox" disabled=""><label
									for="insurance_agreement_chk0"></label><label
									for="insurance_agreement_chk0">[선택] 전자보증보험 발급시 개인정보 이용
										동의</label></span>
								<button type="button" class="btnAgree" onclick="viewInsurance();">자세히보기</button>
							</div>
							<div class="insuranceDetail">
								<div class="ec-base-table typeWrite gCellNarrow">
									<table border="1">
										<caption>전자보증보험 발급 개인정보 입력</caption>
										<colgroup>
											<col style="width: 96px">
											<col style="width: auto">
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">생년월일</th>
												<td><input id="eguarantee_year" name="eguarantee_year"
													fw-filter="" fw-label="전자보증보험 생년월일1" fw-msg=""
													class="inputTypeText" placeholder="" size="4" maxlength="4"
													value="" type="text" disabled="">년 <input
													id="eguarantee_month" name="eguarantee_month" fw-filter=""
													fw-label="전자보증보험 생년월일2" fw-msg="" class="inputTypeText"
													placeholder="" size="2" maxlength="2" value="" type="text"
													disabled="">월 <input id="eguarantee_day"
													name="eguarantee_day" fw-filter="" fw-label="전자보증보험 생년월일3"
													fw-msg="" class="inputTypeText" placeholder="" size="2"
													maxlength="2" value="" type="text" disabled="">일</td>
											</tr>
											<tr>
												<th scope="row">성별</th>
												<td><input id="eguarantee_user_gender0"
													name="eguarantee_user_gender" fw-filter=""
													fw-label="전자보증보험 성별" fw-msg="" value="1" type="radio"
													autocomplete="off" disabled=""><label
													for="eguarantee_user_gender0">남자</label> <input
													id="eguarantee_user_gender1" name="eguarantee_user_gender"
													fw-filter="" fw-label="전자보증보험 성별" fw-msg="" value="2"
													type="radio" autocomplete="off" disabled=""><label
													for="eguarantee_user_gender1">여자</label></td>
											</tr>
											<tr class="displaynone">
												<th scope="row">개인정보 이용동의</th>
												<td><input id="eguarantee_personal_agreement0"
													name="eguarantee_personal_agreement" fw-filter=""
													fw-label="전자보증보험 개인정보 이용동의" fw-msg="" value="T" type="radio"
													autocomplete="off" disabled=""><label
													for="eguarantee_personal_agreement0">동의함</label> <input
													id="eguarantee_personal_agreement1"
													name="eguarantee_personal_agreement" fw-filter=""
													fw-label="전자보증보험 개인정보 이용동의" fw-msg="" value="F" type="radio"
													checked="checked" autocomplete="off" disabled=""><label
													for="eguarantee_personal_agreement1">동의안함</label></td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="ec-base-help ec-order-expandwrap">
									<strong class="insuranceTitle ec-order-expand">전자보증보험(100%
										매매보호 안전결제)이란?</strong>
									<div class="insuranceText">
										물품대금결제시 구매자의 피해보호를 위해 '(주)서울보증보험'의 보증보험증권이 발급됩니다.<br> 증권이
										발급되는 것의 의미는, 물품대금 결제시에 소비자에게 서울보증보험의 쇼핑몰보증보험 계약체결서를 인터넷상으로 자동
										발급하여, 피해발생시 쇼핑몰보증보험으로써 완벽하게 보호받을 수 있습니다. 또한, 입력하신 개인정보는 증권발급을
										위해 필요한 정보이며 다른 용도로 사용되지 않습니다. 전자보증보험 발생시 별도의 수수료가 부과되지 않습니다.
									</div>
								</div>
							</div>
						</li>
						<!-- 예약서비스 상품 관련 동의 -->
						<li id="ec-orderform-ReservationAgreementRow" class="displaynone">
							<div class="agree">
								<span class="check"><label
									for="reservation_agreement_check_box0"><span
										class="txtEm">[필수]</span> 서비스 이용 동의</label></span>
								<button type="button" class="btnAgree" onclick="">내용보기</button>
							</div>
						</li>
					</ul>
					<!-- app tag -->
					<ul id="ec-orderform-agreement-tail"></ul>
				</div>
				<div class="checkNone ">
					<ul>
						<!-- 구매조건 확인 및 결제진행 동의 -->
						<li id="chk_purchase_agreement1" style="">
							<div class="agree">
								<span class="check"><label for="chk_purchase_agreement0">구매조건
										확인 및 결제진행 동의</label></span>
							</div>
						</li>
						<!-- 배송정보 제공방침 -->
						<li class="displaynone">
							<div class="agree">
								<span class="check"><label
									for="delivery_info_offer_check_box0">배송정보 제공방침 동의</label></span>
								<button type="button" class="btnView" onclick="viewDelivery();">자세히</button>
							</div>
						</li>
						<!-- 청약철회방침 -->
						<li class="displaynone">
							<div class="agree">
								<span class="check"><label
									for="subscription_agreement_chk0">청약철회방침 동의</label></span>
								<button type="button" class="btnView"
									onclick="viewSubscription();">자세히</button>
							</div>
						</li>
					</ul>
					<div class="agree-msg" id="agreeMsg" style="">
						<p>주문 내용을 확인하였으며 약관에 동의합니다.</p>
					</div>
				</div>
			</div>
		</div>
		<div class="ec-base-button gFull" id="orderFixItem">
			<button type="button" class="btnSubmit" id="btn_payment">
				<span id="total_order_sale_price_view" class="myTotalPay"></span> <span class="">결제하기</span><span
					class="displaynone">정기배송 신청하기</span>
			</button>
		</div>
		<div class="helpArea">
			<ul class="ec-base-help typeDash">
				<li class="displaynone"><span class="txtEm">상기 금액은 결제 시점의
						금액과 다를 수 있습니다.</span></li>
				<li>무이자할부가 적용되지 않은 상품과 무이자할부가 가능한 상품을 동시에 구매할 경우 전체 주문 상품 금액에 대해
					무이자할부가 적용되지 않습니다. 무이자할부를 원하시는 경우 장바구니에서 무이자할부 상품만 선택하여 주문하여 주시기
					바랍니다.</li>
				<li>최소 결제 가능 금액은 결제금액에서 배송비를 제외한 금액입니다.</li>
			</ul>
		</div>
		<!-- [주문 정보 확인 레이어팝업] -->
		<!--
	        이 파일은 원터치 주문서의 읽기 전용 파일입니다.
	        이 파일은 기능 업그레이드 시, 자동으로 개선된 소스가 적용되어 별도로 디자인 수정을 하지 않아도 됩니다 .
	        원터치 주문서 조각 html 파일을 수정할 경우, 작성한 정보가 유실되거나 주문서 최신 기능이 자동 업그레이드되지 않을 수 있으니 유의해 주세요.
	-->
		<div id="ec-shop_orderConfirmLayer" class="orderConfirmLayer">
			<div class="ec-base-layer typeWide">
				<h1>주문 정보 확인</h1>
				<div class="wrap">
					<p class="ec-base-help">작성하신 내용을 확인하신 후에 주문 완료해 주세요.</p>
	
					<!-- app tag -->
					<div id="ec-orderform-confirm-head"></div>
	
					<!-- [주문배송정보] 주문자정보, 배송지정보 -->
					<!-- 주문자정보 -->
					<div class="pannelArea displaynone">
						<div class="title">
							<h2>주문 정보</h2>
						</div>
						<div class="contents">
							<div class="segment">
								<div class="ec-base-table typeView">
									<table border="1">
										<caption>주문자정보</caption>
										<colgroup>
											<col style="width: 88px">
											<col style="width: auto">
										</colgroup>
										<!-- 국내/해외 주문자 정보 -->
										<tbody class="address_form ">
											<tr>
												<th scope="row">주문자</th>
												<td><span class="ec-shop-confirm_oname"></span><span
													class="ec-shop-confirm_oemail_area">(<span
														class="ec-shop-confirm_oemail"></span>)
												</span></td>
											</tr>
											<tr class="displaynone">
												<th scope="row">주소</th>
												<td><span class="ec-shop-confirm_oaddr1"></span></td>
											</tr>
											<tr class="ec-shop-confirm-billingInfo-phoneNumber">
												<th scope="row">연락처</th>
												<td><span class="displaynone"><span
														class="ec-shop-confirm_ophone"></span></span> <span
													class="ec-shop-delimiter">/</span> <span class="displaynone"><span
														class="ec-shop-confirm_ocell"></span></span></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
	
					<!-- app 배송지정보 -->
					<div class="pannelArea" id="ec-shop-confirm-appshippingInfo">
						<div class="title">
							<h2>배송지</h2>
						</div>
						<div class="contents">
							<div class="segment">
								<div class="ec-base-table typeView">
									<table border="1">
										<colgroup>
											<col style="width: 88px">
											<col style="width: auto">
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">이메일</th>
												<td><span class="ec-shop-confirm_oemail"></span></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div id="ec-shop-confirm-appshippingInfo-shippingInfo"></div>
						</div>
					</div>
	
					<!-- 배송지정보 -->
					<div class="pannelArea" id="ec-shop-confirm-shippingInfo">
						<div class="title">
							<h2>배송지</h2>
						</div>
						<div class="contents">
							<div class="segment">
								<!-- 국내배송 정보 -->
								<div class="ec-base-table typeView ">
									<table border="1">
										<caption>배송지정보</caption>
										<colgroup>
											<col style="width: 88px">
											<col style="width: auto">
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">받는사람</th>
												<td><span class="ec-shop-confirm_rname"></span><span
													class="ec-shop-confirm_oemail_area">(<span
														class="ec-shop-confirm_oemail"></span>)
												</span></td>
											</tr>
											<tr class="ec-shop-confirm-shippingAddress">
												<th scope="row">주소</th>
												<td><span class="ec-shop-confirm_raddr1"></span></td>
											</tr>
											<tr class="ec-shop-confirm-storePickup">
												<th scope="row">수령지</th>
												<td><span class="ec-shop-confirm-storePickupAddress"></span>에서
													수령예정
													<p class="ec-base-help">
														<span class="ec-shop-confirm-storePickupDate txtNormal"></span>
													</p></td>
											</tr>
											<tr class="ec-shop-confirm-shippingInfo-phoneNumber">
												<th scope="row">연락처</th>
												<td><span class="displaynone"><span
														class="ec-shop-confirm_rphone"></span></span> <span
													class="ec-shop-delimiter">/</span> <span class=""><span
														class="ec-shop-confirm_rcell"></span></span></td>
											</tr>
											<tr class="ec-shop-confirm-shippingRequest">
												<th scope="row">배송요청</th>
												<td><span
													class="displaynone ec-shop-confirm_shipcompany_area"><span
														class="ec-shop-confirm_shipcompany"></span></span> <span
													class="displaynone gBlank5"><span
														class="ec-shop-confirm_hope_date"></span></span> <span
													class="displaynone gBlank5"><span
														class="ec-shop-confirm_hope_time"></span></span> <span
													class=" gBlank5"><span
														class="ec-shop-confirm_delivery_msg"></span></span></td>
											</tr>
										</tbody>
									</table>
								</div>
								<!-- 해외배송 정보 -->
								<div class="ec-base-table typeView displaynone">
									<table border="1">
										<caption>배송지정보</caption>
										<colgroup>
											<col style="width: 88px">
											<col style="width: auto">
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">받는사람</th>
												<td><span class="ec-shop-confirm_rname"></span><span
													class="ec-shop-confirm_oemail_area">(<span
														class="ec-shop-confirm_oemail"></span>)
												</span></td>
											</tr>
											<tr class="ec-shop-confirm-shippingAddressGlobal">
												<th scope="row">주소</th>
												<td><span class="ec-shop-confirm_jigsaw_full_addr"></span></td>
											</tr>
											<tr class="ec-shop-confirm-storePickup">
												<th scope="row">수령지</th>
												<td><span class="ec-shop-confirm-storePickupAddress"></span>에서
													수령예정
													<p class="ec-base-help">
														<span class="ec-shop-confirm-storePickupDate txtNormal"></span>
													</p></td>
											</tr>
											<tr class="ec-shop-confirm-shippingInfo-oversea-phoneNumber">
												<th scope="row">연락처</th>
												<td><span class="displaynone"><span
														class="ec-shop-confirm_rphone"></span></span> <span
													class="ec-shop-delimiter">/</span> <span class=""><span
														class="ec-shop-confirm_rcell"></span></span></td>
											</tr>
											<tr>
												<th scope="row">배송요청</th>
												<td><span
													class="displaynone ec-shop-confirm_shipcompany_area"><span
														class="ec-shop-confirm_shipcompany"></span></span> <span
													class="displaynone gBlank5"><span
														class="ec-shop-confirm_hope_date"></span></span> <span
													class="displaynone gBlank5"><span
														class="ec-shop-confirm_hope_time"></span></span> <span
													class=" gBlank5"><span
														class="ec-shop-confirm_delivery_msg"></span></span></td>
											</tr>
											<tr class="displaynone">
												<th scope="row">배송 방법</th>
												<td><span id="ec-shop-confirm-shipping_method_name"></span>
												</td>
											</tr>
											<tr class="">
												<th scope="row">배송비</th>
												<td>
													<div
														class="ec-shop-shipping_additional_fee_show displaynone">
														<p class="gBreak5">
															<span class="txtEm"><span
																id="f_addr_total_ship_fee_id"></span>원</span>
														</p>
														<div class="ec-base-table gCellNarrow">
															<table border="1">
																<caption>배송비 상세</caption>
																<colgroup>
																	<col style="width: 104px">
																	<col style="width: auto">
																</colgroup>
																<tbody>
																	<tr>
																		<th scope="row">해외배송비</th>
																		<td class="right"><span id="f_addr_delv_price_id"></span>원</td>
																	</tr>
																	<tr>
																		<th scope="row">보험료</th>
																		<td class="right">+<span
																			id="f_addr_insurance_price_id"></span>원
																		</td>
																	</tr>
																	<tr class="ec-shop-shipping_additional_fee_name_show">
																		<th scope="row"><span
																			id="f_addr_shipping_additional_fee_name_id"></span></th>
																		<td class="right">+<span
																			id="f_addr_shipping_additional_fee_id"></span>원
																		</td>
																	</tr>
																</tbody>
															</table>
														</div>
														<p class="ec-base-help typeDash">보험료는 배송과정에서 발생하는 분실,
															도난, 파손 등으로 인한 손해에 대하여 규정에 따라 배상해 드리는 서비스입니다.</p>
													</div>
													<div class="ec-shop-shipping_additional_fee_hide ">
														<p class="gBreak5">
															<span class="txtEm"><span
																id="f_addr_total_ship_fee_id"></span>원</span>
														</p>
														<div class="ec-base-table gCellNarrow">
															<table border="1">
																<caption>배송비 상세</caption>
																<colgroup>
																	<col style="width: 104px">
																	<col style="width: auto">
																</colgroup>
																<tbody>
																	<tr>
																		<th scope="row">해외배송비</th>
																		<td class="right"><span id="f_addr_delv_price_id"></span>원</td>
																	</tr>
																	<tr>
																		<th scope="row">보험료</th>
																		<td class="right">+<span
																			id="f_addr_insurance_price_id"></span>원
																		</td>
																	</tr>
																</tbody>
															</table>
														</div>
														<ul class="ec-base-help typeDash">
															<li>배송비에는 관세 및 세금 등의 각종 비용은 포함되어 있지 않습니다. 상품수령 시 고객님이
																추가로 지불하셔야 합니다.</li>
															<li>보험료는 배송과정에서 발생하는 분실, 도난, 파손 등으로 인한 손해에 대하여 규정에 따라
																배상해 드리는 서비스입니다.</li>
														</ul>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
	
					<!-- [주문상품] -->
					<div class="pannelArea">
						<div class="title">
							<h2>주문상품</h2>
						</div>
						<div class="contents">
							<!-- 국내배송상품 주문내역 -->
							<div class="orderArea ">
								<!-- 기본배송 -->
								<div class="xans-element- xans-order xans-order-normallist">
									<!-- 참고: 상품반복 -->
									<div class="ec-base-prdInfo xans-record-">
										<div class="prdBox">
											<div class="thumbnail">
												<a href="/product/detail.html?product_no=14&amp;cate_no=1"><img
													src="//ecudemo276583.cafe24.com/web/product/tiny/202304/ea56f77d90d40b6ecdbff3f46aa99a76.png"
													alt="" width="90" height="90"></a>
											</div>
											<div class="description">
												<strong class="prdName" title="상품명"> <a
													href="/product/살구색-후드티/14/category/1/"
													class="ec-product-name">살구색 후드티</a></strong>
												<ul class="info">
													<li class="displaynone">무이자할부 상품</li>
													<li title="유효기간" class="displaynone">내 사용</li>
													<li title="옵션">
														<p class="option displaynone"></p>
													</li>
													<li>수량: 1개</li>
													<li id="" class="displaynone">할인금액: <span
														class="txtWarn">-<span id="">0</span>원
													</span> <span class="txtWarn displaynone">()</span>
													</li>
													<li class="displaynone" title="배송">[무료] / 기본배송 <span
														class="displaynone">(해외배송가능)</span>
													</li>
													<li class="displaynone">상품중량 : 1.00kg * 1개 = 1.00kg</li>
												</ul>
												<div class="proPrice">
													<span id="">원 </span> <span class="displaynone">()</span>
												</div>
											</div>
										</div>
									</div>
									<!-- //참고 -->
									<!-- 참고: 상품반복 -->
									<!-- //참고 -->
								</div>
								<div class="totalPrice ">
									<div class="title">
										<h3>배송비</h3>
										<span class="deliveryFee"><span
											id="ec-shop-confirm_domestic_ship_fee">0 </span>(무료)</span>
									</div>
								</div>
	
								<!-- 업체기본배송 -->
								<div class="totalPrice displaynone">
									<div class="title">
										<h3>배송비</h3>
										<span class="deliveryFee"><span id=""></span></span>
									</div>
								</div>
	
								<!-- 개별배송 -->
								<div class="totalPrice displaynone">
									<div class="title">
										<h3>배송비</h3>
										<span class="deliveryFee"><span id=""></span></span>
									</div>
								</div>
							</div>
	
							<!-- 해외배송상품 주문내역 -->
							<div class="orderArea displaynone">
								<div class="totalPrice ">
									<div class="title">
										<h3>배송비</h3>
										<span class="deliveryFee"><span
											id="ec-shop-confirm_f_list_total_delv_price_id"></span></span>
									</div>
								</div>
							</div>
							<!-- 바로구매 주문서폼 -->
							<div id="ec-shop-confirm-direct-buy-info"
								class="orderArea displaynone"></div>
							<div id="ec-shop-confirm-direct-buy-template" class="displaynone">
								<div class="ec-base-prdInfo">
									<div class="prdBox">
										<div class="thumbnail">
											<a class="ec-shop-confirm-direct-buy-product-detail-url"><img
												class="ec-shop-confirm-direct-buy-product-image"
												src="//img.echosting.cafe24.com/thumb/img_product_big.gif"
												alt="" width="90" height="90"></a>
										</div>
										<div class="description">
											<strong
												class="prdName ec-shop-confirm-direct-buy-product-name-link"
												title="상품명"></strong>
											<ul class="info">
												<li class="displaynone ec-shop-confirm-direct-buy-allotment">무이자할부
													상품</li>
												<li title="유효기간"
													class="displaynone ec-shop-confirm-direct-buy-expiration-date-display">
													<span class="ec-shop-confirm-direct-buy-expiration-date"></span>내
													사용
												</li>
												<li title="옵션">
													<p
														class="option displaynone ec-shop-confirm-direct-buy-option-str"></p>
												</li>
												<li>수량: <span
													class="ec-shop-confirm_direct-buy-quantity"></span>
												</li>
												<li>상품구매금액: <span><span
														class="ec-shop-confirm-direct-buy-product-purchase-price"></span>
												</span> <span
													class="displaynone ec-shop-confirm-direct-buy-product-purchase-price-ref"></span>
												</li>
												<li
													class="displaynone ec-shop-confirm-direct-buy-product-discount-price-display">
													할인금액: <span class="txtWarn">-<span
														class="ec-shop-confirm-direct-buy-product-discount-price"></span>
												</span> <span
													class="txtWarn displaynone ec-shop-confirm-direct-buy-product-discount-price-ref"></span>
												</li>
												<li class="displaynone">상품중량 : kg * 개 = kg</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<div class="totalWeight displaynone">
								전체 상품중량 : <span>1.00kg</span>
							</div>
						</div>
					</div>
	
					<!-- [사은품] -->
					<div class="pannelArea" id="ec-shop-confirm_gift_list_area_id">
						<div class="title">
							<h2>사은품</h2>
						</div>
						<div class="contents">
							<div class="giftArea" id="ec-shop-confirm_gift_list_id"></div>
						</div>
					</div>
	
					<!-- [결제수단] -->
					<div class="pannelArea">
						<div class="title">
							<h2>결제수단</h2>
						</div>
						<div class="contents">
							<div class="segment">
								<div class="ec-base-table typeView">
									<table border="1">
										<caption>결제수단</caption>
										<colgroup>
											<col style="width: 105px">
											<col style="width: auto">
										</colgroup>
										<tbody id="ec-shop-confirm_paymethod"></tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
	
					<!-- [결제정보] -->
					<div class="pannelArea">
						<div class="title">
							<h2>결제정보</h2>
						</div>
						<div class="contents">
							<div class="segment">
								<div class="ec-base-table gCellNarrow">
									<table border="1">
										<caption>결제정보 상세</caption>
										<colgroup>
											<col style="width: 140px">
											<col style="width: auto">
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">주문상품</th>
												<td id="ec-shop-confirm_total_product_base_price_id"
													class="right">원</td>
											</tr>
											<tr class="displaynone">
												<th scope="row">부가세</th>
												<td id="ec-shop-confirm_total_vat_price_id" class="right">+0원</td>
											</tr>
											<tr class="ec-shop-confirm-ship_price">
												<th scope="row">배송비</th>
												<td class="right">+<span
													id="ec-shop-total_ship_price_id"></span>
												</td>
											</tr>
											<tr id="ec-shop-total_local_ship_price_area"
												style="display: none;">
												<th scope="row">지역별 배송비</th>
												<td class="right">+<span
													id="ec-shop-total_local_ship_price_id"></span>
												</td>
											</tr>
											<tr class="ec-order-expandwrap "
												id="ec-shop-confirm_total_sale_area2">
												<th scope="row"><strong class="ec-order-expand">할인/부가결제</strong></th>
												<td class="right">-<span
													id="ec-shop-confirm_total_sale_price_view"></span>원
												</td>
											</tr>
											<tr class="discountArea">
												<td colspan="2">
													<div id="ec-shop-confirm_total_sale_price2_area"
														class="ec-base-box displaynone">
														<strong class="heading">기본 할인</strong>
														<div class="ec-base-table gCellNarrow">
															<table border="1">
																<caption>상세내역</caption>
																<colgroup>
																	<col style="width: 122px">
																	<col style="width: auto">
																</colgroup>
																<tbody id="confirm_total_benefit_list">
																	<tr id="ec-shop-total_mobilesale_area">
																		<th>모바일할인</th>
																		<td class="right">-<span
																			id="ec-shop-confirm_total_mobile_sale"></span>
																		</td>
																	</tr>
																	<tr id="ec-shop-total_subscriptionpayseqsale_area">
																		<th>정기배송할인</th>
																		<td class="right">-<span
																			id="ec-shop-mBenefitSubscriptionPayseqSale"></span>
																		</td>
																	</tr>
																	<tr id="ec-shop-total_periodsale_area">
																		<th>기간할인</th>
																		<td class="right">-<span
																			id="ec-shop-mBenefitPeriodSale"></span>
																		</td>
																	</tr>
																	<tr id="ec-shop-total_membersale_area">
																		<th>회원할인</th>
																		<td class="right">-<span
																			id="ec-shop-mBenefitMemberSale"></span>
																		</td>
																	</tr>
																	<tr id="ec-shop-total_rebuysale_area">
																		<th>재구매할인</th>
																		<td class="right">-<span
																			id="ec-shop-mBenefitRebuySale"></span>
																		</td>
																	</tr>
																	<tr id="ec-shop-total_bulksale_area">
																		<th>대량구매할인</th>
																		<td class="right">-<span
																			id="ec-shop-mBenefitBulkSale"></span>
																		</td>
																	</tr>
																	<tr id="ec-shop-total_livelinkonsale_area">
																		<th>바로가기(링콘)할인</th>
																		<td class="right">-<span
																			id="ec-shop-mBenefitLivelinkonSale"></span>
																		</td>
																	</tr>
																	<tr id="ec-shop-total_newproductsale_area">
																		<th>신규상품할인</th>
																		<td class="right">-<span
																			id="ec-shop-mBenefitNewproductSale"></span>
																		</td>
																	</tr>
																	<tr id="ec-shop-total_setproductsale_area">
																		<th>세트할인</th>
																		<td class="right">-<span
																			id="ec-shop-mBenefitsetproductSale"></span>
																		</td>
																	</tr>
																	<tr id="ec-shop-total_membergroupsale_area">
																		<th>회원등급할인</th>
																		<td class="right">-<span
																			id="ec-shop-mBenefitMembergroupSale"></span>
																		</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
													<div id="ec-shop-confirm_total_shipfee_area"
														class="ec-base-box">
														<strong class="heading">배송비 할인</strong>
														<div class="ec-base-table gCellNarrow">
															<table border="1">
																<caption>상세내역</caption>
																<colgroup>
																	<col style="width: 122px">
																	<col style="width: auto">
																</colgroup>
																<tbody>
																	<tr>
																		<th>배송비 할인</th>
																		<td class="right">-<span
																			id="ec-shop-confirm_total_shipfee_view"></span>
																		</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
													<div id="ec-shop-confirm_total_coupon_price2_area"
														class="ec-base-box">
														<strong class="heading">쿠폰 할인</strong>
														<div class="ec-base-table gCellNarrow">
															<table border="1">
																<caption>상세내역</caption>
																<colgroup>
																	<col style="width: 122px">
																	<col style="width: auto">
																</colgroup>
																<tbody>
																	<tr id="ec-shop-coupon_product_discount_area">
																		<th>상품별 할인쿠폰</th>
																		<td class="right">-<span
																			id="ec-shop-mProductCouponDiscount"></span>
																		</td>
																	</tr>
																	<tr id="ec-shop-coupon_order_discount_area">
																		<th>주문별 할인쿠폰</th>
																		<td class="right">-<span
																			id="ec-shop-txt_cpn_sale2"></span>
																		</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
													<div id="ec-shop-confirm_total_discountcode_price_area"
														class="ec-base-box">
														<strong class="heading">할인 코드</strong>
														<div class="ec-base-table gCellNarrow">
															<table border="1">
																<caption>상세내역</caption>
																<colgroup>
																	<col style="width: 122px">
																	<col style="width: auto">
																</colgroup>
																<tbody>
																	<tr>
																		<th>할인 코드</th>
																		<td class="right">-<span
																			id="ec-shop-confirm_total_discountcode_price_view"></span>
																		</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
													<div id="ec-shop-confirm_total_addpay_summary_area"
														class="ec-base-box ">
														<strong class="heading">부가결제</strong>
														<div class="ec-base-table gCellNarrow">
															<table border="1">
																<caption>상세내역</caption>
																<colgroup>
																	<col style="width: 122px">
																	<col style="width: auto">
																</colgroup>
																<tbody>
																	<tr id="ec-shop-confirm_used_mileage_area">
																		<th scope="row">적립금</th>
																		<td class="right">-<span
																			id="ec-shop-confirm_used_mileage"></span>
																		</td>
																	</tr>
																	<tr id="ec-shop-confirm_used_deposit_area">
																		<th scope="row">예치금</th>
																		<td class="right">-<span
																			id="ec-shop-confirm_used_deposit"></span>
																		</td>
																	</tr>
																	<tr id="ec-shop-confirm_used_affiliate_area"
																		class="confirm_affiliate_template"
																		style="display: none;">
																		<th scope="row"></th>
																		<td class="right">-<span
																			id="ec-shop-confirm_used_affiliate_view"></span>원
																		</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</td>
											</tr>
											<tr id="confirm_total_tax_area_id" class="displaynone">
												<th scope="row"><span id="confirm_total_tax_name_id"></span></th>
												<td class="right">+<span id="confirm_total_tax_id">0원</span>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="totalPay gBlank10">
									<h3 class="heading">결제금액</h3>
									<strong class="txtStrong"> <span
										id="ec-shop-confirm_payment_total_order_sale_price_view"></span>원
										<span class="refer displaynone">(<span
											id="ec-shop-confirm_payment_total_order_sale_price_ref_view"></span>)
									</span>
									</strong>
								</div>
							</div>
						</div>
					</div>
	
					<!-- [적립 혜택] -->
					<div class="pannelArea" id="ec-shop-confirm_sum_mileage_area">
						<div class="title">
							<h2>적립 혜택</h2>
						</div>
						<div class="contents">
							<div class="segment">
								<div class="ec-base-table gCellNarrow">
									<table border="1">
										<caption>적립 혜택 상세</caption>
										<colgroup>
											<col style="width: 160px">
											<col style="width: auto">
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">상품별 적립금</th>
												<td class="right"><span
													id="ec-shop-confirm_product_mileage"></span></td>
											</tr>
											<tr>
												<th scope="row">회원 적립금</th>
												<td class="right"><span
													id="ec-shop-confirm_member_mileage"></span></td>
											</tr>
											<tr>
												<th scope="row">쿠폰 적립금</th>
												<td class="right"><span
													id="ec-shop-confirm_coupon_mileage"></span></td>
											</tr>
											<tr class="displaynone">
												<th>플러스앱주문 적립금</th>
												<td class="right"><span
													id="ec-shop-confirm_plusapp_mileage"></span></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="totalPay">
								<h3 class="heading">적립 예정금액</h3>
								<strong class="txtEm"><span
									id="ec-shop-confirm_sum_mileage"></span></strong>
							</div>
						</div>
					</div>
	
					<!-- [추가정보입력] 추가입력, 기타문의사항 -->
					<div class="pannelArea displaynone">
						<div class="title">
							<h2>추가입력</h2>
						</div>
						<div class="contents">
							<div class="segment">
								<div class="ec-base-table typeView">
									<table border="1">
										<caption>추가입력</caption>
										<colgroup>
											<col style="width: 105px">
											<col style="width: auto">
										</colgroup>
										<tbody id="ec-shop-confirm_ord_add" class="displaynone"></tbody>
										<tbody id="ec-shop-confirm_question_area"
											class="questionArea displaynone">
											<tr>
												<th scope="row">기타 문의사항</th>
												<td id="ec-shop-confirm_question"></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
	
				<!-- app tag -->
				<div id="ec-orderform-confirm-tail"></div>
	
				<div class="ec-base-button gFull">
					<button type="button" class="btnSubmit"
						id="ec-shop_btn_layer_payment">
						<span id="ec-shop-confirm_total_order_price_view"></span>원
						결제하기
					</button>
				</div>
				<button type="button" class="btnClose"
					onclick="EC_SHOP_FRONT_ORDERFORM_DISPLAY.form.showConfirmOrderLayer();">닫기</button>
			</div>
		</div>
		<iframe id="h_payment" name="h_payment" width="0" height="0" src=""
			title="" style="border: none;"></iframe>
		<input type="hidden" id="sPrdName" name="sPrdName" value="살구색 후드티">
	
		&nbsp;
	</div>