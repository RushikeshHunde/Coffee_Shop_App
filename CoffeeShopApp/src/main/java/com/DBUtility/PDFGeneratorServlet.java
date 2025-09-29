package com.DBUtility;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/PDFGeneratorServlet")
public class PDFGeneratorServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/CoffeeShopDB";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "#rushi@2183#"; // Replace with your actual password

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String orderId = request.getParameter("orderId");

        if (orderId == null || orderId.isEmpty()) {
            response.getWriter().println("<h1>Error: Order ID is missing.</h1>");
            return;
        }

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
                        while (rs.next()) {
                            Map<String, Object> item = new HashMap<>();
                            item.put("name", rs.getString("item_name"));
                            item.put("quantity", rs.getInt("item_quantity"));
                            item.put("subtotal", rs.getDouble("item_total_price"));
                            orderItems.add(item);

                            totalPrice += rs.getDouble("item_total_price");
                            orderDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(rs.getTimestamp("order_date"));
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h1>Error generating PDF:</h1><pre>" + e.getMessage() + "</pre>");
            return;
        }

        // Set response headers for PDF download
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=\"receipt_" + orderId + ".pdf\"");

        try {
            Document document = new Document();
            PdfWriter.getInstance(document, response.getOutputStream());
            document.open();

            // Add content to the PDF
            document.add(new Paragraph("Coffee Corner - Order Receipt"));
            document.add(new Paragraph("Order ID: " + orderId));
            document.add(new Paragraph("Date: " + orderDate));
            document.add(new Paragraph("\n"));

            PdfPTable table = new PdfPTable(4); // 4 columns for Name, Quantity, Price per Item, Subtotal
            table.addCell("Item");
            table.addCell("Quantity");
            table.addCell("Price per Item");
            table.addCell("Subtotal");

            for (Map<String, Object> item : orderItems) {
                double subtotal = (double) item.get("subtotal");
                int quantity = (int) item.get("quantity");
                double pricePerUnit = subtotal / quantity;

                table.addCell((String) item.get("name"));
                table.addCell(String.valueOf(quantity));
                table.addCell(String.format("₹%.2f", pricePerUnit));
                table.addCell(String.format("₹%.2f", subtotal));
            }
            document.add(table);
            document.add(new Paragraph("\n"));
            document.add(new Paragraph("Total Price: ₹" + String.format("%.2f", totalPrice)));

            document.close();

        } catch (DocumentException e) {
            e.printStackTrace();
        }
    }
}