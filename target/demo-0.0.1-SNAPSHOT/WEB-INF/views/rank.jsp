<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- ▼CSS 연결▼ -->
    <link rel="stylesheet" href="/css/rank/main.css">

    <!-- ▼CSS 애니메이션 연결▼ -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>

    <!-- ▼BootStrap CSS 파일 연결▼ -->
    <link rel="stylesheet" href="/css/bootstrap.min.css">

    <!-- ▼BootStrap CSS 웹 연결▼ -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <!-- ▼파비콘▼ -->
    <link rel="shortcut icon" href="/css/rank/smoke.png">

    <!-- ▼사이트 이름▼ -->
    <title>Harry Potter Community 🧙‍♂️</title>
</head>

<style>
      .chating{
         background-color: #000;
         width: 80%;
         height: 330px;
         overflow-y: hidden;
         float: left;
      }
      .chating .me{
         color: #F6F6F6;
         text-align: right;
         font-size: 12px;
      }
      .chating .others{
         color: #FFE400;
         text-align: left;
         font-size: 12px;
      }
      input{
         width: 250px;
         height: 20px;
      }
      #yourName{
          width: 100%;
      }
      #yourMsg{
          width: 100%;
         display: none;
      }
      p{
          padding: 1px;
      }
      #userList{
          color: white;
          text-align:center;
          background-color: grey;
          width: 20%;
          height: 330px;
          overflow: auto;
          float: left;
      }
      .entrance{
          text-align: center;
          color: orange;
      }
</style>

<body class="bg">
<div class="all">
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
        호그와트에 입학하신 학생 여러분, 환영합니다. 원활하고 깨끗한 학교생활을 위해 공지사항은 반드시 읽어주시고, 호그와트 3층 복도 끝 화장실에는 유령이 자주 출몰하니 심신미약이나 노약자는 출입을 자제해 주시기 바랍니다.
    <img src="/css/fire.gif" style="width:15px"></MARQUEE>
    <MARQUEE scrolldelay="1" behavior="scroll" id="Main-News02" style="float: left;">
        그리핀도르 남자 기숙사 화장실에 오우거 출몰, 모든 선생님은 해당 장소로 모여주시기 바랍니다.</MARQUEE>
    </div>

    <!-- 👇 메인화면 기차👇  -->
    <div class="object">
        <img src="/css/main/express.gif" class="express">
    </div>

    <!-- 👇 메인화면 기숙사 랭킹 👇 -->
    <div class="Main-DomitoryRank-Div1" style="float: left; width:320px;">
        <table class="Main-DomitoryRank-Table">
            <tr>
                <td colspan="2" class="Main-DomitoryRank-Title">
                    🛕호그와트 기숙사 랭킹🛕
                </td>
            </tr>
            <tr class="Main-DomitoryRank-Top">
                <td class="Main-Domitory-Name"><b>기숙사</b></td>
                <td class="Main-Domitory-Score"><b>점수</b></td>
            </tr>
            <c:set var="rank" value="0"/>
            <c:forEach var="dr" items="${domrank}">
                <c:if test="${rank==0}">
                <tr class="Main-DomitoryRank-Mid">
                    <td>
                        <input type="text" id="Main-Domitory-Name_01" value="1st ${dr.dominame}">
                    </td>
                    <td>
                        <input type="text" id="Main-Domitory-Score_01" value="${dr.domiscore}">
                    </td>
                </tr>
                </c:if>
                <c:if test="${rank==1}">
                <tr class="Main-DomitoryRank-Mid">
                    <td>
                        <input type="text" id="Main-Domitory-Name_02" value="2nd ${dr.dominame}">
                    </td>
                    <td>
                        <input type="text" id="Main-Domitory-Score_02" value="${dr.domiscore}">
                    </td>
                </tr>
                </c:if>
                <c:if test="${rank==2}">
                <tr class="Main-DomitoryRank-Mid">
                     <td>
                         <input type="text" id="Main-Domitory-Name_03" value="3rd ${dr.dominame}">
                     </td>
                     <td>
                         <input type="text" id="Main-Domitory-Score_03" value="${dr.domiscore}">
                     </td>
                </tr>
                </c:if>
                <c:if test="${rank==3}">
                <tr class="Main-DomitoryRank-Mid">
                    <td>
                        <input type="text" id="Main-Domitory-Name_04" value="4th ${dr.dominame}">
                    </td>
                    <td>
                        <input type="text" id="Main-Domitory-Score_04" value="${dr.domiscore}">
                    </td>
                </tr>
                </c:if>
                <c:set var="rank" value="${rank+1}"/>
            </c:forEach>
            <tr>
                <td class="Main-DomitoryRank-Bottom" colspan="2"></td>
            </tr>
        </table>
    </div>

<!-- 👇 메인화면 인기도 랭킹 👇 -->
    <div class="Main-DomitoryRank-Div1" style="float: left; width:320px;">
        <table class="likeRank-Table">
            <tr>
                <td colspan="2" class="likeRank-Title">
                    💗호그와트 인기도 랭킹💗
                </td>
            </tr>
            <tr class="likeRank-Top">
                <td class="likeRank-Name"><b>학생이름</b></td>
                <td class="likeRank-Score"><b>인기도</b></td>
            </tr>
            <c:set var="rank" value="0"/>
            <c:forEach var="dr" items="${likerank}">
                <c:if test="${rank==0}">
                <tr class="likeRank-Mid">
                    <td>
                        <input type="text" id="likeRank-Name_01" value="1st ${dr.writer}">
                    </td>
                    <td>
                        <input type="text" id="likeRank-Score_01" value="${dr.liked}">
                    </td>
                </tr>
                </c:if>
                <c:if test="${rank==1}">
                <tr class="likeRank-Mid">
                    <td>
                        <input type="text" id="likeRank-Name_02" value="2nd ${dr.writer}">
                    </td>
                    <td>
                        <input type="text" id="likeRank-Score_02" value="${dr.liked}">
                    </td>
                </tr>
                </c:if>
                <c:if test="${rank==2}">
                <tr class="likeRank-Mid">
                     <td>
                         <input type="text" id="likeRank-Name_03" value="3rd ${dr.writer}">
                     </td>
                     <td>
                         <input type="text" id="likeRank-Score_03" value="${dr.liked}">
                     </td>
                </tr>
                </c:if>
                <c:if test="${rank==3}">
                <tr class="likeRank-Mid">
                    <td>
                        <input type="text" id="likeRank-Name_04" value="4th ${dr.writer}">
                    </td>
                    <td>
                        <input type="text" id="likeRank-Score_04" value="${dr.liked}">
                    </td>
                </tr>
                </c:if>
                <c:set var="rank" value="${rank+1}"/>
            </c:forEach>
            <tr>
                <td class="likeRank-Bottom" colspan="2"></td>
            </tr>
        </table>
    </div>

<!-- 👇 메인화면 채팅창 👇 -->
    <div class="Main-Chat-Div" style="float: right;">
    <input type="hidden" id="sessionId" value="">
        <table class="Main-Chat-Table">
            <tr class="Main-Chat-Title">
                <td class="Main-Chat-Title_02" colspan="2">
                    💬CHAT💬
                </td>
            </tr>
            <tr>
                <td>
                    <div class='chating' id='chating'>
                    </div>
                    <div id="userList">
                    <p>MAGICIAN</p>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="Main-Chat-Contents_03">
                    <div id="yourName">
                        <table class="inputTable">
                            <tr>

                                <th><input type="hidden" name="userName" id="userName" value="${userinfo.nick}"></th>
                                <th><button onclick="chatName()" id="startBtn" style="padding: 3px; border-radius: 5px;">입장</button></th>
                            </tr>
                        </table>
                    </div>
                    <div id="yourMsg">
                        <table class="inputTable">
                             <tr>
                                 <th style="color: gold;">메시지</th>
                                 <th><input id="chatting" placeholder="보내실 메시지를 입력하세요." ></th>
                                 <th><button onclick="send()" id="sendBtn" style="padding: 3px; border-radius: 5px;">전송</button></th>
                             </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="Main-Chat-Bottom" colspan="2"></td>
            </tr>
        </table>
    </div>

<!-- 👇 1등기숙사 배너 👇 -->
        <div class="Main-DomitoryRank-Div2" style="float: left; width: 660px; height: 200px; margin-top:30px; margin-left:10px;">
                    <c:if test="${rankFirst==0}">
                        <img src="/css/1.png" style="width: 100%; height: 100%;">
                    </c:if>
                    <c:if test="${rankFirst==1}">
                         <img src="/css/2.png" style="width: 100%; height: 100%;">
                    </c:if>
                    <c:if test="${rankFirst==2}">
                         <img src="/css/3.png" style="width: 100%; height: 100%;">
                    </c:if>
                    <c:if test="${rankFirst==3}">
                         <img src="/css/4.png" style="width: 100%; height: 100%;">
                    </c:if>
                </div>

    <!-- 👇 메인화면 기차02👇  -->
    <div class="object02">
        <img src="/css/main/bus.gif" class="express02">
    </div>

    <!-- 👇 그리핀도르 랭킹 👇 -->
    <div class="griRank-Div" style="float: left;">
        <table class="griRank-Table">
            <tr>
                <td colspan="2" class="griRank-Title">
                    🦁그리핀도르 랭킹🦁
                </td>
            </tr>
            <tr class="griRank-Top">
                <td class="griRank-Name"><b>학생이름</b></td>
                <td class="griRank-Score"><b>점수</b></td>
            </tr>
            <c:set var="rank" value="0"/>
            <c:forEach var="dr" items="${grirank}">
                <c:if test="${rank==0}">
                <tr class="griRank-Mid">
                    <td>
                        <input type="text" id="griRank-Name_01" value="1st ${dr.nick}">
                    </td>
                    <td>
                        <input type="text" id="griRank-Score_01" value="${dr.userscore}">
                    </td>
                </tr>
                </c:if>
                <c:if test="${rank==1}">
                <tr class="griRank-Mid">
                    <td>
                        <input type="text" id="griRank-Name_02" value="2st ${dr.nick}">
                    </td>
                    <td>
                        <input type="text" id="griRank-Score_02" value="${dr.userscore}">
                    </td>
                </tr>
                </c:if>
                <c:if test="${rank==2}">
                <tr class="griRank-Mid">
                    <td>
                        <input type="text" id="griRank-Name_03" value="3st ${dr.nick}">
                    </td>
                    <td>
                        <input type="text" id="griRank-Score_03" value="${dr.userscore}">
                    </td>
                </tr>
                </c:if>
                <c:if test="${rank==3}">
                <tr class="griRank-Mid">
                    <td>
                        <input type="text" id="griRank-Name_04" value="4st ${dr.nick}">
                    </td>
                    <td>
                        <input type="text" id="griRank-Score_04" value="${dr.userscore}">
                    </td>
                </tr>
                </c:if>
                <c:if test="${rank==4}">
                <tr class="griRank-Mid">
                    <td>
                        <input type="text" id="griRank-Name_04" value="5st ${dr.nick}">
                    </td>
                    <td>
                        <input type="text" id="griRank-Score_04" value="${dr.userscore}">
                    </td>
                </tr>
                </c:if>
                <c:set var="rank" value="${rank+1}"/>
            </c:forEach>
            <tr>
                <td class="griRank-Bottom" colspan="2"></td>
            </tr>
        </table>
    </div>

    <!-- 👇 슬리데린 랭킹 👇 -->
    <div class="slyRank-Div" style="float: left;">
        <table class="slyRank-Table">
            <tr>
                <td colspan="2" class="slyRank-Title">
                    🐍슬리데린 랭킹🐍
                </td>
            </tr>
            <tr class="slyRank-Top">
                <td class="slyRank-Name"><b>학생이름</b></td>
                <td class="slyRank-Score"><b>점수</b></td>
            </tr>
            <c:set var="rank" value="0"/>
            <c:forEach var="dr" items="${slyrank}">
                <c:if test="${rank==0}">
                <tr class="slyRank-Mid">
                    <td>
                        <input type="text" id="slyRank-Name_01" value="1st ${dr.nick}">
                    </td>
                    <td>
                        <input type="text" id="slyRank-Score_01" value="${dr.userscore}">
                    </td>
                </tr>
                </c:if>
                <c:if test="${rank==1}">
                <tr class="slyRank-Mid">
                    <td>
                        <input type="text" id="slyRank-Name_02" value="2st ${dr.nick}">
                    </td>
                    <td>
                        <input type="text" id="slyRank-Score_02" value="${dr.userscore}">
                    </td>
                </tr>
                </c:if>
                <c:if test="${rank==2}">
                <tr class="slyRank-Mid">
                    <td>
                        <input type="text" id="slyRank-Name_03" value="3st ${dr.nick}">
                    </td>
                    <td>
                        <input type="text" id="slyRank-Score_03" value="${dr.userscore}">
                    </td>
                </tr>
                </c:if>
                <c:if test="${rank==3}">
                <tr class="slyRank-Mid">
                    <td>
                        <input type="text" id="slyRank-Name_04" value="4st ${dr.nick}">
                    </td>
                    <td>
                        <input type="text" id="slyRank-Score_04" value="${dr.userscore}">
                    </td>
                </tr>
                </c:if>
                <c:if test="${rank==4}">
                <tr class="slyRank-Mid">
                    <td>
                        <input type="text" id="slyRank-Name_04" value="5st ${dr.nick}">
                    </td>
                    <td>
                        <input type="text" id="slyRank-Score_04" value="${dr.userscore}">
                    </td>
                </tr>
                </c:if>
                <c:set var="rank" value="${rank+1}"/>
            </c:forEach>
            <tr>
                <td class="slyRank-Bottom" colspan="2"></td>
            </tr>
        </table>
    </div>

    <!-- 👇 레번클로 랭킹 👇 -->
    <div class="ravenRank-Div" style="float: left;">
        <table class="ravenRank-Table">
            <tr>
                <td colspan="2" class="ravenRank-Title">
                    🦅레번클로 랭킹🦅
                </td>
            </tr>
            <tr class="ravenRank-Top">
                <td class="ravenRank-Name"><b>학생이름</b></td>
                <td class="ravenRank-Score"><b>점수</b></td>
            </tr>
            <c:set var="rank" value="0"/>
            <c:forEach var="dr" items="${ravenrank}">
                <c:if test="${rank==0}">
                <tr class="ravenRank-Mid">
                    <td>
                        <input type="text" id="ravenRank-Name_01" value="1st ${dr.nick}">
                    </td>
                    <td>
                        <input type="text" id="ravenRank-Score_01" value="${dr.userscore}">
                    </td>
                </tr>
                </c:if>
                <c:if test="${rank==1}">
                <tr class="ravenRank-Mid">
                    <td>
                        <input type="text" id="ravenRank-Name_02" value="2st ${dr.nick}">
                    </td>
                    <td>
                        <input type="text" id="ravenRank-Score_02" value="${dr.userscore}">
                    </td>
                </tr>
                </c:if>
                <c:if test="${rank==2}">
                <tr class="ravenRank-Mid">
                    <td>
                        <input type="text" id="ravenRank-Name_03" value="3st ${dr.nick}">
                    </td>
                    <td>
                        <input type="text" id="ravenRank-Score_03" value="${dr.userscore}">
                    </td>
                </tr>
                </c:if>
                <c:if test="${rank==3}">
                <tr class="ravenRank-Mid">
                    <td>
                        <input type="text" id="ravenRank-Name_04" value="4st ${dr.nick}">
                    </td>
                    <td>
                        <input type="text" id="ravenRank-Score_04" value="${dr.userscore}">
                    </td>
                </tr>
                </c:if>
                <c:if test="${rank==4}">
                <tr class="ravenRank-Mid">
                    <td>
                        <input type="text" id="ravenRank-Name_04" value="5st ${dr.nick}">
                    </td>
                    <td>
                        <input type="text" id="ravenRank-Score_04" value="${dr.userscore}">
                    </td>
                </tr>
                </c:if>
                <c:set var="rank" value="${rank+1}"/>
            </c:forEach>
            <tr>
                <td class="ravenRank-Bottom" colspan="2"></td>
            </tr>
        </table>
    </div>
    
    <!-- 👇 후플푸프 랭킹 👇 -->
    <div class="hufleRank-Div" style="float: left;">
        <table class="hufleRank-Table">
            <tr>
                <td colspan="2" class="hufleRank-Title">
                    🦡후플푸프 랭킹🦡
                </td>
            </tr>
            <tr class="hufleRank-Top">
                <td class="hufleRank-Name"><b>학생이름</b></td>
                <td class="hufleRank-Score"><b>점수</b></td>
            </tr>
            <c:set var="rank" value="0"/>
            <c:forEach var="dr" items="${huflerank}">
                <c:if test="${rank==0}">
                <tr class="hufleRank-Mid">
                    <td>
                        <input type="text" id="hufleRank-Name_01" value="1st ${dr.nick}">
                    </td>
                    <td>
                        <input type="text" id="hufleRank-Score_01" value="${dr.userscore}">
                    </td>
                </tr>
                </c:if>
                <c:if test="${rank==1}">
                <tr class="hufleRank-Mid">
                    <td>
                        <input type="text" id="hufleRank-Name_02" value="2st ${dr.nick}">
                    </td>
                    <td>
                        <input type="text" id="hufleRank-Score_02" value="${dr.userscore}">
                    </td>
                </tr>
                </c:if>
                <c:if test="${rank==2}">
                <tr class="hufleRank-Mid">
                    <td>
                        <input type="text" id="hufleRank-Name_03" value="3st ${dr.nick}">
                    </td>
                    <td>
                        <input type="text" id="hufleRank-Score_03" value="${dr.userscore}">
                    </td>
                </tr>
                </c:if>
                <c:if test="${rank==3}">
                <tr class="hufleRank-Mid">
                    <td>
                        <input type="text" id="hufleRank-Name_04" value="4st ${dr.nick}">
                    </td>
                    <td>
                        <input type="text" id="hufleRank-Score_04" value="${dr.userscore}">
                    </td>
                </tr>
                </c:if>
                <c:if test="${rank==4}">
                <tr class="hufleRank-Mid">
                    <td>
                        <input type="text" id="hufleRank-Name_04" value="5st ${dr.nick}">
                    </td>
                    <td>
                        <input type="text" id="hufleRank-Score_04" value="${dr.userscore}">
                    </td>
                </tr>
                </c:if>
                <c:set var="rank" value="${rank+1}"/>
            </c:forEach>
            <tr>
                <td class="hufleRank-Bottom" colspan="2"></td>
            </tr>
        </table>
    </div>
</div>
</body>

<script src="index.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
	var ws;
    wsOpen();
	function wsOpen(){
		ws = new WebSocket("ws://" + location.host + "/chating");
		wsEvt();
	}

	function wsEvt() {
		ws.onopen = function(data){
			//소켓이 열리면 동작
		}

		ws.onmessage = function(data) {
			//메시지를 받으면 동작
			var msg = data.data;

			if(msg != null && msg.trim() != ''){
				var d = JSON.parse(msg);
				if(d.type == "getId"){
					var si = d.sessionId != null ? d.sessionId : "";
					if(si != ''){
						$("#sessionId").val(si);
					}
				}else if(d.type == "message"){
					if(d.sessionId == $("#sessionId").val()){
						$("#chating").append("<p class='me'> 나 :<br>" + d.msg + "</p>");
					}else{
						$("#chating").append("<p class='others'>" + d.userName + " :" + d.msg + "</p>");
					}

				}else if(d.type== "userlist"){
                        $("#chating").append("<p class='entrance'>" + d.userName + "님이 입장하셨습니다.</p>");
                        $("#userList").empty();
                        $("#userList").append("<p>MAGICIAN</p>");
                        var onlist = d.userlist.split(",");
                        for(var i=0; i<onlist.length; i++){
                            $("#userList").append("<p>"+onlist[i]+"</p>");
                        }
				}else if(d.type=="exit"){
				        $("#chating").append("<p class='entrance'>" + d.userName + "님이 퇴장하셨습니다.</p>");
                        $("#userList").empty();
                        $("#userList").append("<p>MAGICIAN</p>");
                        var onlist = d.userlist.split(",");
                        for(var i=0; i<onlist.length; i++){
                            $("#userList").append("<p>"+onlist[i]+"</p>");
                        }
				}
				$('#chating').scrollTop($('#chating').prop('scrollHeight'));
			}
		}

		document.addEventListener("keypress", function(e){
			var chatting = $("#chatting").val();
			if(e.keyCode == 13){ //enter press
			    if(chatting != null && chatting != '' ){
			        send();
			    }
			}
		});
	}

	function chatName(){
		var userName = $("#userName").val();
		if(userName == null || userName.trim() == ""){
			alert("로그인이 필요합니다.");
			$("#userName").focus();
		}else{
            var option ={
            	type: "userlist",
            	sessionId : $("#sessionId").val(),
            	userName : $("#userName").val(),
            	msg : $("#chatting").val()
            }
            ws.send(JSON.stringify(option))
			$("#yourName").hide();
			$("#yourMsg").show();
		}
	}

	function send() {
		var option ={
			type: "message",
			sessionId : $("#sessionId").val(),
			userName : $("#userName").val(),
			msg : $("#chatting").val()
		}
		ws.send(JSON.stringify(option))
		$('#chatting').val("");
		$('#chatting').focus();
	}
</script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="/js/search.js"></script>
</html>