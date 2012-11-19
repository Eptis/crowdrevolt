//= require jquery
//= require jquery_ujs
//= require jquery_nested_form
//= require jquery.iframe-transport
//= require jquery.remotipart
//= require angular
//= require_tree .


$(function(){
  var faye = new Faye.Client('http://localhost:9292/faye');
  faye.subscribe("/messages/new", function(data) {
    eval(data);
  });
})