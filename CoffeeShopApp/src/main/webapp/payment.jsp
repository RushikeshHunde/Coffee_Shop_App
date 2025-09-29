<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
</head>
    <link href="css/payment.css" rel="stylesheet">
</head>
<body>
    <div class="payment-container">
        <h2>Choose your payment method</h2>

        <!-- Payment Method Tabs -->
        <div class="payment-tabs">
            <button class="tab-btn active" data-tab="card">Credit Card 💳</button>
            <button class="tab-btn" data-tab="upi">UPI 🇮🇳</button>
        </div>

        <!-- Tab Content -->
        <div id="card" class="payment-content active">
            <form id="card-form">
                <!-- Card Information Section -->
                <div class="form-section">
                    <h3>Card Information</h3>
                    <div class="form-group">
                        <label for="card-number">Card Number</label>
                        <input type="text" id="card-number" placeholder="•••• •••• •••• ••••" required>
                    </div>
                    <div class="form-row">
                        <div class="form-group">
                            <label for="expiry-date">Expiry Date</label>
                            <input type="text" id="expiry-date" placeholder="MM/YY" required>
                        </div>
                        <div class="form-group">
                            <label for="cvv">CVV</label>
                            <input type="text" id="cvv" placeholder="•••" required>
                        </div>
                    </div>
                </div>

                <!-- Billing Address Section -->
                <div class="form-section">
                    <h3>Billing Address</h3>
                    <div class="form-group">
                        <label for="full-name">Full Name</label>
                        <input type="text" id="full-name" required>
                    </div>
                    <div class="form-group">
                        <label for="address">Address</label>
                        <input type="text" id="address" required>
                    </div>
                    <div class="form-row">
                        <div class="form-group">
                            <label for="city">City</label>
                            <input type="text" id="city" required>
                        </div>
                        <div class="form-group">
                            <label for="zip-code">Zip Code</label>
                            <input type="text" id="zip-code" required>
                        </div>
                    </div>
                </div>

                <button type="submit" class="pay-btn">Pay with Card</button>
            </form>
        </div>

        <div id="upi" class="payment-content">
            <div class="qr-container">
                <h3>Scan to Pay</h3>
                <img id="qr-code" src="img/scanme.png" alt="scanme" />
                <p>Open your UPI app and scan the QR code to complete the payment.</p>
                <div class="upi-id-section">
                    <h4>Or pay with UPI ID:</h4>
                    <span id="upi-id">yourname@upi</span>
                    <button class="copy-btn" onclick="copyUpiId()">Copy ID</button>
                </div>
            </div>
        </div>

    </div>

    <script src="js/payment.js"></script> 