#= require jquery
#= require jquery_ujs
#= require jquery
#= require bootstrap-sprockets
#= require turbolinks
#= require_tree .

localStorage.setItem('invalidRed', 0)
localStorage.setItem('invalidBlue', 0)
localStorage.setItem('scoreRed', 0)
localStorage.setItem('scoreBlue', 0)
localStorage.setItem('validAnswers', [])

$( document ).on 'turbolinks:load', ->
  $('.assign-score').on 'click' , ->
    team = $(this).data('team')
    points = $('#current_score').val()
    $.ajax
      url: "/assign_scores/new"
      data:
        team: team
        points: points

  ['invalidRed', 'invalidBlue', 'scoreRed', 'scoreBlue'].map (field) ->
    $("##{field}").text(localStorage.getItem(field))

  $(document).on 'storage-changed', ->
    ['invalidRed', 'invalidBlue', 'scoreRed', 'scoreBlue'].map (field) ->
      $("##{field}").text(localStorage.getItem(field))

