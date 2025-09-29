<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Coffee Corner | Contact Us</title>
<link href="css/contact.css" rel="stylesheet">
<style>
/* General body styling /
body {
font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
background-color: #f0e6d2; / Softer background /
color: #3e2723; / Darker brown for text */
margin: 0;
padding: 0;
display: flex;
flex-direction: column;
min-height: 100vh;
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
        color: #d7ccc8;
    }

    /* Main content container */
    .contact-container {
        max-width: 800px;
        margin: 2rem auto;
        padding: 2rem;
        background-color: white;
        border-radius: 12px;
        box-shadow: 0 8px 25px rgba(0,0,0,0.1);
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 20px;
    }

    .contact-container h2 {
        color: #5d4037;
        font-size: 2rem;
        margin-bottom: 10px;
        border-bottom: 2px solid #6d4c41;
        padding-bottom: 10px;
    }

    .contact-info {
        text-align: center;
        line-height: 1.6;
    }

    .contact-info p {
        margin: 5px 0;
    }

    /* Form styling */
    .contact-form {
        width: 100%;
        display: flex;
        flex-direction: column;
        gap: 15px;
    }

    .contact-form input,
    .contact-form textarea {
        width: 100%;
        padding: 12px;
        border: 1px solid #ccc;
        border-radius: 8px;
        font-size: 1rem;
        color: #3e2723;
        box-sizing: border-box;
        background-color: #f5f5f5;
    }

    .contact-form textarea {
        resize: vertical;
        min-height: 120px;
    }

    .contact-form button {
        background-color: #6d4c41;
        color: white;
        border: none;
        padding: 12px 25px;
        border-radius: 8px;
        font-weight: bold;
        cursor: pointer;
        transition: background-color 0.3s ease, transform 0.2s ease;
    }

    .contact-form button:hover {
        background-color: #4e342e;
        transform: translateY(-2px);
    }

    /* Footer styling */
    footer {
        background-color: #5d4037;
        color: white;
        text-align: center;
        padding: 1rem 0;
        margin-top: auto; /* Push footer to the bottom */
    }

    @media (max-width: 768px) {
        header {
            flex-direction: column;
            padding: 1rem;
        }

        nav {
            margin-top: 1rem;
            flex-wrap: wrap;
            justify-content: center;
        }
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
<a href="Customer_Messages.jsp">Messages</a>
</nav>
</header>

<!-- Contact Section -->
<div class="contact-container">
    <h2>Contact Us</h2>
    <div class="contact-info">
        <p><strong>📍 Address:</strong> Coffee Corner, MG Road, Pune, India</p>
        <p><strong>📞 Phone:</strong> +91 98765 43210</p>
        <p><strong>✉️ Email:</strong> info@coffeecorner.com</p>
    </div>

    <!-- Contact Form -->
    <form class="contact-form" action="MessageServlet" method="post">
        <input type="text" name="name" placeholder="Your Name" required>
        <input type="email" name="email" placeholder="Your Email" required>
        <textarea name="message" placeholder="Your Message" required></textarea>
        <button type="submit">Send Message</button>
    </form>
</div>

<footer>
    <p>&copy; 2025 Coffee Corner. All Rights Reserved.</p>
</footer>

</body>
</html>