<%@page import="myPkg.TheaterBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myPkg.TheaterDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    TheaterDao tdao = TheaterDao.getInstance();
    int num = Integer.parseInt(request.getParameter("num"));
	//out.print(num);
	TheaterBean tb = tdao.getAllByNum(num);
	String def = tb.getLocation()+tb.getMultiplexnum();
	
	ArrayList<TheaterBean> list = tdao.getAllTheater();
	String abc = "";
	for(int i=0;i<list.size();i++){
		TheaterBean tbean = list.get(i);
		abc = abc + tbean.getLocation()+tbean.getMultiplexnum()+" ";
	}
	
		//System.out.println(abc);
		
	
		
    %>
    <script type="text/javascript">
	function checkData(){
		if(myform.location.value==""){
			alert("지역을 입력해 주세요")
			return false;
		}
		if(myform.multiplexnum.value==""){
			alert("상영관 번호를 입력해 주세요")
			return false;
		}
		if(myform.seatnum.value==""){
			alert("좌석수를 입력해 주세요")
			return false;
		}
		if(myform.multiplexnum.value<0){
			alert("잘못된 상영관 번호입니다.")
			return false;
		}
		if(myform.seatnum.value<0){
			alert("잘못된 좌석수 입니다.")
			return false;
		}
		
		a=myform.location.value
		b=myform.multiplexnum.value
		def = myform.def.value
		abc = myform.abc.value
		if(!(def.includes(a+b))){
			if(abc.includes(a+b)){
				alert("이미 등록된 상영관입니다.");
				return false;
				
			}			
		}
		
		
		
	}

</script>
    
<%@include file="adminMainTop.jsp" %>

<form method="post" action="updateTheaterProc.jsp?num=<%=num %>" name="myform">
<input type="hidden" name="abc" value="<%=abc%>">
<input type="hidden" name="def" value="<%=def%>">
<table class="movieTable2" border="1">
	<tr>
		<td colspan="2" class="tt"><font size="5">상영관 수정</font></td>
		
	</tr>
	<tr>
		<td class="tt">지역</td>
		<td class="t2"><input type="text" name="location" value="<%=tb.getLocation()%>">극장</td>
	</tr>
	<tr>
		<td class="tt">상영관 번호</td>
		<td class="t2"><input type="number" name="multiplexnum" value="<%=tb.getMultiplexnum()%>">관</td>
	</tr>
	<tr>
		<td class="tt">좌석수</td>
		<td class="t2"><input type="number" name="seatnum" value="<%=tb.getSeatnum()%>">석</td>
	</tr>
	<tr>
		
		<td colspan="2" class="tt"><input type="submit" value="수정" onclick="return checkData()">
		<input type="reset" value="리셋"></td>
	</tr>


</table>
</form>



<%@include file="adminMainBottom.jsp" %>