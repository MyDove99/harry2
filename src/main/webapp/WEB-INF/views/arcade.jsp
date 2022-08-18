<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- ▼CSS 연결▼ -->
    <link rel="stylesheet" href="/css/오락실/arcade.css">
    <!-- ▼파비콘▼ -->
    <link rel="shortcut icon" href="/css/오락실/winner.png">
    <title>오락실 🏆</title>
</head>
<body>
<div class="btn">
    <input type="button" value="메인으로 가기" onclick="location.href='main'" id="Main-btn">
</div>
<div class="game01">
    <h2 id="title" class="random_colors">[오리 키우기]</h2>
    <p id="subtitle">온라인 <span id="text2">멀티 가능 : Invite friends로 링크 복사 후 친구에게 전송</span> <span id="text3">컴퓨터 자동 저장 가능</span></p>
    <p id="explanation">
        새끼 오리에게 가까이 다가가 집으로 데려오세요.<br>
        다른 오리들에게 다가가 인솔 중인 새끼 오리를 가로챌 수 있지만, 역으로 빼앗기지 않도록 조심하세요!<br>
        왼쪽 상단에 요구하는 새끼 오리의 숫자를 채우면 집이 업그레이드 되고,<br>
        업그레이드마다 획득하는 모자는 집 영역 안에서 마우스 좌클릭을 이용해 변경할 수 있습니다.
    </p>
    <a href="https://ducklings.io/" id="link">[게임시작]</a>
</div>
<div class="game01">
    <h2 id="title" class="random_colors">[멀티 테트리스]</h2>
    <p id="subtitle">온라인 <span id="text2">멀티 가능 : 로비 > 방 만들기 버튼 > 채팅창 링크 공유</span> <span id="text3"></span></p>
    <p id="explanation">
        모르는 사람들 또는 친구들과 테트리스를 즐겨보세요.<br>
        비공개 방을 생성해 링크를 공유하고 친구들과 테트리스를 할 수도 있습니다.<br>
        블록을 모아 한 줄을 깨뜨리면 상대방에게 공격이 되고, 반대로 공격을 받을 수 있습니다!
    </p>
    <a href="https://jstris.jezevec10.com/" id="link">[게임시작]</a>
</div>
<div class="game01">
    <h2 id="title" class="random_colors">[마크버전 온라인 배틀그라운드]</h2>
    <p id="subtitle">온라인 <span id="text2">멀티 가능 : 레벨5이상 달성 후 친구 추가</span> <span id="text3">로그인 후 저장 가능</span></p>
    <p id="explanation">
        Battle Royale버튼을 눌러 온라인 게임에 참가하세요!<br>
        잠깐의 시간이 지나고 게임이 시작되면 건물에 들어가 총과 총알, 각종 아이템을 얻어 전투에 대비하세요!<br>
        마우스 왼쪽으로 총을 발사하고, 오른쪽으로 줌을 할 수 있습니다.<br>
        shift키로 달리기를 할 수 있고, C를 눌러 앉을 수 있습니다.<br>
        끝까지 살아남으세요!
    </p>
    <a href="https://voxiom.io/" id="link">[게임시작]</a>
</div>
<div class="game01">
    <h2 id="title" class="random_colors">[종합 보드게임]</h2>
    <p id="subtitle">온라인 <span id="text2">멀티 가능 : 원하는 게임 > 방 생성 후 초대</span> <span id="text3">로그인 후 저장 가능</span></p>
    <p id="explanation">
        원하는 종류의 게임을 눌러 로비에 참여하세요.<br>
        상단에 방 만들기 버튼을 눌러 방을 생성하고,<br>
        오른쪽 하늘색 배경의 메뉴에서 설정 > '공개'를 '개인'으로 바꿔주세요.<br>
        '방에있...'를 눌러 아래에 초대 버튼에서 로비에 있는 친구를 초대하세요.<br>
        상단에 #1 혹은 #2 버튼을 눌러 자신의 진영을 선택 후 게임 시작!
    </p>
    <a href="https://www.playok.com/" id="link">[게임시작]</a>
</div>
<div class="game01">
    <h2 id="title" class="random_colors">[1대1 당구 게임]</h2>
    <p id="subtitle">온라인 <span id="text2">멀티 가능 : 로그인 안하면 불가능</span> <span id="text3"></span></p>
    <p id="explanation">
        마우스 하나로 온라인에서 포켓볼을 즐겨보세요!<br>
        하지만 최대한 신중하게 하셔야 합니다.<br>
        상대방에게 기회가 넘어가면 게임에서 패배할 수 있으니까요!
    </p>
    <a href="https://8ballpool.com/en/game" id="link">[게임시작]</a>
</div>
<div class="game01">
    <h2 id="title" class="random_colors">[야생 동물과 생존하기]</h2>
    <p id="subtitle">온라인 <span id="text2">멀티 가능</span> <span id="text3">로그인 후 저장 가능</span></p>
    <p id="explanation">
        야생 동물과함께 생존하세요!<br>
        원하는 동물에게 다가가 하트 버튼을 눌러 교감을 시도하고 교감이 되면 함께 다닐 수 있습니다.<br>
        마우스 왼쪽 버튼으로 야생의 자원을 이용해 무기를 강화하고 자원을 모으세요!<br>
        얻은 자원으로 자신의 영토를 보호하고 장비를 건설할 수 있습니다.<br>
        공격적인 플레어이어들이나 동물들에게서 스스로를 보호하세요!<br>
        물론 자신이 테이밍한 동물도 함께 싸워주니 너무 걱정마세요!
    </p>
    <a href="https://taming.io/" id="link">[게임시작]</a>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
    jQuery(function($){
        for(var i=0 ; i < $(".random_colors").length; i++){
            var f_color = "#"+(parseInt(Math.random()*0xffffff)).toString(16);
            $(".random_colors").eq(i).css("color",f_color);
        }
    });
</script>
</html>