import { Application } from "@hotwired/stimulus"
import TextareaAutogrow from 'stimulus-textarea-autogrow'

// Start Stimulus
const Stimulus = Application.start()
Stimulus.register('textarea-autogrow', TextareaAutogrow)

import Flash_controller from "./flash_controller.js";
Stimulus.register("flash", Flash_controller);

import Tiptap_controller from "./tiptap_controller.js";
Stimulus.register("tiptap", Tiptap_controller);

export { Stimulus }
