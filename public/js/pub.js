$(document).ready(function(){
  $("#getsms").click(function(){
    var regphone=$("#regphone").val();
	if(isNaN(regphone) || regphone.length!=11)
	{
	show_('请输入正确的手机号码');
	return false;
	  //show_('请输入正确的手机号码！');
	}
	
	
	shows_('发送中...');
	$.post("/index.php/index_common_regsms?phone="+regphone,function(data,status){
	    var data1=$.trim(data);
		if(data1=='1')
		{
		  time("getsms");
		  show_('短信发送成功!');
		}else{
		  show_(data);
		}
	});
  });
});



var wait=60; 
function time(o) {
if (wait == 0) { 
	$("#"+o).removeAttr("disabled"); 
	$("#"+o).val("发送验证码");
wait = 60; 
} else { 
	$("#"+o).attr("disabled", true);
	$("#"+o).val(wait + "秒后重新获取");
	wait--; 
	setTimeout(function() { time(o);},1000); 
  } 
} 



$(function(){
 $('.blue-btn').click(function(){
	var id =$(this).attr("id");
	if(id <0){
		alert("参数错误");
	}
	if(!confirm("点击获取将自动扣除相应的账户余额 ？"))
		{
			return false;
		}
	
	
	$.ajax({
		type: "GET",
		url: '/index.php/index_member_addorder',
		data: {id:id},
		dataType: 'json',
		success: function(msg){
			//console.log(msg);
			var status=msg.status;
			var message=msg.message;
			if(status=='1')
			{
				layer.open({
					type: 2,
					title:"在线付款",
					area: ['350px', '300px'],
					fixed: false, //不固定
					maxmin: false,
					content: "/index.php/index_member_pay11.php?orderno="+message
				});
					
			}else{
			  alert(message);	
			}
			
		   // console.log(JSON.parse(msg));
		},
		error:function(e){
			console.log(e);
		}
	});
 })	   
})






$(function () {
	var p = 1;
	var s = '';
	var str = '';
	var kw=$("#kw").val();		   
	var price1=$("#price1").val();		   
	var price2=$("#price2").val();		   
	var date1=$("#date1").val();		   
	var date2=$("#date2").val();		   
	var cid1=$("#cid1").val();		   
	var cid2=$("#cid2").val();
	var TypeID=$("#TypeID").val();
	//alert(TypeID);
	$('#get_more').click(function () {
		$('#get_more').html('加载中...');		   
		p += 1;
		
		$.ajax({
			type: 'GET',
			url: '/index.php/index_index_getmore',
			data: {p:p,TypeID:TypeID,kw:kw,price1:price1,price2:price2,date1:date1,date2:date2,cid1:cid1,cid2:cid2},
			dataType: 'json',
			success: function (msg) {
				//alert(msg);
				//console.log(msg);
				//return false;
				//alert(msg);
				$.each(msg,function(k,v){
					
					str += '<li class=\"clearfix\">';
					str += '<div class=\"clue-name\" style=\"width:300px\">'+v.Title+'</div>';
					str += '<div class=\"clue-place\" style=\"width:162px\">所在地区：<span>'+v.cid1+'/'+v.cid2+'</span></div>';
					str += '<div class=\"clue-date\">发布时间：'+v.date1+'</div>';
					str += '<div class=\"clue-num\">线索编号：'+v.d1+'</div>';
					str += '<div class=\"clue-place\">价格：<span>'+v.price+'</span></div>';
					str += '<div class=\"clue-op\">';
					str += '<a target=\"_blank\" href=\"'+v.url+'\" class=\"dt-btn\">查看详情</a>';
					str += '</div>';
					str += '</li>';
					
				});
				//alert(str);
				
				if(str!='')
				{
				  $('#get_more').html('加载更多');
				}else{
				  $('#get_more').html('--不好意思，只有这么多了--');
				}
				$('.jiazaigengduo ul').append(str);
				str='';
			},
		});
	});
});
