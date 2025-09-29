package com.DBUtility;

import java.io.IOException;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/CurrentReceiptServlet")
public class CurrentReceiptServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/CoffeeShopDB";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "#rushi@2183#";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String orderId = request.getParameter("orderId");
        
        // --- Add this debug code ---
        System.out.println("Received orderId: " + orderId);
        
        if (orderId == null || orderId.isEmpty()) {
            System.out.println("Error: Order ID is null or empty. Cannot retrieve receipt.");
            request.setAttribute("errorMessage", "Order ID not found.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return; // Stop execution
        }
        // -------------------------

        List<Map<String, Object>> orderItems = new ArrayList<>();
        double totalPrice = 0.0;
        String orderDate = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                String sql = "SELECT item_name, item_quantity, item_total_price, order_date FROM orders WHERE order_id = ?";
                try (PreparedStatement ps = con.prepareStatement(sql)) {
                    ps.setString(1, orderId);
                    try (ResultSet rs = ps.executeQuery()) {
                        
                        // --- Add this debug code ---
                        boolean foundData = false;
                        // -------------------------
                        
                        while (rs.next()) {
                            Map<String, Object> item = new HashMap<>();
                            String itemName = rs.getString("item_name");
                            int itemQuantity = rs.getInt("item_quantity");
                            double itemTotalPrice = rs.getDouble("item_total_price");
                            
                            item.put("name", itemName);
                            item.put("quantity", itemQuantity);
                            item.put("pricePerUnit", itemTotalPrice / itemQuantity);
                            item.put("subtotal", itemTotalPrice);
                            orderItems.add(item);
                            
                            totalPrice += itemTotalPrice;
                            orderDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(rs.getTimestamp("order_date"));
                            
                            // --- Add this debug code ---
                            foundData = true;
                            System.out.println("Found item: " + itemName);
                            // -------------------------
                        }
                        
                        // --- Add this debug code ---
                        if (!foundData) {
                            System.out.println("No data found in the database for orderId: " + orderId);
                        }
                        // -------------------------
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
            return;
        }

        request.setAttribute("orderId", orderId);
        request.setAttribute("orderItems", orderItems);
        request.setAttribute("totalPrice", totalPrice);
        request.setAttribute("orderDate", orderDate);

        RequestDispatcher rd = request.getRequestDispatcher("current_receipt.jsp");
        rd.forward(request, response);
    }
}