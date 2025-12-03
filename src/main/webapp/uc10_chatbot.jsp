<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>UC10 CHATBOT - MindLink</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #FFE6D0; /* match global soft peach */
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            overflow-x: hidden; /* ensure page fits laptop browser width */
        }

        /* Header */
        .header {
            padding: 20px 100px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: white;
            border-bottom: 1px solid #e0e0e0;
        }

        .nav-left,
        .nav-right {
            display: flex;
            align-items: center;
            justify-content: space-evenly; /* distribute header links equally */
            flex: 1;
            gap: 0;
        }

        .nav-left a, .nav-right a {
            text-decoration: none;
            color: #00313e;
            font-size: 16px;
            font-weight: 500;
            transition: color 0.3s;
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 10px;
            font-weight: 700;
            color: #00313e;
            font-size: 32px;
            text-decoration: none;
        }

        .logo-icon {
            width: 40px;
            height: 40px;
        }

        .logo-icon img {
            width: 100%;
            height: 100%;
            object-fit: contain;
        }

        /* Main Container */
        .container {
            flex: 1;
            background: #FFE6D0; /* consistent with home/forum */
            padding: 60px;
            display: flex;
            flex-direction: column;
        }

        /* Chat Container */
        .chat-container {
            max-width: 900px;
            width: 100%;
            margin: 0 auto;
            background: white;
            border-radius: 30px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.1);
            flex: 1;
            display: flex;
            flex-direction: column;
            overflow: hidden;
        }

        /* Messages Area */
        .messages-area {
            flex: 1;
            padding: 40px;
            overflow-y: auto;
            display: flex;
            flex-direction: column;
            gap: 25px;
        }

        .messages-area::-webkit-scrollbar {
            width: 8px;
        }

        .messages-area::-webkit-scrollbar-track {
            background: #f1f1f1;
            border-radius: 10px;
        }

        .messages-area::-webkit-scrollbar-thumb {
            background: #00313e;
            border-radius: 10px;
        }

        /* Message */
        .message {
            display: flex;
            gap: 15px;
            align-items: flex-start;
            animation: slideIn 0.3s ease;
        }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .message.bot {
            flex-direction: row;
        }

        .message.user {
            flex-direction: row-reverse;
        }

        .avatar {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            overflow: hidden;
            flex-shrink: 0;
        }

        .avatar img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .message-bubble {
            max-width: 70%;
            padding: 18px 24px;
            border-radius: 20px;
            line-height: 1.6;
            word-wrap: break-word;
        }

        .message.bot .message-bubble {
            background: #f0f0f0;
            color: #333;
            border-bottom-left-radius: 5px;
            border: 2px solid #00313e;
        }

        .message.user .message-bubble {
            background: #00313e;
            color: white;
            border-bottom-right-radius: 5px;
        }

        /* Edit/Delete controls for user messages */
        .message-controls {
            display: flex;
            gap: 4px;
            margin-top: 4px;
            font-size: 10px;
            opacity: 0.8;
        }

        .control-button {
            background: transparent;
            border: none;
            color: #ffeb99;
            cursor: pointer;
            padding: 0;
        }

        .control-button.delete {
            color: #ffb3b3;
        }

        /* Input Area */
        .input-area {
            padding: 30px 40px;
            background: white;
            border-top: 1px solid #e0e0e0;
            display: flex;
            gap: 15px;
            align-items: center;
        }

        .add-icon {
            width: 45px;
            height: 45px;
            border-radius: 50%;
            background: #f0f0f0;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            color: #666;
            cursor: pointer;
            transition: all 0.2s;
            flex-shrink: 0;
        }

        .add-icon:hover {
            background: #e0e0e0;
        }

        .input-field {
            flex: 1;
            padding: 14px 20px;
            border: 2px solid #e0e0e0;
            border-radius: 25px;
            font-size: 15px;
            font-family: inherit;
            outline: none;
            transition: border-color 0.3s;
        }

        .input-field:focus {
            border-color: #00313e;
        }

        .input-field::placeholder {
            color: #999;
        }

        .icon-group {
            display: flex;
            gap: 12px;
            align-items: center;
        }

        .mic-icon, .sound-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: #f0f0f0;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
            cursor: pointer;
            transition: all 0.2s;
        }

        .mic-icon:hover, .sound-icon:hover {
            background: #e0e0e0;
            transform: scale(1.05);
        }

        /* Responsive */
        @media (max-width: 1200px) {
            .header {
                padding: 20px 50px;
            }

            .container {
                padding: 40px;
            }
        }

        @media (max-width: 768px) {
            .header {
                flex-direction: column;
                gap: 15px;
                padding: 20px 30px;
            }

            .container {
                padding: 20px;
            }

            .messages-area {
                padding: 25px;
            }

            .input-area {
                padding: 20px;
            }

            .message-bubble {
                max-width: 85%;
            }

            .add-icon {
                display: none;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <div class="header">
        <div class="nav-left">
            <a href="home.jsp">Home</a>
            <a href="learning.jsp">Learning</a>
        </div>
        
        <a href="home.jsp" class="logo">
            <div class="logo-icon">
                <img src="images/mindlink.png" alt="MindLink">
            </div>
            <span>MindLink</span>
        </a>
        
        <div class="nav-right">
            <a href="uc12_forum_welcome.jsp">Forum</a>
            <a href="profile.jsp">Profile</a>
        </div>
    </div>

    <!-- Main Container -->
    <div class="container">
        <div class="chat-container">
            <!-- Messages Area -->
            <div class="messages-area" id="messages">
                <!-- Welcome Message -->
                <div class="message bot">
                    <div class="avatar">
                        <img src="images/chatbot.png" alt="Bot">
                    </div>
                    <div class="message-bubble">
                        Hi there! I'm MindLinkBot, your AI chatbot assistant. I'm here to listen and help — what can I do for you?
                    </div>
                </div>
            </div>

            <!-- Input Area -->
            <div class="input-area">
                <div class="add-icon">➕</div>
                <input type="text" 
                       class="input-field" 
                       id="userInput" 
                       placeholder="Ask anything"
                       onkeypress="if(event.key==='Enter') sendMessage()">
                <div class="icon-group">
                    <div class="mic-icon" title="Voice Input">🎤</div>
                    <div class="sound-icon" title="Text to Speech">🔊</div>
                </div>
            </div>
        </div>
    </div>

    <script>
        let messageCounter = 0;

        function sendMessage() {
            const input = document.getElementById('userInput');
            const message = input.value.trim();
            
            if (message === '') return;

            // Add user message
            addMessage('user', message);
            input.value = '';

            // Simulate bot response
            setTimeout(() => {
                const botResponse = generateBotResponse(message);
                addMessage('bot', botResponse);
            }, 1000);
        }

        function addMessage(type, text) {
            const messagesContainer = document.getElementById('messages');
            const messageDiv = document.createElement('div');
            messageDiv.className = `message ${type}`;
            const id = ++messageCounter;
            messageDiv.dataset.id = id;

            let avatarContent = '';
            if (type === 'bot') {
                avatarContent = '<img src="images/chatbot.png" alt="Bot">';
            } else {
                avatarContent = '<img src="images/mindlink.png" alt="User">';
            }

            if (type === 'user') {
                messageDiv.innerHTML = `
                    <div class="avatar">${avatarContent}</div>
                    <div class="message-bubble">
                        <div class="message-text">${text}</div>
                        <div class="message-controls">
                            <button class="control-button" title="Edit message" onclick="editMessage(${id})">✏️</button>
                            <button class="control-button delete" title="Delete message" onclick="deleteMessage(${id})">🗑️</button>
                        </div>
                    </div>
                `;
            } else {
                messageDiv.innerHTML = `
                    <div class="avatar">${avatarContent}</div>
                    <div class="message-bubble">${text}</div>
                `;
            }

            messagesContainer.appendChild(messageDiv);
            messagesContainer.scrollTop = messagesContainer.scrollHeight;
        }

        function generateBotResponse(userMessage) {
            const lowerMessage = userMessage.toLowerCase();

            if (lowerMessage.includes('stress') || lowerMessage.includes('anxiety')) {
                return "I understand you're feeling stressed. Try taking deep breaths: inhale for 4 counts, hold for 4, exhale for 4. Would you like some more coping strategies? 🌸";
            } else if (lowerMessage.includes('sleep') || lowerMessage.includes('tired')) {
                return "Sleep is so important! Try establishing a bedtime routine, avoiding screens 1 hour before bed, and keeping your room cool and dark. 😴";
            } else if (lowerMessage.includes('sad') || lowerMessage.includes('depressed')) {
                return "I'm sorry you're feeling this way. Remember, it's okay to not be okay. Have you considered talking to a counselor? I'm here to listen. 💚";
            } else if (lowerMessage.includes('thank')) {
                return "You're very welcome! I'm always here to help. Take care of yourself! 💛";
            } else if (lowerMessage.includes('help')) {
                return "I'm here to help! You can talk to me about stress, anxiety, sleep issues, or anything else on your mind. What would you like to discuss? 🤗";
            } else {
                return "I hear you. Tell me more about what's on your mind. I'm here to support you. 💬";
            }
        }

        // Focus input on load
        window.onload = function() {
            document.getElementById('userInput').focus();
        };

        // Add click functionality to icons
        document.querySelector('.mic-icon').addEventListener('click', function() {
            alert('Voice input feature - coming soon!');
        });

        document.querySelector('.sound-icon').addEventListener('click', function() {
            alert('Text-to-speech feature - coming soon!');
        });

        document.querySelector('.add-icon').addEventListener('click', function() {
            alert('Attach files - coming soon!');
        });

        // Edit an existing user message
        function editMessage(id) {
            const messageDiv = document.querySelector(\`.message.user[data-id="\${id}"] .message-text\`);
            if (!messageDiv) return;
            const current = messageDiv.textContent;
            const updated = prompt('Edit your message:', current);
            if (updated !== null && updated.trim() !== '') {
                messageDiv.textContent = updated.trim();
            }
        }

        // Delete an existing user message
        function deleteMessage(id) {
            const wrapper = document.querySelector(\`.message.user[data-id="\${id}"]\`);
            if (wrapper && confirm('Delete this message?')) {
                wrapper.remove();
            }
        }
    </script>
</body>
</html>

