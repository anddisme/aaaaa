<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:66:"E:\2019phpstudy\PHPTutorial\WWW\xs/App/admin\view\article\add.html";i:1570521267;s:63:"E:\2019phpstudy\PHPTutorial\WWW\xs/App/admin\view\index\js.html";i:1568028337;s:65:"E:\2019phpstudy\PHPTutorial\WWW\xs/App/admin\view\index\foot.html";i:1510904601;}*/ ?>
﻿<!DOCTYPE html>
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
<script type="text/javascript">	var path='';
var url='';
</script>
<script type="text/javascript" src="/public/sup/js/swfupload.js"></script>
<script type="text/javascript" src="/public/sup/js/handlers.js"></script>
<script type="text/javascript" src="/public/sup/js/handlers1.js"></script>
<script type="text/javascript" src="/public/sup/js/handlers2.js"></script>
<script type="text/javascript" src="/public/sup/js/handlers3.js"></script>
<script type="text/javascript">


    $(document).ready(function() {

        //初始化第一个SWFUpload对象
        var upload1 = new SWFUpload({
            upload_url: "<?php echo url('Upload/index'); ?>",
            post_params: {"PHPSESSID": "aa18ofq6npp1atlamplgmohg17"},
            file_size_limit : "2 MB",
            file_types : "*.jpg;*.png;*.gif;*.bmp",
            file_types_description : "JPG Images",
            file_upload_limit : "100",
            file_queue_error_handler : fileQueueError,
            file_dialog_complete_handler : fileDialogComplete,
            upload_progress_handler : uploadProgress,
            upload_error_handler : uploadError,
            upload_success_handler : uploadSuccess,
            upload_complete_handler : uploadComplete,
            button_image_url : "/public/sup/images/upload.png",
            button_placeholder_id : "spanButtonPlaceholder",
            button_width: 113,
            button_height: 39,
            button_text : '',
            button_text_style : '.spanButtonPlaceholder { font-family: Helvetica, Arial, sans-serif; font-size: 14pt;} ',
            button_text_top_padding: 0,
            button_text_left_padding: 0,
            button_window_mode: SWFUpload.WINDOW_MODE.TRANSPARENT,
            button_cursor: SWFUpload.CURSOR.HAND,
            flash_url : "/public/sup/swf/swfupload.swf",
            custom_settings : {
                upload_target : "divFileProgressContainer"
            },
            debug: false
        });









        //初始化第一个SWFUpload对象
        var upload2 = new SWFUpload({
            upload_url: "<?php echo url('Upload/index'); ?>",
            post_params: {"PHPSESSID": "aa18ofq6npp1atlamplgmohg17"},
            file_size_limit : "2 MB",
            file_types : "*.jpg;*.png;*.gif;*.bmp",
            file_types_description : "JPG Images",
            file_upload_limit : "100",
            file_queue_error_handler : fileQueueError1,
            file_dialog_complete_handler : fileDialogComplete1,
            upload_progress_handler : uploadProgress1,
            upload_error_handler : uploadError1,
            upload_success_handler : uploadSuccess1,
            upload_complete_handler : uploadComplete1,
            button_image_url : "/public/sup/images/upload.png",
            button_placeholder_id : "spanButtonPlaceholder1",
            button_width: 113,
            button_height: 33,
            button_text : '',
            button_text_style : '.spanButtonPlaceholder1 { font-family: Helvetica, Arial, sans-serif; font-size: 14pt;} ',
            button_text_top_padding: 0,
            button_text_left_padding: 0,
            button_window_mode: SWFUpload.WINDOW_MODE.TRANSPARENT,
            button_cursor: SWFUpload.CURSOR.HAND,
            flash_url : "/public/sup/swf/swfupload.swf",
            custom_settings : {
                upload_target : "divFileProgressContainer1"
            },
            debug: false
        });





        //初始化第2  SWFUpload对象
        var upload3 = new SWFUpload({
            upload_url: "<?php echo url('Upload/index'); ?>",
            post_params: {"PHPSESSID": "aa18ofq6npp1atlamplgmohg17"},
            file_size_limit : "2 MB",
            file_types : "*.jpg;*.png;*.gif;*.bmp",
            file_types_description : "JPG Images",
            file_upload_limit : "100",
            file_queue_error_handler : fileQueueError2,
            file_dialog_complete_handler : fileDialogComplete2,
            upload_progress_handler : uploadProgress2,
            upload_error_handler : uploadError2,
            upload_success_handler : uploadSuccess2,
            upload_complete_handler : uploadComplete2,
            button_image_url : "/public/sup/images/upload.png",
            button_placeholder_id : "spanButtonPlaceholder2",
            button_width: 113,
            button_height: 33,
            button_text : '',
            button_text_style : '.spanButtonPlaceholder2 { font-family: Helvetica, Arial, sans-serif; font-size: 14pt;} ',
            button_text_top_padding: 0,
            button_text_left_padding: 0,
            button_window_mode: SWFUpload.WINDOW_MODE.TRANSPARENT,
            button_cursor: SWFUpload.CURSOR.HAND,
            flash_url : "/public/sup/swf/swfupload.swf",
            custom_settings : {
                upload_target : "divFileProgressContainer2"
            },
            debug: false
        });




        //初始化第3  SWFUpload对象
        var upload4 = new SWFUpload({
            upload_url: "<?php echo url('Upload/index'); ?>",
            post_params: {"PHPSESSID": "aa18ofq6npp1atlamplgmohg17"},
            file_size_limit : "2 MB",
            file_types : "*.jpg;*.png;*.gif;*.bmp",
            file_types_description : "JPG Images",
            file_upload_limit : "100",
            file_queue_error_handler : fileQueueError3,
            file_dialog_complete_handler : fileDialogComplete3,
            upload_progress_handler : uploadProgress3,
            upload_error_handler : uploadError3,
            upload_success_handler : uploadSuccess3,
            upload_complete_handler : uploadComplete3,
            button_image_url : "/public/sup/images/upload.png",
            button_placeholder_id : "spanButtonPlaceholder3",
            button_width: 113,
            button_height: 33,
            button_text : '',
            button_text_style : '.spanButtonPlaceholder3 { font-family: Helvetica, Arial, sans-serif; font-size: 14pt;} ',
            button_text_top_padding: 0,
            button_text_left_padding: 0,
            button_window_mode: SWFUpload.WINDOW_MODE.TRANSPARENT,
            button_cursor: SWFUpload.CURSOR.HAND,
            flash_url : "/public/sup/swf/swfupload.swf",
            custom_settings : {
                upload_target : "divFileProgressContainer3"
            },
            debug: false
        });







    });
</script>
<!--导航栏-->


<div class="location">
    <a href="javascript:history.back(-1);" class="back"><i></i><span>返回上一页</span></a>
    <a href="<?php echo url('Index/main'); ?>" class="home"><i></i><span>首页</span></a>

    <i class="arrow"></i>

    <span><a href="<?php echo url('Article/index'); ?>">内容管理</a></span>
    <?php 
        $patharr=getidlist1($TypeID);
        $type='添加';
        if(get('id') > 0){ $type='修改'; }
        foreach($patharr as $k=>$v)
        {
        if($v>0)
        {
        $vstr=typearr($v);

        echo '<i class="arrow"></i><span><a href="'.url('Article/index',array('TypeID'=>$vstr['id'])).'">'.$vstr['TypeName'].'</a></span>';
        }
        }
     ?>
    <i class="arrow"></i><span><a href="<?php echo url('Article/index',array('TypeID'=>$vstr['id'])); ?>"><?php echo $type; ?>文档</a></span>
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
    <form name="form1" id="from1" method="post" action=""  class="form-horizontal==">
        <input type="hidden" name="s" id="" value=""/>
        <input type="hidden" name="s1" id="" value=""/>
        <input type="hidden" name="s2" id="" value=""/>
        <input type="hidden" name="s3" id="" value=""/>
        <dl>
            <dt>所属栏目</dt>
            <dd>

                <select name="TypeID"  id="TypeID" class="input normal" style="width:auto; min-width:29.5%;" onChange="location='<?php echo url('Article/add'); ?>?TypeID='+this.value">
                    <?php echo categoryTree(0,$TypeID); ?>
                </select>
                </label>
                <?php 
                    $host=$_SERVER['HTTP_HOST'];
                    $Creator='';
                 ?>

                来源： <input type="text" name="Author" class="input normal" style="width:110px;" id="Author"  value="<?php echo (isset($arr['Author']) && ($arr['Author'] !== '')?$arr['Author']:$host); ?>">
                作者： <input type="text" name="Creator" class="input normal" style="width:100px;" id="Creator"  value="<?php echo (isset($arr['Creator']) && ($arr['Creator'] !== '')?$arr['Creator']:$Creator); ?>">

            </dd>
        </dl>

        <dl>
            <dt>文档标题</dt>
            <dd>
                <input type="text" class="input normal"  id="Title" name="Title"  value="<?php echo $arr['Title']; ?>"  datatype="*1-50"  placeholder="请输入标题"/>
                <span class="Validform_checktip">*标题最多1-50个字符</span>
            </dd>
        </dl>

        <dl>
            <dt>缩略图片</dt>
            <dd>
                <div id="S_Image_a">
                    <input type="text" name="S_Image" class="input normal" id="S_Image" value="<?php echo $arr['S_Image']; ?>">
                    <input class="btn btn-primary" type="button" id="S_Image_" value="上传图片" />
                    <font  style="color:#27a9e3; display:none;" class="picshow" rel="<?php echo $arr['S_Image']; ?>">[预览]</font>
                </div>
                <script>
                    setInterval('imgchange("S_Image")',1000);
                </script>
            </dd>
        </dl>



        <dl id="yijicity">
            <dt>所属地区</dt>
            <dd>
                <?php 
                    $citylist=citylist(0);
                    $citylist1=citylist($arr['d1']);
                 ?>
                <select name="city"  id="city" class="form-control" style="width:150px; float: left;">
                    <option value="">请选择</option>
                    <?php if(is_array($citylist) || $citylist instanceof \think\Collection): if( count($citylist)==0 ) : echo "" ;else: foreach($citylist as $key=>$page): ?>
                        <option <?php if($arr['d1'] == $page['id']): ?>selected="selected" <?php endif; ?> value="<?php echo $page['id']; ?>"><?php echo $page['cityname']; ?></option>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                </select>
                <?php if($arr['d2'] != ''): ?>
                    <span class="addcity">
                        <select name="city1"  id="city1" class="form-control" style="width:150px; float: left;">
                            <option value="">请选择</option>
                            <?php if(is_array($citylist1) || $citylist1 instanceof \think\Collection): if( count($citylist1)==0 ) : echo "" ;else: foreach($citylist1 as $key=>$page): ?>
                                <option <?php if($arr['d2'] == $page['id']): ?>selected="selected" <?php endif; ?> value="<?php echo $page['id']; ?>"><?php echo $page['cityname']; ?></option>
                            <?php endforeach; endif; else: echo "" ;endif; ?>
                        </select>
                    </span>
                <?php endif; ?>





                </label>
            </dd>



        </dl>
        <script>
            $("document").ready(function(){
                $("#city").change(function(){
                    var id = $(this).val();
                    var trs = '';
                    var option = '';
                    $('.addcity').html("");
                    $.ajax({
                        type: "GET",
                        url: "<?php echo url('city/erjicity'); ?>",
                        data: {id:id},
                        dataType: 'json',
                        success: function(msg){
                            $.each(JSON.parse(msg),function(k,v) {
                                option += '<option value="'+v.id+'">'+v.cityname+'</option>';
                            });
                            //alert(option);
                            //console.log(data);
                            trs += '<span class="addcity">';
                            trs += '<select name="city1"  id="city1" class="form-control" style="width:150px;float: left;">';
                            trs += '<option value="">请选择</option>';
                                trs += option;
                                trs += '</select>';
                                trs += '</span>';
                                //alert(trs);
                            $('#yijicity').append(trs);
                            //alert(data);
                        },
                        error:function(e){
                            alert("请选择一个分类属性");
                        }
                    });

                })
            })
        </script>


        <dl>
            <dt>电话号码</dt>
            <dd>
                <input type="text" name="d5" class="input normal" id="d5" value="<?php echo $arr['d5']; ?>"  />
            </dd>
        </dl>

        <script type="text/javascript" src="/public/datepicker/WdatePicker.js"></script>
        <dl>
            <dt>发布时间</dt>
            <dd>
                <?php if($arr['endtime'] != ''): ?>
                    <input readonly="readonly" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" type="text" name="endtime"  class="input normal Wdate" id="endtime"  value="<?php echo date('Y-m-d H:i:s',$arr['endtime']); ?>">
                    <?php else: ?>
                    <input readonly="readonly" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" type="text" name="endtime"  class="input normal Wdate" id="endtime"  value="<?php echo date("Y-m-d H:i:s"); ?>">
                <?php endif; ?>
                <span style="color:#999; padding-right:20px;">时间排序(由大→小)  </span>
                浏览：<input name="read_num" type="text" class="input normal" id="read_num" style="width:100px;" value="<?php echo (isset($arr['read_num']) && ($arr['read_num'] !== '')?$arr['read_num']:'0'); ?>"  datatype="/^-?[1-9]+(\.\d+)?$|^-?0(\.\d+)?$|^-?[1-9]+[0-9]*(\.\d+)?$/" msg="浏览次数必须为数字">
            </dd>
        </dl>


        <?php 
            if($typearr['newsid']=='4')
            {
            //////////////////////////////////////////////////////////////外部链接栏目输出
         ?>
        <dl>
            <dt>链接地址</dt>
            <dd>
                <input type="text" name="B_Image" class="input normal" id="B_Image" value="<?php echo $arr['B_Image']; ?>"  />
                <span class="Validform_checktip">*标题最多1-50个字符</span>
            </dd>
        </dl>
        <?php 
            }
            //////////////////////////////////////////////////////////////外部链接栏目输出
         
            if($typearr['newsid']!='4')
            {
            //输出附属字段
         
            if($typearr['newsid']!='1')
            {
            //单页图文栏目不输出
         
            //$tjlmid=M("news_type")->field("`id`,`TypeName`")->where("`parentID`='6'")->order("")->select();
            //$idlist=explode(",",$arr['fjid']);
         ?>
        <dl>
            <dt>附属栏目</dt>
            <dd>
                <link href="/public/bootstrap/css/bootstrap.min.css" rel="stylesheet">
                <script src="/public/bootstrap/js/jquery.min.js"></script>
                <link rel="stylesheet" href="/public/bootstrap/css/bootstrap-select.css">
                <script src="/public/bootstrap/js/bootstrap-3.3.4.js"></script>
                <script src="/public/bootstrap/js/bootstrap-select.js"></script>

                <div style="float:left; width:50%">
                    <select name="fjid[]"    id="fjid"  class="selectpicker form-control" multiple data-live-search="true">
                        <?php echo categoryTree(0,$arr[fjid]); ?>
                    </select>
                </div>
            </dd>
        </dl>



        <dl>
            <dt>文档属性</dt>
            <dd>
                <?php 
                    $Recommed=NewsRecommed();
                    $tjlistarr=explode(',',$arr['Recommend']);
                 if(is_array($Recommed) || $Recommed instanceof \think\Collection): if( count($Recommed)==0 ) : echo "" ;else: foreach($Recommed as $key=>$typelist): if($key > '0'): 
                            $tjstd='';
                            if(in_array($key,$tjlistarr))
                            {
                            $tjstd='checked="checked"';
                            }
                         ?>
                        <input  <?php echo $tjstd; ?> name="Recommend[]" type="checkbox" value="<?php echo $key; ?>" />[<?php echo $typelist; ?>]&nbsp;
                    <?php endif; endforeach; endif; else: echo "" ;endif; ?>
                &nbsp;&nbsp;&nbsp;&nbsp;
                置顶：<input name="istop" type="radio" value="1" <?php if($arr['istop'] > '0'): ?>checked="checked"<?php endif; ?> />
                是
                <input name="istop" type="radio" value="0" <?php if($arr['istop'] < 1): ?>checked="checked"<?php endif; ?>/>
                否
            </dd>
        </dl>

        <dl>
            <dt>审核状态</dt>
            <dd>
                <input name="isVerify" type="radio" value="1" <?php if($arr['isVerify'] == '1'): ?>checked="checked"<?php endif; if($arr['isVerify'] == ''): ?>checked="checked"<?php endif; ?>/>
                已审核
                <input name="isVerify" type="radio" value="0" <?php if($arr['isVerify'] == '0'): ?>checked="checked"<?php endif; ?>/>
                未审核</label>
            </dd>
        </dl>

        <?php 
            }
            ////单页图文栏目不输出
         ?>





        <dl style="display: none;">
            <dt>属性管理</dt>
            <dd>
                <?php 
                    $list=getsxlist(0);
                 ?>
                <select name="sxoption"  id="sxlist" class="form-control" style="width:auto;">
                    <option value="">选择属性</option>
                    <?php if(is_array($list) || $list instanceof \think\Collection): if( count($list)==0 ) : echo "" ;else: foreach($list as $key=>$page): ?>
                        <option <?php if($arrsx[0]['sxoption'] == $page['id']): ?>selected="selected" <?php endif; ?> value="<?php echo $page['id']; ?>"><?php echo $page['cat_name']; ?></option>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                </select>
                </label>
            </dd>

        </dl>
        <style>
            #erjishuxing div{
                margin-top: 15px;
            }
            #erjishuxing select option{
                width: 40px;
            }
        </style>
        <dl  style="display: none;">
            <dd id="erjishuxing">
                <?php if(is_array($arrsx1) || $arrsx1 instanceof \think\Collection): if( count($arrsx1)==0 ) : echo "" ;else: foreach($arrsx1 as $key=>$menu): if(is_array($menu) || $menu instanceof \think\Collection): if( count($menu)==0 ) : echo "" ;else: foreach($menu as $key1=>$val): 
                            $name = think\Db::name("prosx")->where("`id` =$val[spsxm]")->find();
                            $option1 = $name['attr_values'];
                            $option1arr = explode(",",$option1);
                         if($key1 == 0): ?>
                        <div><a id="team<?php echo $val['spsxm']; ?>" onclick="return addtaem(<?php echo $val['spsxm']; ?>)">[+]</a><?php echo $name['attr_name']; ?>
                            <select  name="option[]">
                                <?php if(is_array($option1arr) || $option1arr instanceof \think\Collection): if( count($option1arr)==0 ) : echo "" ;else: foreach($option1arr as $key=>$v): ?>
                                    <option <?php if($val['option'] == $v): ?>selected="selected"<?php endif; ?> value="<?php echo $v; ?>"><?php echo $v; ?></option>
                                <?php endforeach; endif; else: echo "" ;endif; ?>
                            </select>
                            <input type="hidden" name="spsxm[]" value="<?php echo $val['spsxm']; ?>">
                            属性价格<input type="text" value="<?php echo $val['shuxingjg']; ?>" name="shuxingjg[]" />库存<input type="text" value="<?php echo $val['kucun']; ?>" name="kucun[]" /></div>
                        <?php endif; if($key1 > 0): ?>
                            <div><a onclick="$(this).parent().remove()">[-]</a><?php echo $name['attr_name']; ?>
                                <select  name="option[]">
                                    <?php if(is_array($option1arr) || $option1arr instanceof \think\Collection): if( count($option1arr)==0 ) : echo "" ;else: foreach($option1arr as $key=>$v): ?>
                                        <option <?php if($val['option'] == $v): ?>selected="selected"<?php endif; ?> value="<?php echo $v; ?>"><?php echo $v; ?></option>
                                    <?php endforeach; endif; else: echo "" ;endif; ?>
                                </select>
                                <input type="hidden" name="spsxm[]" value="<?php echo $val['spsxm']; ?>">
                                属性价格<input type="text" value="<?php echo $val['shuxingjg']; ?>" name="shuxingjg[]" />库存<input type="text" value="<?php echo $val['kucun']; ?>" name="kucun[]" /></div>
                        <?php endif; endforeach; endif; else: echo "" ;endif; endforeach; endif; else: echo "" ;endif; ?>
            </dd>
        </dl>
        <script>
            $("document").ready(function(){
                $("#sxlist").change(function(){
                    var id = $("#sxlist").val();
                    $('#erjishuxing').html("");
                    var trs = "";
                    //var jia = "";
                    $.ajax({
                        type: "POST",
                        url: "<?php echo url('prosx/ajaxsx'); ?>",
                        data: {id:id},
                        dataType: 'json',
                        success: function(data){
                            //console.log(data);
                            $.each(data,function(key,val) {
                                trs +=strs(val,'jia');
                            });
                            $('#erjishuxing').append(trs);
                            //alert(data);
                        },
                        error:function(e){
                            alert("请选择一个分类属性");
                        }
                    });
                });
            });
            function strs(val,jiajian){
                var trs = '';
                var arr =val.attr_values.split(',');
                var option = '';
                $.each(arr,function(k,v) {
                    option += '<option value="'+v+'">'+v+'</option>';
                });

                var ss = '';
                var time = (new Date()).valueOf();
                //alert(time);
                if(jiajian == 'jian'){
                    //ss = '<a id="team'+val.id+'" onclick="$(this).parent().html()">[-]</a>';
                    ss = '<a id="team'+val.id+'" onclick="$(this).parent().remove()">[-]</a>';
                }else{
                   ss = '<a id="team'+val.id+'" onclick="return addtaem('+val.id+')">[+]</a>';
                }
                trs += '<div class="'+time+'">';
                trs += ss ;
                trs += '<input type="hidden" name="spsxm[]" value="'+val.id+'">' ;
                trs += '' + val.attr_name + '<select  name="option[]">'+option+'</select>	 属性价格<input type="text" name="shuxingjg[]" />库存<input type="text" name="kucun[]" /></div>';
                return trs;
            }

            function addtaem(id){
                var trs = '';
                //var jian = '';
                $.ajax({
                    type: "POST",
                    url: "<?php echo url('prosx/ajaxsx'); ?>",
                    data: {vid:id},
                    dataType: 'json',
                    success: function(data){
                       // console.log(data);
                        trs +=strs(data,'jian');
                        $('#team'+id).parent().after(trs);
                        //alert(data);
                    },
                    error:function(e){
                        alert(e);
                    }
                });
                //alert(id);
            }
            function deltaem(id){
                //alert(id);
                //var trs = '';
                    $(".id").remove();
                        //alert(data);

                //alert(id);
            }
        </script>




        <?php if($blm == '999999999999'): ?>
            <dl>
                <dt>风格</dt>
                <dd>
                    <?php 
                        $list=sxlist(1);
                     ?>
                    <select name="s11"  id="s11" class="form-control" style="width:auto;">
                        <option >选择风格</option>

                        <?php if(is_array($list) || $list instanceof \think\Collection): if( count($list)==0 ) : echo "" ;else: foreach($list as $key=>$page): ?>
                            <option <?php if($arr['s1'] == $page['id']): ?>selected="selected" <?php endif; ?> value="<?php echo $page['id']; ?>"><?php echo $page['Title']; ?></option>
                        <?php endforeach; endif; else: echo "" ;endif; ?>
                    </select>
                    </label>
                </dd>
            </dl>

            <dl>
                <dt>户型</dt>
                <dd>
                    <?php 
                        $list=sxlist(2);
                     ?>
                    <select name="s22"  id="s22" class="form-control" style="width:auto;">
                        <option >选择户型</option>

                        <?php if(is_array($list) || $list instanceof \think\Collection): if( count($list)==0 ) : echo "" ;else: foreach($list as $key=>$page): ?>
                            <option <?php if($arr['s2'] == $page['id']): ?>selected="selected" <?php endif; ?> value="<?php echo $page['id']; ?>"><?php echo $page['Title']; ?></option>
                        <?php endforeach; endif; else: echo "" ;endif; ?>
                    </select>
                    </label>
                </dd>
            </dl>
        <?php endif; 
            if($blm=='9999')
            {
         ?>
        <dl>
            <dt>商品规格</dt>
            <dd>
                <input type="text" name="isHTML" class="tedfro" id="isHTML" style="width:200px;" value="<?php echo $arr['isHTML']; ?>">
            </dd>
        </dl>



        <dl>
            <dt>价格</dt>
            <dd>
                <input type="text" name="hpx" class="form-control b50" id="hpx" style="width:100px;" value="<?php echo $arr['hpx']; ?>">
                &nbsp;&nbsp;&nbsp;&nbsp;
            </dd>
        </dl>


        <dl>
            <dt>内容</dt>
            <dd>
                <textarea name="KeyWords" cols="80" rows="4" id="KeyWords" class="form-control b50"><?php echo $arr['KeyWords']; ?></textarea>

            </dd>
        </dl>
        <?php 
            }
         
            if($TypeID!=55)
            {
         ?>




        <dl>
            <dt>详细内容</dt>
            <dd>
                <textarea name="Content" style="width:95%;height:450px;visibility:hidden;"><?php echo $arr['Content']; ?></textarea>
                <script type="text/javascript">
                    KindEditor.ready(function(K) {
                        K2=K;
                        var editor1 = K.create('textarea[name="Content"]', {
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

        <?php 
            }
         
            /*
            相册数量
            */
            $imggroup_num=2;
            if($imggroup_num>0)
            {
         ?>

        <style>
            .imggroup{
                float:left;
                width:100%;
                height:auto;
                margin-top:10px;
            }
            .imggroup ul{
                float:left;
                width:100%;

                list-style:none;
                padding:0px;
                margin:0px;
            }
            .imggroup ul li{
                float:left;
                width:80px;
                height:100px;
                margin-right:10px;
            }

            .imggroup ul li img{
                width:80px;
                height:80px;
            }

            .imggroup ul li span{
                float:left;
                width:80px;
                height:20px;
                font-size:10px;
                text-align:center;
            }

            .imggroup ul li span a{
                color:#333;
            }

            .uploadsbotton{
                float:left;
                width:100%;
                height:40px;
            }
            .jindu1tiao{
                float:left;
                width:100%;
                height:2px;
                border:1px solid #060;
            }
        </style>
        <script src="/public/js/jupload/vendor/jquery.ui.widget.js"></script>
        <script src="/public/js/jupload/jquery.iframe-transport.js"></script>
        <script src="/public/js/jupload/jquery.fileupload.js"></script>

        <script>
            $(function () {
                /*
                 相册
                 */
                var filenum='';
                filenum=$(".fileupload").size();
                var i=0;
                var i1='';
                for(i=0;i<<?php echo $imggroup_num; ?>;i++)
                {
                    var j=i;
                    $('#fileupload'+i).fileupload({
                        dataType: 'json',
                        typestr: j,
                        // 上传完成后的执行逻辑
                        done: function (e, data) {
                            var i1=data.typestr;//接收参数 var i
                            var result = JSON.parse(data.result);
                            var src = result.src;
                            var imgstr='';
                            var s_value=$("#s"+i1).val();
                            //alert(result);
                            $.each(result, function (index, file) {
                                //alert(file.name);

                                s_value+=file+',';
                                imgstr+='<li>';
                                imgstr+='<a><img src="'+file+'"></a>';
                                imgstr+='<a href="javascript:;" onclick="$(this).parent().remove()">删除</a>';
                                imgstr+='</li>';
                            });

                            $('#s'+i1).val(s_value);
                            $('#imgstr'+i1).find('ul').append(imgstr);
                            return false;
                            //	$('#tplj').val(src);
                        },
                        // 上传过程中的回调函数
                        progressall: function (e, data) {
                            //var i1=data.typestr;//接收参数 var i

                            var progress = parseInt(data.loaded / data.total * 100, 10);
                            shows_(progress + '%');
                            if(progress==100) { shows_('上传完成'); }
                        }
                    });
                }





            });




            function delidimg(id,idul)
            {
                if(!confirm("确定要删除相册图片吗？"))
                {
                    return false;
                }
                show1_('图片删除中...');
                $.get("<?php echo url('Del/delimg'); ?>?id="+id,function(data,status){
                    if(data=='y')
                    {
                        shows_('删除成功！');
                        $("#"+idul).find("#img"+id).remove();
                        return false;
                    }else{
                        show_('删除失败！');
                        return false;
                    }
                });
            }
            $("document").ready(function(){
                $(".xgimg").click(function(){
                    var id = $(this).attr("rel");
                    //if(Number(id)>0){
                    // shows_("参数非法");
                    // return false;
                    //   }
                    layer.open({
                        type: 2,
                        title:"修改图片",
                        area: ['350px', 'auto'],
                        fixed: false, //不固定
                        maxmin: false,
                        content: "<?php echo url('Article/updateimg'); ?>?id="+id+'&tab=img'
                    });
                    return false;

                })
            })
        </script>
        <?php 
            }
         
            for($i=0;$i<$imggroup_num;$i++)
            {
         ?>
        <dl>
            <dt>相册<?php echo $i; ?></dt>
            <dd>
                <div class="uploadsbotton">
                    <input type="file" multiple class="myfile fileupload" id="fileupload<?php echo $i; ?>"  name="file_name" data-url="<?php echo url('Common/uploads'); ?>"  style="width:150px; height:35px; position:absolute; background:#000; FILTER: alpha(opacity:0);-moz-opacity:0;opacity:0; ">
                    <input type="button" value="上传图片" class="btn jindutiao" id="jindutiao<?php echo $i; ?>" />
                    <input type="hidden" name="s[]" id="s<?php echo $i; ?>" value=""/>
                </div>

                <div class="imggroup imgstr" id="imgstr<?php echo $i; ?>"><ul></ul></div>
                <div class="imggroup">
                    <ul id="imgstrul<?php echo $i; ?>">
                        <?php $_5d9c40b840cec=imgs($arr['id'],$i); if(is_array($_5d9c40b840cec) || $_5d9c40b840cec instanceof \think\Collection): if( count($_5d9c40b840cec)==0 ) : echo "" ;else: foreach($_5d9c40b840cec as $key=>$img): ?>
                            <li id="img<?php echo $img['id']; ?>">
                                <a><img id="xc<?php echo $img['id']; ?>" src="<?php echo $img['image']; ?>"></a>
<span>
<a href="javascript:;" onclick="return delidimg('<?php echo $img['id']; ?>','imgstrul<?php echo $i; ?>')">删除</a>
<a href="javascript:;" class="xgimg" rel="<?php echo $img['id']; ?>">修改</a>
</span>
                            </li>
                        <?php endforeach; endif; else: echo "" ;endif; ?>
                    </ul>
                </div>
            </dd>
        </dl>
        <?php 
            }
         
            if($typearr['newsid']!='1')
            {
            //seo
         ?>
        <dl>
            <dt>SEO设置</dt>
            <dd>
                标&nbsp;&nbsp;&nbsp;&nbsp;题：<input type="text" name="seotitle" class="form-control b60" id="seotitle" style="width:500px;" value="<?php echo $arr['seotitle']; ?>"><br>
                关键词：<input type="text" name="seokeywords" class="form-control b60" id="seokeywords" style="width:600px;" value="<?php echo $arr['seokeywords']; ?>"><br>
                描&nbsp;&nbsp;&nbsp;&nbsp;述：<input type="text" name="seodescription" class="form-control b60" id="seodescription" style="width:600px;" value="<?php echo $arr['seodescription']; ?>"><br>

            </dd>
        </dl>
        <?php 
            }
            //seo
         
            }
         ?>

















</div>



<!--/内容-->

<!--工具栏-->
<div class="page-footer">
    <div class="btn-wrap">

        <input type="submit" name="btnSubmit" value="提交保存" id="btnSubmit" class="btn" />
        <input name="btnReturn" type="button" value="返回上一页" class="btn yellow" onClick="javascript:history.back(-1);" />
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