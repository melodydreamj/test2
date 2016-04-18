<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
System.out.println("여기 왔다감 ㅇㅇ");
String tokenSecret=request.getParameter("tokenSecret");
String token=request.getParameter("token");
session.setAttribute("finish", 1);
System.out.println("전반전끝 ㅇ tokenSecret2="+tokenSecret);
response.sendRedirect("/index.jsp?tokenSecret2="+tokenSecret+"&token2="+token);
%>
</body>
</html>