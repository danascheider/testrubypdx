(function() {
  $(document).ready(function() {
    return $('#talk_speaker_id').change(function() {
      if ($(this).val() === '2') {
        return $(this).hide();
      }
    });
  });

}).call(this);
