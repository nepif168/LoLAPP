# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
Search = (keyword) ->
  regExp = new RegExp(keyword, 'i')
  $('#TABLE1').find('tr').each ->
    $(this).find('td').hide().each ->
      td = $(this)
      if $(this).text().match(regExp)
        td.show()
      return
    return
  return

$(document).ready ->
  $('input').on 'keyup', ->
    Search $(this).val()
    return
  return
