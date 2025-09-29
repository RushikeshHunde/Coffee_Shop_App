<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Coffee Corner | Order</title>
  <link href="css/order.css" rel="stylesheet">
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

  <!-- Order Section -->
 <div class="container">
        <div class="menu">
            <h2>Our Menu</h2>
            <div class="item" onclick="addToCart('espresso', 120)">
                <span>Espresso</span>
                <span>₹120</span>
                <button>Add</button>
            </div>
            <div class="item" onclick="addToCart('cappuccino', 150)">
                <span>Cappuccino</span>
                <span>₹150</span>
                <button>Add</button>
            </div>
            <div class="item" onclick="addToCart('latte', 170)">
                <span>Latte</span>
                <span>₹170</span>
                <button>Add</button>
            </div>
            <div class="item" onclick="addToCart('cold coffee', 180)">
                <span>Cold Coffee</span>
                <span>₹180</span>
                <button>Add</button>
            </div>
            <div class="item" onclick="addToCart('breve', 190)">
                <span>Breve Coffee</span>
                <span>₹190</span>
                <button>Add</button>
            </div>
            <div class="item" onclick="addToCart('mocha', 200)">
                <span>Mocha</span>
                <span>₹200</span>
                <button>Add</button>
            </div>
            <div class="item" onclick="addToCart('berry smoothie', 100)">
                <span>Berry Smoothie</span>
                <span>₹100</span>
                <button>Add</button>
            </div>
            <div class="item" onclick="addToCart('banana smoothie', 80)">
                <span>Banana Smoothie</span>
                <span>₹100</span>
                <button>Add</button>
            </div>
            <div class="item" onclick="addToCart('strawberry smoothie', 120)">
                <span>Strawberry Smoothie</span>
                <span>₹100</span>
                <button>Add</button>
            </div>
        </div>
        <div class="cart">
            <h2>Your Cart</h2>
            <ul id="cartItems" class="cart-items">
                <!-- Cart items will be displayed here dynamically -->
            </ul>
            <hr>
            <div class="total">
                <span>Total: ₹</span><span id="totalAmount">0</span>
            </div>
            <form action="OrderServlet" method="post" id="checkoutForm">
                <input type="hidden" name="cartData" id="cartData">
                <button type="submit" style="width: 100%; padding: 10px; margin-top: 20px;">Checkout</button>
            </form>
        </div>
    </div>
    
  <footer>
    <p>&copy; 2025 Coffee Corner. All Rights Reserved.</p>
  </footer>
  
  <script src="js/order.js"></script>
  
</body>
</html>
