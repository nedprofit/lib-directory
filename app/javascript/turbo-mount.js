import {TurboMount} from "turbo-mount";
import {registerComponent} from "turbo-mount/react";

const turboMount = new TurboMount();

registerComponent(turboMount, "editor", useMarkdownEditor);
