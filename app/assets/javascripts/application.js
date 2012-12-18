//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require jquery.timepicker
//= require jquery.Jcrop
//= require jquery_nested_form
//= require jquery.iframe-transport
//= require jquery.remotipart
//= require bootstrap.min
//= require animation_and_svg_check
//= require admin/default


$(document).ready(function(){


  $("#appreciableBtn").on("click", function(){
    $(this).toggleClass("holy");
    $("#appreciableForm").find("form").submit();
  });

  $(".skypeBtn").on("click", function(){
    $(this).addClass("skypeAvailable").find("span").html("Je bent aangemeld");
    $("#skypeForm").find("form").submit().remove();
  });


  var timer;
  var loadertime = 1500

  $("#search_field").bind('keyup', function(){
    $("#searchloader").slideDown(1000, function(){
      timer = setTimeout(submitSearch, loadertime)
    })
    $("#searchresults").slideUp(500)
    // if($(".loaderholder").length < 1){
    //   $("#searchresults").html("<div class='loaderholder'><img class='ajaxloader' src='/ajax-loader.gif'/><div class='loader'></div><div class='loader2'></div><div class='loader4'></div></div>")
    // }
  });
  $("#search_field").bind('keydown', function(){
     clearTimeout(timer);
  });

  $(window).resize(function() {
    toggleSlides();
  });
  toggleSlides();



  // $(".Toggle").on("click", function(){
  //    $(this).next().toggleClass('open')
  // });

  // $(window).on("resize", function(){
  //   $("menutoggler").css("display", "block")
  // })

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

  $('textarea').each(function(){
    $(this).height('');
      var brCount = this.value.split('\n').length;
      this.rows = brCount+1; //++ To remove twitching
      var areaH = this.scrollHeight,
          lineHeight = $(this).css('line-height').replace('px',''),
          calcRows = Math.floor(areaH/lineHeight);
      this.rows = calcRows;
  })

});

function scrollChatbox(){
  var chat = document.getElementById('chatBox');
  chat.scrollTop = chat.scrollHeight;
}

function update_author_score(mode){

  var current_score = parseInt($("#author .karmascore span").html());
  console.log(current_score)
  if(mode == "add"){
    var score = String(current_score + 1)
    console.log(score)
    $("#author .karmascore span").html(score)
  }else if(mode == "sub"){
    var score = String(current_score - 1)
    console.log(score)

    $("#author .karmascore span").html(score)
  }

}


function toggleSlides(){
  if($(window).width() <= 640){
    $("#collapseOne").removeClass('in').css('height', 0)
    $("#collapseEleven").removeClass('in').css('height', 0)
  }else{
    $("#collapseEleven").css('height', 'auto').addClass('in')
    $("#collapseOne").css('height', 'auto').addClass('in')
  }
}
function submitSearch(){
    if($("#search_field").val() !== ""){
      $("#search_field").closest("form").submit();
    }

}