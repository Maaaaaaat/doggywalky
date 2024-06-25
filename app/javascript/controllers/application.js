import { Application } from "@hotwired/stimulus";

const application = Application.start();

application.debug = false;
window.Stimulus = application;

export { application };

import "controllers";
import "../city_forms";
