<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "bookshop.master.ShopBookDBBean" %>
<%@ page import = "bookshop.master.ShopBookDataBean" %>
<%@ page import = "java.text.NumberFormat" %>

<%@ include file="../etc/color.jspf"%> 

<%
 String book_kind = request.getParameter("book_kind");
 String book_id = request.getParameter("book_id");
 String id = "";
 int buy_price=0;
 try{
   if(session.getAttribute("id")==null)
     id="not";
   else
     id= (String)session.getAttribute("id");    
}catch(Exception e){}
%>

<html>
<head>
<title>Book Shopping Mall</title>
<link href="../etc/style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="<%=bodyback_c%>">
<%
ShopBookDataBean bookList = null;
String book_kindName="";
  
ShopBookDBBean bookProcess = ShopBookDBBean.getInstance();
 
bookList = bookProcess.getBook(Integer.parseInt(book_id));
     
if(book_kind.equals("100"))
	book_kindName="literature";
else if(book_kind.equals("200"))
	book_kindName="foreign language";  
else if(book_kind.equals("300"))
	book_kindName="computer";

%>
<form name="inform" method="post" action="cartInsert.jsp">
<table> 
   <tr height="30"> 
     <td rowspan="6"  width="150">
        <img src="../../imageFile/<%=bookList.getBook_image()%>" 
             border="0" width="150" height="200"></td> 
     <td width="500"><font size="+1">
       <b><%=bookList.getBook_title() %></b></font></td>
   </tr> 
   <tr><td width="500">Author : <%=bookList.getAuthor()%></td></tr>
   <tr><td width="500">Publishing company : <%=bookList.getPublishing_com()%></td></tr> 
   <tr><td width="500">Publishing date : <%=bookList.getPublishing_date()%></td></tr>
   <tr><td width="500">list price : <%=NumberFormat.getInstance().format(bookList.getBook_price())%>$<br>
      <%buy_price = (int)(bookList.getBook_price()*((double)(100-bookList.getDiscount_rate())/100)) ;%>
        price : <b><font color="red">
            <%=NumberFormat.getInstance().format((int)(buy_price))%>$
            </font></b></td> 
   <tr><td width="500">amount : <input type="text" size="5"name="buy_count" value="1"> 
 <%
   if(id.equals("not")){
     if(bookList.getBook_count()==0){
 %>
        <b>out of stack</b>
<%  
     }           
  }else{ 
     if(bookList.getBook_count()==0){
%>
         <b>out of stack</b>
                           
<%   }else{ %>	 
       <input type="hidden" name="book_id" value="<%=book_id %>">
       <input type="hidden" name="book_image" value="<%=bookList.getBook_image()%>">
       <input type="hidden" name="book_title" value="<%=bookList.getBook_title() %>">
       <input type="hidden" name="buy_price" value="<%=buy_price %>">
       <input type="hidden" name="book_kind" value="<%=book_kind %>">              
       <input type="submit" value="put in cart">
<%}}%>
   <input type="button" value="go to the list" 
     onclick="javascript:window.location='list.jsp?book_kind=<%=book_kind%>'">
   <input type="button" value="go to main" 
     onclick="javascript:window.location='shopMain.jsp'">
   </td>
  </tr>         
  <tr>
    <td colspan="2" align="left">
       <br><%=bookList.getBook_content()%></td>
  </tr> 
</table>
</form>
</body>
</html>