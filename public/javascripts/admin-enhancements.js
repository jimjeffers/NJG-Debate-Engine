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
      
      $('#published_at_date, #published_at_time').change(function() {
         var formattedDate = $('#published_at_date').val();
         $('#article_published_at').val(formattedDate.substr(6,4)+'-'+formattedDate.substr(0,2)+'-'+formattedDate.substr(3,2)+' '+$('#published_at_time').val());
         alert($('#article_published_at').val());
      });
   }
   $('#published_at_date, #published_at_time').change(function() {
      var formattedDate = $('#published_at_date').val();
      $('#article_published_at').val(formattedDate.substr(6,4)+'-'+formattedDate.substr(0,2)+'-'+formattedDate.substr(3,2)+' '+$('#published_at_time').val());
   });
   $('.accordian').accordion();
   $('.datepicker').datepicker();
});
