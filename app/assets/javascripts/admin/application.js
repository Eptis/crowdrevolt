//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require jquery_nested_form
//= require jquery.timepicker
//= require jquery.Jcrop
//= require admin/default

$(document).on('nested:fieldAdded', function(event){
  // this field was just inserted into your form
  var field = event.field;
  // it's a jQuery object already! Now you can find date input
  var dateField = field.find('.date');
  // and activate datepicker on it
  dateField.datepicker();
})

$(document).ready(function(){

  $('.changer').live("change", function(){
    select = $(this);
    selectval = $(this).find('select').val();
    if (selectval == "tekst"){
      select.hide();
      select.parent().find('.text_filter').show();
      select.parent().find('.image_filter').remove();
      select.parent().find('.youtube_filter').remove();
      enableCK(select);
    }
    else if(selectval == "afbeelding"){
      select.hide();
      select.parent().find('.youtube_filter').remove();
      select.parent().find('.text_filter').remove();
      select.parent().find('.image_filter').show();
    }
    else if(selectval == "youtubefilm"){
      select.hide();
      select.parent().find('.youtube_filter').show();
      select.parent().find('.text_filter').remove();
      select.parent().find('.image_filter').remove();
    }
  });
});



function enableCK(select){
  var ck = select.parent().find('.text_filter textarea').attr('id');
  console.log(ck);

  CKEDITOR.replace(ck, {
        toolbar: ckeditor_settings
      });
}
