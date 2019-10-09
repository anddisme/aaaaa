(function($){ 
$.fn.jqDrag=function(h){return i(this,h,'d');}; 
$.fn.jqResize=function(h){return i(this,h,'r');}; 
$.jqDnR={dnr:{},e:0, 
drag:function(v){ 
if(M.k == 'd')E.css({left:M.X+v.pageX-M.pX,top:M.Y+v.pageY-M.pY}); 
else E.css({width:Math.max(v.pageX-M.pX+M.W,0),height:Math.max(v.pageY-M.pY+M.H,0)}); 
return false;}, 
stop:function(){E.css('opacity',M.o);$(document).unbind('mousemove',J.drag).unbind('mouseup',J.stop);} 
}; 
var J=$.jqDnR,M=J.dnr,E=J.e, 
i=function(e,h,k){return e.each(function(){h=(h)?$(h,e):e; 
h.bind('mousedown',{e:e,k:k},function(v){var d=v.data,p={};E=d.e; 
// attempt utilization of dimensions plugin to fix IE issues 
if(E.css('position') != 'relative'){try{E.position(p);}catch(e){}} 
M={X:p.left||f('left')||0,Y:p.top||f('top')||0,W:f('width')||E[0].scrollWidth||0,H:f('height')||E[0].scrollHeight||0,pX:v.pageX,pY:v.pageY,k:d.k,o:E.css('opacity')}; 
E.css({opacity:0.8});$(document).mousemove($.jqDnR.drag).mouseup($.jqDnR.stop); 
return false; 
}); 
});}, 
f=function(k){return parseInt(E.css(k))||false;}; 
})(jQuery); 


jQuery.cookie=function(name,value,options){if(typeof value!='undefined'){options=options||{};if(value===null){value='';options.expires=-1}var expires='';if(options.expires&&(typeof options.expires=='number'||options.expires.toUTCString)){var date;if(typeof options.expires=='number'){date=new Date();date.setTime(date.getTime()+(options.expires*24*60*60*1000))}else{date=options.expires}expires='; expires='+date.toUTCString()}var path=options.path?'; path='+(options.path):'';var domain=options.domain?'; domain='+(options.domain):'';var secure=options.secure?'; secure':'';document.cookie=[name,'=',encodeURIComponent(value),expires,path,domain,secure].join('')}else{var cookieValue=null;if(document.cookie&&document.cookie!=''){var cookies=document.cookie.split(';');for(var i=0;i<cookies.length;i++){var cookie=jQuery.trim(cookies[i]);if(cookie.substring(0,name.length+1)==(name+'=')){cookieValue=decodeURIComponent(cookie.substring(name.length+1));break}}}return cookieValue}};

(function($){$.expr[':'].linkingToImage=function(elem){return!!($(elem).is('a')&&elem.img&&elem.img.match(/\.(gif|jpe?g|png|bmp)$/i))};$.fn.imgPreview=function(userDefinedSettings){var s=$.extend({imgCSS:{},distanceFromCursor:{top:10,left:10},preloadImages:true,onShow:function(){},onHide:function(){},onLoad:function(){},containerID:'imgPreviewContainer',containerLoadingClass:'loading',thumbPrefix:''},userDefinedSettings),$container=$('<div/>').attr('id',s.containerID).append('<img/>').hide().appendTo('body'),$img=$('img',$container).css(s.imgCSS);if(s.preloadImages){this.each(function(){if($(this).is(':linkingToImage')){$('<img/>')[0].src=this.img.replace(/\/([^\/]+)$/,'/'+s.thumbPrefix+'$1')}})}this.filter(':linkingToImage').mousemove(function(e){$container.css({top:e.pageY+s.distanceFromCursor.top+'px',left:e.pageX+s.distanceFromCursor.left+'px'})}).hover(function(){var link=this;$container.addClass(s.containerLoadingClass).show();$img.load(function(){$container.removeClass(s.containerLoadingClass);s.onLoad.call($img[0],link)}).attr('src',link.img.replace(/\/([^\/]+)$/,'/'+s.thumbPrefix+'$1'));s.onShow.call($container[0],link)},function(){$container.hide();$img.unbind('load').attr('src','');s.onHide.call($container[0],this)});return this}})(jQuery);

function input(){
	$("input:text,input:password").css({border:"1px solid #abc"})
	.hover(function(){$(this).css("border-color","#0ae");},function(){$(this).css("border-color","#abc");})
		.focus(function(){$(this).css("border-color","#f00");})
		.blur(function(){$(this).css("border-color","#abc");
	});
}

function trhover(){
	$("tr:not(.no)").hover(
		function(){$(this).find("td").css("background","#CFDFEF");}
		,function(){$(this).find("td").css("background","#fff");
	});
}

function Dec()
{
	$(".Dec").keyup(function(){
		if(event.keyCode!=9&&event.keyCode!=37&&event.keyCode!=39){
			var t=$(this).val();
			var ms=t.replace(/[^\.\d]/g,'');
			if(t.split('.').length>2)
			{ms=t.split('.')[0]+'.'+t.split('.')[1]};
			$(this).val(ms);
		}
	});
}

function int()
{	
	$(".int").keyup(function(){
		if(event.keyCode!=9&&event.keyCode!=37&&event.keyCode!=39){
			var t=$(this).val();
			var ms=t.replace(/\D/g,'');
			$(this).val(ms);
		}
	});
}


function showalert(str,nopopup,ty,time,theFunc)
{
	closealert();
	var popstr='<div class="lightBoxpopupCover"></div>';
	if(nopopup==1){popstr='';}
	$("body").append('<div id="lightBox" class="lightBox"><iframe class="lightBoxpopupIframe"></iframe>'+popstr+'<div class="lightBoxbox"><span class="lightBoxMaxHeight"></span><div class="lightBoxContent"><form id="lightBoxForm"><div class="lightBoxWrapper"></div><div class="lightBoxSubmit"></div></form></div></div></div>').end().find("#lightBox").show();
	var i=3,interval="",intimg="",closetext="关闭",op=1,istime=0;
	if(time!=undefined&&time!=""&&time!=0)
	{istime=2;	istime=istime-1;}
	if(istime==1){
		i=time;
		closetext="关闭("+time+")";
		interval=setInterval(function(){
			i--;$('#lightBoxclose').val("关闭("+i+")");
			if(i==0){clearInterval(interval);if(typeof(theFunc)=="function"){theFunc();};closealert();}
		},1000);
	}
	if(ty==undefined){ty=1;}
		switch(ty)
		{
		case 1://info
			$("#lightBox .lightBoxWrapper").append(str)
				.siblings(".lightBoxSubmit")
					.append('<input id="lightBoxclose" onclick="closealert();" type="button" value="'+closetext+'" />')
				.parent().addClass("lightBoxinfo").end()
				.find("#lightBoxclose").focus()
				.bind('click',function(){
					if(istime==1){clearInterval(interval);}
					if(typeof(theFunc)=="function"){theFunc();};
					$('#lightBox').remove();
				});
				$('#lightBox .lightBoxContent').jqDrag().css("cursor","move");

		break;
		case 2://box
				$("#lightBox .lightBoxWrapper").append(str)
				.siblings(".lightBoxSubmit").css("cursor","move")
					.append('<input id="lightBoxclose" onclick="closealertx();" type="button" value="'+closetext+'" />')
				.find("#lightBoxclose").focus()
				.bind('click',function(){
					if(istime==1){clearInterval(interval);}
					if(typeof(theFunc)=="function"){theFunc();};
					closealert();

				});
				$('#lightBox .lightBoxContent').jqDrag(".lightBoxSubmit");
			break;
		}
}


function loading(str)
{
	$("body").append('<div id="loading" class="lightBox"><iframe class="lightBoxpopupIframe"></iframe><div class="lightBoxpopupCover"></div><div class="lightBoxbox"><span class="lightBoxMaxHeight"></span><div class="lightBoxContent lightBoxloading"><div class="lightBoxWrapper">'+str+'</div></div></div></div>').find("#loading").show();
}

function closealert(){$("#lightBox,#loading").remove();}
function closealertx(){$("#lightBox,#loading").remove();location.reload();}