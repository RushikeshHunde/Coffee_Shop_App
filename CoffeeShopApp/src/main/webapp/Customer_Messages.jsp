<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.UUID" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Customer Messages</title>
<style>

margin: 0;
padding: 0;
}

    /* Header styling */
    header {
        background-color: #5d4037; /* A deeper, richer brown */
        color: white;
        text-align: center;
        padding: 1rem 0;
        box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 1rem 2rem;
    }
    
    header h1 {
        margin: 0;
        font-size: 2.5rem;
    }

    /* Navbar styling */
    nav {
        display: flex;
        gap: 1.5rem;
    }
    
    nav a {
        color: white;
        text-decoration: none;
        font-weight: bold;
        font-size: 1.1rem;
        transition: color 0.3s ease;
    }
    
    nav a:hover {
        color: #d7ccc8; /* Lighter brown on hover */
    }

    /* Main content container */
    .container {
        padding: 2rem;
        max-width: 1000px;
        margin: auto;
    }
    
    .messages-table {
        width: 100%;
        border-collapse: collapse;
        background-color: white;
        border-radius: 12px;
        overflow: hidden;
        box-shadow: 0 6px 15px rgba(0,0,0,0.1);
    }
    
    .messages-table th, .messages-table td {
        text-align: left;
        padding: 15px;
        border-bottom: 1px solid #ddd;
    }
    
    .messages-table th {
        background-color: #efdcd5;
        font-weight: bold;
        color: #3e2723;
    }
    
    .messages-table tr:hover {
        background-color: #f7f3f0;
    }
    
    footer {
        background-color: #5d4037;
        color: white;
        text-align: center;
        padding: 1rem 0;
        margin-top: 2rem;
    }
    
    .message-row td:last-child {
        max-width: 400px;
        word-wrap: break-word;
    }
    
    .empty-message {
        text-align: center;
        font-size: 1.2rem;
        color: #8d6e63;
        margin-top: 50px;
    }
</style>

</head>
<body>
<header>
<h1>Coffee Corner ☕</h1>
<nav>
<a href="index.jsp">Home</a>
<a href="menu.jsp">Menu</a>
<a href="order.jsp">Order</a>
<a href="Admin.jsp">Admin</a>
<a href="contact.jsp">Contact</a>
<a href="Display.jsp">Display</a>
<a href="Customer_message.jsp">Messages</a>
</nav>
</header>

<div class="container">
    <h1 style="text-align: center; color: #5d4037; margin-bottom: 30px;">Customer Messages</h1>

    <%
        // Database connection details
        String dbUrl = "jdbc:mysql://localhost:3306/CoffeeShopDB";
        String dbUser = "root";
        String dbPassword = "#rushi@2183#";
        
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

            String sql = "SELECT id, name, email, message, timestamp FROM customer_messages ORDER BY timestamp DESC";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            if (!rs.isBeforeFirst()) {
                out.println("<p class=\"empty-message\">No messages have been submitted yet.</p>");
            } else {
    %>
    <table class="messages-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Date</th>
                <th>Message</th>
            </tr>
        </thead>
        <tbody>
            <% 
                SimpleDateFormat dateFormat = new SimpleDateFormat("MMM dd, yyyy HH:mm");
                while (rs.next()) {
            %>
            <tr class="message-row">
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("name") %></td>
                <td><%= rs.getString("email") %></td>
                <td><%= dateFormat.format(rs.getTimestamp("timestamp")) %></td>
                <td><%= rs.getString("message") %></td>
            </tr>
            <%
                } // end of while loop
            %>
        </tbody>
    </table>
    <%
            } // end of else block for empty result set
        } catch (SQLException e) {
            out.println("<p class=\"empty-message\">Error retrieving messages: " + e.getMessage() + "</p>");
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            out.println("<p class=\"empty-message\">Database driver not found: " + e.getMessage() + "</p>");
            e.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) {}
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
            if (con != null) try { con.close(); } catch (SQLException e) {}
        }
    %>
</div>

<footer>
    <p>&copy; 2025 Coffee Corner. All Rights Reserved.</p>
</footer>

</body>
</html>