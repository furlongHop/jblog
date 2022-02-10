<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JBlog</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/jblog.css">

<!-- jquery ajax 사용시 추가 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>

</head>
<body>
	<div id="center-content">
		
		<!-- 메인 해더 -->
		<c:import url="/WEB-INF/views/includes/main-header.jsp"></c:import>

		<div>		
			<form id="joinForm" method="post" action="${pageContext.request.contextPath}/user/join">
				<table>
			      	<colgroup>
						<col style="width: 100px;">
						<col style="width: 170px;">
						<col style="">
					</colgroup>
		      		<tr>
		      			<td><label for="txtId">아이디</label></td>
		      			<td><input id="txtId" type="text" name="id"></td>
		      			<td><button id="btnIdCheck" type="button">아이디체크</button></td>
		      			<!-- 아이디 중복 체크 확인 여부 -->
		      			<input type="hidden" name="idCheck2" value="idUnchecked"/>
		      		</tr>
		      		<tr>
		      			<td></td>
		      			<td id="tdMsg" colspan="2"></td>
		      		</tr> 
		      		<tr>
		      			<td><label for="txtPassword">패스워드</label> </td>
		      			<td><input id="txtPassword" type="password" name="password"  value=""></td>   
		      			<td></td>  			
		      		</tr> 
		      		<tr>
		      			<td><label for="txtUserName">이름</label> </td>
		      			<td><input id="txtUserName" type="text" name="userName"  value=""></td>   
		      			<td></td>  			
		      		</tr>  
		      		<tr>
		      			<td><span>약관동의</span> </td>
		      			<td colspan="3">
		      				<input id="chkAgree" type="checkbox" name="agree" value="y">
		      				<label for="chkAgree">서비스 약관에 동의합니다.</label>
		      			</td>   
		      		</tr>   		
		      	</table>
	      		<div id="btnArea">
					<button id="btnJoin" class="btn" type="submit" >회원가입</button>
				</div>
	      		
			</form>
			
		</div>
		
		
		<!-- 메인 푸터  자리-->
		<c:import url="/WEB-INF/views/includes/main-footer.jsp"></c:import>
	</div>

</body>

<script type="text/javascript">

	// 이벤트: 아이디 체크 버튼을 클릭했을 때
	$("#btnIdCheck").on("click", function(){
		console.log("아이디 체크");
		
		var inputId = $("#txtId").val(); //id가 txtId인 폼 요소에 작성된 값을 해당 값으로 설정, inputId 변수에 담는다.
		checkId(inputId);
	});

	
	// 기능: 아이디 중복 체크
	function checkId(inputId){// 기능 따로 정의 --> 변수 입력해주기
		
		//요청
		$.ajax({
			/*요청할 데이터*/
			url : "${pageContext.request.contextPath}/user/idCheck",
			type : "post",
			//contentType : "application/json",
			/*↓ url에 파라미터로 들어갈 데이터*/
			data :{id : inputId}, //{필드명: 변수 이름}
			/*응답 받을 데이터*/
			dataType : "json", //controller에서 return 타입이 String
			success : function(result) { 
				console.log(result)
				/*성공 시 처리해야 할 코드*/
				if (result == "0") {
					$("#idCheck2").val("idChecked");
					$("#tdMsg").text("사용할 수 있는 아이디 입니다.");
				}
				else {
					$("#txtId").val("");
					$("#tdMsg").text("이미 사용중인 아이디입니다.");
				}
				
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});//ajax
		
	};

	//이벤트: 회원 가입 버튼을 눌렀을 때
	$("#btnJoin").on("click",function(){
		//아이디 중복 체크 확인 여부, 약관 동의 여부 미완성
		console.log("회원가입")
		
		var id = $("#txtId").val();
		//var idcheck = $("#idCheck2").val();
		var pw = $("#txtPassword").val();
		var name = $("#txtUserName").val();
		
		if(id == ""){
			alert("아이디를 입력 해주세요.");
			return false;
		}else if(pw == ""){
			alert("비밀번호를 입력해주세요.");
			return false;
		}else if(name == ""){
			alert("이름을 입력 해주세요.");
			return false;
		}
		
	});


</script>


</html>