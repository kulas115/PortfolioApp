ready = ->
  new Typed '.element',
    strings: [
      'This is one of my first rails applications.'
      'I am using it as a polygon for testing our new ideas that should come nicely together into portfolio app.'
    ]
    typeSpeed: 30
  return

$(document).ready ready
$(document).on 'turbolinks:load', ready
