import { Controller } from "@hotwired/stimulus";

const ACCESS_TOKEN =
  "pk.eyJ1IjoidHVjYXNzZXNsZXNjb3VpbGxlcyIsImEiOiJjbHhraG51NzEwMWd0MmpzZG02aXQ4bjlkIn0.Rf-MR-RK_4Qi75WYkOINjg";
mapboxgl.accessToken = ACCESS_TOKEN;

// Connects to data-controller="map"
export default class extends Controller {
  static targets = ["map"];

  initialize() {
    const map = new mapboxgl.Map({
      accessToken: mapboxgl.accessToken,
      container: "map",
      style: "mapbox://styles/mapbox/streets-v12",
      language: "fr",
      center: [2.96, 46.96], // FIXME Center the map to the user City
      zoom: 5,
    });

    map.addControl(
      new MapboxGeocoder({
        accessToken: mapboxgl.accessToken,
        mapboxgl: mapboxgl,
        marker: true,
        placeholder: "Recherche",
        country: "fr",
        language: "fr",
        types: "place",
      }),
      "top-right"
    );

    document.querySelectorAll("#marker").forEach((marker) => {
      marker = new mapboxgl.Marker({ color: "blue" })
        .setLngLat([
          marker.dataset.longitudeValue,
          marker.dataset.latitudeValue,
        ])
        .addTo(map);

      marker.getElement().addEventListener("click", () => {
        window.location = "search.html";
      });
    });
  }

  group() {
    console.log("Clicked on method");
  }
}
