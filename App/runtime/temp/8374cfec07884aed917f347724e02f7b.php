<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:65:"E:\2019phpstudy\PHPTutorial\WWW\xs/App/admin\view\index\main.html";i:1568603329;}*/ ?>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,initial-scale=1.0,user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" /><title>
	管理首页
</title><link href="/public/skin/default/style.css" rel="stylesheet" type="text/css" />

</head>

 <style>
.body{
	font-size:12px;
}
</style>

<body class="mainbody" id="weekday">



<!--导航栏-->
<div class="location" style="font-size:12px;">

  <a class="home"><i></i><span>首页</span></a>
  <i class="arrow"></i>
  <span>管理中心</span>
</div>
<!--/导航栏-->

<!--内容-->
<div class="line10"></div>
<div class="nlist-1">
 
</div>
<div class="line10"></div>
<?php 
$web=webinfo();
 ?>
<div class="nlist-2">
  <h3><i></i>站点信息-<span style="color:#090;"><?php echo $web['Web_Name']; ?> </span>   <font color=red></font> 核心版本：v2.0</h3>
  
</div>












<div class="index_box" style="margin-top:30px;">
<section class="index_stat">
		<h3>登录信息</h3>
		<div class="container-fluid">





<table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#e7e7e7" style="margin-bottom:8px">
  <tbody>
  
  
  
  <tr bgcolor="#FFFFFF">
    <td width="12%" align="right" bgcolor="#FFFFFF" style="padding:10px; font-size:14px; color:#666;">登录帐号：</td>
    <td width="88%" bgcolor="#FFFFFF" style="padding:10px; font-size:14px; color:#666;"><?php echo $admin['UserName']; ?></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="12%" align="right" bgcolor="#FFFFFF" style="padding:10px; font-size:14px; color:#666;">登录时间：</td>
    <td width="88%" bgcolor="#FFFFFF" style="padding:10px; font-size:14px; color:#666;"><?php echo session('logintime'); ?></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="12%" align="right" bgcolor="#FFFFFF" style="padding:10px; font-size:14px; color:#666;">本地IP：</td>
    <td width="88%" bgcolor="#FFFFFF" style="padding:10px; font-size:14px; color:#666;"><?php echo getip(); ?></td>
  </tr>
  
  
  
</tbody></table>

		</div>
		<div class="clear"></div>
	</section>
</div>

<div class="index_box" style="margin-top:30px;">
<section class="index_stat">
		<h3>系统信息</h3>
		<div class="container-fluid">

<table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#e7e7e7">
  <tbody>
  <tr bgcolor="#FFFFFF">
    <td width="12%" height="25" align="right" style="padding:10px; font-size:14px; color:#666;">系统版本：</td>
    <td width="88%" style="padding:10px; font-size:14px; color:#666;"><?php echo $SERVER; ?></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="12%" height="25" align="right" style="padding:10px; font-size:14px; color:#666;">最后更新：</td>
    <td width="88%" style="padding:10px; font-size:14px; color:#666;">
    2019.09.20</td>
  </tr>
  
   <tr bgcolor="#FFFFFF">
    <td width="12%" height="25" align="right" style="padding:10px; font-size:14px; color:#666;">程序版本：</td>
    <td width="88%" style="padding:10px; font-size:14px; color:#666;"><?php echo $readme['php_version']; ?></td>
  </tr>
 
   
   <tr bgcolor="#FFFFFF">
    <td width="12%" height="25" align="right" style="padding:10px; font-size:14px; color:#666; color:#666;">上传限制：</td>
    <td width="88%" style="padding:10px; font-size:14px; color:#666;"><?php echo $readme['upload_max_filesize']; ?></td>
  </tr>
   <tr bgcolor="#FFFFFF">
    <td width="12%" height="25" align="right" style="padding:10px; font-size:14px; color:#666;">执行超时：</td>
    <td width="88%" style="padding:10px; font-size:14px; color:#666;"><?php echo $readme['max_execution_time']; ?> </td>
  </tr>

  
 <tr bgcolor="#FFFFFF">
    <td width="12%" height="25" align="right" style="padding:10px; font-size:14px; color:#666;">服务时间：</td>
    <td width="88%" style="padding:10px; font-size:14px; color:#666;">
<?php 
	echo date("Y-m-d H:i:s");
	 ?>	</td>
  </tr>
  
  
</tbody></table>


		</div>
		<div class="clear"></div>
	</section>

    
</div>









<!--/内容-->

    </div>

</body>
</html>
