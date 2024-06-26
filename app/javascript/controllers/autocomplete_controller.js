import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input", "suggestions"];

  connect() {
    console.log("oizinho");
  }

  updateSuggestions(event) {
    const query = this.inputTarget.value.trim();
    if (query.length < 2) {
      this.clearSuggestions();
      return;
    }

    fetch(
      `https://geo.api.gouv.fr/communes?nom=${query}&fields=nom&boost=population&limit=10`
    )
      .then((response) => response.json())
      .then((data) => {
        const suggestions = data.map((city) => city.nom);
        this.showSuggestions(suggestions);
      })
      .catch((error) => {
        console.error("Error fetching city suggestions:", error);
      });
  }

  showSuggestions(suggestions) {
    this.suggestionsTarget.innerHTML = "";

    const limitedSuggestions = suggestions.slice(0, 3);

    limitedSuggestions.forEach((suggestion) => {
      const listItem = document.createElement("li");
      listItem.textContent = suggestion;
      listItem.className = "suggestion-item";
      listItem.addEventListener("click", () => {
        this.inputTarget.value = suggestion;
        this.clearSuggestions();
      });
      this.suggestionsTarget.appendChild(listItem);
    });
  }

  clearSuggestions() {
    this.suggestionsTarget.innerHTML = "";
  }
}
