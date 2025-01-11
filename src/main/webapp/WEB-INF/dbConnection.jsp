<%@page import="java.sql.*"%>
<%
    String dbURL = "jdbc:mysql://localhost:3306/donateease";
    String dbUser = "root"; // Replace with your MySQL username
    String dbPassword = "password"; // Replace with your MySQL password

    Connection conn = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbURL, dbregister, dbPassword);
    } catch (Exception e) {
        out.println("Database connection error: " + e.getMessage());
    }
    if (conn != null) {
    out.println("<p>Database connected successfully!</p>");
}
%>
