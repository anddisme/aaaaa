<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:65:"E:\2019phpstudy\PHPTutorial\WWW\xs/App/admin\view\temp\index.html";i:1568884951;s:63:"E:\2019phpstudy\PHPTutorial\WWW\xs/App/admin\view\index\js.html";i:1568028337;s:65:"E:\2019phpstudy\PHPTutorial\WWW\xs/App/admin\view\index\foot.html";i:1510904601;}*/ ?>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,initial-scale=1.0,user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<title>信息管理</title>
<link href="/public/skin/scripts/artdialog/ui-dialog.css" rel="stylesheet" type="text/css" />
<link href="/public/skin/default/style.css" rel="stylesheet" type="text/css" />
<link href="/public/skin/css/pagination.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/public/skin/scripts/jquery/jquery-1.11.2.min.js"></script>
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


<div class="location" style="font-family:Verdana, Geneva, sans-serif;">
  <a href="javascript:history.back(-1);" class="back"><i></i><span>返回上一页</span></a>
  <a href="<?php echo url('Temp/index'); ?>" class="home"><i></i><span>/></span></a>

  <?php 
  $tempshow=$tempshow;
  $tempshow1=explode("/",$tempshow);
  foreach($tempshow1 as $k=>$v)
  {
       if(!empty($v))
       {
            $start = strpos($tempshow,$v);
            $last=substr($tempshow,0,$start);
           
            $nowurl=delxg(url('Temp/index').'?dir='.urlencode($last).'/'.$v);
            echo '<a href="'.$nowurl.'">'.$v.'</a>/';
        } 
  }
   ?>
 
  


</div>
<!--/导航栏-->
<!--工具栏-->
<div id="floatHead" class="toolbar-wrap">
<div class="toolbar" style="float:left; width:100%; ">



<div class="box-wrap" style=" color:#060;  background:red; width:100%;">
<div class="l-list">

<ul class="icon-list">
<form action="<?php echo url('Temp/add'); ?>" method="post" enctype="multipart/form-data"  class="form-horizontal1">
上传文件：<input name="myFile" id="myFile" class="myFile" type="file" style="width:150px; height:35px; position:absolute; background:#000; FILTER: alpha(opacity:0);-moz-opacity:0;opacity:0; ">
<input type="button" value="选择文件" class="btn yellow filetext" style="width:150px;" />
<input type="hidden" name="tempshow" class="tempshow" value="<?php echo $tempshow; ?>" />
<input type="submit" value="开始上传" class="btn filebotton" style="width:auto; padding-left:10px; padding-right:10px;" />
</form>
</ul>
</div>
</div>
</div>
</div>
</div>
<script>
$(document).ready(function(){
 $(".myFile").change(function(){
	var text = $(this).val();						  
    $('.filetext').val(text);
	return false;
	})
   
	$(".filebotton").click(function(){
		if($('.filetext').val()=='' || $('.filetext').val()=='选择文件'){
		shows_('请选择要上传的文件');
		return false;
		}						  
	})
	 
})

</script>





<!--/工具栏-->

<!--列表-->
<div class="table-container">
  <form id="form1" name="form1" method="post" action=""  class="form-horizontal=">
<input type="hidden" id="ActionIDList" name="ActionIDList" />
<input type="hidden" id="Action" name="Action" />
<input type="hidden" id="table" name="table" value="ad" />
<input type="hidden" id="backurl" name="backurl" value="__URL__" />
  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="ltable">
    <tr>
      <th width="5%">选择</th>
      <th align="left" width="49%" style="text-indent:1%;">名称</th>
      <th width="6%" align="left">类型</th>
      <th width="18%" align="left">信息</th>
      <th width="10%" align="right" style="padding-right:20px;">操作</th>
    </tr>
  
   

    
    
    

<?php if(is_array($listdir) || $listdir instanceof \think\Collection): if( count($listdir)==0 ) : echo "" ;else: foreach($listdir as $key=>$arc): 
$filepath=$tempshow.'/'.$arc;
$filepath=urlencode($filepath);
$type=pathtype($filepath);

 ?>
<tr id="<?php echo $tempshow; ?>/<?php echo urlencode($arc); ?>">
<td align="center">
<span class="checkall">
<input type="checkbox" id="IDList" name="IDList" style="border:n0" value="<?php echo delxg($tempshow.'/'.urlencode($arc)); ?>" /> 
</span>
</td>
<td style="text-indent:1%; font-size:13px; <?php if(get('file') == $arc): ?>color:red;<?php endif; ?>">
<?php if($type['type'] == 'dir'): ?>
<a style="<?php if(get('file') == $arc): ?>color:red;<?php endif; ?>" href="?dir=<?php echo urlencode(delxg($tempshow.'/'.$arc)); ?>"><?php echo $arc; ?></a> 
<?php else: ?>

<?php echo $arc; endif; ?>

</td>
<td align="left">
<?php if($type['type'] == 'dir'): ?>文件夹<?php else: ?>文件|<?php echo $type['extension']; endif; ?>
</td>
<td align="left">
<?php 
$filepath1=delxg(WEB_ROOT.'/'.$tempshow.'/'.$arc);


if($type['type']=='file')
{
$filesize=formatBytes(filesize($filepath1));
echo '大小:'.$filesize;
echo '<br>时间:'.date("Y-m-d H:i:s",filemtime($filepath1));

}else{
 //$filesize=formatBytes(getDirSize($filepath1));
}
 ?>

</td>
<td align="right" style="padding-right:20px;">
 <?php if($type['extension'] == 'zip'): ?>
  <a onClick="if(!confirm('解压后将覆盖已存在的文件夹或文件，确定要解压吗？')){ return false; }" href="<?php echo url('Temp/zipfile'); ?>?files=<?php echo urlencode(delxg($tempshow.'/'.$arc)); ?>">解压</a> 
  <?php endif; if($type['extension'] == 'txt' || $type['extension'] == 'html' || $type['extension'] == 'php' || $type['extension'] == 'css'): ?>
  <a href="<?php echo url('Temp/updata'); ?>?files=<?php echo urlencode(delxg($tempshow.'/'.$arc)); ?>">修改</a> 
  <?php endif; ?>
  <a href="<?php echo url('Temp/ziprar'); ?>?files=<?php echo urlencode(delxg($tempshow.'/'.$arc)); ?>">打包</a> 
  <a href="<?php echo url('Temp/download'); ?>?files=<?php echo urlencode(delxg($tempshow.'/'.$arc)); ?>">下载</a> 
  <del  style="text-decoration:line-through; color:#999;" href="javascript:;">删除</del>
</td>
</tr>
<?php endforeach; endif; else: echo "" ;endif; ?>
    
    
    
    
    
    
    
    
    
    
    
    
  </table>
  <div class="toolbar" style="float:left;">
<div class="box-wrap">
<a class="menu-btn"></a>
<div class="l-list">
<ul class="icon-list">
<label class="foot-label">
<input type="checkbox" style="border:1px solid #ccc" id="cbSelectAll" name="cbSelectAll" value="checkbox" onClick="mySelectAll()" />
全选</label>
<button class="btn btn-primary" onClick="return myAction('ziprar')">&nbsp;文件压缩&nbsp;</button>
</ul>
</div>
</div>
</div>


 
 </div>
</div>
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