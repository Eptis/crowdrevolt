//= require jquery
//= require jquery_ujs
//= require jquery_nested_form
//= require jquery.iframe-transport
//= require jquery.remotipart
//= require angular
//= require_tree .


$(document).ready(function(){
  $("#search_field").bind('keyup', function(){
    $(this).closest("form").delay(200).submit();
    console.log('change')
  });
});