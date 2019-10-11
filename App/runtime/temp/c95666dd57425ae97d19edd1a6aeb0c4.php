<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:68:"E:\2019phpstudy\PHPTutorial\WWW\xs/App/admin\view\loglist\index.html";i:1568123583;s:63:"E:\2019phpstudy\PHPTutorial\WWW\xs/App/admin\view\index\js.html";i:1568028337;}*/ ?>
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
<form id="form1" name="form1" method="post" action=""  class="form-horizontal">
<input type="hidden" id="ActionIDList" name="ActionIDList" />
<input type="hidden" id="Action" name="Action" />
<input type="hidden" id="table" name="table" value="log" />
<input type="hidden" id="backurl" name="backurl" value="__URL__" />

<div class="location">
  <a href="javascript:history.back(-1);" class="back"><i></i><span>返回上一页</span></a>
  <a href="<?php echo url('Index/main'); ?>" class="home" target="mainframe"><i></i><span>首页</span></a>
  
  <i class="arrow"></i>
  <span><a>系统日志</a></span>

</div>
<!--/导航栏-->
<!--工具栏-->
<div id="floatHead" class="toolbar-wrap">
<div class="toolbar" style="float:left; width:100%; ">
<script>
function tos()
{
  if($("#kw").val()=='')
  {
    //show_('请输入搜索关键词');
	//return false;
  }
  window.location='<?php echo url("Loglist/index"); ?>?kw='+$("#kw").val();
}
</script>
<div style="float:left; height:auto;  font-size:12px; color:#999;">
搜索：<input type="text" name="" class="input normal" style="text-indent:0px; width:200px" id="kw" value="<?php echo get('kw'); ?>">
<input class="btn btn-primary" type="button" onClick="return tos()" value="搜 索">
</div>


<div class="box-wrap" style="float:right; width:auto;">

<div class="l-list">

<ul class="icon-list">
</ul>
</div>
</div>
</div>
</div>
</div>





<!--/工具栏-->

<!--列表-->
<div class="table-container">
  
  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="ltable">
    <tr>
      <th width="6%">ID</th>
        <th width="64%" align="left" style="padding-left:10px;">操作内容</th>
      <th align="left" width="7%">管理员</th>
      <th align="left" width="8%">IP</th>
    
      <th width="15%">操作时间</th>
      </tr>
  
   
  

<?php if(is_array($list) || $list instanceof \think\Collection): if( count($list)==0 ) : echo "" ;else: foreach($list as $key=>$log): ?>
<tr id="<?php echo $log['id']; ?>">
<td align="center">
<span class="checkall">
<input type="checkbox" id="IDList" name="IDList" style="border:n0" value="<?php echo $log['id']; ?>" /> 
</span>
<?php echo $log['id']; ?>

</td>
<td align="left" style="padding-left:10px;"><?php echo $log['content']; ?></td>

<td>
<?php echo $log['UserName']; ?>
</td>
<td>
<?php echo $log['ip']; ?>
</td>

<td align="center"><?php echo $log['endtime']; ?></td>
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
<button class="btn btn-primary" onClick="return myAction('logdel')">&nbsp;选中删除&nbsp;</button>
</ul>
</div>
</div>
</div>
<?php echo $fenye; ?>
<div class="paging" style="color:#666; text-align:right;">
<select style="border:1px solid #f5f5f5; color:#666;" onChange="location='?PageSize='+this.value">
<?php echo pagesize($PageSize); ?>
</select>  
 </div>
</div>
</form>
</body>
</html>