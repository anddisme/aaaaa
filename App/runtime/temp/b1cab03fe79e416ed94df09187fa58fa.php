<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:61:"E:\2019phpstudy\PHPTutorial\WWW\xs/App/admin\view\lm\add.html";i:1568122026;s:63:"E:\2019phpstudy\PHPTutorial\WWW\xs/App/admin\view\index\js.html";i:1568028337;s:65:"E:\2019phpstudy\PHPTutorial\WWW\xs/App/admin\view\index\foot.html";i:1510904601;}*/ ?>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,initial-scale=1.0,user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<title>修改内容</title>
<script type="text/javascript" charset="utf-8" src="/public/skin/scripts/jquery/jquery-1.11.2.min.js"></script>
<link href="/public/skin/default/style.css" rel="stylesheet" type="text/css" />
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



<div class="location">
  <a href="javascript:history.back(-1);" class="back"><i></i><span>返回上一页</span></a>
  <a href="<?php echo url('Index/main'); ?>" class="home"><i></i><span>首页</span></a>
  
  <i class="arrow"></i>
  <span><a href="<?php echo url('lm/index'); ?>">栏目管理</a></span>
<?php 
$patharr=getidlist1($TypeID);
foreach($patharr as $k=>$v)
{
if($v>0)
{
$vstr=typearr($v);
echo '<i class="arrow"></i><span><a href="'.url('lm/index',array('TypeID'=>$vstr['id'])).'">'.$vstr['TypeName'].'</a></span>';
}
}
 ?>  
<i class="arrow"></i><span><a href="'.url('lm/index',array('TypeID'=>$vstr['id'])).'"><?php echo $type; ?>栏目</a></span>
</div>
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
K('#S_Image_').click(function() {
    editor.loadPlugin('image', function() {
        editor.plugin.imageDialog({
            imageUrl : K('#S_Image').val(),
            clickFn : function(url, title, width, height, border, align) {
                K('#S_Image').val(url);
                editor.hideDialog();
            }
        });
    });
});
K('#B_Image_').click(function() {
    editor.loadPlugin('image', function() {
        editor.plugin.imageDialog({
            imageUrl : K('#B_Image').val(),
            clickFn : function(url, title, width, height, border, align) {
                K('#B_Image').val(url);
                editor.hideDialog();
            }
        });
    });
});

});
</script>







<!--内容-->
<div id="floatHead" class="content-tab-wrap">
  <div class="content-tab">
    <div class="content-tab-ul-wrap">
      <ul>
        <li><a class="selected" href="javascript:;">基本信息</a></li>
      
      </ul>
    </div>
  </div>
</div>

<div class="tab-content">
<form name="form1" id="from1" method="post" action="###"  class="form-horizontal">













<dl>
<dt>所属父级</dt>
<dd>
<div style="display:none;">
<select  class="input normal" style="width:30%;"  onChange="location='run.php?m=App&a=addlm&TypeID='+this.value">
<option value="0"> 顶级栏目</option>
<?php echo categoryTree(0,$TypeID); ?>
</select>
</div>


<select class="input normal" style="width:30%;" name="parentID" id="parentID" >
<option value="0"> 顶级栏目</option>
<?php echo categoryTree(0,$TypeID); ?>
</select>
<input type="hidden" id="oldPathTree" name="oldPathTree" value="<?php echo $arr['PathTree']; ?>">
<input type="hidden" id="parentPathTree" name="parentPathTree" value="<?php echo $parentPathTree; ?>" />
</label>
<span style="color:#999"> (选择要正在添加栏目的上级栏目)</span>

</dd>
</dl>







<dl>
<dt>栏目名称</dt>
<dd>
<input type="text" name="TypeName" id="TypeName"  class="input normal" value="<?php echo $arr['TypeName']; ?>"  datatype="*1-20" msg="请输入正确的栏目名称" placeholder="请输入栏目名称" >
 <input type="hidden" id="oldPathTree" name="oldPathTree" value="<?php echo $arr['PathTree']; ?>">

</dd>
</dl>






<dl>
<dt>英文名称</dt>
<dd>
<input type="text" id="sTypeName" name="sTypeName" value="<?php echo $arr['sTypeName']; ?>" class="input normal" style="width:30%;">
<input type="hidden" name="Video" id="Video" class="input normal" style="width:auto;" value="<?php echo $arr['Video']; ?>">
</dd>
</dl>
<script>
function chagetype()
{
  var newsid=$("#newsid").val();
  if(newsid==1)
  {
	 $("#temp").val("page"); 
	 $("#contemp").val("page"); 
  }
  if(newsid==2)
  {
	 $("#temp").val("list"); 
	 $("#contemp").val("view"); 
  }
  if(newsid==3)
  {
	 $("#temp").val("pic"); 
	 $("#contemp").val("picview"); 
  }
  if(newsid==4)
  {
	 $("#temp").val("ad"); 
	 $("#contemp").val("adview"); 
  }
}

function showatt()
{
  var tempstr='<strong></strong>';

  show_('<iframe src="run.php?m=Index&a=lxsm" width="100%" frameborder="0" height="300px"></iframe>');
}
</script>


<dl>
<dt>栏目类型</dt>
<dd>
   <?php 
       $temp=array();
       $selected=array();
       $temp[1]=array('page','page');
       $temp[2]=array('list','view');
       $temp[3]=array('pic','picview');
       $temp[4]=array('ad','adview');
       $templist='page';
       $tempview='page';
	   $templist=$temp[1][0];
	   $tempview=$temp[1][1];
	   $selected[1]='selected="selected"';
	   
		 if($arr)
		   { 
			 $templist=$arr['temp'];
			 $tempview=$arr['contemp'];
			 $selected[$arr['newsid']]='selected="selected"';
		   }else{
			   if($parentarr){
			  
				   $templist=$parentarr['temp'];
				   $tempview=$parentarr['contemp'];
				   $selected[$parentarr['newsid']]='selected="selected"';
			   }
		   }
	  // echo '='.$templist;
	  // exit;
	  
	   
    ?>
<select class="input normal" style="width:17.6%;" name="newsid" id="newsid" onChange="return chagetype();" >
<option <?php echo $selected[1]; ?> value="1">单页模型 | Single</option>
<option <?php echo $selected[2]; ?> value="2">文章模型 | Article</option>
<option <?php echo $selected[3]; ?> value="3">图片模型 | Picture</option>
<option <?php echo $selected[4]; ?> value="4">链接模型 | Links</option>
</select>
  &nbsp;&nbsp;列表模板：<input type="text" name="temp" id="temp"  class="input normal" style="width:8%;" value="<?php echo $templist; ?>">
  &nbsp;&nbsp;内容模板：<input type="text" name="contemp"  class="input normal" style="width:8%;" id="contemp" value="<?php echo $tempview; ?>">
</dd>
</dl>


    <dl>
        <dt>链接地址</dt>
        <dd>
            <?php 
                $ljdz1 = config(ljdzarr);
                if($arr['ljdz']  == '0'){
                     $arr['ljdz'] = '1';
                }
                if($arr['ljdz']  == ''){
                     $arr['ljdz'] = '1';
                }
                //print_r($arr['ljdz']);die;
             if(is_array($ljdz1) || $ljdz1 instanceof \think\Collection): if( count($ljdz1)==0 ) : echo "" ;else: foreach($ljdz1 as $key=>$ljd): ?>
                <input name="ljdz" type="radio" value="<?php echo $key; ?>" <?php if($arr['ljdz'] == $key): ?>checked="checked"<?php endif; ?> ><?php echo $ljd; endforeach; endif; else: echo "" ;endif; ?>
        </dd>
    </dl>
<dl>
<dt>栏目属性</dt>
<dd>
[<input name="jcmb" type="checkbox" value="1">
同时更改下级栏目的栏目类型、模板风格]
&nbsp;&nbsp;&nbsp;&nbsp;
[<input name="nohtml" type="checkbox" <?php if($arr['nohtml'] == '1'): ?>checked="checked"<?php endif; ?> value="1">
不生成静态]
&nbsp;&nbsp;&nbsp;&nbsp;
[<input <?php if($arr['is_meau'] == '1' || $type == '添加'): ?>checked="checked"<?php endif; ?> name="is_meau" type="checkbox" value="1"  />
显示]

</dd>
</dl>



<dl>
<dt>页大小</dt>
<dd>
<input type="text" name="PageSize"  class="input normal" style="width:10%;"  onKeyUp="value=value.replace(/[^\d]/g,'')"  id="PageSize"  value="<?php if($arr['PageSize'] == ''): ?>默认<?php else: ?><?php echo $arr['PageSize']; endif; ?>"> 

排序：<input type="text" name="SortNumber"  id="SortNumber"  class="input normal b60" style="width:8%;"  onKeyUp="value=value.replace(/[^\d]/g,'')"  value="<?php echo (isset($arr['SortNumber']) && ($arr['SortNumber'] !== '')?$arr['SortNumber']:$scid+1); ?>">
<span style="color:#999">排序(由低→高)  </span>

</dd>
</dl>





<link rel="stylesheet" href="/public/bjq/themes/default/default.css" />
<script type="text/javascript" src="/public/bjq/kindeditor-min.js"></script><!--编辑器-->
<script type="text/javascript" src="/public/bjq/lang/zh_CN.js"></script><!--公用-->
<script type="text/javascript" src="./Tpl/Public/js/common.js"></script>  		
		<script>
			KindEditor.ready(function(K) {
				var editor = K.editor({
					allowFileManager : true
				});
				K('#img1_').click(function() {
					editor.loadPlugin('image', function() {
						editor.plugin.imageDialog({
							imageUrl : K('#img1').val(),
							clickFn : function(url, title, width, height, border, align) {
								K('#img1').val(url);
								editor.hideDialog();
							}
						});
					});
				});
				
			});
		</script>


<dl>
<dt>栏目图片</dt>
<dd>
<div id="img1_a">
<input type="text" name="img1" class="input normal" style="width:30%;" id="img1" value="<?php echo $arr['img1']; ?>">
<input class="btn btn-primary" type="button" id="img1_" value="上传图片" />
<font  style="color:#27a9e3; display:none;" class="picshow" rel="<?php echo $arr['img1']; ?>">[预览]</font>
</div>
<script>
  setInterval('imgchange("img1")',1000);
</script>
</dd>
</dl>



<dl>
<dt>网站URL</dt>
<dd>
<input type="text" name="weburl" class="input normal" id="weburl" style="width:30%;" value="<?php echo (isset($arr['weburl']) && ($arr['weburl'] !== '')?$arr['weburl']:$addweburl); ?>">
</dd>
</dl>


<?php if($aaa == 111): ?>
<dl>
<dt>内容</dt>
<dd>

    <textarea name="con3" style="width:50%;height:300px;visibility:hidden;"><?php echo $arr['con3']; ?></textarea>
    <script type="text/javascript">
        KindEditor.ready(function(K) {
            K2=K;
            var editor1 = K.create('textarea[name="con3"]', {
                //	cssPath : '/pub/sys/ggj/plugins/code/prettify.css',
                //	uploadJson : '/pub/sys/ggj/php/upload_json.php',
                //	fileManagerJson : '/pub/sys/ggj/php/file_manager_json.php',
                allowFileManager : true,
                filterMode : false,
                afterBlur: function () { this.sync(); },
                afterCreate : function() {},
                newlineTag : "br" //或者为"p"
            });

        });
    </script>
</dd>
</dl>
<?php endif; ?>




<dl>
<dt>网站标题</dt>
<dd>
<input type="text" name="seo_title" class="input normal" style="width:60%;" id="seo_title" value="<?php echo $arr['seo_title']; ?>">
</dd>
</dl>

<dl>
<dt>关键词</dt>
<dd>
<input type="text" name="seo_keywords" class="input normal" style="width:60%;" id="seo_keywords" value="<?php echo $arr['seo_keywords']; ?>">
</dd>
</dl>

<dl>
<dt>描述</dt>
<dd>
<textarea name="seo_miaoshu" cols="80" class="input normal b60" rows="4" style="width:60%" id="seo_miaoshu"><?php echo $arr['seo_miaoshu']; ?></textarea>
</dd>
</dl>

  

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