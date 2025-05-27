import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form-pop-up"
export default class extends Controller {
  static targets = ["form"]

  connect() {
  }

  open() {
    console.log(this.formTarget);

    this.formTarget.classList.toggle('d-none')
  }
}
