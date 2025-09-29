document.getElementById('checkoutForm').addEventListener('submit', function(event) {
            // Prevent the default form submission
            event.preventDefault();

            if (cart.length === 0) {
                // Use a custom modal or message box instead of alert()
                showMessage("Your cart is empty!");
                return;
            }

            // Populate the hidden input field with the cart data
            document.getElementById('cartData').value = JSON.stringify(cart);

            // Now submit the form  programmatically
            this.submit();
        });

let cart = [];
let total = 0;

const menuItems = {
  "espresso": 120,
  "cappuccino": 150,
  "latte": 170,
  "cold coffee": 180,
  "breve": 70,
  "mocha": 200,
  "berry smoothie": 100,
  "banana smoothie": 100,
  "strawberry smoothie": 100
};

function addToCart(item, price) {
  const existingItem = cart.find(c => c.item === item);

  if (existingItem) {
    existingItem.quantity += 1;
  } else {
    cart.push({ item, price, quantity: 1 });
  }
  total += price;
  displayCart();
}

function displayCart() {
  let cartItems = document.getElementById("cartItems");
  cartItems.innerHTML = "";
  cart.forEach((c, index) => {
    cartItems.innerHTML += `
      <li>
      ${c.item} - ₹${c.price} x ${c.quantity}
      <button onclick="removeItem(${index})">X</button></li>`;
  });
  document.getElementById("totalAmount").innerText = total;
}

function removeItem(index) {
  const itemToRemove = cart[index];

  if (itemToRemove.quantity > 1) {
    itemToRemove.quantity -= 1;
    total -= itemToRemove.price;
  } else {
    total -= itemToRemove.price;
    cart.splice(index, 1);
  }
  displayCart();
}

function checkout() {
  if (cart.length === 0) {
    showMessage("Your cart is empty!");
  } else {
    showMessage("✅ Thank you for your order! Total Bill: ₹" + total);
    cart = [];
    total = 0;
    displayCart();
  }
}

function redirectToPage(url) {
  window.location.href = url;
}

// --- Voice Command Logic ---

const SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;
const startVoiceBtn = document.getElementById('start-voice-btn');
const voiceAnimation = document.getElementById('voice-animation');

// --- Helper function for custom messages ---
function showMessage(message) {
    const messageBox = document.createElement('div');
    messageBox.className = 'message-box';
    messageBox.innerHTML = message;
    document.body.appendChild(messageBox);
    setTimeout(() => {
        messageBox.remove();
    }, 3000);
}

// Define number-to-word mapping for quantities
const numberWords = {
    'one': 1, 'two': 2, 'three': 3, 'four': 4, 'five': 5,
    'six': 6, 'seven': 7, 'eight': 8, 'nine': 9, 'ten': 10,
    'a': 1, 'an': 1
};

if (SpeechRecognition) {
  const recognition = new SpeechRecognition();
  recognition.continuous = false;
  recognition.interimResults = false;
  recognition.lang = 'en-US, hindi';
  recognition.maxAlternatives = 2;

  startVoiceBtn.addEventListener('click', () => {
    voiceAnimation.style.display = 'block';
    recognition.start();
    console.log("Listening for voice command...");
  });

  recognition.onresult = (event) => {
    let finalTranscript = '';
    for (let i = event.resultIndex; i < event.results.length; ++i) {
      if (event.results[i].isFinal) {
        finalTranscript += event.results[i][0].transcript;
      }
    }
    
    if (finalTranscript) {
      console.log("Final command received:", finalTranscript);
      parseVoiceCommand(finalTranscript);
    }
  };

  recognition.onend = () => {
    voiceAnimation.style.display = 'none';
    console.log("Speech recognition ended.");
  };

  recognition.onerror = (event) => {
    voiceAnimation.style.display = 'none';
    console.error("Speech recognition error:", event.error);
    showMessage(`Voice recognition error: ${event.error}`);
  };
} else {
  startVoiceBtn.style.display = 'none';
  console.warn("Web Speech API not supported in this browser.");
}

function handleRemoveCommand(command) {
    const removePattern = new RegExp(`remove\\s+(?:(a|an|one|\\d+|${Object.keys(numberWords).join('|')})\\s+)?(.+?)`, 'i');
    const removeMatch = removePattern.exec(command);

    if (removeMatch) {
        let quantityToRemove = 1;
        const quantityStr = removeMatch[1];
        const itemToRemoveName = removeMatch[2].trim();

        if (quantityStr) {
            quantityToRemove = numberWords[quantityStr] || parseInt(quantityStr, 10);
        }

        const itemIndex = cart.findIndex(c => itemToRemoveName.includes(c.item));
        
        if (itemIndex !== -1) {
            for (let i = 0; i < quantityToRemove; i++) {
                removeItem(itemIndex);
            }
            console.log(`Removed ${quantityToRemove} of ${cart[itemIndex].item}`);
        } else {
            console.log(`Could not find "${itemToRemoveName}" in the cart.`);
            showMessage(`Could not find "${itemToRemoveName}" in the cart.`);
        }
        return true;
    }
    return false;
}

function handleAddCommand(command) {
    const itemKeywords = Object.keys(menuItems);
    let itemFound = false;
    for (const keyword of itemKeywords) {
        const regex = new RegExp(`(?:(a|an|one|\\d+|${Object.keys(numberWords).join('|')})\\s+)?(${keyword})`, 'g');
        let match;
        
        while ((match = regex.exec(command)) !== null) {
            let quantity = numberWords[match[1]] || parseInt(match[1], 10) || 1;
            const foundItemKey = match[2];
            const price = menuItems[foundItemKey];
            
            for (let i = 0; i < quantity; i++) {
                addToCart(foundItemKey, price);
            }
            console.log(`Processed: Added ${quantity} of ${foundItemKey}`);
            itemFound = true;
        }
    }
    if (!itemFound) {
        showMessage("Command not recognized. Please try again.");
    }
}

function parseVoiceCommand(command) {
    const lowercaseCommand = command.toLowerCase();

    if (lowercaseCommand.includes("checkout") || lowercaseCommand.includes("finish order")) {
        checkout();
        return;
    }

    if (handleRemoveCommand(lowercaseCommand)) {
        return;
    }

    handleAddCommand(lowercaseCommand);
}
