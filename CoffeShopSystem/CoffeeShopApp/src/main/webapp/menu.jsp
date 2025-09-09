<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Coffee Corner | Menu</title>
  <link href="css/menu.css" rel="stylesheet">
</head>
<body>
  <!-- Nav-bar -->
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

  <!-- Menu Section -->
  <section class="menu">
    <h2>Our Menu</h2>

    <!-- Hot Coffee -->
    <div class="category">
      <h3>Hot Coffee</h3>
      <div class="items">
        <div class="card">
          <img src="img/espresso.webp" alt="espresso">
          <h4>Espresso</h4>
          <p>₹120</p>
        </div>
        <div class="card">
          <img src="img/cappuccino.jpg" alt="Cappuccino">
          <h4>Cappuccino</h4>
          <p>₹150</p>
        </div>
        <div class="card">
          <img src="img/latte.png" alt="latte">
          <h4>Latte</h4>
          <p>₹170</p>
        </div>
      </div>
    </div>

    <!-- Cold Coffee -->
    <div class="category">
      <h3>Cold Coffee</h3>
      <div class="items">
        <div class="card">
          <img src="https://www.sharmispassions.com/wp-content/uploads/2020/02/iced-coffee-recipe1.jpg" alt="Cold Brew">
          <h4>cold coffee</h4>
          <p>₹50</p>
        </div>
        <div class="card">
          <img src="img/mojito.jpg" alt="mojito">
          <h4>Mojito</h4>
          <p>₹100</p>
        </div>
        <div class="card">
          <img src="C:\Users\MAHESH\Downloads\abhishek-hajare-BUJBMDJ-09A-unsplash.jpg"alt="Mocha Frappe">
          <h4>cold coffee with ice cream</h4>
          <p>₹200</p>
        </div>
      </div>
    </div>

    <!-- Snacks -->
    <div class="category">
      <h3>Snacks</h3>
      <div class="items">
        <div class="card">
          <img src="https://www.jagranimages.com/images/newimg/khanakhazana/02_2024-french_fries_recipe.webp" alt="Croissant">
          <h4>French_Fries</h4>
          <p>₹80</p>
        </div>
        <div class="card">
          <img src="https://recipesblob.oetker.in/assets/f7ea4ac65c534c1492d156dfac9db2ad/1272x764/sandwichetojpg.webp" alt="Sandwich">
          <h4>Sandwich</h4>
          <p>₹120</p>
        </div>
        <div class="card">
          <img src="https://b.zmtcdn.com/data/pictures/chains/0/18401590/f1413f56508b7a90773d45db1a7d5a72.jpg?fit=around|960:500&crop=960:500;*,*" alt="Muffin">
          <h4>Veg_Pizza</h4>
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
    