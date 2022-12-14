<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/domitorytest/theSortingHat.css">
    <link rel="stylesheet" href="/css/domitorytest/main.css">
    <link rel="stylesheet" href="/css/domitorytest/qna.css">
    <link rel="stylesheet" href="/css/domitorytest/animation.css">
    <link rel="stylesheet" href="/css/domitorytest/result.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="/css/fav.ico" rel="shortcut icon" type="image/x-icon">
    <title>DOMITORY TEST</title>
</head>
<body>
    <div class="container">
        <section id="main" class="mx-auto my-5 py-3 px-3">
            <h1><b>π κΈ°μμ¬ λ°°μ  π</b></h1>
            <div class="col-6 mx-auto">
                <img src="https://blog.kakaocdn.net/dn/cjvxgU/btrGtgIVwKu/7aJ8XLtd9QhvQwgRxmV600/img.gif" alt="mainImage" class="img-fluid">
            </div>
            <p>
                Welcome to Hogwarts!<br><br>
                νΈκ·ΈμνΈ μνμμ μμ±μ΄ λλ¬λ€λ©΄<br>
                νΈκ·ΈμνΈ κ³΅μ λ§λ²μ λͺ¨μκ° λΉμ μ κΈ°μμ¬λ₯Ό λ°°μ ν΄ μ€ μ°¨λ‘μλλ€.<br>
                μ, ν λ² μλ΅ν μ§λ¬Έμλ<br>
                λ€μ μλ΅ν  μ μμΌλ μ μ€νκ² μ§ννμΈμ!<br><br>
                μμΌλ‘μ λΉμ μ λͺ¨νμ νμ΄μ΄ κΉλ€κΈ°λ₯Ό...
            </p>
            <button type="button" class="btn btn-warning mt-2" onclick="js:begin()">μμνκΈ°</button>
        </section>
        <section id="qna">
            <div class="status mx-auto mt-5">
                <div class="statusBar">
                </div>
            </div>
            <div class="qBox mt-5 mb-1 py-3 mx-auto">

            </div>
            <div class="answerCss mx-auto">
                <div class="answerBox py-3 mx-auto">

                </div>
            </div>
        </section>
        <section id="result" class="mx-auto my-5 py-3 px-3">
            <h1><b>π λΉμ μ κΈ°μμ¬....λ! π</b></h1>
            <div class="resultname" class="my-3">

            </div>
            <div id="resultImg" class="col-6 my-3 mx-auto">

            </div>
            <div class="resultDesc">

            </div>
            <button type="button" onclick='admission()' class="main my-3 py-2 px-3" >λ©μΈμΌλ‘</button>
            <button type="button" class="kakao my-3 py-2 px-3">κ³΅μ νκΈ°</button>
            <input type="hidden" id="nick" value="${nick}">
        </section>
        <script type="text/javascript" src="/js/domitorytest/data.js"></script>
        <script type="text/javascript" src="/js/domitorytest/theSortingHat.js"></script>
    </div>
</body>
</html>