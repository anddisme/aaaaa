<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:65:"E:\2019phpstudy\PHPTutorial\WWW\xs/App/admin\view\html\index.html";i:1568106434;s:63:"E:\2019phpstudy\PHPTutorial\WWW\xs/App/admin\view\index\js.html";i:1568028337;}*/ ?>
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


<div class="location">
  <a href="javascript:history.back(-1);" class="back"><i></i><span>返回上一页</span></a>
  <a href="<?php echo url('Index/main'); ?>" class="home"><i></i><span>首页</span></a>
  
  <i class="arrow"></i>
  <span><a>生成html</a></span>





</div>
<!--/工具栏-->

<!--列表-->
<div class="table-container">














<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="e7e7e7" align="center" style="margin-top:20px">

<script>
function sctype(type)
{
//alert(type);
  if(type==''){ return false; }
  if(type=='lm'){ }
  $("#type").val(type); 
  $("#scbdk").submit();
}
</script>

<tr align='center' height="22" >
<td height="36" colspan="2" align="left">
  <form action="<?php echo url('Html/index'); ?>" method="post" id="scbdk" target="htmlfrom">
  <input type="hidden" name="m" value="Html"/>
  <input type="hidden" name="type" id="type" value=""/>
<div style="float:left; width:100%; height:30px; line-height:30px; font-size:12px;">
<script type="text/javascript"> 
$(function() { 
	$("#selectall").click(function() { 
		$("#selectk").find('option').attr('selected','selected');
	}); 
	$("#selectall1").click(function() { 
		$("#selectk").find('option').attr('selected',false);
	}); 
	
}); 
</script> 
<a href="javascript:;" id="selectall" style="padding-left:10px;"><strong>全选</strong></a>
/<a href="javascript:;" id="selectall1" style="padding-left:5px;"><strong>全不选</strong></a>
<span style="padding-left:10px; color:#999;"><strong>按CTRL/SHIFT多选</strong>（请选择需要更新的栏目后，点击生成按钮开始更新）</span>
</div>
  <select id="selectk" name="idlist[]" multiple=”multiple” class="form-control" style="width:100%; border:1px solid #CCC; margin-bottom:20px; height:300px; font-size:15px; color:#333; padding-left:10px; padding-top:10px; line-height:20px;">
  <?php echo categoryTree(0,$TypeID); ?>
  </select>
 
 <div style="float:left; padding-left:10px; padding-bottom:10px; font-size:14px;">
  <input name="tpl" type="radio" checked="checked" value="Index">PC版
  <div style="display:none;">
  <input name="tpl" type="radio" value="m">移动版
  </div>
    <button id="btn_sub" onClick="return sctype('home');" type="button" class="btn btn-primary">生成首页</button>
    <button id="btn_sub" onClick="return sctype('lm');" type="button" class="btn btn-primary">生成栏目</button>
    <button id="btn_sub" onClick="return sctype('wz');" type="button" class="btn btn-primary">生成文挡</button>
    <button id="btn_sub" onClick="return sctype('all');" type="button" class="btn btn-primary">一键更新</button>
 </div>
 
 
    </form></td>
</tr>


<tr align='center' bgcolor="#FFFFFF" height="22" >
<td height="36" colspan="2" align="right" style="padding-left:10px; padding-top:20px;">
  <iframe frameborder="0" name="htmlfrom" id="htmlfrom" style=" width:100%; border:none; height:450px;" src=""></iframe></td>
</tr>



  
   <tr class="no">
      <td colspan="2" align="center">	   </td>
    </tr>
  
  


<td width="100"></form>
</table>








  
  
  
  
  
  
  
  
  
  
</div>
<!--/列表-->



</body>

</html>
