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
  $('.assign-score').on 'click' , ->
    team = $(this).data('team')
    points = $('#current_score').val()
    $.ajax
      url: "/assign_scores/new"
      data:
        team: team
        points: points

  ['invalidRed', 'invalidBlue', 'scoreRed', 'scoreBlue'].map (field) ->
    $("b##{field}").text(localStorage.getItem(field))

  $(document).on 'storage-changed', ->
    ['invalidRed', 'invalidBlue', 'scoreRed', 'scoreBlue'].map (field) ->
      $("b##{field}").text(localStorage.getItem(field))
    ['invalidRed', 'invalidBlue'].map (field) ->
      if parseInt(localStorage.getItem(field)) == 3
        $("a##{field}").addClass('disabled')
      else
        $("a##{field}").removeClass('disabled')
