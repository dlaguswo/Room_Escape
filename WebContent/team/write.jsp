<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<style type="text/css">

input[type=button], input[type=submit], input[type=reset] {
  background-color: #dad6d7;
  border: none;
  color: white;
  padding: 16px 32px;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;
}

</style>

<script type="text/javascript">

	function sData() {
		
		var f = document.myForm;
		
		if(!f.id.value){
			alert("ID는 필수 입니다!!");
			f.id.focus();
			return;
		}
		
		if(!f.pw.value){
			alert("PW는 필수 입니다!!");
			f.pw.focus();
			return;
		
		}
		
		if(f.pw.value!=f.pwr.value){
			alert("비밀번호가 일치하지 않습니다!!");
			f.pwr.focus();
			return;
			
		}
		
		if (!f.name.value) {
			alert("이름은 필수 입니다!!");
			f.name.focus();
			return;
		}
		
		if(!f.year.value){
			alert("생년월일은 필수 입니다!!");
			f.year.focus();
			return;
		}
		
		if(!f.month.value){
			alert("생년월일은 필수 입니다!!");
			f.month.focus();
			return;
		}
		
		if(!f.date.value){
			alert("생년월일은 필수 입니다!!");
			f.date.focus();
			return;
		}
		
		if (!f.tel2.value) {
			alert("전화번호는 필수 입니다!!");
			f.tel2.focus();
			return;
		}
	
	
	}
	

	function gData() {

		var f = document.myForm;

		f.action = "naver_ok.jsp";

		if (f.id.value&&f.pw.value&&f.tel2.value&&f.name.value) {
			alert("회원가입 완료!!");
			f.submit();
		}
	}
</script>
</head>

<body topmargin="0">


<form name="myForm" method="post">
<table align="center" border="0" cellspacing="0" cellpadding="0" style="font-size: 10pt;">
<tr>
	<td align="center">
		<a href="write.jsp"><img src="./data/img2.png" width="272" height="128"/></a>
	</td>
</tr>

<tr height="3">
	<td bgcolor="#dad6d7">
	</td>
</tr>

<tr>
	<td align="left"><b><br/>아이디</b>
	</td>
</tr>

<tr>
	<td>
	<input type="text" style="width: 70%; height: 50px; border: 0;" name="id">
	</td>
</tr>
<tr height="1">
	<td bgcolor="#dad6d7">
	</td>
</tr>

<tr>
	<td><b><br/>비밀번호</b>
	</td>
</tr>

<tr>
	<td>
	<input type="text" style="width: 70%; height: 50px; border: 0;" name="pw">
	</td>
</tr>
<tr height="1">
	<td bgcolor="#dad6d7">
	</td>
</tr>
<tr>
	<td><b><br/>비밀번호 재확인</b>
	</td>
</tr>


<tr>
	<td>
		<input type="text" style="width: 70%; height: 50px; border: 0;" name="pwr">
	</td>
</tr>

<tr height="1">
	<td bgcolor="#dad6d7">
	</td>
</tr>

<tr>
	<td><b><br/>이름</b>
	</td>
</tr>


<tr>
	<td>
		<input type="text" style="width: 70%; height: 50px; border: 0;" name="name">
	</td>
</tr>

<tr height="1">
	<td bgcolor="#dad6d7">
	</td>
</tr>

<tr>
	<td><b><br/>생년월일</b>
	</td>
</tr>



<tr>
	<td><input type="text" placeholder="년(4자)" maxlength="4" style="width: 147px; height: 49px; border: none;"name="year"> 
		<select style="width: 147px; height: 55px; border: none; border-color: #dad6d7;" name="month">
			<option value="1월">1월</option>
			<option value="2월">2월</option>
			<option value="3월">3월</option>
			<option value="4월">4월</option>
			<option value="5월">5월</option>
			<option value="6월">6월</option>
			<option value="7월">7월</option>
			<option value="8월">8월</option>
			<option value="9월">9월</option>
			<option value="10월">10월</option>
			<option value="11월">11월</option>
			<option value="12월">12월</option>
		</select>
		<input type="text" maxlength="2" style="width: 147px; height: 49px; border: none;" name="date" placeholder="일">
	</td>
	
	
</tr>

<tr height="1">
	<td bgcolor="#dad6d7">
	</td>
</tr>



<tr>
	<td><b><br/>성별</b>
	</td>
</tr>



<tr>
	<td><select name="gender" onchange="genderCheck();" style="width: 100%; height: 50px; border: 0;" name="gender">
	<option value="">성별</option>
	<option value="여성">여성</option>
	<option value="남성" selected="selected">남성</option>
	</select>
	</td>
</tr>

<tr height="1">
	<td bgcolor="#dad6d7">
	</td>
</tr>

<tr>
	<td><b><br/>본인 확인 이메일<font style="font-size: 8pt; color: #dad6d7;">(선택)</font></b>
	</td>
</tr>


<tr>
	<td><input type="text" style="width: 70%; height: 50px; border: 0;" name="email" placeholder="선택입력">
	</td>
</tr>

<tr height="1">
	<td bgcolor="#dad6d7">
	</td>
</tr>

<tr>
	<td><b><br/>휴대전화</b>
	</td>
</tr>


<tr>
	<td><input type="text" style="width: 74%; height: 50px; border: 0;" name="tel2" placeholder="전화번호 입력" >
	</td>
	
</tr>

<tr height="3">
	<td bgcolor="#dad6d7">
	</td>
</tr>

<tr height="5">
	<td>
		&nbsp;
	</td>
</tr>

<tr>
	<td align="center">
		<input type="button" value=" 가입하기 " onclick="">
		<input type="reset" value=" 다시입력 " onclick="document.myForm.id.focus();">
		<input type="reset" value=" 취소하기 " onclick="">
		
	</td>
</tr>


</table>
</form>

</body>
</html>