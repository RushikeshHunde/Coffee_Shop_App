<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Successful!</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0e6d2;
            color: #3e2723;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            text-align: center;
        }
        .success-container {
            background-color: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.1);
            max-width: 500px;
            width: 90%;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        h1 {
            color: #5d4037;
            font-size: 2.5rem;
            margin-bottom: 10px;
        }
        p {
            font-size: 1.2rem;
            line-height: 1.6;
        }
        .icon {
            font-size: 4rem;
            color: #6d4c41;
            margin-bottom: 20px;
        }
        .button-group {
            margin-top: 30px;
            display: flex;
            gap: 15px;
            flex-wrap: wrap;
            justify-content: center;
        }
        .button-group a {
            text-decoration: none;
            display: inline-block;
            padding: 12px 25px;
            border-radius: 8px;
            font-weight: bold;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }
        .button-group .primary-btn {
            background-color: #6d4c41;
            color: white;
            border: 2px solid #6d4c41;
        }
        .button-group .primary-btn:hover {
            background-color: #4e342e;
            transform: translateY(-2px);
        }
        .button-group .secondary-btn {
            background-color: transparent;
            color: #6d4c41;
            border: 2px solid #6d4c41;
        }
        .button-group .secondary-btn:hover {
            background-color: #d7ccc8;
            transform: translateY(-2px);
        }
    </style>
</head>
<body>

    <div class="success-container">
        <span class="icon">✅</span>
        <h1>Order Placed!</h1>
        <p>Thank you for your order. We've successfully received it and our team is already preparing your coffee.</p>
        
        <div class="button-group">
    <a href="order.jsp" class="primary-btn">Place Another Order</a>
       <!--  <a href="CurrentReceiptServlet?orderId=<%= request.getParameter("orderId") %>" class="secondary-btn">View Receipt</a> -->
    <a href="PDFGeneratorServlet?orderId=<%= request.getParameter("orderId") %>" class="secondary-btn">Download PDF Receipt</a>
</div>
    </div>
</body>
</html>
