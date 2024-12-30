import plugin, {registerComponent, TurboMount} from "turbo-mount/react";
import {registerComponents} from "turbo-mount/registerComponents/vite";
import {HexColorPicker} from 'react-colorful';

const controllers = import.meta.glob("./**/*_controller.js", {eager: true});
const components = import.meta.glob("/components/**/*.jsx", {eager: true});

const turboMount = new TurboMount();
registerComponents({plugin, turboMount, components, controllers});
registerComponent(turboMount, "HexColorPicker", HexColorPicker);
