<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- favicon 설정 -->
	<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
	<link rel="icon" href="resources/images/favicon.ico" type="image/x-icon">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
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
	#loginForm>table{width:100%;}
    #loginTable input{
        width: 100%;
        height: 100%;
    }
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
	
	<c:if test="${ not empty alertMsg }">
		<script>
			alert("${ alertMsg }");
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if>
	
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
                <form id="loginForm" method="post" action="" enctype="multipart/form-data">
                    <table id="loginTable" align="center">
                        <tr>
                            <td colspan="2" align="center"><input type="text" id="findemail" class="form-control" name="findemail" style="height:40px; width:100%;" placeholder="이메일" required></td>
                        </tr>
                        <tr >
                            <td><input type="text" id="inputPhoneNumber" class="form-control" name="phoneNumber" style="height:40px; width:100%" placeholder="전화번호" required></td>
                            <td><button type="button" class="btn btn-primary" id="sendPhoneNumber" style="height:40px; width:100%; margin-left: 5px;">인증번호 받기</button></td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center"><input type="text" id="inputCertifiedNumber" class="form-control" name="inputCertifiedNumber" style="height:40px; width:100%;" placeholder="인증번호"></td>
                        </tr>
                    </table>
                    <br>
                    <div align="center">
                        <button type="button" style="width:100%;" id="checkBtn" class="btn btn-primary">인증하기</button>
                    </div>
                </form>
            </div>
            <div id="body3-3"></div>
        </div>

    </div>
    
    <script>
		        $('#sendPhoneNumber').click(function(){
		            $.ajax({
		                type: "GET",
		                url: "checkphone.me",
		                data: {
		                    "phoneNumber" : $('#inputPhoneNumber').val(),	
		                    "email" : $('#findemail').val()
		                },
		                success: function(res){
		                    if(res==""){
		                    	alert("일치하는 이메일 정보가 없습니다");
		                    	location.reload();
		                    }else{
			                	$('#checkBtn').click(function(){
			                    	if($.trim(res) ==$('#inputCertifiedNumber').val()){
			                        	var email = $('#findemail').val();
									    $("#email").val(email);
										$("#findPwdModal").modal("show");
			                        }else{
			                            alert("인증번호가 잘못되었습니다");
			                            location.reload();
			                        }
			                    })
		                    }
		
		                }
		            })
		        });
		</script>

    <div class="modal fade" id="findPwdModal">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">비밀번호 변경</h4>
            </div>

            <form action="pwdChange.me" method="post">
                <!-- Modal Body -->
                <div class="modal-body">
                    <label for="userPwd" class="mr-sm-2"></label>
                    <input type="text" class="form-control mb-2 mr-sm-2" id="email" name="email" placeholder="변경될 이메일" readonly >
                    <input type="password" class="form-control mb-2 mr-sm-2" placeholder="변경할 비밀번호" id="updatePwd" name="updatePwd">
                </div>
                
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">변경</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                </div>
            </form>
            </div>
        </div>
        
		        
    </div>

</body>
</html>