<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.Timestamp" %>

<%@ include file="../../etc/color.jspf"%> 

<%
   String managerId ="";
   try{
	   managerId = (String)session.getAttribute("managerId");
	   if(managerId==null || managerId.equals("")){
           response.sendRedirect("../logon/managerLoginForm.jsp");
	   }else{
%>
<html>
<head>
<title>registering products </title>
<link href="../../etc/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../../etc/script.js"></script>
</head>
<body bgcolor="<%=bodyback_c%>">
<p>registering book</p>
<br>

<form method="post" name="writeform" 
     action="bookRegisterPro.jsp"  enctype="multipart/form-data">
<table>
   <tr>
    <td align="right" colspan="2" bgcolor="<%=value_c%>">
	    <a href="../managerMain.jsp"> go to manager's main page</a> 
   </td>
   </tr>
   <tr>
    <td  width="100"  bgcolor="<%=value_c%>">category selection</td>
    <td  width="400" align="left">
       <select name="book_kind">
           <option value="100">literature</option>
           <option value="200">foreign language</option>
           <option value="300">computer</option>
       </select>
    </td>
  </tr>
  <tr>
    <td  width="100"  bgcolor="<%=value_c%>">title</td>
    <td  width="400" align="left">
        <input type="text" size="50" maxlength="50" name="book_title"></td>
  </tr>
  <tr>
    <td  width="100"  bgcolor="<%=value_c%>">price</td>
    <td  width="400" align="left">
        <input type="text" size="10" maxlength="9" name="book_price" onkeyup="this.value=check_num(this.value)">$</td>
  </tr>
  <tr>
    <td  width="100"  bgcolor="<%=value_c%>">quantity</td>
    <td  width="400" align="left">
        <input type="text" size="10" maxlength="5" name="book_count" onkeyup="this.value=check_num(this.value)">quantity</td>
  </tr>
  <tr>
    <td  width="100"  bgcolor="<%=value_c%>">author</td>
    <td  width="400" align="left">
        <input type="text" size="20" maxlength="30" name="author"></td>
  </tr>
  <tr>
    <td  width="100"  bgcolor="<%=value_c%>">publisher</td>
    <td  width="400" align="left">
        <input type="text" size="20" maxlength="30" name="publishing_com"></td>
  </tr>
  <tr>
    <td  width="100"  bgcolor="<%=value_c%>">publishing date</td>
    <td  width="400" align="left">
        <select name="publishing_year">
        <%
        Timestamp nowTime  = new Timestamp(System.currentTimeMillis());
        int lastYear = Integer.parseInt(nowTime.toString().substring(0,4));
           for(int i=lastYear;i>=2010;i--){
        %>
             <option value="<%=i %>"><%=i %></option>
        <%} %>
        </select>year
        
        <select name="publishing_month">
        <%
           for(int i=1;i<=12;i++){
        %>
             <option value="<%=i %>"><%=i %></option>
        <%} %>
        </select>month
        
        <select name="publishing_day">
        <%
           for(int i=1;i<=31;i++){
        %>
             <option value="<%=i %>"><%=i %></option>
        <%} %>
        </select>day
     </td>
  </tr>
  <tr>
    <td  width="100"  bgcolor="<%=value_c%>">image</td>
    <td  width="400" align="left">
        <input type="file" name="book_image"></td>
  </tr>
  <tr>
    <td  width="100"  bgcolor="<%=value_c%>">contents</td>
    <td  width="400" align="left">
     <textarea name="book_content" rows="13" cols="40"></textarea> </td>
  </tr>
 <tr>
    <td  width="100"  bgcolor="<%=value_c%>">discount rate</td>
    <td  width="400" align="left">
        <input type="text" size="5" maxlength="2" name="discount_rate" onkeyup="this.value=check_num(this.value)">%</td>
  </tr>
<tr>      
 <td colspan=2 bgcolor="<%=value_c%>" align="center"> 
  <input type="button" value="registering book" onclick="checkForm(this.form)">  
  <input type="reset" value="erase all">
</td></tr></table>         
</form>      
</body>
</html>
<% 
	}
}catch(Exception e){
	e.printStackTrace();
}
%>