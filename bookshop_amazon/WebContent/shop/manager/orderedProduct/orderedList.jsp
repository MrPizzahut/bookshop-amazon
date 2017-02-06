<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "bookshop.shopping.BuyDataBean" %>
<%@ page import = "bookshop.shopping.BuyDBBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.NumberFormat" %>

<%@ include file="../../etc/color.jspf"%> 

<%
  String buyer = (String)session.getAttribute("id");
%>

<html>
<head>
<title>Book Shopping Mall</title>
<link href="../../etc/style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="<%=bodyback_c%>">
<%
List<BuyDataBean> buyLists = null;
BuyDataBean buyList = null; 
int count = 0;

BuyDBBean buyProcess = BuyDBBean.getInstance();
count = buyProcess.getListCount();

if(count == 0){
%>
  <h3><b>order list</b></h3>
  
  <table> 
    <tr><td>There is no order</td> </tr>
  </table>
  <a href="../managerMain.jsp"> go to manager's main page</a> 
<%
}else{
   buyLists = buyProcess.getBuyList();
%>
  <h3><b>order list</b></h3>
    <a href="../managerMain.jsp"> go to manager's main page</a>
  <table> 
    <tr> 
      <td>order number</td> 
      <td>user Id</td> 
      <td>book's title</td>
      <td>total price</td> 
      <td>quantity</td>
      <td>oder date </td>
      <td>account</td>
      <td>user Name</td>
      <td>phone number</td>
      <td>address</td>
      <td>condition</td>
   </tr>
<%
  for(int i=0;i<buyLists.size();i++){
    buyList = (BuyDataBean)buyLists.get(i);	     	 
%>
    <tr> 
      <td><%=buyList.getBuy_id() %></td> 
      <td><%=buyList.getBuyer() %></td> 
      <td><%=buyList.getBook_title() %></td>
      <td><%=buyList.getBuy_price() %></td> 
      <td><%=buyList.getBuy_count()%></td>
      <td><%=buyList.getBuy_date().toString() %></td>
      <td><%=buyList.getAccount() %></td>
      <td><%=buyList.getDeliveryName() %></td>
      <td><%=buyList.getDeliveryTel() %></td>
      <td><%=buyList.getDeliveryAddress() %></td>
      <td><%=buyList.getSanction() %></td>
    </tr>
<%}%>
</table>
<%}%>
</body>
</html>