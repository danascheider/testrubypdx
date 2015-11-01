(function() {
  $(document).ready(function() {
    return $('#talk_speaker_id').change(function() {
      if ($(this).val() === '2') {
        return $('#nested_speaker_form').show();
      }
    });
  });

}).call(this);
