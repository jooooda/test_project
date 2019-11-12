<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/_common/tags.jsp" %>
<div id="contents" class="buycar bg_gray">
    <div class="title">
        <h3>사기</h3>
    </div>
    <section>
        <!-- 상세본문 //-->
        <div class="car_detail">
            <div class="imgWrap">
                <div class="swiper-container visual js-swiper">
                    <div class="swiper-wrapper">
                        <c:if test="${not empty carDetailInfo.videoId}">
                            <div class="swiper-slide">
                                <div class="video-container" data-id="<c:out value="${carDetailInfo.videoId}" />">
                                    <div class="video-iframe"></div>
                                    <div class="video-play">
                                    </div>
                                </div>
                            </div>
                        </c:if>
                        <c:forEach var="list" items="${imgSlider}" varStatus="i">
                            <c:if test="${not empty list.carImgA}">
                                <div class="swiper-slide m-img">
                                    <img src="<c:out value="${imgServer}"/><c:out value="${list.carImgA }"/>" alt="">
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                    <div class="page-box">
                        <div class="swiper-page"></div>
                    </div>
                    <div class="swiper-prev"></div>
                    <div class="swiper-next"></div>
                </div>
            </div>
 			<!-- 상세타이틀 //-->
            <div class="car_spc_box">
                <div class="spc">
                    <ul>
                    	<c:if test="${carDetailInfo.regTypeCd eq '01'}">
                            <li>제시번호 <c:out value="${check.suggestNo }" /> <a href="#none" id="_btn_suggestno" class="js-compare1" ><i class="ic-c ic_question"></i></a></li>
                        </c:if>
                        <li><i class="ic-c ic_position"></i><span><c:out value="${carDetailInfo.sprSi}" /> <c:out value="${carDetailInfo.sprGu}" /></span></li>
                    </ul>
                    
                    <div class="shear_box">
                        <a href="#none" class="btn_round btn_share js-compare" >
                            <i></i>
                            공유
                        </a>
                    </div>
                </div>
            </div>
            <div class="infoWrap">
                <div class="cont-inner type1">
                    <div class="head_line">
                        <p class="logo">
                            <c:out value="${carDetailInfo.makerName}" />
                            <c:out value="${carDetailInfo.carname1Name}" />
                            <c:out value="${carDetailInfo.infoname}" />
                        </p>
                        <p class="car_txt">
                            <c:out value="${carDetailInfo.info1name}" />
                            <c:out value="${carDetailInfo.info4name}" />
                            <c:out value="${carDetailInfo.carname2Name}" />
                        </p>
                        <span class="price"><em><c:out value="${carDetailInfo.priceSale}" /></em>만원</span>
                        <span class="position">
                    </div>
                </div>

                <div class="cont-inner type1">
                    <div class="info-box">
                        <ul>
                            <li><span>차량번호</span><c:out value="${carDetailInfo.carNo }" /></li>
                            <li><span>연식</span><c:out value="${carDetailInfo.registerYear }" /> 년 <c:out value="${carDetailInfo.registerMonth }" />월</li>
                            <c:set var="unit" value="Km" />
                            <c:set var="titleText" value="운행시간" />
                            <c:choose>
                                <c:when test="${carDetailInfo.mileYn eq 'P'}">
                                    <c:set var="titleText" value="운행시간" />
                                    <c:set var="unit" value="시간" />
                                </c:when>
                                <c:otherwise>
                                    <c:set var="titleText" value="주행거리" />
                                    <c:set var="unit" value="Km" />
                                </c:otherwise>
                            </c:choose>
                            <li>
                                <span>
                                    <c:out value="${titleText}" />
                                </span>
                                <c:out value="${carDetailInfo.mileage }" /><c:out value="${unit}" />
                            </li>
                            <li><span>배기량</span><c:out value="${carDetailInfo.displacement}" />cc</li>
                        </ul>
                    </div>
                </div>

                <div class="cont-inner">
                    <div class="performance-box">
                        <dl>
                            <dt>성능점검정보</dt>
                            <dd>
                                <c:choose>
                                    <c:when test="${carDetailInfo.regTypeCd eq '01' and carspectCnt > 0}">
                                        <span>
                                            <img src="/resources/images/common/img_signup.png" alt="">
                                        </span>
                                        <a class="btn btn_default btn_sm " href="javascript: popupPerformance();" role="button">자세히보기</a>
                                    </c:when>
                                    <c:otherwise>
                                            <span>
                                                <img src="/resources/images/common/img_signup_no.png" alt="">
                                            </span>
                                    </c:otherwise>
                                </c:choose>
                            </dd>
                        </dl>
                        <dl>
                            <dt>사고이력조회</dt>
                            <dd>
                                <span>
                                    <em><c:out value="${carhistory.caracccnt + carhistory.othersacccnt}" /></em>회
                                </span>
                                <a class="btn btn_default btn_sm " href="javascript: popupCarhistory();" role="button">자세히보기</a>
                            </dd>
                        </dl>
                    </div>
                </div>

                <div class="cont-inner_full">
                    <div class="counselor_box">
                        <div class="counselor">
                            <div class="profile">
                                <c:choose>
                                    <c:when test="${not empty carDetailInfo.dsnPrfImg}">
                                        <img src="<c:out value="${imgServer}${carDetailInfo.dsnPrfImg}"/>" alt="">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="/resources/images/common/img_no_photo.jpg" alt="">
                                    </c:otherwise>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${carDetailInfo.regTypeCd eq '02'}">
                                        <p class="btn btn_md btn_orange_p _btn_safe_ask">안심상담신청 <i class="ic-c ic-type1"></i></p>
                                    </c:when>
                                    <c:otherwise>
                                        <p class="btn btn_md btn_orange_p _btn_buy_ask">구매문의하기 <i class="ic-c ic-type1"></i></p>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="name">
                                <strong>
                                    <c:out value="${carDetailInfo.dsnNm}" />
                                    <c:choose>
                                        <c:when test="${carDetailInfo.regTypeCd eq '01'}">
                                            <i>회원사</i>
                                        </c:when>
                                        <c:otherwise>
                                            <i>개인</i>
                                        </c:otherwise>
                                    </c:choose>
                                </strong>
                                <c:if test="${carDetailInfo.regTypeCd eq '01'}">
                                    <p><span>종사원 번호</span><c:out value="${carDetailInfo.certNo}" /></p>
                                    <p><span>소속(주)</span><c:out value="${carDetailInfo.sprNm}" /></p>
                                </c:if>
                                <p><span>전화번호</span>
                                    <c:choose>
                                        <c:when test="${!empty carDetailInfo.dsnSafeTel}">
                                            <em><ajsellcar:telShow value="${carDetailInfo.dsnSafeTel}" /></em>
                                        </c:when>
                                        <c:when test="${!empty carDetailInfo.v_Sprphone}">
                                            <em><ajsellcar:telShow value="${carDetailInfo.v_Sprphone}" /></em>
                                        </c:when>
                                        <c:otherwise>
                                            <em><ajsellcar:telShow value="${carDetailInfo.dsnMobile2}" /></em>
                                        </c:otherwise>
                                    </c:choose>
                                </p>
                            </div>
                        </div>

                        <div class="btn_set-double">
                            <div class="btn_item"><a class="btn btn_gray " href="javascript:alert('현재 서비스 준비중입니다.');" role="button">보험료계산</a></div>
                            <div class="btn_item"><a class="btn btn btn_black " href="#none" onclick="fnPriceCalculator('<c:out value="${carDetailInfo.priceSale}"/>','<c:out
                                    value="${carDetailInfo.displacement}"/>','<c:out value="${carDetailInfo.makeYear}"/>');" role="button">총비용계산기</a></div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <!-- 베너영역 //-->
    <%-- <section>
        <div class="list_banner mt10 mb10">
            <c:forEach items="${subBannerList}" var="banner" varStatus="i">
                <a href="#none"><img src="<c:out value="${imgServer}${banner.imgPath}${banner.imgNm}"/>" alt=""></a>
            </c:forEach>
        </div>
    </section> --%>

    <!-- 기본정보/보험처리이력테이블 //-->
    <section>
        <div class="cont-inner">
            <div class="car_cont-box">
                <div class="car_cont" id="">
                    <div class="det_his-wrap">
                        <div class="det_his">
                            <div class="car_cont-tit">
                                <h3 class="h3">기본정보</h3>
                            </div>
                            <table class="table_list style1">
                                <colgroup>
                                    <col style="width:40%">
                                    <col style="width:auto">
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th scope="row">차량번호</th>
                                    <td><c:out value="${carDetailInfo.carNo }" /></td>
                                </tr>
                                <tr>
                                    <th scope="row">배기량</th>
                                    <td><c:out value="${carDetailInfo.displacement}" />cc</td>
                                </tr>
                                <tr>
                                    <th scope="row">연식</th>
                                    <td><c:out value="${carDetailInfo.registerYear }" />/<c:out value="${carDetailInfo.registerMonth }" /></td>
                                </tr>
                                <tr>
                                    <th scope="row">색상</th>
                                    <td><c:out value="${carDetailInfo.colorCarCd }" /></td>
                                </tr>
                                <tr>
                                    <th scope="row"><c:out value="${titleText}" /></th>
                                    <td><c:out value="${carDetailInfo.mileage }" /><c:out value="${unit}" /></td>
                                </tr>
                                <tr>
                                    <th scope="row">제시번호</th>
                                    <td><c:out value="${check.suggestNo }" /></td>
                                </tr>
                                <tr>
                                    <th scope="row">변속기</th>
                                    <td><c:out value="${carDetailInfo.tmCarCd }" /></td>
                                </tr>
                                <tr>
                                    <th scope="row">압류/저당</th>
                                    <td>
                                        <c:choose>
                                            <c:when test="${carDetailInfo.seizureTp eq 'Y'}">
                                                있음
                                            </c:when>
                                            <c:when test="${carDetailInfo.seizureTp eq 'N'}">
                                                없음
                                            </c:when>
                                            <c:otherwise>
                                                정보 없음
                                            </c:otherwise>
                                        </c:choose>/
                                        <c:choose>
                                            <c:when test="${carDetailInfo.hostageTp eq 'Y'}">
                                                있음
                                            </c:when>
                                            <c:when test="${carDetailInfo.hostageTp eq 'N'}">
                                                없음
                                            </c:when>
                                            <c:otherwise>
                                                정보 없음
                                            </c:otherwise>
                                        </c:choose>

                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">연료</th>
                                    <td><c:out value="${carDetailInfo.fuelCarCd }" /></td>
                                </tr>
                                <tr>
                                    <th scope="row">세금미납</th>
                                    <td><c:out value="${carDetailInfo.useCdNm }" /></td>
                                </tr>
                                <tr>
                                    <th scope="row">용도</th>
                                    <td><c:out value="${carDetailInfo.useCdNm }" /></td>
                                </tr>
                                <tr>
                                    <th scope="row">가변축</th>
                                    <td><c:out value="${carDetailInfo.vrabAxleCdNm }" /></td>
                                </tr>
                                <tr>
                                    <th scope="row">적재함크기</th>
                                    <td>
                                        <c:if test="${not empty carDetailInfo.cargoBoxSize}">
                                            <c:set var="cargoBoxs" value="${fn:split(carDetailInfo.cargoBoxSize,'X')}" />
                                            <c:if test="${fn:length(cargoBoxs) eq 3}">
                                                <c:out value="${cargoBoxs[0]}" />cm X
                                                <c:out value="${cargoBoxs[1]}" />cm X
                                                <c:out value="${cargoBoxs[2]}" />cm
                                            </c:if>
                                        </c:if>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">마력</th>
                                    <td>
                                        <c:if test="${not empty carDetailInfo.horsepower}">
                                            <fmt:formatNumber value="${carDetailInfo.horsepower}" pattern="#,###" />마력
                                        </c:if>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="det_his">
                            <div class="car_cont-tit">
                                <h3 class="h3">보험처리이력</h3>
                            </div>
                            <table class="table_list style1">
                                <colgroup>
                                    <col style="width:50%">
                                    <col style="width:auto">
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th scope="row">보험처리이력등록기준일</th>
                                    <td class="fc04"><fmt:formatDate value="${carhistory.insertdate }" pattern="yyyy년 MM월 dd일" /></td>
                                </tr>
                                <tr>
                                    <th scope="row">자동차 용도 변경</th>
                                    <td>
                                        <c:choose>
                                            <c:when test="${carhistory.summaryChangeUsing  > 0 }">이력 있음</c:when>
                                            <c:otherwise>이력 없음</c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">자동차 특수사고 이력</th>
                                    <td>전손 <c:out value="${carhistory.totallosscnt }" /> / 도난 <c:out value="${carhistory.theftacccnt}" /> / 침수전손
                                        <c:out value="${carhistory.ftotallosscnt }" /> / 침수분손 <c:out value="${carhistory.fpartiallosscnt }" /></td>
                                </tr>
                                <tr>
                                    <th scope="row">보험사고이력 (내차피해)</th>
                                    <td><c:out value="${carhistory.caracccnt }" />회</td>
                                </tr>
                                <tr>
                                    <th scope="row">보험사고이력 (타차피해)</th>
                                    <td><c:out value="${carhistory.othersacccnt }" />회</td>
                                </tr>
                                </tbody>
                            </table>

                            <p class="guide">
                                본 차량의 보험처리 이력정보는 <strong><fmt:formatDate value="${carhistory.insertdate }" pattern="yyyy년 MM월 dd일" /></strong>에 조회한 내용입니다.<br>
                                이후 이력 정보의 업데이트가 있을 수 있으며, 보험 이력 조회 서비스에서 확인가능합니다.
                            </p>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 옵션정보/시세정보 //-->
    <section>
        <div class="cont-inner mt10">
            <div class="car_cont-box">
                <div class="car_cont" id="">
                    <div class="car_cont-tit">
                        <h3 class="h3">옵션정보</h3>
                        <a href="#none" class="btn btn_more" id="btn_option_more">더보기<i class="ic-c ic_moer"></i></a>
                    </div>
                    <ul class="imp_opt-wrap">
                        <c:forEach items="${optCheck}" var="list" varStatus="i">
                            <c:set var="imgsrc" value="" />
                            <c:set var="oncls" value="" />
                            <c:choose>
                                <c:when test="${empty list.UCAR_SEQ}">
                                    <c:set var="imgsrc" value="${list.METADATA2}" />
                                </c:when>
                                <c:otherwise>
                                    <c:set var="imgsrc" value="${list.METADATA1}" />
                                    <c:set var="oncls" value="on" />
                                </c:otherwise>
                            </c:choose>
                            <li class="<c:out value="${oncls}"/>">
                                <span class="img">
                                    <img src="<c:out value="${imgServer}"/><c:out value="${imgsrc}"/>" />
                                </span>
                                <i class="opt"><c:out value="${list.LONGDESC}" /></i>
                            </li>
                        </c:forEach>
                    </ul>
                </div>

                <c:if test="${carDetailInfo.regTypeCd eq '02'}">
                    <div class="car_cont" id="">
                        <div class="car_cont-tit">
                            <h3 class="h3">판매자 차량 설명</h3>
                        </div>
                        <c:choose>
                            <c:when test="${not empty carDetailInfo.memo}">
                                <%--<div class="vehicle_description"></div>--%>
                                <pre><c:out value="${carDetailInfo.memo}" /></pre>
                            </c:when>
                            <c:otherwise>
                                <div class="no_data border_line">
                                    <img src="/resources/images/common/img_no-data_03.png" alt="">
                                    내용이 없습니다.
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </c:if>
                <div class="car_cont" id="">
                    <div class="marPrice-wrap ">
                        <!---->
                        <div class="marPrice">
                            <div class="car_cont-tit">
                                <h3 class="h3">시세정보</h3>
                                <a href="#none" id="sameModelList" class="btn btn_more ">같은 모델 더보기<i class="ic-c ic_moer"></i></a>
                            </div>
                            <c:choose>
                                <c:when test="${empty carSiseaChart1}">
                                    <div class="notfound">
                                        <img src="/resources/images/buycar/img_marCompare_no.png" alt="" />
                                        <span>해당 판매차량 데이터가 충분하지 않아<br />시세정보를 표기할 수 없습니다.</span>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="marCompare">
                                        <div class="slider-container theme-aj" style="width: 100%;">
                                            <div class="back-bar">
                                                <div class="selected-bar" style="left: 10%; right:0%;"></div>
                                                <div class="pointer-label curr"><strong><c:out value="${carDetailInfo.priceSale}" /></strong> <i>만원</i></div>
                                                <div class="pointer low" style="left: 0;">
                                                    <p class="low js-txt">
                                                <span class="num">최저
                                                    <i>
                                                        <c:choose>
                                                            <c:when test="${empty carSiseaChart1.minPrice}">
                                                                0
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:out value="${carSiseaChart1.minPrice}" />
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </i>
                                                    만원
                                                </span>
                                                    </p>
                                                </div>
                                                <div class="pointer high last-active" style="right: 0;">
                                                    <p class="high js-txt">
                                                <span class="num">최고
                                                    <i>
                                                        <c:choose>
                                                            <c:when test="${carSiseaChart1.maxPrice eq null}">
                                                                9999
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:out value="${carSiseaChart1.maxPrice}" />
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </i> 만원
                                                </span>
                                                    </p>
                                                </div>
                                                <div class="pointer curr" style="left: 40%;"><i>지금 보고 계신차</i></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="guide">
                                        AJ셀카 분포는 현재 AJ셀카 내에 판매중인 차량의 가격정보를 표시한 그래프입니다. <br>
                                        해당 모델의 연식 구분 없이 표시합니다. (AJ셀카 제공)
                                    </div>
                                </c:otherwise>
                            </c:choose>
                            <!-- data 없을때 //-->
                            <%--<div class="notfound">
                                <img src="/resources/images/buycar/img_marCompare_no.png" alt="" />
                                <span>해당 판매차량 데이터가 충분하지 않아<br />시세정보를 표기할 수 없습니다.</span>
                            </div>--%>
                        </div>

                        <div class="marPrice">
                            <div class="car_cont-tit">
                                <h3 class="h3">신차가격 대비 정보</h3>
                            </div>
                            <c:choose>
                                <c:when test="${carSiseaChart2.priceNew <= 0}">
                                    <div class="notfound">
                                        <img src="/resources/images/buycar/img_newCompare_no.png" alt="" />
                                        <span>신차정보가 업데이트 되지 않아<br />신차대비 가격할인율을 표시할 수 없습니다.</span>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="newCompare">
                                        <div class="slider-container theme-aj" style="width: 100%;">
                                            <div class="back-bar">
                                                <div class="selected-bar" style="left: 10%; right:10%;"></div>
                                                <div class="pointer low" style="left: 0;">
                                                    <p class="low js-txt">
                                                        <span class="txt">지금 보고 계신차 </span>
                                                        <span class="num"><i><c:out value="${fn:replace(carDetailInfo.priceSale, ',', '')}" /></i>만원</span>
                                                    </p>
                                                </div>
                                                <div class="pointer high last-active" style="right: 0;">
                                                    <p class="high js-txt">
                                                        <span class="txt">신차 현재시세</span>
                                                        <span class="num"><i><c:out value="${carSiseaChart2.priceNew}" /></i>만원</span>
                                                    </p>
                                                </div>
                                                <div class="pointer curr" style="left: 45%;"></div>
                                            </div>
                                        </div>
                                        <div class="per">
                                            <div class="fl">
                                                <p>신차대비</p>
                                                <c:choose>
                                                    <c:when test="${carSiseaChart2.pricePer >= 100 || carSiseaChart2.pricePer eq 0}">
                                                        <p class="diff up">
                                                            <i><c:out value="${fn:replace(carDetailInfo.priceSale, ',', '') - carSiseaChart2.priceNew}" /></i>만원
                                                        </p>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <p class="diff low"><i><c:out value="${fn:replace(carDetailInfo.priceSale, ',', '') - carSiseaChart2.priceNew}" /></i>만원</p>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            <span class="fr"><c:out value="${carSiseaChart2.pricePer}" />%</span>
                                        </div>
                                    </div>
                                    <div class="guide">
                                        신차가격은 옵션이 포함되지 않은 기본 가격으로 해당 차량이 풀 옵션일 경우, 신차가격보다 높을 수 있습니다.
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!--안내문구//-->
    <section>
        <div class="cont-inner mt10">
            <div class="outer_box-w pt20 pb20">
                <ul class="mark_dot-list style3">
                    <li>
                        AJ셀카는 매매 중개 시스템을 제공하는 사업자로 차량정보, 이미지, 차량설명글 등 모든내용은 판매자가 직접 입력하였습니다. 따라서 상품거래정보 및 거래에 대한 책임을 지지 않습니다.
                    </li>
                    <li>차량 구매 시 모든 정보를 실제 차량, 차량등록증 원본, 성능점검기록부 원본으로 직접 확인하신 뒤 계약을 진행, 완료하세요.</li>
                </ul>
            </div>
        </div>
    </section>


    <!-- 판매자의다른매물/등급매물 //-->
    <section>
        <div class="cont-inner mt10">
            <c:if test="${not empty sameRegList}">
                <!-- 다른매물 //-->
                <div class="car_cont-tit">
                    <h3 class="h3">판매자 다른 매물</h3>
                    <a href="#none" id="sameDsnIdList" class="btn btn_more">더보기<i class="ic-c ic_moer"></i></a>
                </div>
                <!-- list //-->
                <div class="">
                    <div class="thum_list-box s_box">
                        <!--
    left  (ic-c): New(new), Hot(hot), 판매대기(waiting), 판매완료(complete)
    right (box): 비교, 관심
    -->
                        <ul class="thum_list">
                            <c:forEach items="${sameRegList}" var="sameList" varStatus="i">
                                <li>
                                    <a href="/gotruck/buyCar/search/view.do?encUcarSeq=<ajsellcar:enc type="AES" value="${sameList.s}" />">
                                        <span class="img"><img src="<c:out value="${imgServer}" /><c:out value="${sameList.carImgUrlo01A}" />" alt="" /></span>
                                        <div class="info_box">
                                            <dl>
                                                <dt><c:out value="${sameList.cn}" /></dt>
                                                <dd><i><c:out value="${sameList.ps}" /></i>만원</dd>
                                            </dl>
                                        </div>
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
                <!--// list-->
            </c:if>


            <c:if test="${not empty sameCarList}">
                <!-- 동급매물 //-->
                <div class="car_cont-tit">
                    <h3 class="h3">동급 매물 추천</h3>
                    <a href="#none" id="sameInfoList" class="btn btn_more">더보기<i class="ic-c ic_moer"></i></a>
                </div>
                <!-- list //-->
                <div class="">
                    <div class="thum_list-box s_box">
                        <!--
    left  (ic-c): New(new), Hot(hot), 판매대기(waiting), 판매완료(complete)
    right (box): 비교, 관심
    -->
                        <ul class="thum_list">
                            <c:forEach items="${sameCarList}" var="sameList" varStatus="i">
                                <li>
                                    <a href="/gotruck/buyCar/search/view.do?encUcarSeq=<ajsellcar:enc type="AES" value="${sameList.s}" />">
                                        <span class="img"><img src="<c:out value="${imgServer}" /><c:out value="${sameList.carImgUrlo01A}" />" alt="" /></span>
                                        <div class="info_box">
                                            <dl>
                                                <dt><c:out value="${sameList.cn}" /></dt>
                                                <dd><i><c:out value="${sameList.ps}" /></i>만원</dd>
                                            </dl>
                                        </div>
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>

            </c:if>

            <!--// list-->

        </div>
    </section>

    <section class=" pt30">
        <div class="manager_box">
            <c:set var="nameClass" value="" />
            <c:if test="${carDetailInfo.regTypeCd eq '02'}">
                <c:set var="nameClass" value="pt35" />
            </c:if>
            <div class="name_box <c:out value="${nameClass}"/>">
                <span class="name ">
                    <c:out value="${carDetailInfo.dsnNm}" />
                </span>
<!--                 <p class="type"> -->
<%--                     <c:if test="${carDetailInfo.regTypeCd eq '01'}"> --%>
<%--                         <span>종사원증 번호 : <c:out value="${carDetailInfo.certNo}" /></span> --%>
<%--                         <span>소속(주) : <c:out value="${carDetailInfo.sprNm}" /></span> --%>
<%--                     </c:if> --%>
<!--                 </p> -->
            </div>
            <p class="phone_num">
                바로 상담하세요!
                <span>
                    <c:choose>
                        <c:when test="${!empty carDetailInfo.dsnSafeTel}">
                            <a href="tel:<ajsellcar:telShow value="${carDetailInfo.dsnSafeTel}" />"><ajsellcar:telShow value="${carDetailInfo.dsnSafeTel}" /></a>
                        </c:when>
                        <c:when test="${!empty carDetailInfo.v_Sprphone}">
                            <a href="tel:<ajsellcar:telShow value="${carDetailInfo.v_Sprphone}" />"><ajsellcar:telShow value="${carDetailInfo.v_Sprphone}" /></a>
                        </c:when>
                        <c:otherwise>
                            <a href="tel:<ajsellcar:telShow value="${carDetailInfo.dsnMobile2}" />"><ajsellcar:telShow value="${carDetailInfo.dsnMobile2}" /></a>
                        </c:otherwise>
                    </c:choose>
                </span>
            </p>
        </div>
    </section>

    <!-- 전화걸기 버튼 //-->
    <div class="call_btn_box">
        <c:choose>
            <c:when test="${!empty carDetailInfo.dsnSafeTel}">
                <a href="tel:<ajsellcar:telShow value="${carDetailInfo.dsnSafeTel}" />" class="btn btn_black  ">전화하기</a>
            </c:when>
            <c:when test="${!empty carDetailInfo.v_Sprphone}">
                <a href="tel:<ajsellcar:telShow value="${carDetailInfo.v_Sprphone}" />" class="btn btn_black  ">전화하기</a>
            </c:when>
            <c:otherwise>
                <a href="tel:<ajsellcar:telShow value="${carDetailInfo.dsnMobile2}" />" class="btn btn_black  ">전화하기</a>
            </c:otherwise>
        </c:choose>

        <c:choose>
            <c:when test="${carDetailInfo.regTypeCd eq '02'}">
                <a href="#none" class="btn btn_orange _btn_safe_ask">안심상담신청</a>
            </c:when>
            <c:otherwise>
                <a href="#none" class="btn btn_orange _btn_buy_ask">구매문의하기</a>
            </c:otherwise>
        </c:choose>

    </div>

</div>

<div id="popup_share" class="trp popupfixed-wrap">
    <div class="popup-dim"></div>
    <div class="popup-align">
        <div class="popup-vertical sns_sharing">
            <div class="popup-layer option" style="width: 213px; height: 215px;">
                <a class="btn_close" href="#">X</a>
                <!-- 알림 mode0 -->
                <div class="pop_tit">
                    공유하기
                </div>
                <section class="section">
                    <articel class="articel_item mb30">
                        <div class="cont-inner">
                            <div class="sns_box small ps tar">
                                <c:import url="/common/snsShare.do"></c:import>
                            </div>
                        </div>
                    </articel>
                </section>
            </div>
        </div>
    </div>
</div>

<form id="sameMore" action="/gotruck/buyCar/search/list.do" method="post">
    <input type="hidden" id="carinfo" name="carinfo" value="<c:out value="${carDetailInfo.infocode}"/>" />
    <input type="hidden" id="carinfo1" name="carinfo1" value="<c:out value="${carDetailInfo.info1code}"/>" />
    <input type="hidden" id="dnsId" name="dsnId" value="<c:out value="${carDetailInfo.dsnId}"/>" />
    <input type="hidden" id="makerCode" name="makerCode" value="<c:out value="${carDetailInfo.makerCode}"/>" />
    <input type="hidden" id="carname1" name="carname1" value="<c:out value="${carDetailInfo.carname1Code}"/>" />
</form>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.4.2/js/swiper.min.js"></script>
<script src="https://www.youtube.com/player_api?enablejsapi=1"></script>
<script>
    // 퍼블리셔 스크립트 시작
    var initPlayer = function (element) {
        var player = element.querySelector('.video-iframe');
        var button = element.querySelector('.video-play');
        var ytplayer = new YT.Player(player, {
            playerVars: {
                'autoplay': 0,
                'modestbranding': 1,
                'controls': 0,
                'rel': 0,
            },
            videoId: element.dataset.id
        });
        button.addEventListener('click', function () {
            switch (ytplayer.getPlayerState()) {
                case 1:
                    ytplayer.stopVideo();
                    break;
                default:
                    ytplayer.playVideo();
                    break;
            }
        })
    };

    var swiper = new Swiper('.js-swiper', {
        'nextButton': ".swiper-next",
        'prevButton': ".swiper-prev",
        'pagination': ".swiper-page",
        'paginationType': "fraction",
        'onSlideChangeStart': function (swiper) {
            // stop video on change
            var isVideo = swiper.slides[swiper.previousIndex].querySelector('.video-container');
            if (isVideo) {
                YT.get(isVideo.querySelector('iframe').id).stopVideo()
            }
        }
    });

    window.onYouTubePlayerAPIReady = function () {
        var container = document.querySelectorAll('.video-container');
        for (var i = 0; i < container.length; i++) {
            initPlayer(container[i])
        }
    };


    $("#aside .top_btn").on("click", function () {
        $('html, body').animate({
            scrollTop: 0
        }, 200);
    });


    var popup_share = $(".js-compare").trpLayerFixedPopup("#popup_share");
    $(popup_share.getBtn).on("click", function ($e) {
        $e.preventDefault();
        popup_share.open(this);
    });
    $("body").on("click", "#popup_share .btn_close, #popup_share .btn_cancel", function ($e) {
        $e.preventDefault();
        popup_share.close();
    });

    // 퍼블리셔 스크립트 끝


    // 개발 스크립트

    function fnBtnBack(){
        // 뒤로가기 스크립트
        location.href = '/gotruck/buyCar/search/list.do';
    }

    function fnPriceCalculator(price, displace, makeYear) {
        layerPopup.open({
            layerPopupId: 'popup_consult_service_calculator',
            url: '/popup/gotruck/buyCar/totalCalculator.do',
            data: {'priceSale': price, 'displacement': displace, 'makeYear': makeYear}
        });
    }

    //성능점검기록부
    function popupPerformance(){
    	layerPopup.open({
    		layerPopupId: 'popup_performance',
    		data: {'encUcarSeq':'<ajsellcar:enc type="AES" value="${carDetailInfo.ucarSeq}"/>'},
    		url: '/gotruck/buyCar/popupCarspec.do'
    	});
    }

    //사고이력조회
    function popupCarhistory(){
    	layerPopup.open({
    		layerPopupId: 'popup_history',
    		data: {'encUcarSeq':'<ajsellcar:enc type="AES" value="${carDetailInfo.ucarSeq}"/>', 'carNo':'<c:out value="${carDetailInfo.carNo}"/>'},
    		url: '/gotruck/carhistoryPopup.do'
    	});
    }

    $(function () {

        $('#_btn_suggestno').click(function () {
            layerPopup.open({
                layerPopupId: 'popup_presentation_number',
                data: {},
                url: '/buyCar/popupSuggsetno.do'
            });
        });


        var nSellPrice = "<c:out value="${carDetailInfo.price}"/>";
        var nMinPrice = "<c:out value="${carSiseaChart1.minPrice}"/>";
        var nMaxPrice = "<c:out value="${carSiseaChart1.maxPrice}"/>";

        if (nMinPrice == '')
            nMinPrice = '0';
        if (nMaxPrice == '')
            nMaxPrice = '9999';

        if (nMaxPrice != "" && nMinPrice != "") {
            //판매가격이 최저가보다 낮을 경우 판매가격을 최저가
            if (nMinPrice > nSellPrice) {
                nMinPrice = nSellPrice;
            }


            //최저값 대비 시작점
            var minValue = nMinPrice.substring(0, 1);
            for (var i = 1; i < nMinPrice.length; i++) {
                minValue += "0";
            }

            //판매가격이 최고가보다 높을 경우 판매가격을 최고가
            if (nMaxPrice < nSellPrice) {
                nMaxPrice = nSellPrice;
            }

            //최대값 대비 종료점
            var maxValue = parseInt(nMaxPrice.substring(0, 1)) + 1;
            for (var i = 1; i < nMaxPrice.length; i++) {
                maxValue += "0";
            }

            //시작점에서 종료점까지 100%로 봤을때 위치 1%당 가격
            var oPerValue = (maxValue - minValue) / 100;

            //최저가 위치
            var minWidth = ((nMinPrice - minValue) / oPerValue) + 5;

            //시세 위치
            var currWidth = (nSellPrice - minValue) / oPerValue + 5;

            //최고가 위치
            var maxWidth = ((nMaxPrice - minValue) / oPerValue) - 5;

            //pointer low 시작점 ( 시작점에 위치해 있으면 보기가 좋지 않으므로 5% 를 더해준다. )
            $('#car_estimation #pointer_low').css("left", minWidth + "%");
            $('#car_estimation #pointer_low').css("z-index", "0");

            //pointer high 위치 ( 종료점에 위치해 있으면 보기가 좋지 않으므로 5% 를 빼준다. )
            $('#car_estimation #pointer_high').css("left", maxWidth + "%");
            $('#car_estimation #pointer_high').css("z-index", "0");

            //pointer curr 위치
            if (currWidth > maxWidth) {
                currWidth = maxWidth;
            }
            if (currWidth < minWidth) {
                currWidth = minWidth;
            }
            $('#car_estimation #pointer_curr').css("left", currWidth + "%");
            $('#car_estimation #pointer_curr').css("z-index", "1");

            //selected-bar 값
            $('#car_estimation #selected_bar').css("left", minWidth + "%");
            $('#car_estimation #selected_bar').css("width", maxWidth - minWidth + "%");
        }

        // 안심상담 버튼 클릭시
        $('._btn_safe_ask').click(function () {
            event.preventDefault();
            layerPopup.open({
                layerPopupId: 'popup_consult_nologin',
                url: '/popup/gotruck/buyCar/safeAsk.do',
                data: {'encUcarSeq': '<ajsellcar:enc type="AES" value="${carDetailInfo.ucarSeq}"/>'}
            });
        });
        // 구매상담 버튼 클릭시
        $('._btn_buy_ask').click(function () {
            event.preventDefault();
            layerPopup.open({
                layerPopupId: 'popup_contact_us',
                url: '/popup/gotruck/buyCar/buyAsk.do',
                data: {'encUcarSeq': '<ajsellcar:enc type="AES" value="${carDetailInfo.ucarSeq}"/>'}
            });

        });

        $('#sameInfoList').click(function () {
            event.preventDefault();
            $('#dnsId').val('');
            $('#makerCode').val('');
            $('#carname1').val('');
            $('#sameMore').submit();
        });

        $('#sameDsnIdList').click(function () {
            event.preventDefault();
            $('#carinfo').val('');
            $('#carinfo1').val('');
            $('#makerCode').val('');
            $('#carname1').val('');
            $('#sameMore').submit();
        });

        $('#sameModelList').click(function () {
            event.preventDefault();
            $('#dnsId').val('');
            $('#sameMore').submit();
        });


        putGotrucRecentCar('<c:out value="${carDetailInfo.ucarSeq}"/>');

        $('#btn_option_more').click(function () {
            event.preventDefault();

            layerPopup.open({
                layerPopupId: 'popup_option',
                url: '/popup/gotruck/buyCar/optionDetail.do',
                data: {'encUcarSeq': '<ajsellcar:enc type="AES" value="${carDetailInfo.ucarSeq}"/>'}
            });
        });

        // 유투브 재생
        onYouTubePlayerAPIReady();
    });


    var share_text = "<c:out value="${fn:trim(carDetailInfo.makerName)}"/> <c:out value="${fn:trim(carDetailInfo.carname2Name)}"/> <c:out value="${fn:trim(carDetailInfo.carname3Name)}"/> <c:out value="${fn:trim(carDetailInfo.carname4Name)}"/>";
    share_text = share_text + "\n <c:out value="${fn:trim(carDetailInfo.priceSale)}"/>만원 (월 <c:out value="${fn:trim(carDetailInfo.monthPrice)}"/>만원) | <c:out value="${fn:trim(carDetailInfo.registerYear)}"/>년  <c:out value="${fn:trim(carDetailInfo.registerMonth)}"/>월 | <c:out value="${fn:trim(carDetailInfo.mileage)}"/>km ";
    share_text = share_text + "| <c:out value="${fn:trim(carDetailInfo.tmCarCd)}"/> | <c:out value="${fn:trim(carDetailInfo.fuelCarCd)}"/> | <c:out value="${fn:trim(carDetailInfo.displacement)}cc"/> ";
    share_text = share_text + "| <c:out value="${fn:trim(carDetailInfo.colorCarCd)}"/> | <c:out value="${fn:trim(carDetailInfo.sprSi)}"/> <c:out value="${fn:trim(carDetailInfo.sprGu)}"/> ";
    share_text = share_text + "\n <s:eval expression="@globals['url.host.dev']" />/gotruck/buyCar/search/view.do?encUcarSeq=<ajsellcar:enc type="AES" value="${carDetailInfo.ucarSeq}"/>";
    var share_url = "<s:eval expression="@globals['url.host.dev']" />/gotruck/buyCar/search/view.do?encUcarSeq=<ajsellcar:enc type="AES" value="${carDetailInfo.ucarSeq}"/>";

</script>