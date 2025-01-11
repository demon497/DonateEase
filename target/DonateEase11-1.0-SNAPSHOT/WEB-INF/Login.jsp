<%-- 
    Document   : Login
    Created on : Jul 15, 2024, 1:21:34 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form action="doLogin.jsp" method="POST"> 
            Username:<input tpye="text" name="Username"><br>
            Password:<input tpye="Password" name="Password"><br>
            <input type="submit"value="Login">
        </form>
    </body>
</html>
