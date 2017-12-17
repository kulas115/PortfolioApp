ready = undefined

ready = ->
  $(".sortable").sortable()
  return

$(document).ready ready #when page loaded i want to call ready defined above  
