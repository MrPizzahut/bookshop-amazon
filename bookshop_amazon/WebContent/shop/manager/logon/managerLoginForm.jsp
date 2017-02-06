<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<title>sign in</title>
</head>
<body>
  <h2>sing form</h2>
    
    <form method="post" action="managerLoginPro.jsp">
        Id: <input type="text" name="id" maxlength="50" 
               style="ime-mode:inactive;"><br>
  Password: <input type="password" name="passwd" maxlength="16"
               style="ime-mode:inactive;"><br>
         <input type="submit" value="sing in">
    </form>
</body>
</html>