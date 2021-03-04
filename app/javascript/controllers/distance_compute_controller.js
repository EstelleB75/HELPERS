import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "cards" ]
  compute(event) {
    const latitude = event.detail.latitude,
          longitude = event.detail.longitude
    
    fetch(`/dashboard?latitude=${latitude}&longitude=${longitude}`, { headers: { accept: "application/json" } })
    .then(response => response.json())
    .then(data => {
      this.cardsTarget.innerHTML = data.cards
    })

  }
}