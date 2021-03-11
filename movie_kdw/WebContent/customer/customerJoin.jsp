
<%@page import="myPkg.MemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myPkg.MemberDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- customerJoin.jsp<br> -->
<%@include file="mainTop.jsp" %>

<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
	flag=false;
	$(document).ready(function(){
		$("input[name='id']").keydown(function(){
			$("#idMessage").empty()
			flag=false;
		})
		$("#checkbtn").click(function(){
			flag=true;
			if(document.myform.id.value==""){
				document.myform.id.focus()
			alert("아이디를 입력하세요")
			}else{
				$.ajax({
				url: "id_check_proc.jsp",
				data:({
					id : $('input[name="id"]').val()
				}),
				success:function(data){
					if($.trim(data)=='YES'){
						$("#idMessage").empty().append("<font color = green>사용할수있는 아이디입니다.</font>");
					}else{
						$("#idMessage").empty().append("<font color = red>중복되는아이디입니다.</font>");
					}
					
				}
				
			})
			}	
			
			
			
		})
		
		
	
	})
	function Checksub(){
			if(flag==false){
				alert("중복체크를 해주세요");
				return false;
			}
			
			
			
			if($("input[name='id']").val()==""){
				alert("아이디를 입력하세요")
				$("input[name='id']").focus()
				return false;
			}
			if($("input[name='password']").val()==""){
				alert("비밀번호를 입력하세요")
				$("input[name='password']").focus()
				return false;
			}
			if($("input[name='passwordCheck']").val()==""){
				alert("비밀번호 확인란을 입력하세요")
				$("input[name='passwordCheck']").focus()
				return false;
			}
			
			if($("input[name='passwordCheck']").val() != $("input[name='password']").val()){
				alert("비밀번호란과 비밀번호확인란의 값이 다릅니다");
				$("input[name='passwordCheck']").val("")
				$("input[name='passwordCheck']").focus()
				return false;
			}
			if($("input[name='name']").val()==""){
				alert("이름을 입력하세요")
				$("input[name='name']").focus()
				return false;
			}
			if($("input[name='birth']").val()==""){
				alert("생년월일을 입력하세요")
				$("input[name='birth']").focus()
				return false;
			}
			if($("input[name='ssn1']").val()==""){
				alert("주민등록번호를 입력하세요")
				$("input[name='ssn1']").focus()
				return false;
			}
			if(isNaN($("input[name='ssn1']").val())){
				alert("주민등록번호를 숫자로 입력하세요")
				$("input[name='ssn1']").val("")
				$("input[name='ssn1']").focus()
				return false;
			}
			if($("input[name='ssn2']").val()==""){
				alert("주민등록번호를 입력하세요")
				$("input[name='ssn2']").focus()
				return false;
			}
			if(isNaN($("input[name='ssn2']").val())){
				alert("주민등록번호를 숫자로 입력하세요")
				$("input[name='ssn2']").val("")
				$("input[name='ssn2']").focus()
				return false;
			}
			if($("input[name='email']").val()==""){
				alert("이메일을 입력하세요")
				$("input[name='email']").focus()
				return false;
			}
			  var emailVal = $("input[name='email']").val();

			  var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			  

			  if (emailVal.match(regExp) == null) {
			    alert("유효하지 않은 이메일 형식입니다.");
			    $("input[name='email']").val("")
			    $("input[name='email']").focus()
			    return false;
			  }
			  
			var emaillist = myform.emailList.value
			if(emaillist.includes(myform.email.value)){
				alert("이미 가입된 이메일 주소입니다.")
				$("input[name='email']").val("")
				$("input[name='email']").focus()
				return false;
				
				
			}
			
			
			
			
		}
	
	
	
</script>
<%
SimpleDateFormat sdf = new SimpleDateFormat ( "yyyy-MM-dd");
String today = sdf.format(System.currentTimeMillis());
MemberDao mdao = MemberDao.getInstance();
String emailList = "";
ArrayList<MemberBean> list = mdao.selectAll();
for(int i=0;i<list.size();i++){
	MemberBean mbean = list.get(i);
	emailList = emailList+ mbean.getEmail()+" ";
}

%>

<form method="post" action="joinProc.jsp" name="myform">
<input type="hidden" name="emailList" value="<%=emailList%>">
<table border="1" width="700px" class="movieTable2">
	<tr>
		<td colspan="2" class="tt"><font size="5">회원가입</font></td>
	</tr>
	<tr>
		<td class="tt" width="150px">아이디</td>
		<td align="left"><input type="text" name="id">
			<input type="button" value="중복 체크" id="checkbtn">
			<span id="idMessage"></span></td>
	</tr>
	<tr>
		<td class="tt">비밀번호</td>
		<td><input type="password" name="password"></td>
	</tr>
	<tr>
		<td class="tt">비밀번호 확인</td>
		<td><input type="password" name="passwordCheck"></td>
	</tr>
	<tr>
		<td class="tt">이름</td>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<td class="tt">생년월일</td>
		<td><input type="date" name="birth" max="<%=today%>"></td>
	</tr>
	<tr>
		<td class="tt">주민등록 번호</td>
		<td><input type="text" name="ssn1" size="6">-<input type="password" name="ssn2" size="7"></td>
	</tr>
	<tr>
		<td class="tt">이메일 주소</td>
		<td><input type="text" name="email"></td>
	</tr>
	
	<tr>
		<td colspan="2" class="tt">
		<input type="submit" value="확인" onclick="return Checksub()">
		
		
		</td>
	</tr>





</table>
</form>

<%@include file="mainBottom.jsp" %>