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
            background: #FFE6D0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            overflow-x: hidden;
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
            justify-content: space-evenly;
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

        .nav-left a:hover, .nav-right a:hover {
            color: #FF6B6B;
        }

        .logo {
            display: flex;
            align-items: center;
            text-decoration: none;
            color: #00313e;
            font-size: 24px;
            font-weight: bold;
        }

        .logo-icon {
            width: 40px;
            height: 40px;
            margin-right: 10px;
        }

        .logo-icon img {
            width: 100%;
            height: 100%;
            object-fit: contain;
        }

        /* Main Container */
        .container {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px 100px;
        }

        /* Chat Container */
        .chat-container {
            background: white;
            border-radius: 20px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 900px;
            height: 600px;
            display: flex;
            flex-direction: column;
            overflow: hidden;
        }

        .chat-title {
            padding: 25px;
            background: #00313e;
            color: white;
            font-size: 24px;
            font-weight: 600;
            text-align: center;
            border-radius: 20px 20px 0 0;
        }

        /* Chat Messages */
        .chat-messages {
            flex: 1;
            overflow-y: auto;
            padding: 20px;
            background: #f9f9f9;
        }

        .message {
            display: flex;
            margin-bottom: 20px;
            align-items: flex-start;
            animation: slideIn 0.3s ease-out;
            position: relative;
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

        .bot-message {
            justify-content: flex-start;
        }

        .user-message {
            justify-content: flex-end;
        }

        .message-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            overflow: hidden;
            margin: 0 10px;
            flex-shrink: 0;
        }

        .message-avatar img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .message-content {
            display: flex;
            flex-direction: column;
            max-width: 70%;
        }

        .message-bubble {
            padding: 12px 18px;
            border-radius: 18px;
            word-wrap: break-word;
            position: relative;
        }

        .bot-message .message-bubble {
            background: #e3f2fd;
            color: #1976d2;
            border-bottom-left-radius: 4px;
        }

        .user-message .message-bubble {
            background: #00313e;
            color: white;
            border-bottom-right-radius: 4px;
        }

        /* Message Actions - ALWAYS VISIBLE */
        .message-actions {
            display: flex;
            gap: 8px;
            margin-top: 8px;
            /* Removed opacity - always visible */
        }

        .message-action-btn {
            border: none;
            cursor: pointer;
            font-size: 12px;
            padding: 6px 12px;
            border-radius: 6px;
            transition: all 0.2s;
            font-weight: 600;
            color: white;
        }

        /* Edit button - BLUE BACKGROUND */
        .edit-btn {
            background: #2196F3;
        }

        .edit-btn:hover {
            background: #1976D2;
            transform: scale(1.05);
        }

        /* Delete button - RED BACKGROUND */
        .delete-btn {
            background: #f44336;
        }

        .delete-btn:hover {
            background: #d32f2f;
            transform: scale(1.05);
        }

        /* Edit Mode */
        .message-edit-container {
            display: none;
            margin-top: 10px;
            width: 100%;
        }

        .message-edit-container.active {
            display: flex;
            gap: 8px;
        }

        .message-edit-input {
            flex: 1;
            padding: 8px 12px;
            border: 2px solid #00313e;
            border-radius: 8px;
            font-size: 14px;
            font-family: inherit;
        }

        .message-edit-save,
        .message-edit-cancel {
            padding: 8px 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 14px;
            font-weight: 500;
            transition: all 0.2s;
        }

        .message-edit-save {
            background: #4CAF50;
            color: white;
        }

        .message-edit-save:hover {
            background: #45a049;
        }

        .message-edit-cancel {
            background: #f0f0f0;
            color: #333;
        }

        .message-edit-cancel:hover {
            background: #e0e0e0;
        }

        /* Chat Input */
        .chat-input-container {
            padding: 20px;
            background: white;
            border-top: 1px solid #e0e0e0;
            display: flex;
            gap: 10px;
            align-items: center;
        }

        .input-icon-btn {
            width: 40px;
            height: 40px;
            border: none;
            background: #f0f0f0;
            border-radius: 50%;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
            transition: all 0.3s;
        }

        .input-icon-btn:hover {
            background: #e0e0e0;
            transform: scale(1.1);
        }

        .chat-input {
            flex: 1;
            padding: 12px 20px;
            border: 2px solid #e0e0e0;
            border-radius: 25px;
            font-size: 14px;
            outline: none;
            transition: border-color 0.3s;
        }

        .chat-input:focus {
            border-color: #00313e;
        }

        .send-btn {
            width: 45px;
            height: 45px;
            border: none;
            background: #00313e;
            color: white;
            border-radius: 50%;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
            transition: all 0.3s;
        }

        .send-btn:hover {
            background: #004d61;
            transform: scale(1.1);
        }

        .send-btn:active {
            transform: scale(0.95);
        }

        /* Scrollbar */
        .chat-messages::-webkit-scrollbar {
            width: 8px;
        }

        .chat-messages::-webkit-scrollbar-track {
            background: #f1f1f1;
        }

        .chat-messages::-webkit-scrollbar-thumb {
            background: #00313e;
            border-radius: 4px;
        }

        .chat-messages::-webkit-scrollbar-thumb:hover {
            background: #004d61;
        }

        /* Delete Confirmation Modal */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 1000;
            align-items: center;
            justify-content: center;
        }

        .modal.active {
            display: flex;
        }

        .modal-content {
            background: white;
            padding: 30px;
            border-radius: 15px;
            max-width: 400px;
            text-align: center;
        }

        .modal-title {
            font-size: 20px;
            font-weight: 600;
            margin-bottom: 15px;
            color: #00313e;
        }

        .modal-text {
            font-size: 14px;
            color: #666;
            margin-bottom: 25px;
        }

        .modal-buttons {
            display: flex;
            gap: 10px;
            justify-content: center;
        }

        .modal-btn {
            padding: 10px 25px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 14px;
            font-weight: 500;
            transition: all 0.2s;
        }

        .modal-btn-cancel {
            background: #f0f0f0;
            color: #333;
        }

        .modal-btn-cancel:hover {
            background: #e0e0e0;
        }

        .modal-btn-delete {
            background: #f44336;
            color: white;
        }

        .modal-btn-delete:hover {
            background: #da190b;
        }
    </style>
</head>
<body>
    <!-- Header Navigation -->
    <div class="header">
        <div class="nav-left">
            <a href="${pageContext.request.contextPath}/home">Home</a>
            <a href="${pageContext.request.contextPath}/learning">Learning</a>
        </div>
        
        <a href="${pageContext.request.contextPath}/home" class="logo">
            <div class="logo-icon">
                <img src="${pageContext.request.contextPath}/images/mindlink.png" alt="MindLink">
            </div>
            <span>MindLink</span>
        </a>
        
        <div class="nav-right">
            <a href="${pageContext.request.contextPath}/forum/welcome">Forum</a>
            <a href="${pageContext.request.contextPath}/profile">Profile</a>
        </div>
    </div>

    <!-- Main Container -->
    <div class="container">
        <div class="chat-container">
            <h1 class="chat-title">AI Chatbot Assistant</h1>
            
            <!-- Chat Messages -->
            <div class="chat-messages" id="chatMessages">
                <!-- Bot Welcome Message -->
                <div class="message bot-message">
                    <div class="message-avatar">
                        <img src="${pageContext.request.contextPath}/images/chatbot.png" alt="Bot">
                    </div>
                    <div class="message-content">
                        <div class="message-bubble">
                            Hi there! I'm MindLinkBot, your AI chatbot assistant. I'm here to listen and help — what can I do for you?
                        </div>
                    </div>
                </div>
            </div>

            <!-- Chat Input -->
            <div class="chat-input-container">
                <button class="input-icon-btn" title="Add attachment">
                    <span>➕</span>
                </button>
                <input type="text" id="userInput" class="chat-input" placeholder="Type your message..." />
                <button class="send-btn" id="sendBtn" title="Send message">
                    <span>➤</span>
                </button>
            </div>
        </div>
    </div>

    <!-- Delete Confirmation Modal -->
    <div class="modal" id="deleteModal">
        <div class="modal-content">
            <h2 class="modal-title">Delete Message?</h2>
            <p class="modal-text">Are you sure you want to delete this message? This action cannot be undone.</p>
            <div class="modal-buttons">
                <button class="modal-btn modal-btn-cancel" onclick="closeDeleteModal()">Cancel</button>
                <button class="modal-btn modal-btn-delete" onclick="confirmDelete()">Delete</button>
            </div>
        </div>
    </div>

    <script>
        const chatMessages = document.getElementById('chatMessages');
        const userInput = document.getElementById('userInput');
        const sendBtn = document.getElementById('sendBtn');
        let messageIdCounter = 1;
        let messageToDelete = null;

        // Bot responses - now fetched from server/database

        // Send message on Enter key
        userInput.addEventListener('keypress', function(e) {
            if (e.key === 'Enter' && this.value.trim()) {
                sendMessage(this.value.trim());
                this.value = '';
            }
        });

        // Send message on button click
        sendBtn.addEventListener('click', function() {
            if (userInput.value.trim()) {
                sendMessage(userInput.value.trim());
                userInput.value = '';
            }
        });

        function sendMessage(text) {
            const messageId = 'msg-' + messageIdCounter++;
            
            // Add user message
            addMessage(text, 'user', messageId);

            // Get bot response from server/database
            getBotResponse(text).then(response => {
                const botMessageId = 'bot-msg-' + messageIdCounter++;
                addMessage(response, 'bot', botMessageId);
                // Store reference to bot response in user message
                const userMessageDiv = document.getElementById(messageId);
                if (userMessageDiv) {
                    userMessageDiv.dataset.botResponseId = botMessageId;
                }
            }).catch(error => {
                console.error('Error getting bot response:', error);
                const botMessageId = 'bot-msg-' + messageIdCounter++;
                addMessage('Sorry, I encountered an error. Please try again.', 'bot', botMessageId);
                const userMessageDiv = document.getElementById(messageId);
                if (userMessageDiv) {
                    userMessageDiv.dataset.botResponseId = botMessageId;
                }
            });
        }

        function addMessage(text, type, messageId = null) {
            const messageDiv = document.createElement('div');
            messageDiv.className = `message ${type}-message`;
            if (messageId) {
                messageDiv.id = messageId;
                messageDiv.dataset.originalText = text;
            }

            const avatar = document.createElement('div');
            avatar.className = 'message-avatar';
            const avatarImg = document.createElement('img');
            avatarImg.src = type === 'bot' 
                ? '${pageContext.request.contextPath}/images/chatbot.png' 
                : '${pageContext.request.contextPath}/images/mindlink.png';
            avatarImg.alt = type === 'bot' ? 'Bot' : 'User';
            avatar.appendChild(avatarImg);

            const content = document.createElement('div');
            content.className = 'message-content';
            
            const bubble = document.createElement('div');
            bubble.className = 'message-bubble';
            bubble.textContent = text;
            content.appendChild(bubble);

            // Add edit/delete actions for user messages
            if (type === 'user') {
                const actions = document.createElement('div');
                actions.className = 'message-actions';
                
                const editBtn = document.createElement('button');
                editBtn.className = 'message-action-btn edit-btn';
                editBtn.innerHTML = 'Edit';
                editBtn.onclick = () => editMessage(messageId);
                
                const deleteBtn = document.createElement('button');
                deleteBtn.className = 'message-action-btn delete-btn';
                deleteBtn.innerHTML = 'Delete';
                deleteBtn.onclick = () => showDeleteModal(messageId);
                
                actions.appendChild(editBtn);
                actions.appendChild(deleteBtn);
                content.appendChild(actions);

                // Add edit container
                const editContainer = document.createElement('div');
                editContainer.className = 'message-edit-container';
                editContainer.id = `edit-${messageId}`;
                
                const editInput = document.createElement('input');
                editInput.type = 'text';
                editInput.className = 'message-edit-input';
                editInput.value = text;
                
                const saveBtn = document.createElement('button');
                saveBtn.className = 'message-edit-save';
                saveBtn.textContent = 'Save';
                saveBtn.onclick = () => saveEdit(messageId);
                
                const cancelBtn = document.createElement('button');
                cancelBtn.className = 'message-edit-cancel';
                cancelBtn.textContent = 'Cancel';
                cancelBtn.onclick = () => cancelEdit(messageId);
                
                editContainer.appendChild(editInput);
                editContainer.appendChild(saveBtn);
                editContainer.appendChild(cancelBtn);
                content.appendChild(editContainer);
            }

            if (type === 'user') {
                messageDiv.appendChild(content);
                messageDiv.appendChild(avatar);
            } else {
                messageDiv.appendChild(avatar);
                messageDiv.appendChild(content);
            }

            chatMessages.appendChild(messageDiv);
            chatMessages.scrollTop = chatMessages.scrollHeight;
        }

        function editMessage(messageId) {
            const messageDiv = document.getElementById(messageId);
            if (!messageDiv) return;
            
            const editContainer = document.getElementById(`edit-${messageId}`);
            const bubble = messageDiv.querySelector('.message-bubble');
            const actions = messageDiv.querySelector('.message-actions');
            
            if (editContainer && bubble && actions) {
                editContainer.classList.add('active');
                bubble.style.display = 'none';
                actions.style.display = 'none';
            }
        }

        function saveEdit(messageId) {
            const messageDiv = document.getElementById(messageId);
            if (!messageDiv) return;
            
            const editContainer = document.getElementById(`edit-${messageId}`);
            const input = editContainer.querySelector('.message-edit-input');
            const bubble = messageDiv.querySelector('.message-bubble');
            const actions = messageDiv.querySelector('.message-actions');
            
            const newText = input.value.trim();
            if (newText) {
                bubble.textContent = newText;
                messageDiv.dataset.originalText = newText;
                
                // Remove old bot response if it exists
                const oldBotResponseId = messageDiv.dataset.botResponseId;
                if (oldBotResponseId) {
                    const oldBotMessage = document.getElementById(oldBotResponseId);
                    if (oldBotMessage) {
                        oldBotMessage.style.animation = 'slideOut 0.3s ease-out';
                        setTimeout(() => {
                            oldBotMessage.remove();
                        }, 300);
                    }
                    messageDiv.dataset.botResponseId = '';
                }
                
                // Get new bot response from server/database
                getBotResponse(newText).then(response => {
                    const botMessageId = 'bot-msg-' + messageIdCounter++;
                    addMessage(response, 'bot', botMessageId);
                    // Store reference to new bot response
                    messageDiv.dataset.botResponseId = botMessageId;
                }).catch(error => {
                    console.error('Error getting bot response:', error);
                    const botMessageId = 'bot-msg-' + messageIdCounter++;
                    addMessage('Sorry, I encountered an error. Please try again.', 'bot', botMessageId);
                    messageDiv.dataset.botResponseId = botMessageId;
                });
            }
            
            editContainer.classList.remove('active');
            bubble.style.display = 'block';
            actions.style.display = 'flex';
        }

        function cancelEdit(messageId) {
            const messageDiv = document.getElementById(messageId);
            const editContainer = document.getElementById(`edit-${messageId}`);
            const input = editContainer.querySelector('.message-edit-input');
            const bubble = messageDiv.querySelector('.message-bubble');
            const actions = messageDiv.querySelector('.message-actions');
            
            input.value = messageDiv.dataset.originalText;
            editContainer.classList.remove('active');
            bubble.style.display = 'block';
            actions.style.display = 'flex';
        }

        function showDeleteModal(messageId) {
            messageToDelete = messageId;
            document.getElementById('deleteModal').classList.add('active');
        }

        function closeDeleteModal() {
            document.getElementById('deleteModal').classList.remove('active');
            messageToDelete = null;
        }

        function confirmDelete() {
            if (messageToDelete) {
                const messageDiv = document.getElementById(messageToDelete);
                if (messageDiv) {
                    // Also remove the corresponding bot response if it exists
                    const botResponseId = messageDiv.dataset.botResponseId;
                    if (botResponseId) {
                        const botMessage = document.getElementById(botResponseId);
                        if (botMessage) {
                            botMessage.style.animation = 'slideOut 0.3s ease-out';
                            setTimeout(() => {
                                botMessage.remove();
                            }, 300);
                        }
                    }
                    
                    // Remove user message
                    messageDiv.style.animation = 'slideOut 0.3s ease-out';
                    setTimeout(() => {
                        messageDiv.remove();
                    }, 300);
                }
            }
            closeDeleteModal();
        }

        function getBotResponse(message) {
            // Call server endpoint to get response from database
            const formData = new FormData();
            formData.append('message', message);
            
            return fetch('${pageContext.request.contextPath}/ai/chatbot/query', {
                method: 'POST',
                body: formData
            })
            .then(response => response.json())
            .then(data => {
                return data.response || 'I\'m here to help! Please ask me a question.';
            })
            .catch(error => {
                console.error('Error:', error);
                return 'Sorry, I encountered an error. Please try again.';
            });
        }

        // Add slideOut animation
        const style = document.createElement('style');
        style.textContent = `
            @keyframes slideOut {
                to {
                    opacity: 0;
                    transform: translateX(-100%);
                }
            }
        `;
        document.head.appendChild(style);
    </script>
</body>
</html>