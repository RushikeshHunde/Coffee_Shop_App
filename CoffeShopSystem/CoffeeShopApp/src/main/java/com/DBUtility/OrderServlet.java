package com.DBUtility;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
    private static final String DB_PASSWORD = "#rushi@2183#"; // Ensure this is the correct password from your Display.jsp

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get the JSON string of cart data from the hidden input field
        String cartDataJson = request.getParameter("cartData");

        // Use a Connection and PreparedStatement with try-with-resources for automatic closing
        try (Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            // SQL query to insert data into the 'orders' table
            String sql = "INSERT INTO orders (item_name, item_quantity, item_total_price) VALUES (?, ?, ?)";

            // Set up the prepared statement to prevent SQL injection
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                // Parse the JSON data
                JSONArray cartArray = new JSONArray(cartDataJson);

                // Loop through each item in the cart
                for (int i = 0; i < cartArray.length(); i++) {
                    JSONObject cartItem = cartArray.getJSONObject(i);

                    String itemName = cartItem.getString("item");
                    int itemQuantity = cartItem.getInt("quantity");
                    double itemPrice = cartItem.getDouble("price");
                    double itemTotalPrice = itemPrice * itemQuantity;

                    // Set the parameters for the prepared statement
                    ps.setString(1, itemName);
                    ps.setInt(2, itemQuantity);
                    ps.setDouble(3, itemTotalPrice);

                    // Add the current set of parameters to the batch
                    ps.addBatch();
                }

                // Execute the batch insertion
                ps.executeBatch();
            }

            // Redirect to the Display.jsp page after the data is successfully saved
            response.sendRedirect("Display.jsp");

        } catch (SQLException | org.json.JSONException e) {
            // Handle any database or JSON parsing errors
            e.printStackTrace();
            response.getWriter().println("<h1>Error processing your order:</h1><pre>" + e.getMessage() + "</pre>");
        }
    }
}
