import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["messageContainer", "messageInput"]

  connect() {
    console.log("Chat controller connected")
  }

  sendMessage(event) {
    event.preventDefault()
    
    const message = this.messageInputTarget.value.trim()
    if (!message) return

    // Add user message to chat
    this.addMessageToChat(message, 'user')

    // Clear input
    this.messageInputTarget.value = ''

    // Here you would typically make an API call to your backend
    // For now, we'll just simulate a response
    setTimeout(() => {
      this.addMessageToChat("I received your message. This is a placeholder response.", 'ai')
    }, 1000)
  }

  addMessageToChat(message, sender) {
    const messageHTML = `
      <div class="flex items-start ${sender === 'user' ? 'justify-end' : ''}">
        <div class="${
          sender === 'user' 
            ? 'bg-blue-500 text-white' 
            : 'bg-gray-100 text-gray-800'
        } rounded-lg px-4 py-2 max-w-[80%]">
          <p>${message}</p>
        </div>
      </div>
    `
    
    this.messageContainerTarget.insertAdjacentHTML('beforeend', messageHTML)
    this.messageContainerTarget.scrollTop = this.messageContainerTarget.scrollHeight
  }
} 