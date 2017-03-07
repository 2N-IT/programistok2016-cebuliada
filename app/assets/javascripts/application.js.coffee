#= require jquery
#= require jquery_ujs
#= require jquery
#= require bootstrap-sprockets
#= require turbolinks
#= require_tree .

localStorage.setItem('scoreRed', 0)
localStorage.setItem('scoreBlue', 0)

$(document).on 'turbolinks:load', ->

  localStorage.setItem('invalidRed', 0)
  localStorage.setItem('invalidBlue', 0)

  $('.show-question').off('click').on 'click' , ->
    $('.assign-score, .valid-answer').removeClass('disabled')

    $(this).addClass('disabled')

  $('.assign-score').off('click').on 'click' , ->
    $('.assign-score').addClass('disabled')
    team = $(this).data('team')
    points = $('#current_score').val()
    $.ajax
      url: "/game/assign_score"
      data:
        team: team
        points: points
      complete: ->
        $('#current_score').val(0)
        score = localStorage.getItem("score#{team.capitalize()}")
        localStorage.setItem("score#{team.capitalize()}", parseInt(score) + parseInt(points))
        $(document).trigger('storage-changed')
        $('.answer a').addClass('disabled')
        $('#next-question').removeClass('disabled')
        $('#show-all').removeClass('disabled')


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

  $('.teamName').off('change').on 'keyup', ->
    $.ajax
      url: '/game/change_name'
      data:
        team: $(this).data('team')
        value: $(this).val()

  $('.play-sounds').off('click').on 'click', (e) ->
    type = this.getAttribute('data-sound-type')
    audio = document.getElementById(type)
    if audio.currentTime > 0
      audio.pause()
      audio.currentTime = 0
      return
    audio.currentTime = 0
    audio.play()

  $('.valid-answer').off('click').on 'click', ->
    answerId = $(this).attr('data-answer-id')
    $.ajax
      url: "/answers/#{answerId}/valid"
      success: (data) ->
        console.log('test:', data.points)
        currentScore = parseInt($('#current_score').val()) + parseInt(data.points)
        scope = $("#answer_#{answerId}")
        $('a', scope).addClass('disabled')
        $('#current_score').val(currentScore)
        audio = document.getElementById('valid')
        audio.currentTime = 0
        audio.play()

  $('.invalid-answer').off('click').on 'click', ->
    answerId = $(this).attr('data-answer-id')
    team = $(this).attr('data-team')
    $.ajax
      url: "/answers/invalid"
      data:
        team: team
      success: ->
        invalid = localStorage.getItem("invalid#{team.capitalize()}")
        localStorage.setItem("invalid#{team.capitalize()}", parseInt(invalid) + 1)
        $(document).trigger('storage-changed')
        audio = document.getElementById('invalid')
        audio.currentTime = 0
        audio.play()

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

