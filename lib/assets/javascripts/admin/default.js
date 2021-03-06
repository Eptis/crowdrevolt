// AUTH_TOKEN constante.
// const AUTH_TOKEN;

// CKEditor instellingen.
var ckeditor_settings = [
  { name: 'basicstyles', items : [ 'Bold','Italic','Underline','Strike','Subscript','Superscript','-','RemoveFormat' ] },
  { name: 'clipboard', items : [ 'Undo','Redo' ] },
  // { name: 'editing', items : [ 'Find','Replace','-','SelectAll' ] },
  { name: 'paragraph', items : [ 'NumberedList','BulletedList','Blockquote','-' ] },
  { name: 'links', items : [ 'Link','Unlink' ] },
  { name: 'insert', items : [ 'Image','HorizontalRule', ] },//'SpecialChar'
  // "/",
  { name: 'styles', items : [ 'Format' ] }, //'Styles',
  { name: 'colors', items : [ ] },
  { name: 'tools', items : [ 'Maximize', 'ShowBlocks' ] }
]

// Globale variabelen.
var image_selector;

// Functie om HTML te unescapen.
function unescapeHTML(html) {
  return $("<div />").html(html).text();
}

function addCKEditor() {
  if ($('textarea.editor:not(.editor_added)').length) {
    var data = $('textarea.editor:not(.editor_added)');
    $.each(data, function(i, el) {
      $(el).addClass("editor_added");
      CKEDITOR.replace(data[i].id, {
        toolbar: ckeditor_settings
      });
    });
  }
  if ($('form textarea.owneditor:not(.editor_added)').length) {
    var data = $('form textarea.owneditor:not(.editor_added)');
    $.each(data, function(i, el) {
      $(el).addClass("editor_added");
      CKEDITOR.replace(data[i].id, {
        toolbar: ckeditor_settings
      });
    });
  }
}

$(function(){
  // Chosen aan alle select velden toevoegen zonder de class 'no_chosen'.
  // $("select:not(.no_chosen)").chosen();

  // Voeg classes toe aan buttons rechtsbovenin.
  $("#buttons a").addClass("btn-primary btn-large");
  $("#buttons a i").addClass("icon-white");

  // Datum en tijd selecteren.
  $(".datepicker").datepicker({ dateFormat: 'dd-mm-yy' });
  $(".datetimepicker").datetimepicker({ dateFormat: 'dd-mm-yy' });

  // CKEditor aan alle tekstvelden toevoegen zonder de class 'no_cke'.
  addCKEditor();

  // Als je ergens een 'check' class aan toevoegt en er wordt op geklikt,
  // zal het formulier worden verstuurd.
  // $("input.check").live("click", function(){
  //   $(this).closest("form").submit();
  // });

  // Event voor tekstvelden met TagsInput.
  $('input.tags').each(function() {
    if ($(this).data("url")) {
      $(this).tagsInput({
        autocomplete_url: $(this).data("url")
      });
    } else {
      $(this).tagsInput();
    }
  });

  // #######################
  // ## Dynamische velden ##
  // #######################
  // if($(".add_fields").length) {
  //   $(".remove_fields").live("click", function(e){
  //     e.preventDefault();
  //     var link = $(this);
  //     link.prev("input[type=hidden]").val("1");
  //     link.closest(".fields").hide();
  //   });

  //   $(".add_fields").live("click", function(e){
  //     e.preventDefault();
  //     var link = $(this);
  //     var association = link.data("association");
  //     var content = unescapeHTML(link.data("content"));

  //     var new_id = new Date().getTime();
  //     var regexp = new RegExp("new_" + association, "g");
  //     link.before(content.replace(regexp, new_id));

  //     $(".datepicker").datepicker({ dateFormat: 'dd-mm-yy' });
  //     $(".datetimepicker").datetimepicker({ dateFormat: 'dd-mm-yy' });
  //     addCKEditor();
  //   });
  // }

  // ##############
  // ## Sortable ##
  // ##############
  // Helper om de juiste breedte van de cel te krijgen.
  // var fixHelper = function(e, tr) {
  //   var originals = tr.children();
  //   var helper = tr.clone();
  //   helper.children().each(function(index){
  //     // Set helper cell sizes to match the original sizes
  //     $(this).width(originals.eq(index).width())
  //   });
  //   return helper;
  // };

  // // Functie om tabellen sortable te maken.
  // $(".sortable").each(function(){
  //   var el = $(this);
  //   el.sortable({
  //     items: el.data("item"),
  //     containment: 'parent',
  //     tolerance: "pointer",
  //     axis: 'y',
  //     handle: ".handle",
  //     placeholder: "placeholder",
  //     forcePlaceholderSize: true,
  //     helper: fixHelper,
  //     update: function() {
  //       var el = $(this);
  //       $.post(el.data("url"), '_method=put&authenticity_token='+AUTH_TOKEN+'&'+el.sortable('serialize'));
  //     }
  //   });
  // });

  // // #################
  // // ## Categorieën ##
  // // #################
  // if($("#categories").length) {
  //   $(".parent_category h2").hover(function(){
  //     $(this).children(".buttons").show();
  //   }, function(){
  //     $(this).children(".buttons").hide();
  //   }).mouseout();

  //   $('#categories').sortable({
  //     items: '.parent_category',
  //     tolerance: "pointer",
  //     axis: 'y',
  //     handle: ".handle",
  //     update: function() {
  //       $.post($('#categories').data("url"), '_method=put&authenticity_token='+AUTH_TOKEN+'&'+$(this).sortable('serialize'));
  //     }
  //   });
  // }

  // ########################
  // ## Beelden selecteren ##
  // ########################
  // Als er op de 'Klaar'-knop of op het achtergrond wordt geklikt moet #image_popup verdwijnen.
  $("#image_popup_background, #image_done a").click(function(evt){
    evt.preventDefault();
    $("#image_popup").hide();
  });

  // Dit is de link om de 'image selector' te tonen.
  $(".image_selector_link").live("click", function(evt){
    evt.preventDefault();
    var el = $(this);
    el.trigger("ajax:beforeSend");
    image_selector = el.parent().parent().find(".image_selector_field");
    $("#image_paginate").html("");
    $("#image_popup").show();
    $.getScript($("#image_popup").data("url"));
  });

  // Loader GIF laten zien als er op een AJAX link wordt geklikt.
  $(".image_ajax").live("ajax:beforeSend", function(evt, xhr, settings){
    $("#image_loading").html("<div class ='loaderholder'><img class='ajaxloader' src=\"/assets/ajax-loader.gif\" /><div class='loader'></div><div class='loader2'></div><div class='loader4'></div></div>");

    $("#image_wrapper").hide();
  });

  // Dit is als je een beeld verwijdert.
  $(".image_previews .image_preview").live("click", function(){
    var el = $(this);
    var id = el.find("img").data("id");
    var image_val;
    image_selector = el.parent().prevAll(".image_selector_field");
    image_val = image_selector.val();
    image_selector.val(image_val.replace(","+id, ""));
    image_val = image_selector.val();
    image_selector.val(image_val.replace(id+",", ""));
    image_val = image_selector.val();
    image_selector.val(image_val.replace(id, ""));
    el.remove();
  }).live("mouseover", function(){
    $(this).find(".delete").show();
  }).live("mouseout", function(){
    $(this).find(".delete").hide();
  });

  // Dit is de link om een beeld toe te voegen.
  $(".image_selector_add").live("click", function(evt){
    evt.preventDefault();
    var el = $(this);
    var id = el.data("id") + "";
    var url = el.data("url");
    var image = "<div class=\"image_preview thumbnail\"><img src=\""+ url +"\" width=\""+ el.data("width") +"\" height=\""+ el.data("height") +"\" data-id=\""+ id +"\" /><span class=\"delete\">X</span></div>";
    var image_val = image_selector.val();
    var images = image_selector.parent().find(".image_previews");
    $("#image_popup").hide();
    $("#image_table").before("<div class=\"alert alert-success\"><a class=\"close\" data-dismiss=\"alert\" href=\"#\">×</a>" + el.data("text") + "</div>");

    if(image_val == "") {
      image_selector.val(id);
      images.html(image);
    } else {
      if(image_selector.data("total")) {
        var total = parseInt(image_selector.data("total"));
        if(total == 1) {
          image_selector.val(id);
          images.html(image);
        } else {
          if(image_val.split(",").length < total) {
            if($.inArray(id, image_val.split(",")) == -1){
              image_selector.val(image_val + "," + id);
              images.append(image);
            }
          }
        }
      } else {
        if($.inArray(id, image_val.split(",")) == -1){
          image_selector.val(image_val + "," + id);
          images.append(image);
        }
      }
    }
  });
});


// #############################
// ## Cropper functionaliteit ##
// #############################
// Coördinaten invullen in hidden_fields.
function showCoords(c) {
  $('#crop_x').val(c.x);
  $('#crop_y').val(c.y);
  $('#crop_w').val(c.w);
  $('#crop_h').val(c.h);
};

// Als de window is geladen moet Jcrop.
// Dit moet omdat de <img> helemaal geladen moet zijn.
$(window).load(function(){
  // Cropper
  var jcrop = $("#Jcrop");
  var ratio = parseFloat(jcrop.data("ratio"));
  var min_w = parseFloat(jcrop.data("min-w"));
  var min_h = parseFloat(jcrop.data("min-h"));
  var image_w = jcrop.width();
  var image_h = jcrop.height();

  jcrop.Jcrop({
    onChange: showCoords,
    onSelect: showCoords,
    aspectRatio: ratio,
    minSize: [min_w, min_h],
    setSelect: [(image_w/2)-(min_w/2), (image_h/2)-(min_h/2), (image_w/2)+(min_w/2), (image_h/2)+(min_h/2)]
  });
});