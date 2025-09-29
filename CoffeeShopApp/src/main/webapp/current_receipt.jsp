<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Order Receipt</title>
    <style>
        /* Modern CSS for the receipt page (copy from the previous response) */
        body { font-family: 'Helvetica Neue', Arial, sans-serif; background-color: #f8f9fa; color: #333; display: flex; justify-content: center; align-items: center; min-height: 100vh; margin: 0; text-align: center; }
        .receipt-container { background-color: #fff; padding: 3rem 2.5rem; border-radius: 10px; box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08); max-width: 650px; width: 90%; display: flex; flex-direction: column; align-items: center; border: 1px solid #e9ecef; }
        h1 { color: #495057; font-size: 2.2rem; font-weight: 600; margin-bottom: 0.5rem; }
        .receipt-details { width: 100%; text-align: left; margin-top: 2rem; padding-bottom: 1.5rem; border-bottom: 2px solid #e9ecef; }
        .receipt-details p { font-size: 1rem; margin: 0.5rem 0; line-height: 1.5; }
        .receipt-details p strong { color: #495057; }
        table { width: 100%; border-collapse: collapse; margin-top: 1.5rem; font-size: 0.95rem; }
        th, td { padding: 1rem; text-align: left; border-bottom: 1px solid #dee2e6; }
        th { background-color: #f1f3f5; color: #495057; font-weight: 600; }
        tr:last-child td { border-bottom: none; }
        .total-price { font-size: 1.8rem; font-weight: 700; text-align: right; width: 100%; padding-top: 1.5rem; margin-top: 1.5rem; border-top: 2px dashed #adb5bd; color: #333; }
        .button-group { margin-top: 2.5rem; display: flex; gap: 1.5rem; flex-wrap: wrap; justify-content: center; }
        .button-group a { text-decoration: none; display: inline-block; padding: 12px 28px; border-radius: 5px; font-weight: 600; transition: all 0.3s ease; }
        .button-group .primary-btn { background-color: #007bff; color: white; border: 2px solid #007bff; }
        .button-group .primary-btn:hover { background-color: #0056b3; transform: translateY(-2px); box-shadow: 0 4px 10px rgba(0, 123, 255, 0.2); }
        .button-group .secondary-btn { background-color: #fff; color: #6c757d; border: 2px solid #ced4da; }
        .button-group .secondary-btn:hover { background-color: #e9ecef; transform: translateY(-2px); box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05); }
    </style>
</head>
<body>

    <div class="receipt-container">
        <h1>Your Receipt</h1>
        <div class="receipt-details">
            <p><strong>Order ID:</strong> <c:out value="${orderId}" /></p>
            <p><strong>Date:</strong> <c:out value="${orderDate}" /></p>
        </div>
        
        <table>
            <thead>
                <tr>
                    <th>Item</th>
                    <th>Quantity</th>
                    <th>Price Per Item</th>
                    <th>Subtotal</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${orderItems}">
                    <tr>
                        <td><c:out value="${item.name}" /></td>
                        <td><c:out value="${item.quantity}" /></td>
                        <td><fmt:formatNumber value="${item.pricePerUnit}" type="currency" currencySymbol="₹" /></td>
                        <td><fmt:formatNumber value="${item.subtotal}" type="currency" currencySymbol="₹" /></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
        <div class="total-price">
            Total Price: <fmt:formatNumber value="${totalPrice}" type="currency" currencySymbol="₹" />
        </div>
        
        <div class="button-group">
            <a href="Successfull.jsp?orderId=${orderId}" class="secondary-btn">Go Back</a>
            <a href="order.jsp" class="primary-btn">Place Another Order</a>
        </div>
    </div>
</body>
</html>