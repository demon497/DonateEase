<%-- 
    Document   : dologin
    Created on : Jan 11, 2025, 3:35:24 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <div class="content">
    <h2>Welcome Back!</h2>
    <p>Enter your credentials to login and make a difference.</p>
    <form action="doLogin.jsp" method="POST" class="login-form" onsubmit="return validateForm()">
        <label for="Username">Username:</label>
        <input type="text" id="Username" name="Username" required><br>

        <label for="Password">Password:</label>
        <input type="password" id="Password" name="Password" required><br>

        <input type="submit" value="Login">
    </form>
    <p>Don't have an account? <a href="register.html">Register here</a></p>
</div>

<script>
    function validateForm() {
        var username = document.getElementById("Username").value;
        var password = document.getElementById("Password").value;

        // Check if username and password are not empty
        if (username == "") {
            alert("Username is required!");
            return false;
        }

        if (password == "") {
            alert("Password is required!");
            return false;
        }

        // Check password length (example: at least 6 characters)
        if (password.length < 6) {
            alert("Password must be at least 6 characters long!");
            return false;
        }

        // If all validations pass, return true
        return true;
    }
</script>
</html>
