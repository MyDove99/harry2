<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="/css/sign/signin.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="/css/sign/fvc.ico" rel="shortcut icon" type="image/x-icon">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <title>SIGN IN</title>
</head>
<style>
    .olmessagef {color: red;}
    .olmessaget {color: blue;}
</style>
<body>
    <form id="frmSignin" action="domitorytest">
    <div class="write mx-auto">
        <h1 class="animate__animated animate__bounce animate__infinite animate__delay-0.5s	0.5s animate__slower	0.5s"><b>⚜ 호그와트 입학서 ⚜</b></h1>
        <table class="signTable mx-auto">
            <tr>
                <td>이름</td>
                <td><input type="text" class="name form-control" placeholder="NAME" name="name"></td>
            </tr>
            <tr><td>아이디</td>
                <td>
                    <input type="text" class="id form-control" placeholder="MAGICIAN ID" name="id" id="userid">
                    <span id="olmessage"></span>
                </td>
                <td><button type="button" class="checkId btn btn-dark" id="overlappedID">중복확인</button>
                </td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" class="pw1 form-control" placeholder="PASSWORD" name="pwd" id="pw1"></td>
            </tr>
            <tr>
                <td>비밀번호 확인</td>
                <td><input type="password" class="pw2 form-control" placeholder="CHECK PASSWORD" id="pw2">
                    <span id="wrong" style="color: red; display: none;">비밀번호가 다릅니다.</span>
                    <span id="equal" style="color: blue; display: none;">비밀번호가 일치합니다.</span>
                </td>
            </tr>
            <tr>
                <td>닉네임</td>
                <td>
                    <input type="text" class="nick form-control" placeholder="MAGICIAN NICKNAME" name="nick" id="usernick">
                    <span id="olmessage2"></span>
                </td>
                <td><input type="button" class="checkId btn btn-dark" id="overlappedNick" value="중복확인"></td>
            </tr>
            <tr>
                <td>
                    이메일<br><br>인증번호
                </td>
                <td>
                    <input type="email" class="email form-control" placeholder="E-mail" name="email">
                    <br><input type="text" class="compare form-control" placeholder="인증 키 입력">
                    <span class='compare-text' style="display: none">인증번호를 확인해주세요.</span>
                </td>
                <td><input type="button" class="sendMail btn btn-dark" value="메일인증"></td>
            </tr>
            <tr>
                <td>모바일</td>
                <td><input type="text" class="mobile form-control" placeholder="MOBILE" name="mobile"></td>
            </tr>
            <tr>
                <td>
                </td>
                <td><br><br><input type='button' id='frmAddnew' class="submit btn btn-primary" value="제출"> <input type="reset" class="reset btn btn-secondary" value="비우기"></td>
                <td></td>
            </tr>
        </table>
        <br>
    </div>
    </form>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
    $(document)

    .on('click','#frmAddnew',function(){
        if($('#pw1').val()!=$('#pw2').val()){
            alert('비밀번호를 확인해주세요.');
            $('wrong').show();
            return false;
       } else {
            return true;
       }
    })

    $('#pw1').change(function(){
        if($('#pw1').val()==$('#pw2').val()){
                    $('#wrong').hide();
                    $('#equal').show();
                } else{
                    $('#equal').hide();
                    $('#wrong').show();
                }
    })

    $('#pw2').change(function(){
            if($('#pw1').val()==$('#pw2').val()){
                        $('#wrong').hide();
                        $('#equal').show();
                    } else{
                        $('#equal').hide();
                        $('#wrong').show();
                    }
    })

    $(function(){
        var idCetification = false;
        $("#overlappedID").click(function(){
                $("#frmAddnew").attr("type", "button");
                const id = $("#userid").val();
                $.ajax({
                type: "get",
                async: false,
                url: "/idCheck",
                data: {id: id},
                success: function (data) {
                if(data == 1) {
                    $("#olmessage").text("이미 사용중인 ID 입니다.");
                    $("#olmessage").addClass("olmessagef");
                    $("#olmessage").removeClass("olmessaget");
                    }else {
                    $("#olmessage").text("사용 가능한 ID 입니다.");
                    $("#olmessage").addClass("olmessaget");
                    $("#olmessage").removeClass("olmessagef");
                    $("#frmAddnew").attr("type", "submit");
                    idCetification = true
                    }
                    }
                })
                })
                $("#frmAddnew").click(function(){
                            if(idCetification == false){
                                alert("ID 중복확인이 필요합니다.");
                                return false;
                            } else{
                                return true;
                            }
                        })
            })
    $(function(){
        var nickCetification = false;
        $("#overlappedNick").click(function(){
                    $("#frmAddnew").attr("type", "button");
                    const nick = $("#usernick").val();
                    $.ajax({
                    type: "get",
                    async: false,
                    url: "/nickCheck",
                    data: {nick: nick},
                    success: function (data) {
                    if(data == 1) {
                        $("#olmessage2").text("이미 사용중인 닉네임 입니다.");
                        $("#olmessage2").addClass("olmessagef");
                        $("#olmessage2").removeClass("olmessaget");
                        }else {
                        $("#olmessage2").text("사용 가능한 닉네임 입니다.");
                        $("#olmessage2").addClass("olmessaget");
                        $("#olmessage2").removeClass("olmessagef");
                        $("#frmAddnew").attr("type", "submit");
                        nickCetification = true;
                        }
                        }
                    })
                    })
                    $("#frmAddnew").click(function(){
                        if(nickCetification == false){
                            alert("닉네임 중복확인이 필요합니다.");
                            return false;
                            } else {
                                return true;
                            }
                    })
                })


    $(function(){

        var isCertification = false;
        var key = "";

        $(".sendMail").click(function() {   // 메일 입력 유효성 검사
                var mail = $(".email").val();   //사용자의 이메일 입력값.

                if (mail == "") {
                    alert("메일 주소가 입력되지 않았습니다.");
                } else {
                    $.ajax({
                        type : 'post',
                        url : '/CheckMail',
                        data : {
                            mail:mail
                            },
                        dataType :'json',
                        success : function(data){
                            console.log(data.key);
                            key = data.key;
                        }
                    });
                    alert("인증번호가 전송되었습니다.")
                    $(".compare-text").css("display","block");
                }
            })

        $(".compare").on("propertychange change keyup paste input", function(){
            if($(".compare").val() == key) {    //인증 키 값의 비교를 위해 텍스트인풋과 벨류를 비교
                $(".compare-text").text("인증 성공!").css("color", "blue");
                isCertification = true; //인증 성공 여부 check
            } else{
                $(".compare-text").text("인증번호를 확인해주세요.").css("color", "red");
                isCertification = false; //인증 실패.
            }
        })

        $("#frmAddnew").click(function(){
            if(isCertification == false){
                alert("메일 인증이 완료되지 않았습니다.");
                return false;
            } else{
                return true;
            }
        })
    })
</script>
</html>