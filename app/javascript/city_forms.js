const cityInput = document.getElementById("city-input");
const datalist = document.getElementById("city-suggestions");

if (cityInput && datalist) {
  cityInput.addEventListener("input", function () {
    const query = cityInput.value.trim();
    if (query.length < 2) {
      return;
    }

    fetch(
      `https://geo.api.gouv.fr/communes?nom=${query}&fields=nom&boost=population&limit=10`
    )
      .then((response) => response.json())
      .then((data) => {
        const suggestions = data.map((city) => city.nom);
        showSuggestions(suggestions);
      })
      .catch((error) => {
        console.error("Error fetching city suggestions:", error);
      });
  });

  function showSuggestions(suggestions) {
    datalist.innerHTML = "";

    suggestions.forEach((suggestion) => {
      const option = document.createElement("option");
      option.value = suggestion;
      datalist.appendChild(option);
    });
  }
}
