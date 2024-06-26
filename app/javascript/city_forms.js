// const cityInput = document.getElementById("city-input");
// const suggestionsList = document.getElementById("city-suggestions");

// if (cityInput && suggestionsList) {
//   cityInput.addEventListener("input", function () {
//     const query = cityInput.value.trim();
//     if (query.length < 2) {
//       suggestionsList.innerHTML = "";
//       return;
//     }

//     fetch(
//       `https://geo.api.gouv.fr/communes?nom=${query}&fields=nom&boost=population&limit=10`
//     )
//       .then((response) => response.json())
//       .then((data) => {
//         const suggestions = data.map((city) => city.nom);
//         showSuggestions(suggestions);
//       })
//       .catch((error) => {
//         console.error("Error fetching city suggestions:", error);
//       });
//   });

//   function showSuggestions(suggestions) {
//     suggestionsList.innerHTML = "";

//     suggestions.forEach((suggestion) => {
//       const listItem = document.createElement("li");
//       listItem.textContent = suggestion;
//       listItem.className = "suggestion-item";
//       listItem.addEventListener("click", () => {
//         cityInput.value = suggestion;
//         suggestionsList.innerHTML = "";
//       });
//       suggestionsList.appendChild(listItem);
//     });
//   }
// }
