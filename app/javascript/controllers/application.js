import { Application } from "@hotwired/stimulus"
import star_bar_controller from "./star_bar_controller";

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

