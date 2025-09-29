import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="alert"
export default class extends Controller {
  close = () => {
    this.element.remove()
  }

  disconnect = () => {
    this.close()
  }
}
