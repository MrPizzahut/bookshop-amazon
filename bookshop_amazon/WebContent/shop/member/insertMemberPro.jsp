<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "bookshop.shopping.CustomerDBBean" %>
<%@ page import = "bookshop.shopping.CustomerDataBean" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("utf-8");%>

<jsp:useBean id="member" scope="page" class="bookshop.shopping.CustomerDataBean">
   <jsp:setProperty name="member" property="*"/>
</jsp:useBean>
 
<%
    member.setReg_date(new Timestamp(System.currentTimeMillis()) );
	
	CustomerDBBean dbPro = CustomerDBBean.getInstance();
	
	
	int x=dbPro.confirmId(member.getId());
	if(x==1){
		out.println("<h2>"+member.getId()+" is already exist.</h2><p>");
		%>
		<a href="insertMember.jsp">go back</a>
		<%
	}else{
		dbPro.insertMember(member);
		out.println("<h2> your registration is completed.<br>your id is "+member.getId()+". welcome</h2><p>");
		%>
		<a href="../shopping/shopMain.jsp">Home</a>
		<%
	
	}
%>


    