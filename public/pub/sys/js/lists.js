		$("#dolist").click(function(){return imglist();});
		$("#fileup li").each(function(i){
			var h=$(this);
			h.find("a").eq(0).click(function(){dup(i);});
			h.find("a").eq(1).click(function(){fups(i);});
		})
		KindEditor.ready(function(K) {
			K2=K;
			var editor1 = K.create('textarea[name="content"]', {
				cssPath : '__PUBLIC__/sys/ggj/plugins/code/prettify.css',
				uploadJson : '__PUBLIC__/sys/ggj/php/upload_json.php',
				fileManagerJson : '__PUBLIC__/sys/ggj/php/file_manager_json.php',
				allowFileManager : true,
				filterMode : false,
				afterCreate : function() {}
			});
		});
	var K2;
	function dia(obj)
	{
			var i=$("#fileup a").index(obj)+1;
			var j=Math.ceil(i/2);j=j-1;
			if (i%2==1){dup(j);}else{fups(j);}	
	}
    function imglist()
	{
		var size=$('#fileup li').not(".hide").length;
		if (size>27){alert('最多上传28张图片');return false;}
		var editor = K2.editor({allowFileManager : true});
		editor.loadPlugin('image', function() {
			editor.plugin.imageDialog({
				clickFn : function(url, title, width, height, border, align) {
					var nh=$('#fileup').html();
					nh=nh+'<li><img src="'+url+'" /><div><a onclick="dia(this)" href="#" class="rt">删除图片</a><a onclick="dia(this)" href="#">修改图片</a></div></li>';
					$('#fileup').html(nh);
					editor.hideDialog();
				}
			});
		});	
	}
	
    function fups(id)
	{
		var editor = K2.editor({allowFileManager : true});
		editor.loadPlugin('image', function() {
			editor.plugin.imageDialog({
				clickFn : function(url, title, width, height, border, align) {
					$('#fileup li').eq(id).find('img').attr("src",url);
					editor.hideDialog();
				}
			});
		});
	}
    function oneup(id)
	{
		var editor = K2.editor({allowFileManager : true});
		editor.loadPlugin('image', function() {
			editor.plugin.imageDialog({
				clickFn : function(url, title, width, height, border, align) {
					$('#'+id).val(url);
					editor.hideDialog();
				}
			});
		});
	}

	function dup(i){$('#fileup li').eq(i).attr("class","hide").hide();}
function trim(str)
{
     return str.replace(/(^\s*)|(\s*$)/g,"");
} 
function selfidAdditional(){CollectGarbage();}