


function cmsconfirm(text)
{
	layer.open({
	content: ''+text+'',
	btn: ['确认', '取消'],
	shadeClose: false,
	yes: function(){
	  layer.open({content: '确认取消认购', time: 1});
	  return true;
	}, no: function(){
	return false;
	}
	});
}


