<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="lidawei.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<title>登陆页面</title>
<jsp:useBean id="User" class="lidawei.User" scope="session"></jsp:useBean> 
</head>

<body background="1.png">
<div align="center">
<div class="lidawei">
<font size="10",font face="微软雅黑">欢迎登陆在线考试系统</font>
</div>
	<p>
	<form action="Login.jsp" method="POST">
	<p>
		<font size="4",font face="微软雅黑">用户名: </font>
		<input type="text" name="Name"  /><br /> 
		<font size="4",font face="微软雅黑">密&nbsp&nbsp&nbsp码: </font>
		<input type="password" name="Password" /><br /> 
		<p>
		<input type="submit" value="登录"/>
	</form>
	
</div>
	<%
	request.setCharacterEncoding("UTF-8");
	String Name = request.getParameter("Name");
	String Password = request.getParameter("Password");
	int flag = 0;
	if (Name != null && Password != null) {
		ResultSet rs = User.Login(Password, Name);
		while(rs.next()){
			User.setUsername(rs.getString(1));
			User.setPassword(rs.getString(2));
			if (Name.equals(User.getUsername()) && Password.equals(User.getPassword())) {
				session.setAttribute("Login","OK");
				session.setAttribute("Name",Name);
				response.sendRedirect("Question.jsp");
			}
			else{
				flag = 1;
			}
		}
	}
	if(flag == 1){
		out.println("登录失败!<br>");
		out.println("用户名或密码错误，请重新输入！");
	}
	%>

</body>
</html>