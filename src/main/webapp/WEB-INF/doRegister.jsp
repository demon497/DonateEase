<%@page import="java.sql.*"%>
<%
    // Database connection parameters
    String dbURL = "jdbc:mysql://localhost:3306/donateease";
    String dbUser = "root";
    String dbPassword = "your_password"; // Replace with your actual MySQL password

    // Form data from the request
    String firstname = request.getParameter("Firstname");
    String lastname = request.getParameter("Lastname");
    String username = request.getParameter("Username");
    String password = request.getParameter("Password");
    String email = request.getParameter("Email");
    String phone = request.getParameter("Phone");
    String district = request.getParameter("District");
    String area = request.getParameter("Area");

    // Initialize response message
    String message = "";

    // Database connection and operations
    Connection conn = null;
    PreparedStatement insertStmt = null;

    try {
        // Load JDBC driver (optional for modern JDBC)
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish the connection
        conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

        // Insert query to add data into the `register` table
        String insertQuery = "INSERT INTO register (Firstname, Lastname, Username, Password, Email, Phone, District, Area) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        insertStmt = conn.prepareStatement(insertQuery);
        insertStmt.setString(1, firstname);
        insertStmt.setString(2, lastname);
        insertStmt.setString(3, username);
        insertStmt.setString(4, password); // Store passwords securely in production
        insertStmt.setString(5, email);
        insertStmt.setString(6, phone);
        insertStmt.setString(7, district);
        insertStmt.setString(8, area);

        // Execute the query
        int rowsAffected = insertStmt.executeUpdate();
        if (rowsAffected > 0) {
            message = "Registration successful!";
        } else {
            message = "Registration failed. Please try again.";
        }
    } catch (SQLIntegrityConstraintViolationException e) {
        // Handle unique constraint violations (e.g., duplicate username or email)
        message = "Error: Username or Email already exists!";
    } catch (Exception e) {
        // Handle general exceptions
        message = "Error: " + e.getMessage();
    } finally {
        // Close resources
        try {
            if (insertStmt != null) insertStmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            out.println("Error closing connection: " + e.getMessage());
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Status</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            padding: 2rem;
            background-color: #f9f9f9;
        }
        .message {
            font-size: 1.5rem;
            color: #333;
        }
        .success {
            color: #4CAF50;
        }
        .error {
            color: #e74c3c;
        }
        a {
            text-decoration: none;
            color: #4CAF50;
        }
    </style>
</head>
<body>
    <div class="message <%=message.contains("successful") ? "success" : "error" %>">
        <%=message %>
    </div>
    <a href="Register.html">Go Back</a>
</body>
</html>
