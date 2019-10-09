document.writeln("<script src=\'/public/js/cmsupload/simpleUpload.min.js\'></script>");
var urls="/public/app/uploadimg.php";
function shows_(str){
   layer.msg(str, {time: 3000,});
}
function show_(str){
  layer.alert(str, {time: 300000,});
}
function show1_(str){
   return layer.msg('正在加载...', {icon: 16,shade: [0.5, '#666'],scrollbar: false, time:100000}) ;  
}


function qmup(ty,obj,selects)
{
	switch (ty)
	{
		case 1:
		case '1':
			qmup1('file',obj,selects);
			break;
		case 2:
		case '2':
			qmup2('file',obj,selects);
			break;
		case 3:
		case '3':
			qmup3('file',obj,selects);
			break;
		case 4:
		case '4':
			qmup4('file',obj,selects);
			break;
	}
}
var maxsize=2097152*2;
function qmup1(name,obj,selects)
{
	
	urls+='?name='+name;

	$(obj).find('input[type=file]').change(function(){
			//alert(file);									
		$(this).simpleUpload(urls, {
			allowedExts: ["jpg", "jpeg", "jpe", "jif", "jfif", "jfi", "png", "gif"],
			allowedTypes: ["image/pjpeg", "image/jpeg", "image/png", "image/x-png", "image/gif", "image/x-gif"],
			maxFileSize: maxsize,
			start: function(file){
				shows_('图片上传中...');
			},
			progress: function(progress){
				shows_('上传'+progress + '%');
			},
			success: function(data){		
				console.log(data);
				if (data.success) {
					$(obj).find(selects).val(data.Result);
					show_('上传成功');
				} else {
					show_('上传失败：'+data.message);
				}
			},
			error: function(error){
				console.log(error);
				show_('上传失败：'+error.message);
			}
		});
	});
}

function delimg(obj,img)
{
			show_('删除中...');
	$.post("/user/lists/delimg",{img:img},function(data){
		data=$.trim(data);
	     if(data=='1'){ 
			$(obj).parent().hide();
			show_('删除成功');
		 }else{
			show_('删除失败');
		 }
	});
} 



function isWeiXin(){
    var ua = window.navigator.userAgent.toLowerCase();
    if(ua.match(/MicroMessenger/i) == 'micromessenger'){
        return true;
    }else{
        return false;
    }
}
if (isWeiXin())
{
	$('input[type=file]').attr("capture","camera");
}
$(document).ready(function(){

$(".fileupqm").each(function(){
	var ty=$(this).attr("ty");
	var obj=$(this).attr("obj");
	var selects=$(this).attr("selects");
	//alert(selects);
	qmup(ty,obj,selects);
});

});