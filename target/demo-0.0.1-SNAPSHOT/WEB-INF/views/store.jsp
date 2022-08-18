<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- ▼CSS 연결▼ -->
    <link rel="stylesheet" href="/css/store/store.css">

    <!-- ▼CSS 애니메이션 연결▼ -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>

    <!-- ▼BootStrap CSS 파일 연결▼ -->
    <link rel="stylesheet" href="/css/bootstrap.min.css">

    <!-- ▼BootStrap CSS 웹 연결▼ -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>

    <!-- ▼파비콘▼ -->
    <link rel="shortcut icon" href="/css/main/smoke.png">

    <!-- ▼사이트 이름▼ -->
    <title>Harry Potter Community 🧙‍♂️</title>

    <!-- ▼토스▼ -->
    <script src="https://js.tosspayments.com/v1"></script>
</head>

<body class="bg">

<!-- 👇 상단바 👇 -->
<header class="Top-bar">

    <!-- 👇 배너 이미지 👇 -->
    <div style="float: left;">
        <a href="main">
            <img src="/css/banner.png" class="Top-banner">
        </a>
    </div>

<!-- 👇 상단바 실시간 인기도 랭킹 👇 -->
    <div id="Real-Time-User-Rank">
        <div style="float: left;" id="Top-Emoge">👑✨
        <span id="Top-Rank-Title">실시간 인기도 랭킹</span>
        ✨👑</div><br>
        <c:set var="rank" value="0"/>
                    <c:forEach var="dr" items="${likerank}">
                        <c:if test="${rank==0}">
                        <tr class="likeRank-Mid">
                            <td>
                                🥇<input type="text" id="Top-Rank01" value="${dr.writer}" readonly><br>
                            </td>
                        </tr>
                        </c:if>
                        <c:if test="${rank==1}">
                        <tr class="likeRank-Mid">
                            <td>
                                🥈<input type="text" id="Top-Rank02" value="${dr.writer}" readonly><br>
                            </td>
                        </tr>
                        </c:if>
                        <c:if test="${rank==2}">
                        <tr class="likeRank-Mid">
                             <td>
                                 🥉<input type="text" id="Top-Rank03" value="${dr.writer}" readonly>
                             </td>
                        </tr>
                        </c:if>
                    <c:set var="rank" value="${rank+1}"/>
                </c:forEach>
    </div>

    <!-- 👇 상단바 공지사항/검색창 👇 -->
    <div style="float: left;">
        <table class="Top-Table">
            <!-- 👇 공지사항 👇 -->
            <tr class="Top-News">
                <td>
                    <div style="float: left;" id="Top-Emoge02">🔊</div>
                    <div id="News-Title" style="float: left;">HOGWARTS NEWS</div>&nbsp;&nbsp;
                    <MARQUEE id="News" scrolldelay="130" behavior="scroll">
                        ※델리 한 미너브가 중앙 마법부의 결정으로 위대한 마법사 덤블도어와 스네이프 교수의 뒤를 이어 호그와트 마법학교의 교장직을 맡게 되었습니다.※
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                ※태리 지라프가 아즈카반 교도소에서 탈옥했습니다. 중앙 마법부는 어린 마법사들과 여성 마법사들에게 각별히 주의하라는 경고의 뜻을 밝혔습니다.※
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                ※예언 마법사들의 예언자 일보에서 호그와트 마법학교의 올해의 퀴디치 대회 우승은 슬리데린, 하지만 연말 기숙사 우승컵은 센 머튼스의 활약 덕에, 후플푸프가 차지할 것이라고
                                                보도했습니다.※
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                ※론 위즐리의 패트로누스는 잭 러셀 테리어라는 개로, 수달을 쫒는 사냥개입니다. 참고로 헤르미온느의 패트로누스는 수달입니다.※
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                ※호그와트 마법학교 식당의 레시피 중 대부분은 후플푸프에서 만들었습니다.※
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                ※영화 해리포터 시리즈에서 도비역을 맡은 크로플의 작 중 첫 대사와 마지막 대사는 '해리포터' 입니다. 참고로 작 중 도비는
                                                <죽음의 성물>편에서 해리포터의 목숨을 구하려다 사망합니다. Mr.크로플은 '길다면 길고 짧다면 짧은 힘들지만 아름답고 아련한 여행이었다.'라는 소감을 밝혔습니다.※
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    ※스네이프 교수가 작 중 해리포터에게 처음 한 질문은 "포터, 만약 약쑥을 우려낸 물에 수선화의 뿌리를 빻아서 넣으면 어떻게 되지?"였는데, 수선화는
                                                    백합(Lily)의 한 종류로써 "My regrets follow you to the grave(나의 후회는 무덤까지 당신을 따라 가겠습니다.)"를 의미하고, 약쑥은
                                                    부재를 의미하는데, 이것은 보통 "쓰라린 슬픔"을 의미합니다. 곧, 스네이프 교수의 질문은 "I bitterly regret Lily's death.."(나는 릴리의
                                                    죽음에 죽을 듯이 슬퍼한다..)라고 해석될 수 있다고 합니다.※
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    ※네빌 롱바텀이 맨드레이크와 양지버섯 조합 마법 개발에 성공해 중앙 마법부 Make Magician('마법을 만드는 자')에 이름이 등록되었습니다. 한편, 네빌
                                                    롱바텀의 아내 한나 애보트가 머글 세계와 마법 세계를 연결해주는 리키 콜드런의 주인이 되었습니다. 리키 콜드런 뒷마방의 벽을 일정한 템포로 지팡이로 두드리면 벽이
                                                    활짝 열리며 작 중 등장한 마법사들의 쇼핑몰 다이애건 앨리가 나타납니다.※
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    ※의심스러운 사람을 감지해내는 마법생물 크니즐의 피가 섞인 헤르미온느의 고양이 크룩생크가 해그리드 탐정 사무소에서 범인을 찾아내는 역할로 취직했다고 합니다.※
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    ※중앙 마법부 역사부서에서 그리핀도르 기숙사의 창시자 고드릭 그리핀도르가 대왕오징어로 변신하는 능력이 있었다는 사실을 발견했다고 밝혔습니다.※
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    ※마법부 장관이 된 킹슬리 샤클볼트가 호그와트에서 벌어진 볼드모트 및 어둠의 마법사들과 벌어진 마지막 전투에 참가한 마법사들은 시험을 보지 않아도 오러가 될 수
                                                    있다고 전했습니다.※
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    ※최근 해리포터는 가끔씩 호그와트에 가서 어둠의 마법 방어술 특강을 하고있다고 합니다. 그것에 대해 해리포터는 '육아를 하는 것보다 100배는 덜 피곤한 것
                                                    같아요.'라며 웃음을 자아냈습니다.※
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    ※작 중 스네이프 교수역을 맡은 알란 릭맨은 해리포터의 저자이자 대마법사인 J.K.롤링이 직접 골랐다고 합니다. 그리고 그는 작 중 스네이프 교수역에 관해 특별
                                                    지시를 직접 받았기 때문에 모든 시리즈의 책이 출간되기도 전에 해리포터의 스토리와 결말을 알고 있던 유일한 사람이었다고 합니다.※
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </MARQUEE>
                </td>
            </tr>

            <!-- 👇 검색창 👇 -->
            <tr class="Top-News02">
                <td colspan="2" align="left" id="Search">
                    <input type="text" id="Search-Box" placeholder="글 제목/글 내용/닉네임을 검색하세요.">
                    <input type="button" value="검색" id="Search-Button" >
                </td>
            </tr>
        </table>
    </div>
    <div >
        <table class="Top-Login-User-Table">
            <tr class="Top-Login-User-tr">
                <td class="Top-Login-User-td01">현재 접속 중인 마법사</td>
            </tr>
            <tr>
                <td class="Top-Login-User-td02">
                    <input type="text" class="Top-Login-User-number" readonly value="${usercount}">명
                </td>
            </tr>
        </table>
    </div>
    </header>

<!-- ------------------------------------------------------------ -->

    <!-- 👇 사이드바 👇 -->
    <div class="Side-bar">

<!-- 👇 사이드바 로그인 후 👇 -->
    <c:if test="${user_check eq 1}">
        <div class="Side-Login-On" style="cursor:pointer" onclick="location.href='userinfo?usernum=${userNum}&nick=${userinfo.nick}'">
            <ul id="profile" style="padding-left: 0; margin-left:5px; margin-right:5px; list-style:none;">
                <li>
                    &nbsp;
                </li>
                <li>
                    환영합니다!
                </li>
                <li>
                    <b id="nick">${userinfo.nick}</b>님
                </li>
                <li>
                    &nbsp;
                </li>
                <li>
                    <span id="logincon2">[기숙사]</span> <span class="logincon" id="dom">${UserDominame}</span>
                </li>
                <li>
                    [게시글] <span class="logincon">${CountUserboard}개</span>
                </li>
                <li>
                    [댓글] <span class="logincon">${CountUsercomment}개</span>
                </li>
                <li>
                    [개인 점수] <span class="logincon">${Userscore}점</span>
                </li>
                <li>
                    [인기 점수] <span class="logincon">${userliked}점</span>
                </li>
                <li>&nbsp;</li>
                <span id="sipal">
                <li>
                    <a href="myinfo?nick=${userinfo.nick}">[내 정보 보기]</a>
                    <c:if test="${kakaocheck eq 1}">
                        <a href="javascript:kakaoLogout();" class="logout"><b>[로그아웃]</b></a>
                    </c:if>
                    <c:if test="${kakaocheck eq 0}">
                        <a href="logout" class="logout"><b>[로그아웃]</b></a>
                    </c:if>
                </li>
                <li>
                    &nbsp;
                </li>
                </span>
            </ul>
        </div>
    <div class="Writing-Div">
        <a href="write">
        <input type="button" value="🖋글쓰기🖋" id="writing-text">
        </a>
    </div>
    </c:if>

    <!-- 👇 사이드바 로그인 전 👇 -->
    <c:if test="${user_check ne 1}">
    <table class="Side-Log" align="center">
        <tr>
            <td>
            <form id="frm_login" method="POST" action="login">
            <input type="text" id="Side-Id" name="id">
            <input type="password" id="Side-Pw" name="pw">
            <input type="submit" value="로그인" id="Side-Login">
            </form>
            </td>
        </tr>
        <tr>
            <td>
                <input type="button" onclick="javascript:popup()" value="아이디/비밀번호 찾기" id="Side-IP">
                <input type="button" onclick="location.href='signin'" value="회원가입" id="Side-Signin">
                <a href="javascript:kakaoLogin();"><img src="//k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" alt="카카오계정 로그인" style="width:auto"/></a>
            </td>
        </tr>
    </table>
    </c:if>

    <!-- 👇 사이드바 메뉴 👇 -->
    <table class="Side-Menu-Table" align="center">
        <tr>
            <td>
            <!-- 👇 그레이트홀 입장 👇 -->
                <ul class="list-unstyled ps-0">
                    <li class="mb-1">
                        <button id="Side-GreatHall-Button"
                                class="btn btn-toggle align-items-center rounded collapsed"
                                data-bs-toggle="collapse"
                                data-bs-target="#Side-GreatHall-Dropdown"
                                aria-expanded="false">
                                그레이트홀 입장
                        </button>
                        <div class="collapse" id="Side-GreatHall-Dropdown">
                            <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                                <li><a href="all" id="Side-Dropdown">전체게시판</a></li>
                                <li><a href="free" id="Side-Dropdown">자유게시판</a></li>
                                <li><a href="notice" id="Side-Dropdown">공지사항</a></li>
                                <li><a href="tip" id="Side-Dropdown">공략게시판</a></li>
                            </ul>
                        </div>
                    </li>
                </ul>

            <!-- 👇 기숙사 입장 👇 -->
            <ul class="list-unstyled ps-0">
                <li class="mb-1">
                    <button id="Side-Domitory-Button"
                            class="btn btn-toggle align-items-center rounded collapsed"
                            data-bs-toggle="collapse"
                            data-bs-target="#Side-Domitory-Dropdown"
                            aria-expanded="false">
                            기숙사 입장
                    </button>
                    <div class="collapse" id="Side-Domitory-Dropdown">
                        <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                            <li><a href="gry" id="Side-Dropdown">그리핀도르</a></li>
                            <li><a href="sly" id="Side-Dropdown">슬리데린</a></li>
                            <li><a href="huf" id="Side-Dropdown">후플푸프</a></li>
                            <li><a href="rav" id="Side-Dropdown">래번클로</a></li>
                        </ul>
                    </div>
                </li>
            </ul>

            <!-- 👇 랭킹 확인 👇 -->
            <ul class="list-unstyled ps-0">
                <li class="mb-1">
                    <button id="Side-Rank-Button"
                            class="btn btn-toggle align-items-center rounded collapsed"
                            data-bs-toggle="collapse"
                            data-bs-target="#Side-Rank-Dropdown"
                            aria-expanded="false"
                            onclick="location.href='rank'">
                            전체 랭킹
                    </button>
                </li>
            </ul>

            <!-- 👇 마법 수업 👇 -->
            <ul class="list-unstyled ps-0">
                <li class="mb-1">
                    <button id="Side-Class-Button"
                            class="btn btn-toggle align-items-center rounded collapsed"
                            data-bs-toggle="collapse"
                            data-bs-target="#Side-Class-Dropdown"
                            aria-expanded="false">
                            마법 수업
                    </button>
                    <div class="collapse" id="Side-Class-Dropdown">
                        <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                            <li><a href="https://sehunpyo.github.io/Drow/" id="Side-Dropdown">퍼플쌤의 드로잉 마법</a></li>
                            <li><a href="https://signal.vercel.app/edit" id="Side-Dropdown">러브굿의 음악교실</a></li>
                        </ul>
                    </div>
                </li>
            </ul>

            <!-- 👇 포인트 획득 👇 -->
            <ul class="list-unstyled ps-0">
                <li class="mb-1">
                    <button id="Side-Game-Button"
                            class="btn btn-toggle align-items-center rounded collapsed"
                            data-bs-toggle="collapse"
                            data-bs-target="#Side-Game-Dropdown"
                            aria-expanded="false">
                            포인트 획득
                    </button>
                    <div class="collapse" id="Side-Game-Dropdown">
                        <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                            <c:if test="${user_check ne 1}">
                                <li><a href="javascript:textRpg();" id="Side-Dropdown">Text RPG</a></li>
                            </c:if>
                            <c:if test="${user_check eq 1}">
                                <li><a href="textrpg?nick=${userinfo.nick}" id="Side-Dropdown">Text RPG</a></li>
                            </c:if>
                        </ul>
                    </div>
                </li>
            </ul>

            <!-- 👇 포인트 획득 👇 -->
                            <ul class="list-unstyled ps-0">
                                <li class="mb-1">
                                    <button id="Side-Store-Button"
                                            class="btn btn-toggle align-items-center rounded collapsed"
                                            data-bs-toggle="collapse"
                                            data-bs-target="#Side-Store-Dropdown"
                                            aria-expanded="false">
                                        스토어
                                    </button>
                                    <div class="collapse" id="Side-Store-Dropdown">
                                        <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                                            <li><a href="store" id="Side-Dropdown">다이애건 앨리</a></li>
                                        </ul>
                                    </div>
                                </li>
                            </ul>

            <!-- 👇 창작마당 👇 -->
            <ul class="list-unstyled ps-0">
                <li class="mb-1">
                    <button id="Side-Contents-Button"
                            class="btn btn-toggle align-items-center rounded collapsed"
                            data-bs-toggle="collapse"
                            data-bs-target="#Side-Contents-Dropdown"
                            aria-expanded="false">
                            창작마당
                    </button>
                    <div class="collapse" id="Side-Contents-Dropdown">
                        <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                            <li><a href="art" id="Side-Dropdown">그림</a></li>
                            <li><a href="fanfic" id="Side-Dropdown">팬픽</a></li>
                            <li><a href="music" id="Side-Dropdown">음악</a></li>
                        </ul>
                    </div>
                </li>
            </ul>

            <!-- 👇 문의 / 요청 👇 -->
            <ul class="list-unstyled ps-0">
                <li class="mb-1">
                    <button id="Side-QnA-Button"
                            class="btn btn-toggle align-items-center rounded collapsed"
                            data-bs-toggle="collapse"
                            data-bs-target="#Side-QnA-Dropdown"
                            aria-expanded="false">
                            문의 / 요청
                    </button>
                    <div class="collapse" id="Side-QnA-Dropdown">
                        <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                            <li><a href="gun" id="Side-Dropdown">건의 게시판</a></li>
                            <li><a href="inquiry" id="Side-Dropdown">문의 게시판</a></li>
                            <li><a href="notify" id="Side-Dropdown">신고 게시판</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
            </td>
        </tr>
    </table>
    </div>

<!-- ------------------------------------------------------------ -->

<!-- 👇 메인화면 상단 인사말/알림창 👇 -->
<div class="Main-Top-News">
    <MARQUEE scrolldelay="200" behavior="scroll" id="Main-News" style="float: left;">
        <img src="/css/fire.gif" style="width:15px">
        호그와트에 입학하신 학생 여러분, 환영합니다. 원활하고 깨끗한 학교생활을 위해 공지사항은 반드시 읽어주시고, 호그와트 3층 복도 끝 화장실에는 유령이 자주 출몰하니 심신미약이나 노약자는 출입을 자제해
        주시기 바랍니다.
        <img src="/css/fire.gif" style="width:15px"></MARQUEE>
    <MARQUEE scrolldelay="1" behavior="scroll" id="Main-News02" style="float: left;">
        그리핀도르 남자 기숙사 화장실에 오우거 출몰, 모든 선생님은 해당 장소로 모여주시기 바랍니다.
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        기숙사 북쪽 탑 2층 계단이 망가졌습니다. 공사부가 오늘 전원 휴가인 관계로 학생 여러분은 북쪽 탑 계단 이용을 삼가시고 동쪽이나 서쪽 탑 계단을 이용해 주시기 바랍니다.
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        2학년 마법사들에게 알립니다. 당일 코일 사파이어 교수님의 마법 약초학개론 수업이 해당 교수님의 개인 사정으로 인해 시리우스 블랙 교수님의 변신마법학으로 대체되었습니다.
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        호그와트 식당 뒤쪽 벽에 의문의 포털이 생성되어 학생들이 동요하고 있습니다. 학생여러분들이 불안하지 않도록 탐사부의 빠른 조치 바랍니다.
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        최근 머글 세상에서 마법을 사용하는 학생이 많이 발생하고 있습니다. 저희 호그와트는 엄격한 규율로 운영되는 학교임을 명심해 주시기 바랍니다.
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        당일 수업을 모두 마친 뒤, 서쪽 숲 강당에서 전임교수 해리포터씨의 어둠의 마법 방어술 특강이 있습니다. 수강하실 학생들은 점심 식사전에 행정부에 말씀해 주세요.
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        교장 델리 한 미너브가 직접 알립니다. 사전에 동의 없이 어둠의 숲에 들어가지마세요. 다시 한번 알립니다. 교수들의 사전 동의와 동행 없이 어둠에 숲에 절대 들어가지마세요.
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        퀴디치 대회 예선전이 이번 주 금요일부터 시작됩니다. 각 기숙사에서는 대회 참가 명단을 행정부에 제출해 주시기 바랍니다.
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </MARQUEE>
</div>

<!-- 👇 메인화면 기차👇  -->
<div class="object">
    <img src="/css/main/express.gif" class="express">
</div>

<%--1번 템--%>
<div class="desk1">
    <div style="float: left">
    <img src="/css/store/칼빵 병아리.png" class="storeimg">
    </div>
    <div class="storetitle">
        <h4>칼침 병아리</h4>
    </div>
    <div>
        <p class="storecon">
            세상 무서운 칼침 병아리 만나면 존나 도망쳐야한다. 하지만 달리기도 매우 빠른 칼침 병아리.
        </p>
        <p class="storecom">
            [최신 리뷰] 뾰족한거 근처에 못가게 하세요ㅋㅋ;; (tlqkfrj12***)님
        </p>
    </div>
    <div>
        <p class="storeamount">
            <b>138,000원</b>
        </p>
    </div>
    <div class="storedate">
            금요일 도착 예정
    </div>
    <div style="float: left">
        <span class="storestar">⭐⭐⭐</span><span class="blackstar">⭐⭐</span>
    </div>
    <div class="payment">
        <input type="button" value="구매하기" id="paybutton" onclick="칼침병아리()">
    </div>
</div>

<%--2번 템--%>
<div class="desk">
    <div style="float: left">
        <img src="/css/store/갱스터 병아리.png" class="storeimg">
    </div>
    <div class="storetitle">
        <h4>갱스터 병아리</h4>
    </div>
    <div class="storecon">
        <p>
        뉴욕 일대를 주름잡고 감옥에 잡혀갔다가 맥고나걸 교수에 의해 아즈카반으로 이송된 전과 있는 무시무시한 병아리 형제.
        </p>
        <p class="storecom">
            [최신 리뷰] 시간 많으신 분만 분양받으세요.. 이번 주만 경찰서 세 번 다녀왔습니다... (적당히***)님
        </p>
    </div>
    <div>
        <p class="storeamount">
            <b>430,000원</b>
        </p>
    </div>
    <div class="storedate">
        다음주 월요일 도착 예정
    </div>
    <div style="float: left">
        <span class="storestar">⭐⭐⭐⭐</span><span class="blackstar">⭐</span>
    </div>
    <div class="payment">
        <input type="button" value="구매하기" id="paybutton" onclick="갱스터병아리()">
    </div>
</div>

<%--3번 템--%>
<div class="desk">
    <div style="float: left">
        <img src="/css/store/헬창 병아리.png" class="storeimg">
    </div>
    <div class="storetitle">
        <h4>헬창 병아리</h4>
    </div>
    <div class="storecon">
        <p>
            함께 미니 덤벨을 들며 숫자를 세고, 큰 목소리로 울며 응원해주는 헬창 병아리와 함께라면 어느새 몸짱이 되어있다.
        </p>
        <p class="storecom">
            [최신 리뷰] 매일 운동하는 시간 정해서 알려주면 그 시간마다 횐님 운동하셔야죠 하고 옵니다. 귀여움ㅋ (이두바끈***)님
        </p>
    </div>
    <div>
        <p class="storeamount">
            <b>529,000원</b>
        </p>
    </div>
    <div class="storedate">
            내일 도착 예정
    </div>
    <div style="float: left">
        <span class="storestar">⭐⭐⭐⭐⭐</span><span class="blackstar"></span>
    </div>
    <div class="payment">
        <input type="button" value="구매하기" id="paybutton" onclick="헬창병아리()">
    </div>
</div>

<%--4번 템--%>
<div class="desk">
    <div style="float: left">
        <img src="/css/store/김두한 병아리.png" class="storeimg">
    </div>
    <div class="storetitle">
        <h4>김두한 병아리</h4>
    </div>
    <div class="storecon">
        <p>
            매일 사료 4알 이상 주지 않으면 주먹부터 지르고 보는 폭력적이지만 카리스마 넘치는 매력 병아리.
        </p>
        <p class="storecom">
            [최신 리뷰] ㄹㅇ개*클린봇에 의해 검열된 단어입니다.* 같음ㅋㅋ; 밥 시간이라고 냅다 내 얼굴 때림; (그만 때려 시***)님
        </p>
    </div>
    <div>
        <p class="storeamount">
            <b>137,000원</b>
        </p>
    </div>
    <div class="storedate">
            화요일 도착 예정
    </div>
    <div style="float: left">
        <span class="storestar">⭐⭐⭐⭐⭐</span><span class="blackstar"></span>
    </div>
    <div class="payment">
        <input type="button" value="구매하기" id="paybutton" onclick="김두한병아리()">
    </div>
</div>

<%--5번 템--%>
<div class="desk">
    <div style="float: left">
        <img src="/css/store/극대노 병아리.png" class="storeimg">
    </div>
    <div class="storetitle">
        <h4>극대노 병아리</h4>
    </div>
    <div class="storecon">
        <p>
            항상 주먹부터 지르고 두드려맞는 자신의 친구만 보면 한심해 죽겠다며 하루종일 극대노 하는 병아리.
        </p>
        <p class="storecom">
            [최신 리뷰] 배달 온 뒤로 김두한 병아리인가 따라다닌다고 집에 안들어오는데 어떻게 생겼나요?? (그리핀도르 레***)님
        </p>
    </div>
    <div>
        <p class="storeamount">
            <b>137,000원</b>
        </p>
    </div>
    <div class="storedate">
            화요일 도착 예정
    </div>
    <div style="float: left">
        <span class="storestar">⭐⭐⭐⭐</span><span class="blackstar">⭐</span>
    </div>
    <div class="payment">
        <input type="button" value="구매하기" id="paybutton" onclick="극대노병아리()">
    </div>
</div>

<%--6번 템--%>
<div class="desk">
    <div style="float: left">
        <img src="/css/store/소림사 병아리.png" class="storeimg">
    </div>
    <div class="storetitle">
        <h4>소림사 병아리</h4>
    </div>
    <div class="storecon">
        <p>
            밥 먹는 시간 외에는 언제나 괴상한 소리를 내며 무공을 수련하지만 냥펀치 한 방에 기절하는 하찮은 병아리.
        </p>
        <p class="storecom">
            [최신 리뷰] 체급이 깡패라는걸 깊이 느꼈습니다. 매일 수련하는데 왜,,, 이럴거면 수련 왜 해,,, (slsk2***)님
        </p>
    </div>
    <div>
        <p class="storeamount">
            <b>682,000원</b>
        </p>
    </div>
    <div class="storedate">
            수요일 도착 예정
    </div>
    <div style="float: left">
        <span class="storestar">⭐⭐⭐⭐⭐</span><span class="blackstar"></span>
    </div>
    <div class="payment">
        <input type="button" value="구매하기" id="paybutton" onclick="소림사병아리()">
    </div>
</div>

<%--7번 템--%>
<div class="desk">
    <div style="float: left">
        <img src="/css/store/개발 병아리.png" class="storeimg">
    </div>
    <div class="storetitle">
        <h4>개발 병아리</h4>
    </div>
    <div class="storecon">
        <p>
            부리로 키보드 자판을 쪼아서 코딩을 하기 때문에 홈페이지 제작에 3년이 걸리지만 결국 해내는 끈기있는 병아리.
        </p>
        <p class="storecom">
            [최신 리뷰] 코딩 그만하라고 코딩 그만하라고 코딩 그만하라고 코딩 그만하라고코딩 그만하라고 코딩 그만하라고...... (kkal34***)님
        </p>
    </div>
    <div>
        <p class="storeamount">
            <b>785,000원</b>
        </p>
    </div>
    <div class="storedate">
            다음주 수요일 도착 예정
    </div>
    <div style="float: left">
        <span class="storestar">⭐⭐⭐⭐</span><span class="blackstar">⭐</span>
    </div>
    <div class="payment">
        <input type="button" value="구매하기" id="paybutton" onclick="개발병아리()">
    </div>
</div>

<%--8번 템--%>
<div class="desk">
    <div style="float: left">
        <img src="/css/store/지쥬레겐 병아리.png" class="storeimg">
    </div>
    <div class="storetitle">
        <h4>지쥬레겐 병아리</h4>
    </div>
    <div class="storecon">
        <p>
            매일 귀에 삐약크레용을 불러주며 아침에 깨워주는 쏘스윗하면서도 쏘스웩있는 티비 잘못 본 뒤로 이상해진 병아리.
        </p>
        <p class="storecom">
            [최신 리뷰] ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ 그래 귀여우니 됐다ㅋㅋㅋㅋㅋㅋ (봄여름가을겨***)님
        </p>
    </div>
    <div>
        <p class="storeamount">
            <b>429,000원</b>
        </p>
    </div>
    <div class="storedate">
            다음주 월요일 도착 예정
    </div>
    <div style="float: left">
        <span class="storestar">⭐⭐⭐⭐⭐</span><span class="blackstar"></span>
    </div>
    <div class="payment">
        <input type="button" value="구매하기" id="paybutton" onclick="지쥬레겐병아리()">
    </div>
</div>

<%--9번 템--%>
<div class="desk">
    <div style="float: left">
        <img src="/css/store/냥루토.png" class="storeimg">
    </div>
    <div class="storetitle">
        <h4>냥루토</h4>
    </div>
    <div class="storecon">
        <p>
            시끄러운 성격에 다른 고양이들에게 왕따를 당하지만 가장 잠재성이 돋보이는 고양이.
        </p>
        <p class="storecom">
            [최신 리뷰] 제발 조용히 좀 해라 퇴근하고 쉬고싶은데 *클린봇에 의해 검열된 단어입니다.* 시끄러움 진짜 (미들***)님
        </p>
    </div>
    <div>
        <p class="storeamount">
            <b>1,900,000원</b>
        </p>
    </div>
    <div class="storedate">
        목요일 도착 예정
    </div>
    <div style="float: left">
        <span class="storestar">⭐⭐⭐</span><span class="blackstar">⭐⭐</span>
    </div>
    <div class="payment">
        <input type="button" value="구매하기" id="paybutton" onclick="냥루토()">
    </div>
</div>

<%--10번 템--%>
<div class="desk">
    <div style="float: left">
        <img src="/css/store/냥스케.png" class="storeimg">
    </div>
    <div class="storetitle">
        <h4>냥스케</h4>
    </div>
    <div class="storecon">
        <p>
            까칠한 성격이지만 뛰어난 미모로 주변 고양이들에게 인기 많은 고양이. 전기를 사용할 수 있어 전기세를 줄일 수 있다.
        </p>
        <p class="storecom">
            [최신 리뷰] 분양 받고 전기세가 5만원 가량 줄었습니다. 대만족합니다. 번개 마법평가 캐리 부탁해~! (전기구이 통닭 존***)님
        </p>
    </div>
    <div>
        <p class="storeamount">
            <b>900,000원</b>
        </p>
    </div>
    <div class="storedate">
        수요일 도착 예정
    </div>
    <div style="float: left">
        <span class="storestar">⭐⭐⭐⭐⭐</span><span class="blackstar"></span>
    </div>
    <div class="payment">
        <input type="button" value="구매하기" id="paybutton" onclick="냥스케()">
    </div>
</div>

<%--11번 템--%>
<div class="desk">
    <div style="float: left">
        <img src="/css/store/냥타치.png" class="storeimg">
    </div>
    <div class="storetitle">
        <h4>냥타치</h4>
    </div>
    <div class="storecon">
        <p>
            탈주닌자 이타치를 닮아 툭하면 집에서 탈출하는 고양이. 집사는 하루하루 불안 속에 살아야 한다.
        </p>
        <p class="storecom">
            [최신 리뷰] 이 정도면 우리동네 모든 마법사들 반려묘임... 왜 나랑 밥 안먹어줘 어디서 먹고오는거야... (나 서운***)님
        </p>
    </div>
    <div>
        <p class="storeamount">
            <b>1,390,000원</b>
        </p>
    </div>
    <div class="storedate">
        화요일 도착 예정
    </div>
    <div style="float: left">
        <span class="storestar">⭐⭐</span><span class="blackstar">⭐⭐⭐</span>
    </div>
    <div class="payment">
        <input type="button" value="구매하기" id="paybutton" onclick="냥타치()">
    </div>
</div>

<%--12번 템--%>
<div class="desk">
    <div style="float: left">
        <img src="/css/store/냥피스.png" class="storeimg">
    </div>
    <div class="storetitle">
        <h4>냥피스</h4>
    </div>
    <div class="storecon">
        <p>
            빈 집에 들어가 상습적으로 음식을 훔쳐먹고 걸리면 보물 원피스를 찾는 중이었다고 둘러대는 전과 14범 고양이.
        </p>
        <p class="storecom">
            [최신 리뷰] 갱스터 병아리 쌉 상위호환임 덕분에 교도소에서 마법부 유명인사랑 연줄만들고옴 ㄹㅇㅋㅋ (입만 열면 구***)님
        </p>
    </div>
    <div>
        <p class="storeamount">
            <b>1,390,000원</b>
        </p>
    </div>
    <div class="storedate">
        다음 주 금요일 도착 예정
    </div>
    <div style="float: left">
        <span class="storestar">⭐⭐⭐</span><span class="blackstar">⭐⭐</span>
    </div>
    <div class="payment">
        <input type="button" value="구매하기" id="paybutton" onclick="냥피스()">
    </div>
</div>

<%--13번 템--%>
<div class="desk">
    <div style="float: left">
        <img src="/css/store/숭마담.png" class="storeimg">
    </div>
    <div class="storetitle">
        <h4>숭마담</h4>
    </div>
    <div class="storecon">
        <p>
            어느 날부터 못보던 원숭이가 우리집에 눌러산다면 숭마담의 새로운 애인이 아닌가 의심해보라 -아리숭토 텔레스-.
        </p>
        <p class="storecom">
            [최신 리뷰] 저희집에서 혹성탈출 4DX로 상영합니다. 쪽지 주세요. (제발 그***)님
        </p>
    </div>
    <div>
        <p class="storeamount">
            <b>1,190,000원</b>
        </p>
    </div>
    <div class="storedate">
        수요일 도착 예정
    </div>
    <div style="float: left">
        <span class="storestar">⭐⭐⭐</span><span class="blackstar">⭐⭐</span>
    </div>
    <div class="payment">
        <input type="button" value="구매하기" id="paybutton" onclick="숭마담()">
    </div>
</div>

<%--14번 템--%>
<div class="desk2">
    <div style="float: left">
        <img src="/css/store/갱숭터.png" class="storeimg">
    </div>
    <div class="storetitle">
        <h4>갱숭터</h4>
    </div>
    <div class="storecon">
        <p>
            자유분방한 영혼의 원숭이. 데려가라.
        </p>
        <p class="storecom">
            [최신 리뷰] *클린봇이 검열한 단어입니다.* 판매자는 제 정신 맞음? *클린봇이 검열한 단어입니다.*아 다시 데려가 (sld1os***)님
        </p>
    </div>
    <div>
        <p class="storeamount">
            <b>1,460,000원</b>
        </p>
    </div>
    <div class="storedate">
        다음 주 토요일 도착 예정
    </div>
    <div style="float: left">
        <span class="storestar">⭐</span><span class="blackstar">⭐⭐⭐⭐</span>
    </div>
    <div class="payment">
        <input type="button" value="구매하기" onclick="갱숭터()">
    </div>
</div>
<br>
</body>
<script src="/js/store.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="/js/search.js"></script>
<script>
    var clientKey = 'test_ck_D5GePWvyJnrK0W0k6q8gLzN97Eoq'
    var tossPayments = TossPayments(clientKey) // 클라이언트 키로 초기화하기
</script>
</html>