import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"
import mapboxgl from 'mapbox-gl'


export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })
    this.#addMarkersToMap()
    this.#fitMapToMarkers()

    this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl }))
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}

function searchCity(cityName) {
  const url = `https://api.mapbox.com/geocoding/v5/mapbox.places/${cityName}.json?access_token=pk.eyJ1IjoidHVjYXNzZXNsZXNjb3VpbGxlcyIsImEiOiJjbHhraG51NzEwMWd0MmpzZG02aXQ4bjlkIn0.Rf-MR-RK_4Qi75WYkOINjg`;
  fetch(url)
    .then(response => response.json())
    .then(data => {
      const coordinates = data.features[0].center; // Assuming the first result is the most relevant
      map.setCenter(coordinates);
      map.setZoom(12); // Adjust zoom level as needed
    })
    .catch(error => {
      console.error('Error fetching the city coordinates:', error);
    });
}

document.getElementById('searchButton').addEventListener('click', () => {
  const cityName = document.getElementById('cityInput').value;
  searchCity(cityName);
});
