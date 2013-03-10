# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('.entries a').on 'click', (e) ->
    e.preventDefault()
    $target = $(e.currentTarget)
    $.ajax
      url: '/entries/win'
      method: 'PUT'
      data:
        win_id: $target.attr('id').replace('entry-', '')
        lose_id: $target.data('lose_id')
      success: (data) ->
        location.reload()
  $('.icon-refresh').on 'click', (e) ->
    e.preventDefault()
    $target = $('.entries a:first')
    $.ajax
      url: '/entries/draw'
      method: 'PUT'
      data:
        draw_ids: [
          $target.attr('id').replace('entry-', ''),
          $target.data('lose_id')]
      success: (data) ->
        location.reload()