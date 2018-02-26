ready = ->
  new Typed '.element',
    strings: [
      'This is one of my first rails applications. ^1000'
      'I am using it as a polygon for testing our new ideas that should come nicely together into portfolio app.'
    ]
    typeSpeed: 30
  return

$(document).ready ready
