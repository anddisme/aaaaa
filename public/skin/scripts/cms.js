$(document).ready(function(){
  $("#main-nav a").click(function(){
	var rel=$(this).attr('rel');
	if(rel!='home')
	{
		var mid= $("#main-nav a").index($(this));
		$(".list-group").hide();
		$(".list-group").eq(mid).show();
		$("#main-nav a").removeClass('selected');
		$(this).addClass('selected');
	
	}
	
	
  });
  
  
  
  
  
  $(".list-wrap .expandable").click(function(){
      if($(this).hasClass('open'))
	  {
		  $(this).parent().next("ul").stop(true, true).slideUp(100);
		  $(this).removeClass('open');
		  $(this).addClass('close');
	  }else{
		  $(this).parent().next("ul").stop(true, true).slideDown(100);
		  $(this).removeClass('close');
		  $(this).addClass('open');
	  }
	  
  });
  
  $(".list-wrap  ul li a").click(function(){
	 $(".list-wrap  ul li a").removeClass('selected');
	 $(this).addClass('selected');
  });
  
  	

  
  
  
  
  
  
});