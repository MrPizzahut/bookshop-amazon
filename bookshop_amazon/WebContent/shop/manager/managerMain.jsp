<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../etc/color.jspf"%>

<%
   String managerId ="";
   try{
	   managerId = (String)session.getAttribute("managerId");
	   
	   if(managerId==null || managerId.equals("")){
          response.sendRedirect("logon/managerLoginForm.jsp");
	   }else{
%>
<html>
<head>
<title>book manage</title>
</head>
<body>
  <form method="post" action="logon/managerLogout.jsp">
	 <b>manager page </b><input type="submit" value="logout">	
  </form>
    
   <table>
     <tr><td align="center" bgcolor="<%=bar%>">product</td></tr>
     <tr><td>
     <a href='productProcess/bookRegisterForm.jsp'>registering books</a></td></tr>
     <tr><td>
     <a href='productProcess/bookList.jsp?book_kind=all'>product delete/edit</a>
     </td></tr>
   </table><br><br>
   
   <table>
     <tr><td align="center" bgcolor="<%=bar%>">purchased products</td></tr>
     <tr><td>
     <a href='orderedProduct/orderedList.jsp'>list of the purchased products</a></td></tr>
   </table>
</body>
</html>
<% 
	   }
    }catch(Exception e){
		e.printStackTrace();
	}
%>