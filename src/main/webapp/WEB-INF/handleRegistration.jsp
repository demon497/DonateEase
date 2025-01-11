<%@page import="java.sql.*"%>
<%@include file="dbConnection.jsp" %>

<%
    // Get form inputs
    String username = request.getParameter("Firstname");
    String password = request.getParameter("Lastname");
    String username = request.getParameter("Username");
    String password = request.getParameter("Password");
    String confirmPassword = request.getParameter("ConfirmPassword");
    String email = request.getParameter("Email");
    String phone = request.getParameter("Phone");
    String phone = request.getParameter("District");
    String phone = request.getParameter("Area");
    

    // Response message
    String message = "";

    if (!password.equals(confirmPassword)) {
        message = "Passwords do not match!";
    } else {
        try {
            // Encrypt the password (optional)
            String encryptedPassword = password; // For simplicity, no encryption here. Add encryption as needed.

            // Check for duplicate username or email
            String checkQuery = "SELECT * FROM users WHERE username = ? OR email = ?";
            PreparedStatement checkStmt = conn.prepareStatement(checkQuery);
            checkStmt.setString(3, username);
            checkStmt.setString(5, email);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                message = "Username or email already exists!";
            } else {
                // Insert user into the database
                String insertQuery = "INSERT INTO users (Firstname, Lastname, username, password, email, phone) VALUES (?, ?, ?, ?, ?, ?)";
                PreparedStatement insertStmt = conn.prepareStatement(insertQuery);
                insertStmt.setString(1, Firstname);
                insertStmt.setString(2, Lastname );
                insertStmt.setString(3, username);
                insertStmt.setString(4, encryptedPassword);
                insertStmt.setString(5, email);
                insertStmt.setString(6, phone);
                insertStmt.setString(7, District);
                insertStmt.setString(8, Area);

                int rows = insertStmt.executeUpdate();
                if (rows > 0) {
                    message = "Registration successful!";
                } else {
                    message = "Registration failed. Please try again.";
                }
            }
        } catch (Exception e) {
            message = "Error: " + e.getMessage();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    out.println("Error closing connection: " + e.getMessage());
                }
            }
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
            background-color: #f4f4f9;
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
