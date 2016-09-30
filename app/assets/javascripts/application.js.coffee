#= require jquery
#= require jquery_ujs
#= require jquery
#= require bootstrap-sprockets
#= require turbolinks
#= require_tree .

localStorage.setItem('scoreRed', 0)
localStorage.setItem('scoreBlue', 0)

$( document ).on 'turbolinks:load', ->

  localStorage.setItem('invalidRed', 0)
  localStorage.setItem('invalidBlue', 0)

  $('.assign-score').off('click').on 'click' , ->
    team = $(this).data('team')
    points = $('#current_score').val()
    $.ajax
      url: "/game/assign_score"
      data:
        team: team
        points: points

  ['invalidRed', 'invalidBlue', 'scoreRed', 'scoreBlue'].map (field) ->
    $("b##{field}").text(localStorage.getItem(field))

  $(document).off('storage-changed').on 'storage-changed', ->
    ['invalidRed', 'invalidBlue', 'scoreRed', 'scoreBlue'].map (field) ->
      $("b##{field}").text(localStorage.getItem(field))
    ['invalidRed', 'invalidBlue'].map (field) ->
      if parseInt(localStorage.getItem(field)) == 3
        $("a##{field}").addClass('disabled')
      else
        $("a##{field}").removeClass('disabled')

  $('.teamName').off('change').on 'change', ->
    $.ajax
      url: '/game/change_name'
      data:
        team: $(this).data('team')
        value: $(this).val()

  $('#introWav')

  $(document).off('keydown').on 'keydown', (event)->
    console.log('test:', event.keyCode)
    switch event.keyCode
      when 225
        $.ajax
          url: '/game/show_suprise'
      when 105
        document.getElementById('introWav').play()
      when 97
        document.getElementById('funnyWav').play()
