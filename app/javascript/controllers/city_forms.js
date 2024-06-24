document.addEventListener("DOMContentLoaded", function () {
  const cityInput = document.getElementById("city-input");

  cityInput.addEventListener("input", function () {
    const query = cityInput.value;
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
      });
  });

  function showSuggestions(suggestions) {
    const datalist = document.getElementById("city-suggestions");
    datalist.innerHTML = "";

    suggestions.forEach((suggestion) => {
      const option = document.createElement("option");
      option.value = suggestion;
      datalist.appendChild(option);
    });
  }
});
