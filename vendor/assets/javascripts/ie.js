var setImageInterval;
$(document).ready(function(){
  setImageInterval = setInterval(setImage, 500);
  

  $(window).resize(function(){
    setImage();
  })
});

function setImage(){
  if(picturefilled == true){
    clearInterval(setImageInterval);
    if($(window).width() < 640){
      var small = $('#smallheader').attr('data-src');
      $('.background img').attr('src', small)
    }else{
      var large = $('#largeheader').attr('data-src');
      $('.background img').attr('src', large)
    }    
  }else{
    if($(window).width() < 640){
      var small = $('#smallheader').attr('data-src');
      $('.background img').attr('src', small)

    }else{
      var large = $('#largeheader').attr('data-src');
      $('.background img').attr('src', large)
    }    
  }

}