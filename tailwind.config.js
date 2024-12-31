/** @type {import('tailwindcss').Config} */
const defaultTheme = require("tailwindcss/defaultTheme");
export default {
  content: [
    "./public/*.html",
    "./app/helpers/**/*.rb",
    "./app/assets/stylesheets/**/*.css",
    "./app/views/**/*.{html,html.erb,erb}",
    "./app/javascript/**/*.js",
    "./config/initializers/**/*",
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ["Inter var", ...defaultTheme.fontFamily.sans],
      },
      boxShadow: {
        combined: `0px 4px 6px -2px rgba(0, 0, 0, 0.1), 0px 16px 32px 8px rgba(0, 0, 0, 0.2)`,
        dropdown:
          "0rem 2rem 1.5rem 0rem #0E142B14, 0rem 0.75rem 1.5rem 0rem #0E142B14, 0rem 0rem 1rem 0rem #0000001A",
        "new-entity": "0rem 0.25rem 0.25rem 0rem #0E142B14",
        "new-entity-hover":
          "0rem 0.5rem 0.25rem 0rem #579AFF14, 0rem 0.375rem 0.25rem 0rem #579AFF14, 0rem 0.25rem 0.25rem 0rem #579AFF14, 0rem 0rem 0.5rem 0rem #579AFFB8",
      },
      fontSize: {
        xxs: "0.625rem",
      },
      spacing: {
        header: "3.5rem",
        "screen-header": "calc(100vh - 3.5rem)",
        notifications: "80px",
      },
      transitionProperty: {
        height: "height",
        width: "width",
      },
      animation: {
        shake: "shake 0.62s cubic-bezier(.36,.07,.19,.97) both",
      },
      keyframes: {
        shake: {
          "10%, 90%": {
            transform: "translate3d(-1px, 0, 0)",
          },
          "20%, 80%": {
            transform: "translate3d(2px, 0, 0)",
          },
          "30%, 50%, 70%": {
            transform: "translate3d(-4px, 0, 0)",
          },
          "40%, 60%": {
            transform: "translate3d(4px, 0, 0)",
          },
        },
      },
      backgroundImage: {
        "brand-gradient":
          "linear-gradient(133.83deg, #2E3FFF 0.98%, #8A4DFF 99.02%)",
        "brand-gradient-inverse":
          "linear-gradient(133.83deg, #8A4DFF 0.98%, #2E3FFF 99.02%)",
      },
      colors: {
        // Electric Violet Brand Color
        primary: {
          50: "#F4F2FF",
          100: "#EDE7FF",
          200: "#DBD2FF",
          300: "#C2AEFF",
          400: "#A580FF",
          500: "#8A4DFF",
          600: "#751AFF",
          700: "#6F16EB",
          800: "#5D12C5",
          900: "#4D11A1",
          950: "#2E076E",
        },
        // Neon Brand Color
        secondary: {
          50: "#EBF4FF",
          100: "#DBE9FF",
          200: "#BED6FF",
          300: "#97B9FF",
          400: "#6E90FF",
          500: "#4C69FF",
          600: "#2E3FFF",
          700: "#202CE2",
          800: "#1D29B6",
          900: "#202B8F",
          950: "#131853",
        },

        accent: "#F4F2FF",
        destructive: "#DC2626",
        background: "#131853",
        foreground: "#171717",
        "muted-foreground": "#D4D4D4",
        "secondary-foreground": "#525252",
        "secondary-background": "#F5F5F5",
      },
    },
  },
  plugins: [require("daisyui")],
};
