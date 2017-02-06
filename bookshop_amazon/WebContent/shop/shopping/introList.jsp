<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "bookshop.master.ShopBookDBBean" %>
<%@ page import = "bookshop.master.ShopBookDataBean" %>
<%@ page import = "java.text.NumberFormat" %>

<%@ include file="../etc/color.jspf"%> 

<html>
<head>
<title>Book Shopping Mall</title>
<link href="../etc/style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="<%=bodyback_c%>">
<h3>new books</h3>
<%
  ShopBookDataBean bookLists[] = null;
  int number =0;
  String book_kindName="";
  
  ShopBookDBBean bookProcess = ShopBookDBBean.getInstance();
  for(int i=1; i<=3;i++){
	  bookLists = bookProcess.getBooks(i+"00",3);
     
     if(bookLists[0].getBook_kind().equals("100")){
	      book_kindName="literature";
     }else if(bookLists[0].getBook_kind().equals("200")){
	      book_kindName="forein languge";  
     }else if(bookLists[0].getBook_kind().equals("300")){
	      book_kindName="computer";
     }
%>
  <br><font size="+1"><b><%=book_kindName%> category's new books: 
  <a href="list.jsp?book_kind=<%=bookLists[0].getBook_kind()%>">show more</a>
  </b></font>
<%             
  for(int j=0;j<bookLists.length;j++){
%>
    <table > 
      <tr height="30" bgcolor="<%=value_c%>"> 
        <td rowspan="4"  width="100">
          <a href="bookContent.jsp?book_id=<%=bookLists[j].getBook_id()%>&book_kind=<%=bookLists[0].getBook_kind()%>">
             <img src="../../imageFile/<%=bookLists[j].getBook_image()%>" 
             border="0" width="60" height="90"></a></td> 
       <td width="350"><font size="+1"><b>
          <a href="bookContent.jsp?book_id=<%=bookLists[j].getBook_id()%>&book_kind=<%=bookLists[0].getBook_kind()%>">
              <%=bookLists[j].getBook_title() %></a></b></font></td> 
       <td rowspan="4" width="100">
          <%if(bookLists[j].getBook_count()==0){ %>
              <b>out of product</b>
          <%}else{ %>
               &nbsp;
          <%} %>
       </td>
     </tr>        
     <tr height="30" bgcolor="<%=value_c%>"> 
       <td width="350">Publishing company : <%=bookLists[j].getPublishing_com()%></td> 
     </tr>
     <tr height="30" bgcolor="<%=value_c%>"> 
       <td width="350">Author : <%=bookLists[j].getAuthor()%></td>
     </tr>
     <tr height="30" bgcolor="<%=value_c%>"> 
       <td width="350">list price :<%=NumberFormat.getInstance().format(bookLists[j].getBook_price())%>$<br>
                price : <b><font color="red">
       <%=NumberFormat.getInstance().format((int)(bookLists[j].getBook_price()*((double)(100-bookLists[j].getDiscount_rate())/100)))%>
            </font></b>$</td> 
     </tr> 
     </table>
     <br>
<%
  }
}
%>

</body>
</html>