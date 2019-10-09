<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:68:"E:\2019phpstudy\PHPTutorial\WWW\xs/App/admin\view\webinfo\index.html";i:1569208852;s:63:"E:\2019phpstudy\PHPTutorial\WWW\xs/App/admin\view\index\js.html";i:1568028337;s:65:"E:\2019phpstudy\PHPTutorial\WWW\xs/App/admin\view\index\foot.html";i:1510904601;}*/ ?>
﻿<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,initial-scale=1.0,user-scalable=no" />
  <meta name="apple-mobile-web-app-capable" content="yes" />
  <title>修改内容</title>
  <link href="/public/skin/default/style.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" charset="utf-8" src="/public/skin/scripts/jquery/jquery-1.11.2.min.js"></script>
<link rel="stylesheet" href="/public/pub/validform/css/validform.css">

<script src="/public/js/jquery-1.7.1.min.js" type="text/javascript"></script>

<script type="text/javascript" src="/public/layer/layer.js"></script>
<script src="/public/pub/js/pub.js"></script>
<script src="/public/js/img.js"></script>
<script type="text/javascript" src="/public/datepicker/WdatePicker.js"></script>
    <link rel="stylesheet" href="/public/layer/skin/layer.css">

<script language="javascript">
  function mySelectAll()
  {
  	 ////alert(document.getElementById("cbSelectAll").checked);
	// return false;
//	 alert(document.form1.IDList.length);
     if(document.getElementById("cbSelectAll").checked)
	 {
	     if(document.form1.IDList.length==null)
		 {
		    //不是数组
			document.form1.IDList.checked=true;
		 }else{
			 for(var i=0;i<document.form1.IDList.length;i++)
			 {
				document.form1.IDList[i].checked=true;
			 }
		 }
	 }else{
	     if(document.form1.IDList.length==null)
		 {
		    //不是数组
			document.form1.IDList.checked=false;
		 }else{
			 for(var i=0;i<document.form1.IDList.length;i++)
			 {
				document.form1.IDList[i].checked=false;
			 }
		 }
	 }
  }

function myAction(type,TypeID)
{
	var s="";
	$("#IDList:checked").each(function() {
		s += $(this).val() + ",";
	});
	if(s!="")
	{
		s=s.substr(0,s.length-1);
	}
	 if(s=="")
	 {
        $("#ydtoid option:first").prop("selected", 'selected'); 
		show_('请选择要批量操作的文档!');
		return false;
	 }
	 
	 if(type=="DelSome")
	 {
			if(!confirm("你确定要批量删除选择中数据吗？"))
			{
				return false;
			}
	 }
	if(type=="delnews")
	{
		if(!confirm("你确定要批量删除选择中文档吗？"))
		{
			return false;
		}
	}
	
	if(type=="huanyuan")
	{
		if(!confirm("你确定要还原选择中文档吗？"))
		{
			return false;
		}
	}
	
	if(type=="huanyuan")
	{
		if(!confirm("你确定要还原选择中文档吗？"))
		{
			return false;
		}
	}
	 
	 if(type=="ziprar")
	 {
		if(!confirm("确定要打包选择的文件吗?"))
		{
			return false;
		}
		//alert(s);
		//return false;
		show1_('数据处理中...');
       var actionurl="<?php echo url('Temp/ziprar'); ?>?tempshow=<?php echo (isset($tempshow) && ($tempshow !== '')?$tempshow:'/'); ?>&files="+s;
	   window.location=actionurl;
	   return false;
	 }
	 
	 
	 if(type=="yd")
	 {
		/*if(TypeID<1)
		{
			return false;
		}
		*/
		
		/*if(!confirm("确定要批量移动选中数据到 "+$('#ydtoid option:selected').attr('fd')+" 吗？"))
		{
		    $('#ydtoid option:eq(0)').attr('selected','selected');
			return false;
		}*/
		
	layer.open({
	  type: 2,
	  title:"批量移动",
	  area: ['350px', 'auto'],
	  fixed: false, //不固定
	  maxmin: false,
	  content: "<?php echo url('Article/yidong'); ?>?ActionIDList="+s
	});
	return false;		
		
		
		
	 }


var url='&TypeID='+TypeID;
var table=$("#table").val();
var Action=type;
var ActionIDList=s;
$("#Action").val(type);
$("ActionIDList").val(s);
$("#TypeID").val(TypeID);
if(table==''){ show_('没有找到操作数据表!'); }
if(Action==''){ show_('没有找到操作类型!'); }
     //document.form1.submit();
 show1_('数据处理中...');
 
 var actionurl="<?php echo url('Common/action'); ?>?table="+table+"&Action="+Action+"&ActionIDList="+ActionIDList+url;
 $.getJSON(actionurl,function(data){
 var url=data.url;
//alert(url);
//return false;
	if(url!='-1')
	{
	  shows_(data.text);
	}else{
	  show_(data.text);
	}
	var url=data.url;
	if(url=='1')
	{
		location.reload();
		return true; 
	}else if(url=='-1'){
		return false; 
	}else{
	    window.location=url;
		return true;
	}
  });
     return false;
  }
</script>
<script>  
$(document).ready(function(){
$(".picshow").hover(function(){
							// alert('111');
	var X=event.clientX;
	var Y=event.clientY;
	var imgsrc=$(this).attr("rel");
	$("#showimg").css({"top":Y,left:X});
	$("#showimg").find("img").attr("src",imgsrc);
	$("#showimg").show();
}, function(){
	$("#showimg").hide();
});
});

function imgchange(idstr)
{
    var obj=$("#"+idstr+"_a");
	var imgsrc=obj.find("#"+idstr).val();
	if(imgsrc=='') 
	{
	   obj.find(".picshow").hide();
	   return false;
	}
	obj.find(".picshow").attr("rel",imgsrc);
	obj.find(".picshow").show();
}

function delid(id,table)
{
	if(!confirm('请谨慎删除,确定要删除吗？')){ return false; }
	if(id<1){ show_('id为空，无法删除数据'); return false; }	
	if(table==''){ show_('数据表为空，无法删除数据'); return false; }	
	 show1_('删除中...');
	 if(table!='article')
	 {
		 var delurl="<?php echo url('Del/del'); ?>";
	 }else{
		 var delurl="<?php echo url('Del/del_news'); ?>";
	 }
 $.get(delurl,{id:id,table:table},function(data,status){
     if(data=='y')
	 {
	   show_('删除成功');
	   $("#"+id).html('');
	   $("#"+id).hide();
	   return false; 
	 }else{
		show_(data);
		return false;
	 }
  });
}

function deltype(id)
{
	show1_('删除中...');
	$.get("<?php echo url('Del/deltype'); ?>",{id:id},function(data,status){
     if(data=='y')
	 {
	   show_('删除成功');
	   $("#"+id).html('');
	   $("#"+id).hide();
	    return false;
	 }else{
	   show_(data);
	 return false;
	 }
  });
}
</script>
<div id="showimg" style="display:none;position:fixed;z-index:999; width:auto; max-width:200px; height:auto; border:1px solid #f8f8f8;">
<img src="" style="width:100%; min-width:100px;" />
</div>



<style>
.text1{
text-align:center; color:#F00;
background:#fff;
height:20px;
width:100%;
font-size:15px;
}
</style>
<script>
$(function(){
//$("tbody>tr:even").addClass("dan");
$("tbody>tr>td").dblclick(function(){
var val=$(this).html();
var fd=$(this).attr("fd");
var id=$(this).parents().attr("id");
//alert(fd);

var ishasstr=$(this).find("input").length;
if(ishasstr==true){ return false; }
if(fd!=null){
  $(this).html("<input style='border:1px solid #000;' id='edit"+fd+id+"' value='"+val+"' class='text1'> ");
}


$("#edit"+fd+id).focus().live("blur",function(){
var table = $("#table").val();
var aval = $(this).val();
if(val==aval){ $(this).parents("td").html(val); return false; }
if(table=='news_type')
{
	if(isNaN(aval))
	{
	  show_('请输入数字');
	  return false;
	}
}
$(this).parents("td").html(aval);
 // $.post("run.php?m=Pub&a=xiugai",{val:aval,fd:fd,id:id,table:table});
  	  show1_('保存中...');

  $.get("<?php echo url('Del/xiugai'); ?>",{val:aval,fd:fd,id:id,table:table},function(result){
  	 
   if($.trim(result)!='1')
   {
    show_(result);
	return false;
   }
    shows_('更新成功.');
		if(table=='lm'){ window.location.reload(); }
  });
});
});
});
</script>





</head>

<body class="mainbody">

<div class="line10"></div>
<!--/导航栏-->



<link rel="stylesheet" href="/public/bjq/themes/default/default.css" />
<script type="text/javascript" src="/public/bjq/kindeditor-min.js"></script><!--编辑器-->
<script type="text/javascript" src="/public/bjq/lang/zh_CN.js"></script><!--公用-->
<script>
  KindEditor.ready(function(K) {
    var editor = K.editor({
      allowFileManager : true
    });


      $("document").ready(function(){

          $(".webshanchu").click(function(){
              if(!confirm('请谨慎删除,确定要删除吗？')){ return false; }
              var id = $(this).attr("id");
              $.ajax({
                  type: "POST",
                  url: "/index.php/admin_Webinfo_delid",
                  data: {id:id},
                  success: function(data){
                      //alert(data);return false;
                      $('#shanchusj'+id).html('');
                  }
              });

          })
      });

      <?php if(is_array($infolist) || $infolist instanceof \think\Collection): if( count($infolist)==0 ) : echo "" ;else: foreach($infolist as $key=>$menu): if($menu['type'] == 'images'): ?>
      K('#<?php echo $menu['field']; ?>cn').click(function() {
          editor.loadPlugin('image', function() {
              editor.plugin.imageDialog({
                  imageUrl : K('#<?php echo $menu['field']; ?>').val(),
                  clickFn : function(url, title, width, height, border, align) {
                      K('#<?php echo $menu['field']; ?>').val(url);
                      editor.hideDialog();
                  }
              });
          });
      });

      <?php endif; endforeach; endif; else: echo "" ;endif; ?>



  });
</script>








<!--内容-->
<div id="floatHead" class="content-tab-wrap">
  <div class="content-tab">
    <div class="content-tab-ul-wrap">
      <ul>
        <li><a href="<?php echo url('Web/index'); ?>">系统配置</a></li>
        <li><a class="selected" href="<?php echo url('Webinfo/index'); ?>">网站参数</a></li>
				<li><a  href="<?php echo url('Email/index'); ?>">邮箱配置</a></li>

      </ul>
    </div>
  </div>
</div>

<div class="tab-content">


 <dl>
      <dt>新增项目：</dt>
      <dd>
          <form name="form1"  method="post" action="<?php echo url('Webinfo/add'); ?>"  class="form-horizontal">
        <div id="taobaourl_a">
          <strong>名称：</strong>
          <input type="text" name="name" class="input normal"  style="width:100px;" />
            <strong>字段名：</strong>
            <input type="text" name="field" class="input normal"  style="width:100px;" />
          <strong>类型：</strong>
          <select name="type" class="input normal"  style="width:100px;" />
          <option value="text">text</option>
          <option value="textarea">textarea</option>
          <option value="images">images</option>
          </select>
          
          <input class="btn btn-primary" style="margin-left: 10px;" type="submit" value="保存" />
    
        </div>
        </form>
      </dd>
    </dl>



</div>




<div class="tab-content">
  <form name="form1" id="from1" method="post" action=""  class="form-horizontal">
    <?php if(is_array($infolist) || $infolist instanceof \think\Collection): if( count($infolist)==0 ) : echo "" ;else: foreach($infolist as $key=>$menu): if($menu['type'] == 'text'): ?>
    <dl id="shanchusj<?php echo $menu['id']; ?>">
      <dt><?php echo $menu['name']; ?>(<?php echo $menu['field']; ?>)</dt>
      <dd>
        <input type="text" class="input normal" style="width:50%;"  id="<?php echo $menu['field']; ?>" name="<?php echo $menu['field']; ?>"  value="<?php echo $menu['val']; ?>" /> <span style="color:#ccc">$web['<?php echo $menu['field']; ?>']</span>
          <?php if($menu['val'] == ''): ?>
          <span style="margin-left: 20px;"><a  class="webshanchu" id="<?php echo $menu['id']; ?>" style="cursor: pointer;">删除</a></span>
          <?php endif; ?>
          <span class="Validform_checktip"></span>
      </dd>
    </dl>
    <?php endif; if($menu['type'] == 'images'): ?>
    <dl>
      <dt><?php echo $menu['name']; ?>(<?php echo $menu['field']; ?>)</dt>
      <dd>
        <div id="<?php echo $menu['field']; ?>_a">
          <strong></strong><input  type="text" name="<?php echo $menu['field']; ?>" class="input normal" id="<?php echo $menu['field']; ?>" rel="<?php echo $menu['field']; ?>" style="width:200px;" value="<?php echo $menu['val']; ?>"> <input class="btn btn-primary" type="button" id="<?php echo $menu['field']; ?>cn" value="上传图片" /> 
          <font  style="color:#27a9e3; display:none;" class="picshow" rel="<?php echo $links['S_Image']; ?>">[预览]</font>
        </div>
        <script>
          setInterval('imgchange("<?php echo $menu['field']; ?>")',1000);
        </script>
      </dd>
    </dl>



    <?php endif; if($menu['type'] == 'textarea'): ?>
<dl>
<dt><?php echo $menu['name']; ?>(<?php echo $menu['field']; ?>)</dt>
<dd>
<label for="textarea"></label>
<textarea name="<?php echo $menu['field']; ?>" id="<?php echo $menu['field']; ?>" cols="45" rows="5" class="input normal" style="width:65%;"><?php echo $menu['val']; ?></textarea>  <span style="color:#ccc">$web['<?php echo $menu['field']; ?>']</span>
</dd>
</dl>
<?php endif; endforeach; endif; else: echo "" ;endif; ?>


</div>



<!--/内容-->

<!--工具栏-->
<div class="page-footer">
  <div class="btn-wrap">

    <input type="submit" name="btnSubmit" value="提交保存" id="btnSubmit" class="btn" />
    <input name="btnReturn" type="button" value="返回上一页" class="btn yellow" onClick="javascript:history.back(-1);" />
  </div>
</div>
<!--/工具栏-->

</form>
<script src="/public/pub/validform/js/validform_v5.3.2.js"></script>
<script src="/public/pub/validform/js/validform.js"></script>

<script>
$(".form-horizontal input").focus(function(){
var obj=$(this);
if (obj.hasClass("Validform_error"))
{
  var v=obj.val();
//  alert('111');
  var msg=obj.attr('msg');
  var msg2=obj.attr('placeholder');
  if (v=='')
  {
	layer.msg(msg2,{time:3000});
  }
  else
  {
	layer.msg(msg,{time:3000});
  }    
}
});  
</script> 
</body>
</html>