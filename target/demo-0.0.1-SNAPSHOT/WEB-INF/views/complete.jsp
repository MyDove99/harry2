<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>complete</title>
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
        text-align: center;
    }

    th,td {
        padding: 15px;
    }
</style>
<body>
    <div class="container">
            <table class="findTable">
                <tr>
                    <td>가입하신 정보가 이메일로 전송되었습니다</td>
                </tr>
                <tr>
                    <td><input type="button" value="닫기" onclick="window.close()"></td>
                </tr>
            </table>
    </div>
</body>
</html>