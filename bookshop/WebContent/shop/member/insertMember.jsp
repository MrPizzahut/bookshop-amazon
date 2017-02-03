<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function check_num(str){
	if(isNaN(str)){
		alert("숫자만 입력하세요");
		return "";
	}else
		return str;
}

function check(){
	var blank=0;
	if(form1.id.value=="")
		blank=1;
	if(form1.passwd.value=="")
		blank=1;
	if(form1.name.value=="")
		blank=1;
	if(form1.address.value=="")
		blank=1;
	if(form1.tel.value=="")
		blank=1;
	
	if(blank==1){
		alert("Please fill in the blank.");
		return (false);
	}else{
		return (true);
	}
}

function userCheck(id){
	wx=300;
	wy=200;
	sx=screen.width;
	sy=screen.height;
	x=(sx-wx)/2;
	y=(sy-wy)/2;
	if(id==""){
		alert("input id ")
	}else{
		url="idcheck.jsp?id="+id;
		wr=window.open(url,"checking id","width=300,height=200");
		wr.moveTo(x,y);
	}
	
	
} 

</script>
</head>
<body>



	<form method="post" action="insertMemberPro.jsp" name="form1" onsubmit="return check();" >
	아이디 : <input type="text" name="id">
	 <input type="button" value="중복체크" onclick="userCheck(this.form.id.value)"><br>
	비밀번호 : <input type="password" name="passwd"><br>
	이 름 : <input type="text" name="name"><br>
	주 소 : <input type="text" name="address"><br>
	전화번호 : <input type="text" name="tel"onkeyup="this.value=check_num(this.value)"><br>
	<input type="submit" value="회원가입">
	<input type="reset" value="다시자성">
	

	</form>

</body>
</html>