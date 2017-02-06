<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../etc/color.jspf"%> 
<html>
<head>
<link href="../etc/style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="<%=bodyback_c%>">
<%
 try{
   if(session.getAttribute("id")==null){%>
   <a href="../shopping/list.jsp?book_kind=all">list of all</a>&nbsp;
   <br>
      
   <form name="inform" method="post" action="loginPro.jsp">
       ID:  <input type="text" name="id" size="15" maxlength="50">
 Password:  <input type="password" name="passwd" size="15" maxlength="16">
    <input type="submit" name="Submit" value="sign in">
    <input type="button"  value="Create account" 
        onclick="javascript:window.location='../member/insertMember.jsp'">
   </form>
   <font color="red">* You must sign in to shop.*</font>    
 <%}else{%>
    <a href="../shopping/list.jsp?book_kind=all">list of all</a>&nbsp;
    <a href="../shopping/cartList.jsp?book_kind=all">cart</a>&nbsp;
    <a href="../shopping/buyList.jsp">list of purchased items</a>&nbsp;
      
    <br><br> 
    <b><%=session.getAttribute("id")%></b> enjoy your shopping.
       
    <input type="button"  value="logout" 
        onclick="javascript:window.location='../shopping/logout.jsp'">
     
     
 <%}
 }catch(NullPointerException e){
	 e.printStackTrace();
 }
 %>
</body>
</html>