<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "bookshop.shopping.CartDataBean" %>
<%@ page import = "bookshop.shopping.CartDBBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.NumberFormat" %>

<%@ include file="../etc/color.jspf"%>

<%
 String book_kind = request.getParameter("book_kind");
 String buyer = (String)session.getAttribute("id");
%>

<html>
<head>
<title>Book Shopping Mall</title>
<link href="../etc/style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="<%=bodyback_c%>">
<%
List<CartDataBean> cartLists = null;
CartDataBean cartList = null;
int count = 0;
int number = 0;
int total = 0;

if(session.getAttribute("id")==null){
   response.sendRedirect("shopMain.jsp");        
}else{
   CartDBBean bookProcess = CartDBBean.getInstance();
   count = bookProcess.getListCount(buyer);

   if(count == 0){
%>
   <h3><b>cart</b></h3>
   <table> 
     <tr><td >There is no item in the cart.</td> </tr>
   </table>
     <input type="button" value="keep shopping" 
     onclick="javascript:window.location='list.jsp?book_kind=<%=book_kind%>'">
<%
   }else{
     cartLists = bookProcess.getCart(buyer);
 %>
   <h3><b>cart</b></h3>
   <form name="cartform">
   <table> 
     <tr> 
       <td width="50">Number</td> 
       <td width="300">Book name</td> 
       <td width="100">list price</td>
       <td width="150">quantity</td> 
       <td width="150">price</td>
     </tr>
      
<%
   for(int i=0;i<cartLists.size();i++){
     cartList = (CartDataBean)cartLists.get(i);
%>
     
     <tr> 
       <td width="50"><%=++number %></td> 
       <td  width="300" align="left">
         <img src="../../imageFile/<%=cartList.getBook_image()%>" 
             border="0" width="30" height="50" align="middle">
             <%=cartList.getBook_title()%>
       </td> 
       <td width="100"><%=NumberFormat.getInstance().format(cartList.getBuy_price())%></td>
       <td width="150">
          <input type="text" name="buy_count" size="5" value="<%=cartList.getBuy_count()%>">
          <% 
          String url = "updateCartForm.jsp?cart_id="+cartList.getCart_id()+
            "&book_kind="+book_kind + "&buy_count="+cartList.getBuy_count();
          
          %>
          <input type="button" value="edit"
            onclick="javascript:window.location='<%=url%>'">
       </td> 
       <td align="center"  width="150">
          <%total += cartList.getBuy_count()*cartList.getBuy_price();%>
            <%=NumberFormat.getInstance().format(cartList.getBuy_count()*cartList.getBuy_price()) %>
          <input type="button" value="delete" 
            onclick="javascript:window.location=
            'cartListDel.jsp?list=<%=cartList.getCart_id()%>&book_kind=<%=book_kind%>'">
       </td>
     </tr>
<%}%>
     <tr>
       <td colspan="5" align="right"><b>total price : <%=NumberFormat.getInstance().format(total)%></b></td>
     </tr>
     <tr>
       <td colspan="5">
         <input type="button" value="buy" 
            onclick="javascript:window.location='buyForm.jsp'">
         <input type="button" value="keep shopping" 
            onclick="javascript:window.location='list.jsp?book_kind=<%=book_kind%>'">
         <input type="button" value="empty the cart" 
            onclick="javascript:window.location='cartListDel.jsp?list=all&book_kind=<%=book_kind%>'">
       </td>
     </tr>
   </table>
   </form>
<%
  } 
}
%>
</body>
</html>