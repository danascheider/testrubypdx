$(document).ready ->
  $('#talk_speaker_id').change ->
    if $(@).val() == '2'
      $(@).hide()
      $('#nested_speaker_form').show()