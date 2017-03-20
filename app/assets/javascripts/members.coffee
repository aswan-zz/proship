# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

load_availabilities = ->
  $('#availabilities_list_div').load '/members/' + member_id + '/availabilities'
  return

$(document).ready ->
  $('#new_availability_div').load '/availabilities/new'
  load_availabilities()
  form_loaded = false
  $(document).ajaxComplete (event, request, settings) ->
    if form_loaded == true
      return false
    form_loaded = true
    $('#availability_member_id').val member_id
    $('.availability_type_button').click (e) ->
      url = $('#new_availability').attr('action')
      method = $('#new_availability').attr('method')
      id = $(this).attr('id')
      $('#availability_availability_type_id').val id
      $.ajax
        type: method
        url: url
        dataType: 'JSON'
        data: $('#new_availability').serialize()
        success: (data) ->
          $('#new_availability')[0].reset()
          load_availabilities()
          return
        error: (data) ->
          errorMsg = ''
          $.each data.responseJSON, (key, value) ->
            errorMsg += key + ' ' + value + '\n'
            return
          alert errorMsg
          return
      e.preventDefault()
      false
    return
  return
  
$(document).ready ->

  load_comments = ->
    $('#note_history').load '/members/' + member_id + '/notes'
    
    return

  edit_comment = (url) ->
    $.ajax
      type: 'GET'
      url: url
      dataType: 'JSON'
      success: (data) ->
        $('#note_content').val data.content
        $('#member_to_id').val data.member_to_id
        $('#member_from_id').val data.member_from_id
        $('input[name="note[note_type_id]"]').val [ data.note_type_id ]
        $('#new_note').attr 'action', '/notes/' + data.id
        $('#new_note').attr 'method', 'PATCH'
        return
      error: (data) ->
        errorMsg = ''
        $.each data.responseJSON, (key, value) ->
          errorMsg += key + ' ' + value + '\n'
          return
        alert errorMsg
        return
    return

  delete_comment = (url) ->
    $.ajax
      type: 'DELETE'
      url: url
      dataType: 'JSON'
      success: load_comments
      error: (data) ->
        jsonPretty = JSON.stringify(data, null, '\u0009')
        #alert(jsonPretty);
        errorMsg = ''
        $.each data.responseJSON, (key, value) ->
          errorMsg += key + ' ' + value + '\n'
          return
        alert errorMsg
        return
    return

  $('#new_note_div').load '/notes/new'
  
  $(document).ajaxComplete (event, request, settings) ->
    $('#note_member_to_id').val member_id
    $('#edit_past_comment').click (event) ->
      addressValue = $(this).attr('href')
      edit_comment addressValue
      event.preventDefault()
      return
    $('#delete_past_comment').click (event) ->
      addressValue = $(this).attr('href')
      delete_comment addressValue
      event.preventDefault()
      false
    $('#new_note_reset').click (event) ->
      $('#new_note').attr 'action', '/notes'
      $('#new_note').attr 'method', 'POST'
      return
    return
  if $('#note_history').val() == ''
    load_comments()
  $('#new_note_div').submit (e) ->
    url = $('#new_note').attr('action')
    e.preventDefault()
    method = $('#new_note').attr('method')
    $.ajax
      type: method
      url: url
      dataType: 'JSON'
      data: $('#new_note').serialize()
      success: (data) ->
        $('#new_note')[0].reset()
        load_comments()
        $('#new_note').attr 'action', '/notes'
        $('#new_note').attr 'method', 'POST'
        return
      error: (data) ->
        jsonPretty = JSON.stringify(data, null, '\u0009')
        #alert(jsonPretty);
        errorMsg = ''
        $.each data.responseJSON, (key, value) ->
          errorMsg += key + ' ' + value + '\n'
          return
        alert errorMsg
        return
    return
  return
  