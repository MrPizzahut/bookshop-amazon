<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.Timestamp" %>
<%@ page import = "bookshop.master.ShopBookDBBean" %>
<%@ page import = "bookshop.master.ShopBookDataBean" %>

<%@ include file="../../etc/color.jspf"%> 

<%
String managerId ="";
try{
   managerId = (String)session.getAttribute("managerId");
   if(managerId==null || managerId.equals("")){
      response.sendRedirect("../logon/managerLoginForm.jsp");
}else{
%>
<%
int book_id = Integer.parseInt(request.getParameter("book_id"));
String book_kind = request.getParameter("book_kind");
try{
	ShopBookDBBean bookProcess = ShopBookDBBean.getInstance();
    ShopBookDataBean book =  bookProcess.getBook(book_id); 
%>
<html>
<head>
<title>product edit</title>
<link href="../../etc/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../../etc/script.js"></script>
</head>
<body bgcolor="<%=bodyback_c%>">
<p>book edit</p>
<br>

<form method="post" name="writeform" 
   action="bookUpdatePro.jsp"  enctype="multipart/form-data">
<table>
   <tr>
    <td align="right" colspan="2" bgcolor="<%=value_c%>">
	    <a href="../managerMain.jsp"> go to manager's main page</a> &nbsp;
	    <a href="bookList.jsp?book_kind=<%=book_kind%>"> category's list</a>
   </td>
   </tr>
   <tr>
    <td  width="100"  bgcolor="<%=value_c%>">category selection</td>
    <td  width="400"  align="left">
       <select name="book_kind">
           <option value="100" 
             <%if (book.getBook_kind().equals("100")) {%>selected<%} %>
              >literature</option>
           <option value="200" 
             <%if (book.getBook_kind().equals("200")) {%>selected<%} %>
             >foreign language</option>
           <option value="300" 
             <%if (book.getBook_kind().equals("300")) {%>selected<%} %>
             >computer</option>
       </select>
    </td>
  </tr>
  <tr>
    <td  width="100"  bgcolor="<%=value_c%>">title</td>
    <td  width="400" align="left">
        <input type="text" size="50" maxlength="50" name="book_title" 
            value="<%=book.getBook_title() %>">
        <input type="hidden" name="book_id" value="<%=book_id%>"></td>
  </tr>
  <tr>
    <td  width="100"  bgcolor="<%=value_c%>">price</td>
    <td  width="400" align="left">
        <input type="text" size="10" maxlength="9" name="book_price" 
          value="<%=book.getBook_price() %>" onkeyup="this.value=check_num(this.value)">$</td>
  </tr>
  <tr>
    <td  width="100"  bgcolor="<%=value_c%>">quantity</td>
    <td  width="400" align="left">
        <input type="text" size="10" maxlength="5" name="book_count" 
          value="<%=book.getBook_count() %>" onkeyup="this.value=check_num(this.value)"> quantity</td>
  </tr>
   <tr>
    <td  width="100"  bgcolor="<%=value_c%>">author</td>
    <td  width="400" align="left">
        <input type="text" size="10" maxlength="5" name="author" 
          value="<%=book.getAuthor()%>"></td>
  </tr>
  <tr>
    <td  width="100"  bgcolor="<%=value_c%>">publisher</td>
    <td  width="400" align="left">
        <input type="text" size="20" maxlength="30" name="publishing_com" 
          value="<%=book.getPublishing_com() %>"></td>
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
             <option value="<%=i %>"  
             <%if (Integer.parseInt(book.getPublishing_date().substring(0,4))==i) {%>
             selected<%} %>><%=i %></option>
        <%} %>
        </select>year
        
        <select name="publishing_month">
        <%
           for(int i=1;i<=12;i++){
        %>
             <option value="<%=i %>" 
             <%if (Integer.parseInt(book.getPublishing_date().substring(5,7))==i) {%>
               selected<%} %>><%=i %></option>
        <%} %>
        </select>month
        
        <select name="publishing_day">
        <%
           for(int i=1;i<=31;i++){
        %>
             <option value="<%=i %>" 
             <%if (Integer.parseInt(book.getPublishing_date().substring(8))==i) {%>
               selected<%} %>><%=i %></option>
        <%} %>
        </select>day
     </td>
  </tr>
  <tr>
    <td  width="100"  bgcolor="<%=value_c%>">image</td>
    <td  width="400" align="left">
        <input type="file" name="book_image"><%=book.getBook_image() %></td>
  </tr>
  <tr>
    <td  width="100"  bgcolor="<%=value_c%>">contents</td>
    <td  width="400" align="left">
     <textarea name="book_content" rows="13" 
         cols="40"><%=book.getBook_content() %></textarea> </td>
  </tr>
 <tr>
    <td  width="100"  bgcolor="<%=value_c%>">discount rate</td>
    <td  width="400" align="left">
        <input type="text" size="5" maxlength="2" name="discount_rate" 
          value="<%=book.getDiscount_rate() %>" onkeyup="this.value=check_num(this.value)">%</td>
  </tr>
<tr>      
 <td colspan=2 bgcolor="<%=value_c%>" align="center"> 
  <input type="button" value="edit book" onclick="updateCheckForm(this.form)">  
  <input type="reset" value="erase all">
</td></tr></table>         
</form>   
<%
}catch(Exception e){
	e.printStackTrace();
}%>         
</body>
</html>
<% 
  }
}catch(Exception e){
	e.printStackTrace();
}
%>