$(document).ready(function() {
   
   $('#article_published_at').hide();
   $('#published_at_option').show();
   if($('#article_published_at').val() == "") {
      $('#edit_published_at').click(function() {
         $(this).parent().hide();
         $(this).parent().next().show();
         $('#published_at_date').val('select a date');
         $('#published_at_time').val('00:00:00');
         $('#published_at_date').datepicker();
         return false;
      });
   } else if($('#article_published_at').length > 0) {
      $('#published_at_date').val($('#article_published_at').val().split(" ")[0].replace(/-/g,'/'));
      $('#published_at_time').val($('#article_published_at').val().split(" ")[1]);
      $('#edit_published_at').parent().hide();
      $('#edit_published_at').parent().next().show();
      $('#published_at_date').datepicker();
   }
   $('.accordian').accordion();
   $('.datepicker').datepicker();
});
