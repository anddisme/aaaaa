// JavaScript Document
function showCustomAlert(){
  var alertStr='<div id="customAlert" style="width: 420px;position: absolute;margin-left:130px;top: 0px;z-index: 999999999;"><div class="Validform_alert"><span id="Validform_alert_status" class="Validform_alert_loading"></span><span class="Validform_info">正在加载中，请稍后...</span><span class="Validform_alert_end"></span></div></div>';
  $('body').append(alertStr);
  popup($('#customAlert'));
}
function hideCustomAlert(css,message,url){
	var css = 'Validform_alert_'+css;
	$('#Validform_alert_status').attr('class',css);
	setTimeout(function(){
		if (url!=null&&url!='') {
		  	if(url=='reload'){
		  		window.location.reload();
		  	}else{
		  		window.location.href=url;
		  	}
		}else{
			$('#customAlert').remove();
		}
	},1000);	
}
function popup(popupName){ 
var _scrollHeight = $(document).scrollTop(),//获取当前窗口距离页面顶部高度 
	_windowHeight = $(window).height(),//获取当前窗口高度 
	_windowWidth = $(window).width(),//获取当前窗口宽度 
	_popupHeight = popupName.height(),//获取弹出层高度 
	_popupWeight = popupName.width();//获取弹出层宽度 
	_posiTop = (_windowHeight - _popupHeight)/2 + _scrollHeight; 
	_posiLeft = (_windowWidth - _popupWeight)/2; 
	popupName.css({"left": _posiLeft + "px","top":_posiTop + "px","display":"block"});//设置position 
}
$(function(){
	$(window).resize(function() {
	  popup($('#customAlert'));
	});
	$(window).scroll(function () {
		popup($('#customAlert'));
	});
	$("#navCategoryToggle").click(function(){
		if($('#navCategory').is(":hidden")){
			$('#navCategory').show();
		}else{
			$('#navCategory').hide();
		}
	});
	$('body').click(function(e) {
		var target = $(e.target);
		if(target.is('#searchTabToggle')|| target.parent().is('#searchTabToggle')){
			if($('#searchTab').is(":hidden")){
				$('#searchTab').show();
			}else{
				$('#searchTab').hide();
			}
		}else if(!target.is('#searchTab') && !target.is('#searchTab > a')){
			if($('#searchTab').is(':visible')){
				$('#searchTab').hide();
			}
		}else{

		}
	});
})
function changeSearchTable(table,title){
	$('#searchTable').val(table);
	$('#searchTableTitle').html(title);
	$('#searchTab').hide();
}
function inputGet (obj) {
  var a = $(obj);
  var thisVal =  a.attr('data-val');
  var thisName = a.attr('data-name');
  $('input[name='+thisName+']').val(thisVal);
  if (thisName!='p') {
    $('input[name=p]').val('1');
  }
  var form = $('#form-get');
  form.submit();
} 
function toggleFilter(obj){
	var ul = $(obj).parent().find('ul');
	var ul_class = ul.attr('class');
	if (ul_class == 'overauto') {
		ul.removeClass('overauto').addClass('overhide');
	}
	if (ul_class == 'overhide') {
		ul.removeClass('overhide').addClass('overauto');
	}
}
function mallChildDescToggle(obj){
	var li = $(obj).parent().parent();
	var toggle = '';
	if(li.next('li.bd-cont').is(":hidden")){
		toggle = 'show';
	}else{
		toggle = 'hide';
	}
	var ol = li.parent();
	ol.children('li.bd-cont').hide();
	if(toggle == 'show'){
		li.next('li.bd-cont').show();
	}
}
function mallChildLiToggle(obj){
	var title = $(obj).html();
	if(title == '查看更多'){
		$(obj).html('收起更多');
		$(obj).parent().parent().find('li.bd').each(function(num,index){
			if($(index).hasClass('hide')){
				$(index).removeClass('hide').addClass('show');
			}
		});
	}
	if(title == '收起更多'){
		$(obj).html('查看更多');
		$(obj).parent().parent().find('li.bd').each(function(num,index){
			if($(index).hasClass('show')){
			$(index).removeClass('show').addClass('hide');
		}
		});
	}
}
function collect(obj,table,id){
  $.ajax({
     url:'/member/collect/operate?table='+table+'&tableid='+id,
     type:"GET",
     dataType:'json',
     success:function(d){
     	if (d.status>0) {
	        if(d.operate=='add'){
	          $(obj).html('取消收藏')
	        }
	        if(d.operate=='delete'){
	          var t = $(obj).attr('data-html');
	          $(obj).html(t);
	        }  
        }else{
        	errorDialog(d.status,d.message,d.url)
        }
      },
     error:function(e){
        hideCustomAlert('fail','服务器繁忙，请稍后再试','');
      }
   	});
}