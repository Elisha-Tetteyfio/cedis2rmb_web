const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Quicksand', 'Inter var', ...defaultTheme.fontFamily.sans],

      },
    },
    colors: {
      'slate': '#fafbff',
      'white': '#ffffff',
      'blue': '#4f71fa',
      'blue-light': '#edf0ff',
      'blue-dark': '#04124d',
      'grey-dark': '#636363',
      'grey-light': '#d9d9d9',
      'green-light': '#ebffe0',
      'yellow-light': '#fff5e0',
      'red-light': '#ffe0e0',
      'yellow': '#f9bc23',
      'green': '#23f96e',
      'red': '#f92323'
    }
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
