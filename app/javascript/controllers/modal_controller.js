import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["modal", "content"]

  closeModal = () => {
    this.element.parentElement.removeAttribute("src")
    this.modalTarget.remove()
  }

  closeOnSucceed = (e) => {
    if (!e.detail.success) return

    this.closeModal()
  }

  closeWithKeyboard = (e) => {
    if (e.code == "Escape")
      this.closeModal()
  }

  closeOnBackground = (e) => {
    if (e && this.contentTarget.contains(e.target)) return

    this.closeModal()
  }
}
