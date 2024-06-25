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

document.addEventListener('turbo:load', () => {
  var dropdownElementList = [].slice.call(document.querySelectorAll('.dropdown-toggle'))
  var dropdownList = dropdownElementList.map(function (dropdownToggleEl) {
    return new bootstrap.Dropdown(dropdownToggleEl)
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
