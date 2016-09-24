#= require jquery
#= require jquery_ujs
#= require jquery
#= require bootstrap-sprockets
#= require turbolinks
#= require_tree .

$( document ).on 'turbolinks:load', ->
  $('.assign-score').on 'click' , ->
    team = $(this).data('team')
    points = $('#current_score').val()
    $.ajax
      url: "/score/assign"
      data:
        team: team
        points: points

