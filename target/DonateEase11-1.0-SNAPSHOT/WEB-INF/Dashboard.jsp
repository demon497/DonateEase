<%-- 
    Document   : Dashboard
    Created on : Jan 11, 2025, 1:04:10 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .container {
            display: flex;
            flex: 1;
            flex-direction: column;
        }

        .header {
            background-color: #4CAF50;
            color: white;
            text-align: center;
            padding: 1rem;
        }

        .sidebar {
            background-color: #333;
            color: white;
            padding: 1rem;
            width: 200px;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            overflow-y: auto;
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .sidebar ul li {
            margin: 1rem 0;
        }

        .sidebar ul li a {
            color: white;
            text-decoration: none;
            display: block;
            padding: 0.5rem 0.75rem;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        .sidebar ul li a:hover {
            background-color: #575757;
        }

        .main-content {
            margin-left: 200px;
            padding: 1rem;
            flex: 1;
        }

        .cards {
            display: flex;
            gap: 1rem;
            flex-wrap: wrap;
        }

        .card {
            background-color: #f1f1f1;
            padding: 1rem;
            border: 1px solid #ddd;
            border-radius: 8px;
            flex: 1;
            text-align: center;
            min-width: 200px;
            max-width: calc(33.33% - 1rem);
            box-sizing: border-box;
        }

        .footer {
            background-color: #4CAF50;
            color: white;
            text-align: center;
            padding: 1rem;
            position: relative;
            width: 100%;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .sidebar {
                position: relative;
                width: 100%;
                height: auto;
            }

            .main-content {
                margin-left: 0;
                margin-top: 1rem;
            }

            .cards .card {
                max-width: 100%;
            }
        }

        @media (max-width: 480px) {
            .header, .footer {
                text-align: center;
                font-size: 1rem;
            }

            .sidebar ul li {
                margin: 0.5rem 0;
            }

            .cards {
                gap: 0.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <header class="header">
            <h1>Dashboard</h1>
        </header>
        <nav class="sidebar">
            <ul>
                <li><a href="#">Home</a></li>
                <li><a href="#">Profile</a></li>
                <li><a href="#">Settings</a></li>
                <li><a href="#">Logout</a></li>
            </ul>
        </nav>
        <main class="main-content">
            <section class="cards">
                <div class="card">
                    <h2>Card 1</h2>
                    <p>Some content for card 1.</p>
                </div>
                <div class="card">
                    <h2>Card 2</h2>
                    <p>Some content for card 2.</p>
                </div>
                <div class="card">
                    <h2>Card 3</h2>
                    <p>Some content for card 3.</p>
                </div>
            </section>
        </main>
        <footer class="footer">
            <p>&copy; 2024 Dashboard</p>
        </footer>
    </div>
    <%
        String user = (String) session.getAttribute("User");
        String pass = (String) session.getAttribute("Pass");

        out.println(user);
        out.println(pass);
    %>
</body>
</html>
