<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="lidawei.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>测试页面</title>
<jsp:useBean id="Test" class="lidawei.Test" scope="session"></jsp:useBean> 
</head>
<body background="1.png">
<div align="center">
	<%	
	String Login = (String)session.getAttribute("Login");
	String name = (String)session.getAttribute("Name");
	if(Login!= null && Login == "OK"){
		out.println(name + "同学，欢迎进入答题页面！<br>");
		out.println("注意：共有五道小题，每题20分，满分100分！");
	}
	else{	
		out.println("请您先登陆!")	;
		out.println("<br>本页面将在3秒之后自动跳转到登录页面");
		response.setHeader("Refresh","3;URL=Login.jsp");
	}
	session.invalidate();

	ResultSet rs = Test.getTest();
	int[] number = new int[5];
	ArrayList<String> aStrings = new ArrayList<String>();
	int i = 0;
	int j = 0;
	while(rs.next()){
		number[j] = rs.getInt(1);
		j++;
		for(int h=0;h<5;h++){
			aStrings.add(i, rs.getString(h+2));
			i++;
		}
	}
	%>	
	
	<form action="Answer.jsp" method="post" name=form>
		<p>
			<%out.println(number[0] + "." + aStrings.get(0)); %><br/>
			<input type="radio" name="question1" value="a"><%=aStrings.get(1)%>
			<input type="radio" name="question1" value="b"><%=aStrings.get(2)%>
			<input type="radio" name="question1" value="c"><%=aStrings.get(3)%>
			<input type="radio" name="question1" value="d"><%=aStrings.get(4)%>
		<p>
			<%out.println(number[1] + "." + aStrings.get(5)); %><br/>
			<input type="radio" name="question2" value="a"><%=aStrings.get(6)%>
			<input type="radio" name="question2" value="b"><%=aStrings.get(7)%>
			<input type="radio" name="question2" value="c"><%=aStrings.get(8)%>
			<input type="radio" name="question2" value="d"><%=aStrings.get(9)%>
		<p>
			<%out.println(number[2] + "." + aStrings.get(10)); %><br/>
			<input type="radio" name="question3" value="a"><%=aStrings.get(11)%>
			<input type="radio" name="question3" value="b"><%=aStrings.get(12)%>
			<input type="radio" name="question3" value="c"><%=aStrings.get(13)%>
			<input type="radio" name="question3" value="d"><%=aStrings.get(14)%>
		<p>
			<%out.println(number[3] + "." + aStrings.get(15)); %><br/>
			<input type="radio" name="question4" value="a"><%=aStrings.get(16)%>
			<input type="radio" name="question4" value="b"><%=aStrings.get(17)%>
			<input type="radio" name="question4" value="c"><%=aStrings.get(18)%>
			<input type="radio" name="question4" value="d"><%=aStrings.get(19)%>
		<p>
			<%out.println(number[4] + "." + aStrings.get(20)); %><br/>
			<input type="radio" name="question5" value="a"><%=aStrings.get(21)%>
			<input type="radio" name="question5" value="b"><%=aStrings.get(22)%>
			<input type="radio" name="question5" value="c"><%=aStrings.get(23)%>
			<input type="radio" name="question5" value="d"><%=aStrings.get(24)%>
			<p><input type="submit" name="submit" value="提交">
	</form>
	
	<form action="Login.jsp" method="post" name=form>
		<input type="submit" name="back" value="返回">
	</form>
	</div>
</body>
</html>