import { Application } from "@hotwired/stimulus";

const application = Application.start();

// Configure Stimulus development experience
application.debug = false;
window.Stimulus = application;

export { application };

// app/javascript/packs/application.js
import "controllers";


const ACCESS_TOKEN =
  "pk.eyJ1IjoidHVjYXNzZXNsZXNjb3VpbGxlcyIsImEiOiJjbHhraG51NzEwMWd0MmpzZG02aXQ4bjlkIn0.Rf-MR-RK_4Qi75WYkOINjg";

mapboxgl.accessToken = ACCESS_TOKEN;
const map = new mapboxgl.Map({
  container: "map",
  style: "mapbox://styles/mapbox/streets-v12",
  center: [-73.99209, 40.68933],
  zoom: 12,
});

const searchJS = document.getElementById("search-js");
searchJS.onload = function () {
  const geocoder = new MapboxGeocoder();
  geocoder.accessToken = ACCESS_TOKEN;
  geocoder.options = {
    proximity: [-73.99209, 40.68933],
  };
  geocoder.marker = true;
  geocoder.mapboxgl = mapboxgl;
  map.addControl(geocoder);
};

document.addEventListener("turbo:load", () => {
  var dropdownElementList = [].slice.call(
    document.querySelectorAll(".dropdown-toggle")
  );
  var dropdownList = dropdownElementList.map(function (dropdownToggleEl) {
    return new bootstrap.Dropdown(dropdownToggleEl);
  });
});

  document.addEventListener('turbo:load', () => {
    var dropdownElementList = [].slice.call(document.querySelectorAll('.dropdown-toggle'));
    var dropdownList = dropdownElementList.map(function (dropdownToggleEl) {
      return new bootstrap.Dropdown(dropdownToggleEl);
    });

    // Confirmation de déconnexion
    const logoutLinks = document.querySelectorAll('.logout-link');
    logoutLinks.forEach(link => {
      link.addEventListener('click', function(event) {
        event.preventDefault();
        const confirmation = confirm("Êtes-vous sûr de vouloir vous déconnecter ?");
        if (confirmation) {
          const form = document.createElement('form');
          form.style.display = 'none';
          form.method = 'POST';
          form.action = this.href;

          const csrfInput = document.createElement('input');
          csrfInput.name = 'authenticity_token';
          csrfInput.value = document.querySelector('meta[name="csrf-token"]').content;
          form.appendChild(csrfInput);

          const methodInput = document.createElement('input');
          methodInput.name = '_method';
          methodInput.value = 'delete';
          form.appendChild(methodInput);

          document.body.appendChild(form);
          form.submit();
        }
      });
    });
  });
