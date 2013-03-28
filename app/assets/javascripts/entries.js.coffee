# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  # When we mouse over a card we need to move it out a little bit so we can read the description
  $('.entries .multi-card .white-card-wrapper').hoverIntent \
    (e) ->
      # Mouseover
      # We have to use padding on a wrapper element because mousing over margin
      # doesn't count as a mouseover. Without doing this, if we put the mouse over
      # the icon it would move the card, which would count as a mouseout (because
      # our mouse is no longer on the card which has moved out of the way).
      $target = $(e.currentTarget)
      $target.css('padding-bottom', parseInt($target.css('padding-bottom'), 10) + 60 + "px")
      $target.css('top', parseInt($target.css('top'), 10) - 60 + "px")
      $target.css('padding-left', parseInt($target.css('padding-left'), 10) + 10 + "px")
      $target.css('left', parseInt($target.css('left'), 10) + 10 + "px")
    , \
    (e) ->
      # Mouseout, restore original position
      $target = $(e.currentTarget)
      $target.css('padding-bottom', parseInt($target.css('padding-bottom'), 10) - 60 + "px")
      $target.css('top', parseInt($target.css('top'), 10) + 60 + "px")
      $target.css('padding-left', parseInt($target.css('padding-left'), 10) - 10 + "px")
      $target.css('left', parseInt($target.css('left'), 10) - 10 + "px")

  # When you click on an entry send a request to /entries/win and then
  # reload the page.
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

  # When the refresh icon is clicked, tell those entries to register that
  # battle as a draw.
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