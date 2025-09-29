package com.DBUtility;

import java.io.IOException;
  
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.UUID;

import org.json.JSONArray;
import org.json.JSONObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection details
    private static final String DB_URL = "jdbc:mysql://localhost:3306/CoffeeShopDB";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String cartDataJson = request.getParameter("cartData");

        if (cartDataJson == null || cartDataJson.isEmpty()) {
            response.getWriter().println("<h1>Error: Cart data is empty.</h1>");
            return;
        }

        // Generate a single UUID to serve as the order_id for all items in this order
        String orderId = UUID.randomUUID().toString();

        try {
            // Explicitly load the MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Use a Connection and PreparedStatement with try-with-resources for automatic closing
            try (Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                // SQL query to insert data into the 'orders' table
                String sql = "INSERT INTO orders (order_id, item_name, item_quantity, item_total_price) VALUES (?, ?, ?, ?)";

                try (PreparedStatement ps = con.prepareStatement(sql)) {
                    JSONArray cartArray = new JSONArray(cartDataJson);

                    for (int i = 0; i < cartArray.length(); i++) {
                        JSONObject cartItem = cartArray.getJSONObject(i);

                        String itemName = cartItem.getString("item");
                        int itemQuantity = cartItem.getInt("quantity");
                        double itemPrice = cartItem.getDouble("price");
                        double itemTotalPrice = itemPrice * itemQuantity;

                        // Set the parameters for the prepared statement
                        ps.setString(1, orderId); // Use the same orderId for all items
                        ps.setString(2, itemName);
                        ps.setInt(3, itemQuantity);
                        ps.setDouble(4, itemTotalPrice);

                        ps.addBatch();
                    }

                    ps.executeBatch();
                }

                // After executing the batch, redirect to the new success page, passing the orderId
                response.sendRedirect("Successfull.jsp?orderId=" + orderId);

            }
        } catch (SQLException | ClassNotFoundException | org.json.JSONException e) {
            e.printStackTrace();
            response.getWriter().println("<h1>Error processing your order:</h1><pre>" + e.getMessage() + "</pre>");
        }
    }
}

