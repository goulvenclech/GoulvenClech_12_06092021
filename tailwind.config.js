module.exports = {
  mode: "jit",
  purge: [
    "./src/*.res",
    "./src/**/*.res",
    "./src/*.js",
    "./src/**/*.js",
    "./src/*.re",
    "./src/**/*.re",
    "./src/*.bs.js",
    "./src/**/*.bs.js",
    "./index.html"
  ],
  darkMode: false,
  theme: {
    extend: {
      spacing: {
        "224": "56rem",
      },
      fill: {
        transparent: "transparent",
      }
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
