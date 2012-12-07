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

  $("#appreciableBtn").live("click", function(){
    $("#appreciableForm").find("form").submit();
  })

  $(".Toggle").on("click", function(){
     $(this).next().toggleClass('open')
  });

  $(window).on("resize", function(){
    $("menutoggler").css("display", "block")
  })

  $(".clearsearch").live("click",function(){
    $("#searchresults").slideUp(500, function(){
      $(this).css("display", "block").html("");
    })

  });




});

function scrollChatbox(){
  var chat = document.getElementById('chatBox');
  chat.scrollTop = chat.scrollHeight;
}