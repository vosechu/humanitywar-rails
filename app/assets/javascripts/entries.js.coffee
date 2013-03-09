# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('.entries a').on 'click', (e) ->
    $target = $(e.currentTarget)
    $.ajax
      url: '/entries/win'
      method: 'PUT'
      data:
        win_id: $target.attr('id').replace('entry-', '')
        lose_id: $target.data('lose_id')
      success: (data) ->
        location.reload()
      error: () ->
        location.reload()