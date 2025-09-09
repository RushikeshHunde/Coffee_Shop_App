<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Coffee Corner | Display Orders</title>
  <link href = "css/display.css"  rel = "stylesheet">
  <style>
    .order-table {
      width: 80%;
      margin: 20px auto;
      border-collapse: collapse;
      box-shadow: 0 4px 10px rgba(0,0,0,0.1);
      border-radius: 10px;
      overflow: hidden;
    }
    .order-table th, .order-table td {
      border: 1px solid #ddd;
      padding: 12px;
      text-align: left;
    }
    .order-table th {
      background-color: #3e2723;
      color: white;
      text-transform: uppercase;
      letter-spacing: 1px;
    }
    .order-table tr:nth-child(even) {
      background-color: #f9f9f9;
    }
    .order-table th, .order-table td {
        white-space: nowrap;
    }
    @media (max-width: 768px) {
        .order-table {
            width: 95%;
            font-size: 12px;
        }
        .order-table th, .order-table td {
            padding: 8px;
        }
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
      <a href="contact.jsp">Contact</a>
      <a href="Display.jsp">Display</a>
    </nav>
  </header>

  <div class="container">
    <h2>All Placed Orders</h2>
    <table class="order-table">
      <thead>
        <tr>
          <th>Order ID</th>
          <th>Item Name</th>
          <th>Quantity</th>
          <th>Total Price</th>
          <th>Order Date</th>
        </tr>
      </thead>
      <tbody>
        <%
          Connection con = null;
          Statement stmt = null;
          ResultSet rs = null;

          try {
              String url = "jdbc:mysql://localhost:3306/CoffeeShopDB";
              String user = "root";
              String password = "#rushi@2183#";
              
              Class.forName("com.mysql.cj.jdbc.Driver");
              con = DriverManager.getConnection(url, user, password);

              stmt = con.createStatement();
              // Corrected query to select all required columns
              String sql = "SELECT order_id, item_name, item_quantity, item_total_price, order_date FROM orders ORDER BY order_date DESC";
              rs = stmt.executeQuery(sql);

              while (rs.next()) {
        %>
        <tr> 
          <td><%= rs.getInt("order_id") %></td>
          <td><%= rs.getString("item_name") %></td>
          <td><%= rs.getInt("item_quantity") %></td>
          <td>₹<%= String.format("%.2f", rs.getDouble("item_total_price")) %></td>
          <td><%= rs.getTimestamp("order_date") %></td>
        </tr>
        <%
              }
          } catch (SQLException e) {
              out.println("<tr><td colspan='6'>Error retrieving data: " + e.getMessage() + "</td></tr>");
              e.printStackTrace();
          } finally {
              if (rs != null) try { rs.close(); } catch (SQLException e) {}
              if (stmt != null) try { stmt.close(); } catch (SQLException e) {}
              if (con != null) try { con.close(); } catch (SQLException e) {}
          }
        %>
      </tbody>
    </table>
  </div>

  <footer>
    <p>&copy; 2025 Coffee Corner. All Rights Reserved.</p>
  </footer>
</body>
</html>