//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require jquery.timepicker
//= require jquery.Jcrop
//= require jquery_nested_form
//= require jquery.iframe-transport
//= require jquery.remotipart
//= require admin/default


$(document).ready(function(){

  $("#appreciableBtn").on("click", function(){
    $(this).toggleClass("holy");
    $("#appreciableForm").find("form").submit();
  });

  $("#search_field").bind('keyup', function(){
    $(this).closest("form").delay(200).submit();
  });



  $(".Toggle").on("click", function(){
     $(this).next().toggleClass('open')
  });

  $(window).on("resize", function(){
    $("menutoggler").css("display", "block")
  })

//verwijder zoekresultaten
  $(".clearsearch").live("click",function(){
    $("#searchresults").slideUp(500, function(){
      $(this).css("display", "block").html("");
    })
  });

// voeg dynamische blokken toe in idea/solution
$('.changer').live("change", function(){
    select = $(this);
    selectval = $(this).find('select').val();
    if (selectval == "tekst"){
      select.hide();
      select.parent().find('.text_filter').show();
      select.parent().find('.image_filter').remove();
      select.parent().find('.youtube_filter').remove();
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

// stretch textarea's
  $('textarea').live('keyup keypress', function() {
      $(this).height('');
      var brCount = this.value.split('\n').length;
      this.rows = brCount+1; //++ To remove twitching
      var areaH = this.scrollHeight,
          lineHeight = $(this).css('line-height').replace('px',''),
          calcRows = Math.floor(areaH/lineHeight);
      this.rows = calcRows;
  });

});

function scrollChatbox(){
  var chat = document.getElementById('chatBox');
  chat.scrollTop = chat.scrollHeight;
}

function update_author_score(mode){

  var current_score = parseInt($("#author .karmascore span").html());
  if(mode == "add"){
    $("#author .karmascore span").html(current_score+1)
  }else if(mode == "sub"){
    $("#author .karmascore span").html(current_score-1)
  }
}
