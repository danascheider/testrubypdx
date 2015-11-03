$(document).ready ->
  $('.nav-pills li').click ->
    target = $(@).data('target')

    # Make all the pills inactive and then turn only the
    # clicked one active
    $(@).siblings().removeClass('active')
    $(@).addClass('active')

    $('.admin_view').hide()
    $(target).show()