<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Us</title>
<link href="css/contact.css" rel="stylesheet">
<style>
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #f0e6d2;
    color: #3e2723;
    margin: 0;
    padding: 0;
}

/* Header styling */
header {
    background-color: #5d4037;
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
    color: #f0e6d2;
}

/* Contact Section Styling */
.contact-container {
    max-width: 800px;
    margin: 2rem auto;
    padding: 2rem;
    background-color: white;
    border-radius: 12px;
    box-shadow: 0 8px 25px rgba(0,0,0,0.1);
    text-align: center;
}

.contact-container h2 {
    color: #5d4037;
    font-size: 2.5rem;
    margin-bottom: 1rem;
}

.contact-info {
    margin-bottom: 2rem;
    font-size: 1.1rem;
    line-height: 1.8;
}

.contact-info p strong {
    color: #5d4037;
}

/* Contact Form Styling */
.contact-form {
    display: flex;
    flex-direction: column;
    gap: 1rem;
    text-align: left;
}

.contact-form input,
.contact-form textarea {
    width: 100%;
    padding: 12px;
    border: 2px solid #ccc;
    border-radius: 8px;
    box-sizing: border-box;
    font-size: 1rem;
    color: #3e2723;
    background-color: #f9f6f0;
    transition: border-color 0.3s ease;
}

.contact-form input:focus,
.contact-form textarea:focus {
    border-color: #5d4037;
    outline: none;
}

.contact-form textarea {
    resize: vertical;
    min-height: 150px;
}

.contact-form button {
    background-color: #6d4c41;
    color: white;
    border: none;
    padding: 15px;
    border-radius: 8px;
    font-size: 1.2rem;
    font-weight: bold;
    cursor: pointer;
    transition: background-color 0.3s ease, transform 0.2s ease;
}

.contact-form button:hover {
    background-color: #4e342e;
    transform: translateY(-2px);
}

footer {
    background-color: #5d4037;
    color: white;
    text-align: center;
    padding: 1rem 0;
    margin-top: 2rem;
}

</style>
</head>
<body>
<header>
<h1>Coffee Corner ☕</h1>
<nav>
<a href="index.jsp">Home</a>
<a href="menu.jsp">Menu</a>
<a href="order.jsp">Order</a>
<a href="Admin.jsp">Admin</a>
<a href="contact.jsp">Contact</a>
<a href="Display.jsp">Display</a>
<a href="Customer Messages.jsp">Messages</a>
</nav>
</header>

<div class="contact-container">
    <h2>Contact Us</h2>
    <div class="contact-info">
        <p><strong>📍 Address:</strong> Coffee Corner, MG Road, Pune, India</p>
        <p><strong>📞 Phone:</strong> +91 98765 43210</p>
        <p><strong>✉️ Email:</strong> info@coffeecorner.com</p>
    </div>

    <!-- The form action is now set to the servlet URL and method is POST. -->
    <!-- The onsubmit handler has been removed to allow direct form submission. -->
    <form class="contact-form" action="MessageServlet" method="post">
      <!-- Added name attribute to input fields -->
      <input type="text" id="name" name="name" placeholder="Your Name" required>
      <input type="email" id="email" name="email" placeholder="Your Email" required>
      <input type="text" id="subject" name="subject" placeholder="Subject" required>
      <textarea id="message" name="message" placeholder="Your Message" required></textarea>
      <button type="submit">Send Message</button>
    </form>
</div>

<footer>
    <p>&copy; 2025 Coffee Corner. All Rights Reserved.</p>
</footer>
</body>
</html>
