<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div{box-sizing: border-box;}
    form{box-sizing: border-box;}
    tr{box-sizing: border-box;}
    td{box-sizing: border-box; padding-top: 5px;}
    input{padding:0px;margin:0px;}
    #header{
        width:100%;
        height:100px;
        padding-top:10px;
        margin:auto;
    }
    #header>div{width:100%; margin-bottom:10px}
    #header1>div{
        height:100%;
        float:left;
    }
    #header1-1{width:20%;position:relative;}
    #header1-2{width:70%;}
    #header1-1>img{height:80%;position:absolute;margin:auto;top:0;bottom:0;right: 0;left:0;}
    #body>div{
        width:100%;
    }
    #body1{
        height: 100px;
    }
    #body2{
        text-align: center;
        color:rgb(45, 130, 235);
        font-size: 30px;
        font-weight: 800;
    }
    #loginForm>table{
        width:100%;
    }
	#loginForm>table{width:100%;}
    #body3{
        height: 300px;
    }
    #body3>div{
        height:100%;
        float:left;
    }
    #body3-1{
        width:35%;
        position:relative;
    }
    #body3-2{
        width:30%;
    }
    #body3-3{
        width:35%;
    }
    #loginTable input{
        width: 100%;
        height: 100%;
    }
    #loginbtn{
        width: 100%;
        height: 30px;
        color:white;
        background-color:rgb(45, 130, 235);
        border-color:rgb(45, 130, 235);
    }
    </style>
</head>
<body>

    <div id="header">
        <div id="header1">
            <div id="header1-1">
                <img src="resources/images/workpeople-logo-blue02.png" alt="">
                <br><br><br>
            </div>

            <div id="header1-2">
            </div>
        </div>
    </div>

    <div id="body">
        <div id="body1"></div>
        <div id="body2">워크피플</div>
        <br><br>

        <div id="body3">
            <div id="body3-1"></div>
            <div id="body3-2">
                <form id="loginForm" method="post" action="login.me" enctype="multipart/form-data">
                    <table id="loginTable" align="center">
                        <tr>
                            <td align="center"><input type="text" id="email" class="form-control" name="email" style="height:30px;" placeholder="이메일" required></td>
                        </tr>
                        <tr>
                            <td align="center"><input type="password" id="userPwd" class="form-control" name="userPwd" style="height:30px;" placeholder="비밀번호" required></td>
                        </tr>
                    </table>
                    
                    <a href="" id="find-pwd" style="font-size: 10px; ">비밀번호 찾기</a>
                    <br><br>

                    <div align="center">
                        <button type="submit" id="loginbtn">로그인</button>
                    </div>
                </form>
            </div>
            <div id="body3-3"></div>
        </div>

    </div>
</body>
</html>