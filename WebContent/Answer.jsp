<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>答案页面</title>
</head>
<body background="1.png">
<div align="center">
	<%
	String Login = (String)session.getAttribute("Login");
	String name = (String)session.getAttribute("Name");
	if(Login!= null && Login == "OK"){
		out.println(name + "，测试完成！");
	}
	else{	
		out.println("请您先登陆!")	;
		out.println("<br>本页面将在3秒之后自动跳转到登录页面");
		response.setHeader("Refresh","3;URL=Login.jsp");
	}
	session.invalidate();
	
	int sum = 0;
	int score = 0;
	String errorQues="";
	String s1 = request.getParameter("question1");
	String s2 = request.getParameter("question2");
	String s3 = request.getParameter("question3");
	String s4 = request.getParameter("question4");
	String s5 = request.getParameter("question5");
	
	if (s1 == null)
		s1 = "";
	if (s2==null)
		s2 = "";
	if (s3 == null)
		s3 = "";
	if (s4==null)
		s4 = "";
	if (s5 == null)
		s5 = "";
	
	if (s1.equals("a")){
		sum++;
		score+=20;
	}else{
		errorQues+="1";
	}
	
	if (s2.equals("b")){
		sum++;
		score+=20;
	}else{
		if(errorQues != ""){
			errorQues+=",2";
		}else{
			errorQues+="2";
		}
	}
	
	if (s3.equals("c")){
		sum++;
		score+=20;
	}else{
		if(errorQues != ""){
			errorQues+=",3";
		}else{
			errorQues+="3";
		}
	}
	
	if (s4.equals("d")){
		sum++;
		score+=20;
	}else{
		if(errorQues != ""){
			errorQues+=",4";
		}else{
			errorQues+="4";
		}
	}
	
	if (s5.equals("b")){
		sum++;
		score+=20;
	}else{
		if(errorQues != ""){
			errorQues+=",5";
		}else{
			errorQues+="5";
		}
	}
	%>
	
	<p>共有5道题，你答对了<%=sum%>道题！
	<p>
		<%
		if(sum == 5){
			out.println("恭喜你全答对了！<br>");
		}
		else{
			out.print("您答错了第"+errorQues+"题<br>");
			out.print("<br>");
			if(errorQues.contains("1")){
				out.println("第1题的正确答案为：A<br>");
			}
			if(errorQues.contains("2")){
				out.println("第2题的正确答案为：B<br>");
			}
			if(errorQues.contains("3")){
				out.println("第3题的正确答案为：C<br>");
			}
			if(errorQues.contains("4")){
				out.println("第4题的正确答案为：D<br>");
			}
			if(errorQues.contains("5")){
				out.println("第5题的正确答案为：B<br>");
			}
		}
		
		out.println("<br>你的得分是：" + score);
		%>
		
	<form action="Login.jsp" method="post" name=form>
	<input type="submit" name="back" value="返回">
	</form>
</div>

</body>
</html>