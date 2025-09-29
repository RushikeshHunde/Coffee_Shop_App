/*
document.addEventListener('DOMContentLoaded', () => {
    // Select both the tab buttons and the payment content sections.
    const tabButtons = document.querySelectorAll('.tab-btn');
    const paymentSections = document.querySelectorAll('.payment-content');

    // Add a click event listener to each tab button.
    tabButtons.forEach(button => {
        button.addEventListener('click', () => {
            // Remove the 'active' class from all buttons and sections first.
            tabButtons.forEach(btn => btn.classList.remove('active'));
            paymentSections.forEach(section => section.classList.remove('active'));

            // Add the 'active' class to the clicked button and its corresponding section.
            const targetTab = button.getAttribute('data-tab');
            document.getElementById(targetTab).classList.add('active');
            button.classList.add('active');
        });
    });

    // Handle form submission for the card payment (optional, for demo purposes).
    document.getElementById('card-form').addEventListener('submit', (event) => {
        event.preventDefault(); // Prevents the page from reloading.
        alert('Payment with card is successful!');
    });

    // Function to copy the UPI ID to the clipboard.
    window.copyUpiId = function() {
        const upiId = document.getElementById('upi-id').textContent;
        navigator.clipboard.writeText(upiId)
            .then(() => {
                alert('UPI ID copied to clipboard!');
            })
            .catch(err => {
                console.error('Failed to copy UPI ID:', err);
            });
    };
});
*/
