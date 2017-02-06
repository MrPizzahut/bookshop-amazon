<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "bookshop.master.ShopBookDBBean" %>
<%@ page import = "bookshop.master.ShopBookDataBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<%@ include file="../../etc/color.jspf"%> 

<%
String managerId ="";
try{
	managerId = (String)session.getAttribute("managerId");
	if(managerId==null || managerId.equals("")){
       response.sendRedirect("../logon/managerLoginForm.jsp");
	}else{
%> 

<%!
    SimpleDateFormat sdf = 
        new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

<%
    List<ShopBookDataBean> bookList = null; 
    int number =0;
    String book_kind="";
    
    book_kind = request.getParameter("book_kind");
 
    ShopBookDBBean bookProcess = ShopBookDBBean.getInstance();
    int count = bookProcess.getBookCount();
    
    if (count > 0) {
    	bookList = bookProcess.getBooks(book_kind);
    }
%>
<html>
<head>
<title>list of books</title>
<link href="../../etc/style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="<%=bodyback_c%>">
<%
   String book_kindName="";
   if(book_kind.equals("100")){
	   book_kindName="literature";
   }else if(book_kind.equals("200")){
	   book_kindName="forein language";  
   }else if(book_kind.equals("300")){
	   book_kindName="computer";
   }else if(book_kind.equals("all")){
	   book_kindName="all";
   }
%>
<a href="../managerMain.jsp"> go to manager's main page</a> &nbsp;
<p><%=book_kindName%> category's list: 
<%if(book_kind.equals("all")){%> 
    <%=count%> quantity
<%}else{%>
    <%=bookList.size() %> quantity
<%} %>
</p>
<table>
<tr>
    <td align="right" bgcolor="<%=value_c%>">
       <a href="bookRegisterForm.jsp">registering book</a>
    </td>
</table>

<%
  if (count == 0) {
%>
<table>
<tr>
   <td align="center">
           There is no book registered.
   </td>
</table>

<%} else {%>
<table> 
    <tr height="30" bgcolor="<%=value_c%>"> 
      <td align="center"  width="30">Number</td> 
      <td align="center"  width="30">Category</td> 
      <td align="center"  width="100">Book name</td>
      <td align="center"  width="50">List price</td> 
      <td align="center"  width="50">Quantity</td> 
      <td align="center"  width="70">Author</td>
      <td align="center"  width="70">Publisher</td>
      <td align="center"  width="50">Publishing date</td>
      <td align="center"  width="50">Image</td>
      <td align="center"  width="30">Discount rate</td>
      <td align="center"  width="70">registered date</td>
      <td align="center"  width="50">edit</td>
      <td align="center"  width="50">delete</td>         
    </tr>
<%  
    for (int i = 0 ; i <bookList.size() ; i++) {
      ShopBookDataBean book = 
    		  (ShopBookDataBean)bookList.get(i);
%>
   <tr height="30">
      <td width="30"><%=++number%></td> 
      <td width="30"><%=book.getBook_kind()%></td> 
      <td width="100" align="left">
           <%=book.getBook_title()%></td>
      <td width="50" align="right"><%=book.getBook_price()%></td> 
      <td width="50" align="right">
      <% if(book.getBook_count()==0) {%>
         <font color="red"><%="out of stack"%></font>
      <% }else{ %>
         <%=book.getBook_count()%>
      <%} %>
      </td> 
      <td width="70"><%=book.getAuthor()%></td>
      <td width="70"><%=book.getPublishing_com()%></td>
      <td width="50"><%=book.getPublishing_date()%></td>
      <td width="50"><%=book.getBook_image()%></td>
      <td width="50"><%=book.getDiscount_rate()%></td>
      <td width="50"><%=sdf.format(book.getReg_date())%></td>
      <td width="50">
         <a href="bookUpdateForm.jsp?book_id=<%=book.getBook_id()%>&book_kind=<%=book.getBook_kind()%>">edit</a></td>
      <td width="50">
         <a href="bookDeleteForm.jsp?book_id=<%=book.getBook_id()%>&book_kind=<%=book.getBook_kind()%>">delete</a></td>    
   </tr>
<%}%>
</table>
<%}%>
<br>
<a href="../managerMain.jsp"> go to manager's main page</a> 
</body>
</html>

<% 
   }
}catch(Exception e){
   e.printStackTrace();
}
%>