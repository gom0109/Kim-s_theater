<%@page import="myPkg.TheaterBean"%>
<%@page import="myPkg.TheaterDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="myPkg.MovieBean"%>
<%@page import="myPkg.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="mainTop.jsp" %>
        
<%
	if(id==null){
		%>
			<script type="text/javascript">
				alert("로그인이 필요한 페이지입니다.");
				location.href="login.jsp"
			</script>
		<%
	}
	int num = Integer.parseInt(request.getParameter("num"));   
	MovieDao mdao = MovieDao.getInstance();
	MovieBean mbean = mdao.getMovieByNum(num);
	TheaterDao tdao = TheaterDao.getInstance();
	TheaterBean tbean = tdao.getAllByNum(Integer.parseInt(mbean.getTheater()));
	
	int runtime = Integer.parseInt(mbean.getRuntime());
	int startH=8;
	int startM=00;
	
	int pmcount=0;
	
	int count=1;
	
	//800에 시작 
	SimpleDateFormat sdf = new SimpleDateFormat ( "yyyy-MM-dd");
	String today = sdf.format(System.currentTimeMillis());
	
	
	
%>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript">
    	function checkData(){
    		
    		
    		if($("input[name='bookingDate']").val()==""){
    			alert("예매하실 날짜를 선택해 주세요");
    			return false;
    		}
    		
    		
    		if(myform.time.value==""){
    			alert("예매하실 시간을 선택해 주세요");
    			return false;
    		}
    	}
    
    </script>
    
    

    
    


<form method="post" action="theater.jsp" name="myform">
<table border="1" class="movieTable" >
<input type="hidden" name="mnum" value="<%=num%>">
<tr>
	<td colspan="2" class="tt">
		<font size="5"><%=tbean.getLocation() %>극장 <%=tbean.getMultiplexnum() %>관
		<%=mbean.getTitle() %>시간표</font>
	</td>
</tr>
<tr>
<td class="tt">예매날짜</td>
<td class="t2"><input type="date" name="bookingDate" max="<%=mbean.getCloseDate() %>" min="<%=today%>" value="<%=today%>"></td>
</tr>
	<%
while(true){
	
	int newrt = runtime/10*10+20;
int rH =newrt/60;
int rM = newrt-(60*rH);

if(startM>60){
	startH++;
	startM = startM-60;
}
if(startH>=12){
	startH=startH-12;
	pmcount++;
}
if(pmcount>1){
		break;
		}

%>
<tr>
	<td class="tt"><%=count%>회</td>
	<td class="t2">
		<%if(pmcount==1){
			%><input type="radio" name="time" value="<%=count%>회  오후 <%=startH %>시<%=startM %>분"><%
			%>오후<%
			}else{
				%><input type="radio" name="time" value="<%=count%>회  오전 <%=startH %>시<%=startM %>분"><%
				%>오전<%
			}
			%> <%=startH %>시<%=startM %>분
	</a></td></tr>
	
	<%
		 count++;
	startH= startH+rH;
	startM = startM+rM;
	
	
}
	
%>

<tr>
<td colspan="2" class="tt">
	<input type="submit" value="좌석 선택" onclick="return checkData()">
	<input type="button" value="뒤로가기" onclick='history.go(-1)'>
	<input type="button" value="영화 목록" onclick="location.href='customerCurrentMovieList.jsp'">
</td>
</tr>
</table>
</form>
<%@include file="mainBottom.jsp" %>