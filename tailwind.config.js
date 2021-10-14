module.exports = {
  mode: "jit",
  purge: {
    content: [
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
    // needed by UserData.res
    safelist: [
      "bg-red-100",
      "bg-blue-100",
      "bg-yellow-100",
      "bg-pink-100"
    ]
  },
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
  plugins: [
    ({
      addComponents,
    }) => {
      addComponents({
        ".writing-vertical": {
          writingMode: "vertical-lr",
          textOrientation: "mixed"
        }  
      })
    }]
}
