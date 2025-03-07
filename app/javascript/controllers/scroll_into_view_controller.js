import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("Scroll into view connected")
    this.element.scrollIntoView({ behavior: 'smooth' })
  }
}