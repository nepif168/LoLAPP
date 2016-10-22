# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
Search = (keyword) ->
  regExp = new RegExp(keyword, 'i')
  $('#TABLE1').find('tr').hide().each ->
    tr = $(this)
    $(this).find('td').each ->
      if $(this).text().match(regExp)
        tr.show()
      return
    return
  return

$(document).ready ->
  $('input').on 'keyup', ->
    Search $(this).val()
    return
  return
