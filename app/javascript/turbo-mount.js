import plugin, {TurboMount} from "turbo-mount/react";
import {registerComponents} from "turbo-mount/registerComponents/esbuild";
import controllers from "./controllers/**/*_controller.js";
import components from "./components/**/*.jsx";

const turboMount = new TurboMount();

registerComponents({plugin, turboMount, components, controllers});