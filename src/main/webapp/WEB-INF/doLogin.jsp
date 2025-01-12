<%-- 
    Document   : doLogin
    Created on : Jan 11, 2025, 3:35:24 PM
    Author     : acer
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    // Sample hardcoded credentials for demonstration
    String validUsername = "admin";
    String validPassword = "admin";
    
    // Retrieve form data
    String username = request.getParameter("Username");
    String password = request.getParameter("Password");
    
    // Validate credentials
    if (username != null && password != null && username.equals(validUsername) && password.equals(validPassword)) {
        // Redirect to dashboard if login is successful
        response.sendRedirect("../Dashboard.html");
    } else {
        // Display error message if login fails
        out.println("<html><body><h3>Invalid credentials. Please try again.</h3>");
        out.println("<a href='../Login.html'>Go back to login</a></body></html>");
    }
%>

