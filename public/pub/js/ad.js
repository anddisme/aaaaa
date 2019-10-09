
	var ppt_count = $('.index_ad_banner a').length;	//幻灯总数
	var play_i = 0;						//当前播放序
	
	//生成页码
	if (ppt_count>1){
	for(var pi=0; pi<ppt_count; pi++){
		if(pi==0){
			$('.index_ad_page').append('<a href="#no" class="over" pi="'+pi+'"></a>');
		}else{
			$('.index_ad_page').append('<a href="#no" pi="'+pi+'"></a>');
		}
	}}
	
	//播放指定
	function ppt_play_to(index){
		var last_i = play_i;
		play_i = index;
		$('.index_ad_page a').attr('class','');
		$('.index_ad_page a').eq(play_i).attr('class','over');
		$('.index_ad_banner a').stop().animate({'opacity':0},1000,function(){/*$('.index_ad_banner a').eq(last_i).hide();*/});
		$('.index_ad_banner a').eq(play_i).stop().css('opacity',0).show().animate({'opacity':1},1000);
	}
	
	//自动播放
	function ppt_play_auto(){
		$('.index_ad_banner').stopTime().everyTime('5s',function(){
			var ni = play_i+1;
			if(ni>=ppt_count){ni=0;}
			ppt_play_to(ni);
		});
	}
	
	//停止播放
	function ppt_stop(){
		$('.index_ad_banner').stopTime();
	}
	
	if(ppt_count>1){
		$(".index_ad_page").show();
		$('.index_ad_banner a').each(function(index, element) {
			if($(this).css('display')=='none'){
				$(this).css('left','100%').show();
			}
		});
		ppt_play_auto();
		
		$('.index_ad_page a').bind('click',function(){
			ppt_stop();
			var this_i = parseInt($(this).attr('pi'),10);
			ppt_play_to(this_i);
			ppt_play_auto();
		});
	}
$('.index_ad_banner a').hide();
$('.index_ad_page a').attr('class','');
$('.index_ad_page a').eq(0).attr('class','over');
$('.index_ad_banner a').eq(0).show().animate({'opacity':1},0);