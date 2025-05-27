import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = ["input", "start", "end", "total"]
  static values = { price: Number }


  connect() {
    this.initCalendar()
  }

  initCalendar() {
    flatpickr(this.inputTarget, {
      mode: "range",
      dateFormat: "Y-m-d",
      minDate: "today",
      onChange: (selectedDates) => {
        if (selectedDates.length === 2) {
          const [startDate, endDate] = selectedDates
          this.startTarget.value = this.formatDate(startDate)
          this.endTarget.value = this.formatDate(endDate)
          this.updateTotal(startDate, endDate)
        } else {
          this.clearTotal()
        }
      }
    })
  }

  formatDate(date) {
    return date.toISOString().split("T")[0]
  }

  updateTotal(startDate, endDate) {
    const oneDayMs = 24 * 60 * 60 * 1000
    let numDays = Math.round((endDate - startDate) / oneDayMs)
    if (numDays < 1) numDays = 1 // charge minimum 1 day

    const total = (numDays * this.priceValue).toFixed(2)
    this.totalTarget.textContent = total
  }

  clearTotal() {
    this.totalTarget.textContent = "0.00"
  }
}
