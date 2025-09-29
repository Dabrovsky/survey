import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="color-picker"
export default class extends Controller {
  static values = {
    colors: { type: Array, default: ["zielony", "niebieski", "czerwony"] }
  }

  setColor = () => {
    this.element.querySelector("input#survey_favorite_color").value = this.getRandomColor()
  }

  getRandomColor = () => {
    const index = Math.floor(Math.random() * this.colorsValue.length);
    return this.colorsValue[index]
  }
}
