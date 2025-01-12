<%-- 
    Document   : requestDispatcher
    Created on : Jan 12, 2025, 4:56:57?AM
    Author     : acer
--%>

<%@page import="javax.servlet.*" %>
<%@page import="java.io.*" %>
<%
    RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/yourFile.jsp");
    rd.forward(request, response);
%>
