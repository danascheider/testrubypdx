$(document).ready ->
  $('.nav-pills li').click ->
    $(@).siblings().removeClass('active');
    $(@).addClass('active');