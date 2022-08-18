<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- ▼CSS 연결▼ -->
    <link rel="stylesheet" href="/css/오락실/arcadegate.css">
    <!-- ▼파비콘▼ -->
    <link rel="shortcut icon" href="/css/오락실/ghost.png">
    <title>오락실 입구 🎮</title>
</head>
<body>
<div class="background">
    <h1 class="random_colors">오락실 입구</h1>
    <p>
        호그와트 오락실에 방문하신 학생 여러분 환영합니다.<br>
        이곳은 호그와트에서 운영하는 무료 오락체험 시설로, 별도의 비용이 필요없는 대신 호그와트 포인트 또한 쌓이지 않습니다.<br>
        대부분의 게임은 호그와트 공용언어인 영어로 설명이 되어있지만 <span id="red">게임에 참가하기 전 설명을 숙지</span>하신다면<br>
        어려움 없이 게임을 즐길 수 있습니다.<br><br>
        <span id="Go">
        오락실에 입장하시려면 아래의 버튼을 천천히 눌러주세요!
        </span>
    </p>
    <input type="button" onclick="location.href='/arcade';"  value="Go to the arcade" class="btn">
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