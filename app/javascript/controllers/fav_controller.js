import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ['icon', 'card']

  update() {
    const count = document.getElementById('favorite-counter');
    const value = parseInt(count.innerText);

    this.iconTarget.classList.toggle('far');
    this.iconTarget.classList.toggle('fas');

    if (this.iconTarget.classList.contains('far')) {
      count.innerText = value - 1;
    } else {
      count.innerText = value + 1;
    }
  }
  destroy() {
    this.cardTarget.remove();
    const count = document.getElementById('favorite-counter');
    const value = parseInt(count.innerText);
    count.innerText = value - 1;
  }
}