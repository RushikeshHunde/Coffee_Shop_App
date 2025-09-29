<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Coffee Corner | Display Orders</title>
  <link href="css/display.css" rel="stylesheet">
  <style>
    /* Basic styling for the body */
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f0e6d2; /* Softer background */
        color: #3e2723; /* Darker brown for text */
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

    /* Main container styling */
    .container {
        padding: 2rem;
        max-width: 1200px;
        margin: auto;
    }

    /* Order card styling */
    .order-card {
        background-color: white;
        padding: 25px;
        border-radius: 12px;
        box-shadow: 0 6px 15px rgba(0,0,0,0.1);
        margin-bottom: 2rem;
    }

    .order-header {
        border-bottom: 2px solid #e0e0e0;
        padding-bottom: 15px;
        margin-bottom: 20px;
    }

    .order-header h2 {
        margin: 0;
        font-size: 1.8rem;
        color: #5d4037;
    }

    .order-header p {
        margin: 5px 0 0;
        font-size: 0.9rem;
        color: #8d6e63;
    }

    /* Table styling */
    .order-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 15px;
    }
    
    .order-table th, .order-table td {
        text-align: left;
        padding: 12px;
        border-bottom: 1px solid #ddd;
    }

    .order-table th {
        background-color: #efdcd5;
        font-weight: bold;
        color: #3e2723;
    }

    .order-table tr:hover {
        background-color: #f7f3f0;
    }

    /* Total and button styling */
    .total-summary {
        text-align: right;
        font-weight: bold;
        margin-top: 15px;
        font-size: 1.2rem;
    }
    
    .secondary-btn {
        background-color: #6d4c41; /* Darker brown button */
        color: white;
        border: none;
        padding: 12px 25px;
        border-radius: 8px;
        font-weight: bold;
        cursor: pointer;
        transition: background-color 0.3s ease, transform 0.2s ease;
    }
    
    .receipt-button:hover {
        background-color: #4e342e; /* Even darker brown on hover */
        transform: translateY(-2px);
    }
    
    footer {
        background-color: #5d4037;
        color: white;
        text-align: center;
        padding: 1rem 0;
        position: relative;
        bottom: 0;
        width: 100%;
        margin-top: 2rem;
    }

    .message {
        text-align: center;
        font-size: 1.5rem;
        color: #5d4037;
        margin-top: 50px;
    }
  </style>
</head>
<body>

  <!-- Navbar -->
  <header>
    <h1>Coffee Corner ☕</h1>
    <nav>
      <a href="index.jsp">Home</a>
      <a href="menu.jsp">Menu</a>
      <a href="order.jsp">Order</a>
      <a href="Admin.jsp">Admin</a>
      <a href="contact.jsp">Contact</a>
    </nav>
  </header>

  <!-- Main Content -->
  <div class="container">
    <h1 style="text-align: center; color: #5d4037;">All Past Orders</h1>

    <%
      // Database connection details from the other files provided
      String dbUrl = "jdbc:mysql://localhost:3306/CoffeeShopDB";
      String dbUser = "root";
      String dbPassword = "#rushi@2183#";
      
      Connection con = null;
      PreparedStatement stmt = null;
      ResultSet rs = null;

      // Grouping all order items by a single order_id
      // This uses a nested Map to structure the data for display
      Map<String, Map<String, Object>> groupedOrders = new LinkedHashMap<>();

      try {
          Class.forName("com.mysql.cj.jdbc.Driver");
          con = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

          // SQL query to fetch all order items ordered by their order date and ID
          // The order_id field is now assumed to be a VARCHAR(36) to store UUIDs
          String sql = "SELECT order_id, item_name, item_quantity, item_total_price, order_date FROM orders ORDER BY order_date DESC, order_id DESC";
          stmt = con.prepareStatement(sql);
          rs = stmt.executeQuery();

          if (!rs.isBeforeFirst()) {
              out.println("<p class=\"message\">No orders have been placed yet.</p>");
          } else {
              while (rs.next()) {
                  String orderId = rs.getString("order_id");
                  String itemName = rs.getString("item_name");
                  int itemQuantity = rs.getInt("item_quantity");
                  double itemPrice = rs.getDouble("item_total_price");
                  Timestamp orderDate = rs.getTimestamp("order_date");

                  // Get or create the map for the current orderId
                  Map<String, Object> orderData = groupedOrders.getOrDefault(orderId, new HashMap<>());

                  // Initialize the list for items if it doesn't exist
                  List<Map<String, Object>> items = (List<Map<String, Object>>) orderData.getOrDefault("items", new ArrayList<>());
                  
                  // Add the current item to the list
                  Map<String, Object> item = new HashMap<>();
                  item.put("itemName", itemName);
                  item.put("itemQuantity", itemQuantity);
                  item.put("itemPrice", itemPrice);
                  items.add(item);
                  
                  // Update the total price for this order
                  double totalOrderPrice = (double) orderData.getOrDefault("totalPrice", 0.0);
                  totalOrderPrice += itemPrice;

                  // Store the updated data back into the order map
                  orderData.put("items", items);
                  orderData.put("totalPrice", totalOrderPrice);
                  orderData.put("orderDate", orderDate);
                  
                  // Put the order map back into the main grouped map
                  groupedOrders.put(orderId, orderData);
              }
              
              // Now iterate through the grouped orders to display them
              SimpleDateFormat dateFormat = new SimpleDateFormat("MMMM dd, yyyy 'at' hh:mm:ss a");
              
              for (Map.Entry<String, Map<String, Object>> entry : groupedOrders.entrySet()) {
                  String orderId = entry.getKey();
                  Map<String, Object> orderData = entry.getValue();
                  List<Map<String, Object>> items = (List<Map<String, Object>>) orderData.get("items");
                  double totalOrderPrice = (double) orderData.get("totalPrice");
                  Timestamp orderDate = (Timestamp) orderData.get("orderDate");
                  String formattedDate = dateFormat.format(orderDate);
    %>

    <div class="order-card">
      <div class="order-header">
        <h2>Order ID: <%= orderId %></h2>
        <p>Date: <%= formattedDate %></p>
      </div>
      <table class="order-table">
        <thead>
          <tr>
            <th>Item Name</th>
            <th>Quantity</th>
            <th>Item Price</th>
          </tr>
        </thead>
        <tbody>
          <%
            // Loop through each item in the current order to display as a separate row
            for (Map<String, Object> item : items) {
          %>
          <tr>
            <td><%= item.get("itemName") %></td>
            <td><%= item.get("itemQuantity") %></td>
            <td>₹<%= String.format("%.2f", (double) item.get("itemPrice")) %></td>
          </tr>
          <% } %>
        </tbody>
      </table>
      <p class="total-summary">
        Grand Total: ₹<%= String.format("%.2f", totalOrderPrice) %>
      </p>
      <a href="PDFGeneratorServlet?orderId=<%= request.getParameter("orderId") %>">
        <button class="secondary-btn">Print Receipt</button>
      </a>
    </div>

    <%
          }
        }
      } catch (SQLException e) {
          out.println("<p class=\"message\">Error retrieving data: " + e.getMessage() + "</p>");
          e.printStackTrace();
      } finally {
          if (rs != null) try { rs.close(); } catch (SQLException e) {}
          if (stmt != null) try { stmt.close(); } catch (SQLException e) {}
          if (con != null) try { con.close(); } catch (SQLException e) {}
      }
    %>
  </div>

  <footer>
    <p>&copy; 2025 Coffee Corner. All Rights Reserved.</p>
  </footer>

</body>
</html>
