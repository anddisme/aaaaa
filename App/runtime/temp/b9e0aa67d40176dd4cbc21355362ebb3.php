<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:68:"E:\2019phpstudy\PHPTutorial\WWW\xs/App/admin\view\article\index.html";i:1568123782;s:63:"E:\2019phpstudy\PHPTutorial\WWW\xs/App/admin\view\index\js.html";i:1568028337;}*/ ?>
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
<form id="form1" name="form1" method="post" action="run.php?a=Pub&a=action111" onSubmit="return false;">
<input type="hidden" id="ActionIDList" name="ActionIDList" />
<input type="hidden" id="Action" name="Action" />
<input type="hidden" id="TypeID" name="TypeID" />
<input type="hidden" id="table" name="table" value="article" />
<input type="hidden" id="backurl" name="backurl" value="__URL__&TypeID=<?php echo $TypeID; ?>&Recommend=<?php echo $Recommend; ?>" />


<div class="location">
  <a href="javascript:history.back(-1);" class="back"><i></i><span>返回上一页</span></a>
  <a href="<?php echo url('Index/main'); ?>" class="home"><i></i><span>首页</span></a>
  
  <i class="arrow"></i>
  <span><a href="<?php echo url('Article/index'); ?>">内容管理</a></span>
<?php 
$patharr=getidlist1($TypeID);
foreach($patharr as $k=>$v)
{
if($v>0)
{
$vstr=typearr($v);

echo '<i class="arrow"></i><span><a href="'.url('Article/index',array('TypeID'=>$vstr['id'])).'">'.$vstr['TypeName'].'</a></span>';
}
}
 if($Recommend > 0): ?><i class="arrow"></i><span><?php echo NewsRecommed($Recommend); ?><a style="color:red; padding-left:5px;" href="<?php echo url('Article/index',array('TypeID'=>$TypeID,'kw'=>'')); ?>?&kw=<?php echo get('kw'); ?>&pxget=<?php echo get('pxget'); ?>&istop=<?php echo get('istop'); ?>">X</a></span><?php endif; if($istop > 0): ?><i class="arrow"></i><span>置顶
<a style="color:red; padding-left:5px;" href="<?php echo url('Article/index',array('TypeID'=>$TypeID)); ?>?Recommend=<?php echo get('Recommend'); ?>&kw=<?php echo get('kw'); ?>&pxget=<?php echo get('pxget'); ?>">X</a></span><?php endif; if($kw != ''): ?><i class="arrow"></i><span><?php echo $kw; ?><a style="color:red; padding-left:5px;" href="<?php echo url('Article/index',array('TypeID'=>$TypeID,'kw'=>'')); ?>?Recommend=<?php echo get('Recommend'); ?>&pxget=<?php echo get('pxget'); ?>">X</a></span><?php endif; ?> 

</div>
<!--/导航栏-->

<script>
function typeidisnull()
{
 var TypeID='<?php echo $TypeID; ?>';
 if(TypeID<1)
 {
	show_('请选择栏目.');
   $("#parentID").focus();
   $("#parentID").css("border",'1px solid red');
   return false;
 } 
}
</script>
<!--工具栏-->
<div id="floatHead" class="toolbar-wrap">








<div class="toolbar" style="float:left; width:100%; border-bottom:1px solid #CCC; padding-bottom:20px; margin-bottom:10px;">
<div style="float:left; width:70%; height:auto;">
<style>
.lmlist{
float:left;
width:100%;
height:auto;
line-height:25px;
font-size:12px;
color:#666;
font-weight:normal;
}
.lmlist span{
float:left;
width:auto;
min-width:65px;
text-align:right;
height:auto;
font-weight:bold;
text-align:left;

}
.lmlist a{
float:left;
width:auto;
height:auto;
padding-left:5px;
padding-right:5px;
color:#666
}
.lmlist .cur{
color:#27a9e3;
font-weight:bold;
}
</style>

<?php 
$patharr=typepatharr($TypeID);//获取路径ID数组

$patharr[0]=0;
if(!$patharr)
{
  $patharr=array(0);
}
$keyk='';
 if(is_array($patharr) || $patharr instanceof \think\Collection): if( count($patharr)==0 ) : echo "" ;else: foreach($patharr as $keyk=>$path): if(is_numeric($path)): 
$caidan=caidan($path,1000);

$nowTypeName=typearr($path,'TypeName');
if(empty($nowTypeName)){ $nowTypeName='网站栏目'; }
$nextnum=sizeof($caidan);

//print_r($caidan);
if($caidan)
{
 ?>
<div class="lmlist">
<span><?php echo $nowTypeName; ?>：</span>
<?php if(is_array($caidan) || $caidan instanceof \think\Collection): if( count($caidan)==0 ) : echo "" ;else: foreach($caidan as $key=>$cd): 
$cur='';
$class='';
if($TypeID>0)
{
    $cur=1;
}
if($cd['id']==$patharr[$keyk+$cur]){ $class='cur'; }
 ?>
<a class="<?php echo $class; ?>"  href="<?php echo url('Article/index',array('TypeID'=>$cd['id'])); ?>"><?php echo $cd['TypeName']; ?></a>
<?php endforeach; endif; else: echo "" ;endif; ?>
</div>
<?php 
}
 endif; endforeach; endif; else: echo "" ;endif; ?>

</div>


<div class="box-wrap" style="float:right; width:auto;">

<div class="l-list">
<ul class="icon-list">
  <li><a class="add" onClick="return typeidisnull()" href="<?php echo url('Article/add',array('TypeID'=>$TypeID)); ?>"><i></i><span>发布内容</span></a></li>
</ul>
</div>
</div>

</div>






</div>



</div>
<script>
function kwss()
{
  var pxget=$("#pxget").find("option:selected").val();
  var TypeID=$("#parentID").find("option:selected").val();
  var Recommend=$("#Recommend").val();
  if($("#kw").val()=='' && Recommend=='')
  {
   //alert('请输入ID/标题搜索文档');
   //$("#kw").focus();
   //$("#kw").css("border",'1px solid red');
	//return false;
  }
  if(Recommend<1) Recommend='';
  window.location='<?php echo url("Article/index"); ?>?istop=<?php echo get('istop'); ?>&TypeID='+TypeID+'&pxget='+pxget+'&Recommend='+Recommend+'&kw='+$("#kw").val();
}
</script>


<div style=" width:auto; height:auto; margin-top:10px; margin-bottom:10px; font-size:12px; text-align:center; margin:auto; padding-top:10px; padding-bottom:10px;  color:#999; ">

栏目：<select name="parentID" id="parentID" class="input normal"  class="form-control wat" style="font-size:12px; width:auto; " onChange="window.location='<?php echo url('Article/index'); ?>?TypeID='+this.value">
<option selected='selected' value="0">所有栏目</option>
<?php echo categoryTree(0,$TypeID); ?>
</select>
<?php 
$NewsRecommed=NewsRecommed();
 ?>
属性：<select name="Recommend" id="Recommend" class="input normal" style="font-size:12px; width:100px" >
<option selected='selected' value="0">默认</option>
<?php if(is_array($NewsRecommed) || $NewsRecommed instanceof \think\Collection): if( count($NewsRecommed)==0 ) : echo "" ;else: foreach($NewsRecommed as $key=>$rd): if($key > 0): ?>
<option <?php if($Recommend == $key): ?>selected='selected'<?php endif; ?> value="<?php echo $key; ?>"><?php echo $rd; ?></option>
<?php endif; endforeach; endif; else: echo "" ;endif; ?>

</select>
排序：<select name="pxget" id="pxget" class="input normal"  style="font-size:15px; width:100px" >
<option <?php if($pxget == ''): ?>selected='selected'<?php endif; ?> value="">默认</option>
<option <?php if($pxget == 'endtime'): ?>selected='selected'<?php endif; ?> value="endtime">更新时间</option>
<option <?php if($pxget == 'read_num'): ?>selected='selected'<?php endif; ?> value="read_num">浏览量</option>
<option <?php if($pxget == 'istop'): ?>selected='selected'<?php endif; ?> value="istop">置顶状态</option>
</select>

关键词：<input type="text" name="" class="input normal" style="text-indent:0px; width:120px" id="kw" value="<?php echo $kw; ?>">
 <input class="btn btn-primary" type="button" onClick="return kwss()" value="搜 索" />
	
</div>

<!--/工具栏-->

<!--列表-->
<div class="table-container">
  
  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="ltable">
    <tr>
      <th width="8%">ID</th>
      <th align="left" width="58%">标题</th>
      <th width="6%">栏目</th>
      <th width="5%">状态</th>
      <th width="3%">点击</th>
      <th width="14%">发布时间</th>
      <th width="6%">操作</th>
    </tr>
  
   
  

<?php if(is_array($list) || $list instanceof \think\Collection): if( count($list)==0 ) : echo "" ;else: foreach($list as $key=>$news): ?>
<tr id="<?php echo $news['id']; ?>">
<td align="center">
<span class="checkall">
<input type="checkbox" id="IDList" name="IDList" style="border:n0" value="<?php echo $news['id']; ?>" /> 
</span>
<?php echo $news['id']; ?>

</td>
<td>

<a href="<?php echo url('Article/updata',array('id'=>$news['id'])); ?>">
<?php echo jiezi($news['Title'],0,20,'UTF-8',true); if($news['S_Image'] != ''): ?><font  style="color:#f00" class="picshow" rel="<?php echo $news['S_Image']; ?>">[图]</font><?php endif; 
$tjlistarr=explode(",",$news['Recommend']);
 if(is_array($tjlistarr) || $tjlistarr instanceof \think\Collection): if( count($tjlistarr)==0 ) : echo "" ;else: foreach($tjlistarr as $key=>$tj): if($tj > 0): ?>
<font>[<a style="color:#f00;" href="<?php echo url('Article/index'); ?>?TypeID=<?php echo $TypeID; ?>&Recommend=<?php echo $tj; ?>&pxget=<?php echo get('pxget'); ?>&istop=<?php echo get('istop'); ?>&kw=<?php echo get('kw'); ?>"><?php echo NewsRecommed($tj); ?></a>]</font>
<?php endif; endforeach; endif; else: echo "" ;endif; if($news['istop'] > 0): ?>[<font style="color:#27a9e3">
<a style="color:#27a9e3;" href="<?php echo url('Article/index'); ?>?TypeID=<?php echo $TypeID; ?>&istop=1&Recommend=<?php echo get('Recommend'); ?>&pxget=<?php echo get('pxget'); ?>&kw=<?php echo get('kw'); ?>">置顶</a></font>]<?php endif; ?>

</a>
<?php 
$fjidstr=$news['fjid'];
$fjidstr=ltrim($fjidstr, ",");
$fjidstr=rtrim($fjidstr, ",");
$fjid=explode(",",$fjidstr);
if($fjid[0]>0)
{
$listfj=M("news_type")->field("`id`,`TypeName`")->where("`id` in($fjidstr)")->select();
 ?>
<div style="float:left; width:100%; height:auto; color:#FF3300;">
附属栏目：
<?php if(is_array($listfj) || $listfj instanceof \think\Collection): if( count($listfj)==0 ) : echo "" ;else: foreach($listfj as $key=>$type): ?>
<a style="color:#FF3300" href="<?php echo url('Article/index'); ?>?TypeID=<?php echo $type['id']; ?>">[<?php echo $type['TypeName']; ?>]</a>
<?php endforeach; endif; else: echo "" ;endif; ?>
</div>
<?php 
}
 ?>
</td>
<php>

<?php 
$TypeArr=typearr($news['TypeID']);
 ?>
<td align="center"><a href="<?php echo url('Article/index'); ?>?TypeID=<?php echo $TypeArr['id']; ?>"><?php echo $TypeArr['TypeName']; ?></a></td>
<td align="center">
<?php if($news['isVerify'] == 1): ?>
<span style="color:#960">已审</span>
<?php else: ?>
<span style="color:red">未审</span><?php endif; ?>
</td>
<td align="center" fd="read_num"><?php echo (isset($news['read_num']) && ($news['read_num'] !== '')?$news['read_num']:0); ?></td>
<td align="center"><?php echo date('Y-m-d H:i:s',$news['endtime']); ?></td>

<td align="center">

<a href="<?php echo url('Article/updata',array('id'=>$news['id'])); ?>">修改</a> <a onClick="return delid('<?php echo $news['id']; ?>','article')" href="javascript:;">删除</a>

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
<button class="btn btn-primary" onClick="return myAction('delnews')">&nbsp;选中删除&nbsp;</button>
<button class="btn btn-primary" onClick="return myAction('isVerify1')">&nbsp;选中审核&nbsp;</button>
<button class="btn btn-primary" onClick="return myAction('isVerify0')">&nbsp;取消审核&nbsp;</button>
<button class="btn btn-primary" onClick="return myAction('yd')">&nbsp;批量移动&nbsp;</button>



<!--<select name="ydtoid" id="ydtoid" onChange="return myAction('yd',this.value)" class="btn btn-primary" style=" height:33px; width:140px;">
<option value="0" > 批量移动文档</option>
--{:categoryTree(0,'')}-
</select>
</ul>-->



</ul>


</div>
</div>

</div>


<?php echo $list->render(); ?>
<div class="paging" style="color:#666; text-align:right;">
<select style="border:1px solid #f5f5f5; color:#666;" onChange="location='<?php echo url('Article/index',array('TypeID'=>$TypeID)); ?>?PageSize='+this.value">
<?php echo pagesize($PageSize); ?>
</select>  
</div>

  
  
  
  
  
  
  
  
  
  
</div>
<!--/列表-->



</form>
</body>

</html>
