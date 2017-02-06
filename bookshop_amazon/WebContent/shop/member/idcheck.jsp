<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "bookshop.shopping.CustomerDataBean" %>
    <%@ page import = "bookshop.shopping.CustomerDBBean" %>
    
<%
CustomerDBBean dao = CustomerDBBean.getInstance();
String id=request.getParameter("id");
int x=dao.confirmId(id);

%>  
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="#FFFFCC">
<br>
<center>
<h2><b><%=id %></b></h2>
<%
if(x==1){
	out.println("<h2>is already exist.</h2><p>");
}else{
	out.println("<h2>is availible.</h2><p>");
}
%>
<a href="JavaScript:window.close()">close</a>
</center>

</body>
</html>