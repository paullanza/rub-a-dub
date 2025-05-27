import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["overlay"]

  open() {
    this.overlayTarget.classList.remove("d-none")
  }

  close() {
    this.overlayTarget.classList.add("d-none")
  }
}
