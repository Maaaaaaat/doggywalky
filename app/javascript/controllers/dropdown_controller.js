import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dropdown"
export default class extends Controller {
  static targets = ["down"]
  connect() {
  }

  drop() {
    console.log("titi");
    this.downTarget.classList.toggle("d-none");
  }
}
