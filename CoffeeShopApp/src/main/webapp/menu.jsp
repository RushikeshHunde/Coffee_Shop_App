<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Coffee Corner | Menu</title>
  <link href="css/menu.css?v=<%= System.currentTimeMillis() %>" rel="stylesheet">
</head>
<body>
  <!-- Navbar -->
  <header>
    <h1>Coffee Corner ☕</h1>
    <nav>
      <a href="index.jsp">Home</a>
      <a href="menu.jsp">Menu</a>
      <a href="order.jsp">Order</a>
      <a href="contact.jsp">Contact</a>
    </nav>
  </header>

  <!-- Menu Section -->
  <section class="menu">
    <h2>Our Menu</h2>

    <!-- Hot Coffee -->
    <div class="category">
      <h3>Coffees</h3>
      <div class="items">
        <div class="card">
          <img src="https://cdn.shopify.com/s/files/1/0365/4293/9273/files/Difference_Between_Espresso_and_Coffee_-_what_is_espresso.png?v=1716987756" alt="Espresso">
          <h4>Espresso</h4>
          <p>₹120</p>
        </div>
        <div class="card">
          <img src="https://lorcoffee.com/cdn/shop/articles/Cappuccino-exc.jpg?v=1684870907" alt="Cappuccino">
          <h4>Cappuccino</h4>
          <p>₹150</p>
        </div>
        <div class="card">
          <img src="https://skydecklounge.in/wp-content/uploads/2022/01/Cafe-Latte-Coffee.jpg" alt="Latte">
          <h4>Latte</h4>
          <p>₹170</p>
        </div>
      </div>
    </div>

    <!-- Cold Coffee -->
    <div class="category">
      <div class="items">
        <div class="card">
          <img src="https://www.sharmispassions.com/wp-content/uploads/2020/02/iced-coffee-recipe1.jpg" alt="Cold Brew">
          <h4>cold coffee</h4>
          <p>₹70</p>
        </div>
        <div class="card">
          <img src="img/breve.jpeg" alt="breve">
          <h4>Breve coffee</h4>
          <p>₹50</p>
        </div>
        <div class="card">
          <img src="img/mocha.png"alt="mocha">
          <h4>Mocha</h4>
          <p>₹200</p>
        </div>
      </div>
    </div>

    <!-- Snacks -->
    <div class="category">
      <h3>Smoothies</h3>
      <div class="items">
        <div class="card">
          <img src="img/berry_smoothie.jpeg" alt="berry_smoothie">
          <h4>Berry_Smoothie</Ice-Cream></h4>
          <p>₹100</p>
        </div>
        <div class="card">
          <img src="img/banana_smoothie.jpeg" alt="banana_smoothie">
          <h4>Banana_Smoothie</h4>
          <p>₹100</p>
        </div>
        <div class="card">
          <img src="img/strawberry_smoothie.jpeg" alt="strawberry_smoothie">
          <h4>Strawberry_Smoothie</h4>
          <p>₹100</p>
        </div>
      </div>
    </div>
  </section>

  <!-- Footer -->
  <footer>
    <p>&copy; 2025 Coffee Corner. All Rights Reserved.</p>
  </footer>
</body>
</html>
    