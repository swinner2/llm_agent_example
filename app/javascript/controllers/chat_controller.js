import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["messageContainer", "input"]

  connect() {
    console.log("Chat controller connected")
  }

  sendMessage(event) {
    event.preventDefault()
    const form = event.target.closest("form")
    form.requestSubmit()
    form.reset()
  }
} 