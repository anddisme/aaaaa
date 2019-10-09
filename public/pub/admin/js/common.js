$(function () {
  $(window).scroll(function() {       
      if($(window).scrollTop()>= 100){
        $('#top').fadeIn(300); 
      }else{    
        $('#top').fadeOut(300);
      }  
  });
  $('#top').click(function(){$('html,body').animate({scrollTop: '0px'}, 800);});
  $('input[name=status]').on('ifChecked', function(event){
    listsearch();
  });
});

