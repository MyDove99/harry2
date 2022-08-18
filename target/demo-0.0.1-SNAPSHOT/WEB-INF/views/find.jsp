<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>아이디/비밀번호 찾기</title>
</head>
<style>
    body {
        background-image: url("/css/find.jpg");
        background-size: cover;
    }
    .findTable {
        border-style:double;
        vertical-align: middle;
        margin: auto;
    }

    th,td {
        padding: 8px;
    }

    input {
        background-color: beige;
    }
</style>
<body>
    <div class="container">
            <table class="findTable">
                <tr>
                    <th>아이디 찾기</th><th>비밀번호 찾기</th>
                </tr>
                <tr>
                    <td>이메일</td><td>아이디</td>
                </tr>
                <tr>
                    <td><input type="text" id="idE" name="idE" placeholder="Email"></td>
                    <td><input type="text" id="pwid" name="pwid" placeholder="ID"></td>
                </tr>
                <tr>
                    <td><input type="button" id="btnFindI" value="찾기"></td>
                    <td>이메일</td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="text" id="pwE" name="pwE" placeholder="Email"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="button" id="btnFindP" value="찾기"></td>
                </tr>
            </table>
    </div>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
    $("#btnFindI").click(function() {
                    var mail = $("#idE").val();   //사용자의 이메일 입력값.
                    if (mail == "") {
                        alert("메일 주소가 입력되지 않았습니다.");
                    } else {
                        $.ajax({
                            type : 'post',
                            url : '/findid',
                            data : {
                                mail:mail
                                },
                            dataType :'json',
                            success : function(data){
                                if(data=="1"){
                                                    location.href="complete";
                                              } else {
                                                    location.href="fail";
                                              }
                            }
                        });
                    }
                })

    $("#btnFindP").click(function() {
                    var mail = $("#pwE").val();   //사용자의 이메일 입력값.
                    var userid = $("#pwid").val();
                    if (mail == "") {
                        alert("메일 주소가 입력되지 않았습니다.");
                    } else {
                        $.ajax({
                            type : 'post',
                            url : '/findpw',
                            data : {
                                mail:mail,
                                userid:userid
                                },
                            dataType :'json',
                            success : function(data){
                                if(data=="1"){
                                    location.href="complete";
                                } else {
                                    location.href="fail";
                                }
                            }
                        });

                    }
                })
</script>
</html>