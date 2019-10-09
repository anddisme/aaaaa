<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:66:"E:\2019phpstudy\PHPTutorial\WWW\xs/App/admin\view\index\index.html";i:1569297220;}*/ ?>
﻿<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit">
<?php 
$webinfo=webinfo();
 ?>
<title><?php echo $webinfo['Web_Name']; ?> | 管理系统</title>
<link href="/public/skin/default/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" charset="utf-8" src="/public/skin/scripts/jquery/jquery-1.11.2.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/public/skin/scripts/cms.js"></script>
</head>

<body class="indexbody">
<div style="width:100%; height:auto; min-width:1200px;">
<!--全局菜单-->
<a class="btn-paograms"  onclick="$('#pop-menu').show()"></a>
<div id="pop-menu" class="pop-menu" style="display:none;">
<div class="pop-box" style="height: 235px;">
<h1 class="title"><i></i>快捷菜单</h1>
<i class="close" onClick="$('#pop-menu').hide()">关闭</i>
<div class="list-box" tabindex="5000" style="overflow: hidden; outline: none;">
<div class="list-group1" style="height:360px; width:90px;">
<h1 title="内容"><img src="/public/skin/default/nav/home.png"></h1>
<div class="list-wrap">
<ul>

<li>
<a navid="55" href="<?php echo url('Article/index'); ?>" target="mainframe">
<span>内容管理</span>
</a>
</li>

<li>
<a navid="55" href="<?php echo url('Lm/index'); ?>" target="mainframe">
<span>栏目管理</span>
</a>
</li>

<li>
<a navid="55" href="<?php echo url('Sql/index'); ?>" target="mainframe">
<span>数据备份</span>
</a>
</li>

<li>
<a navid="55" href="<?php echo url('Links/index'); ?>" target="mainframe">
<span>友情链接</span>
</a>
</li>


<li>
<a navid="55" href="<?php echo url('Html/index'); ?>" target="mainframe">
<span>广告管理</span>
</a>
</li>

<li>
<a navid="55" href="<?php echo url('Web/index'); ?>" target="mainframe">
<span>系统设置</span>
</a>
</li>


</ul>
</div></div>








</div>
</div>
<i class="arrow">箭头</i>
</div>











<div class="main-top">
<a class="icon-menu"></a>
<div id="main-nav" class="main-nav">
<a class="selected" href="<?php echo url('Article/index'); ?>" target="mainframe">内容</a>
<a href="<?php echo url('Web/index'); ?>" target="mainframe">设置</a>
<a>广告</a>
<a>账户</a>
<a href="<?php echo url('Guest/index'); ?>" target="mainframe">留言</a>
<a class="">更新</a>
<a href="<?php echo url('Loglist/index'); ?>" rel="home"  target="mainframe">日志</a>
<a href="<?php echo url('Sql/index'); ?>" rel="home"  target="mainframe">备份</a>

<a href="/" rel="home" target="_blank">预览首页</a>
</div>
<div class="nav-right">
<div class="info">
<i></i>
<span>
上午好，<?php echo $admin['UserName']; ?>

</span>
</div>
<div class="option">
<i></i>
<div class="drop-wrap">
<div class="arrow"></div>
<ul class="item">
<li><a href="/" target="_blank">预览网站</a></li>
<li><a id="lbtnExit" target="mainframe" href="<?php echo url('User/xgmm'); ?>">修改密码</a></li>
<li><a id="lbtnExit1" href="<?php echo url('Login/logout'); ?>" onClick="return confirm('确定要退出系统吗？');">注销登录</a></li>
<li><a id="lbtnExit11" target="mainframe" href="<?php echo url('Qqlogin/index'); ?>" onClick="return confirm('确定要绑定qq吗?');">绑定qq</a></li>
</ul>
</div>
</div>
</div>
</div>
  
  
  
  
  
<div class="main-left">
<h1 class="logo"></h1>
<div id="sidebar-nav" class="sidebar-nav">
<!--------------left menu s------------------------------------------------->
<!--------------left menu s------------------------------------------------->
<!--------------left menu s------------------------------------------------->

<div class="list-group" style="display: block;">
<h1 title="内容管理"><img src="/public/skin/default/nav/home.png"></h1>
<div class="list-wrap">
<h2>内容管理<i></i></h2>
<?php 
$caidan=caidan(0);
 if(is_array($caidan) || $caidan instanceof \think\Collection): if( count($caidan)==0 ) : echo "" ;else: foreach($caidan as $key=>$cd): 
$caidan1=caidan($cd['id']);
//print_r($caidan1);
//print_r($caidan1)."=pppttt";
$caidan1num=array_count_values($caidan1);
 ?>
<ul style="display: block;">
<li>
<a target="mainframe" href="<?php echo url('Article/index',array('TypeID'=>$cd['id'])); ?>">

<i class="icon  <?php if(is_array($caidan1)): ?>folder<?php else: ?>file<?php endif; ?>"></i><span><?php echo $cd['TypeName']; ?></span>
<?php if(is_array($caidan1)): ?>
<b class="expandable close"></b>
<?php endif; ?>
</a>
    <ul style="display: none;">
    <?php if(is_array($caidan1) || $caidan1 instanceof \think\Collection): if( count($caidan1)==0 ) : echo "" ;else: foreach($caidan1 as $key=>$cd1): 
    $caidan2=caidan($cd1['id']);
     ?>
    <li>
    <a href="<?php echo url('Article/index',array('TypeID'=>$cd1['id'])); ?>" target="mainframe">
    <i class="icon"></i><i class="icon <?php if(is_array($caidan2)): ?>folder<?php else: ?>file<?php endif; ?>"></i><span><?php echo $cd1['TypeName']; ?></span>
    <?php if(is_array($caidan2)): ?>
    <b class="expandable close"></b>
    <?php endif; ?>
    </a>
        <ul style="display: none;">
        <?php if(is_array($caidan2) || $caidan2 instanceof \think\Collection): if( count($caidan2)==0 ) : echo "" ;else: foreach($caidan2 as $key=>$cd2): 
        $caidan3=caidan($cd2['id']);
         ?>
        <li>
        <a href="<?php echo url('Article/index',array('TypeID'=>$cd2['id'])); ?>" target="mainframe">
        <i class="icon"></i><i class="icon <?php if(is_array($caidan3)): ?>folder<?php else: ?>file<?php endif; ?>"></i><span><?php echo $cd2['TypeName']; ?></span>
        <?php if(count($caidan3) > 0): ?>
        <b class="expandable close"></b>
        <?php endif; ?>
        </a>
        </li>
        <?php endforeach; endif; else: echo "" ;endif; ?>
        </ul>
    </li>
    <?php endforeach; endif; else: echo "" ;endif; ?>
    </ul>
</li>
</ul>
<?php endforeach; endif; else: echo "" ;endif; ?>

</div>
</div>
<!-------menu2-------->
<div class="list-group" style="display: none;">
<h1 title="设置中心"><img src="/public/skin/default/nav/home.png"></h1>
<div class="list-wrap">
<h2>设置中心<i></i></h2>

<ul style="display: block;">
<li>
<a href="<?php echo url('Web/index'); ?>" target="mainframe">
<i class="icon folder"></i><span>系统配置</span>
</a>
</li>
    <li>
        <a href="<?php echo url('Webinfo/index'); ?>" target="mainframe">
            <i class="icon folder"></i><span>网站参数</span>
        </a>
    </li>
    
<li>
<a  href="<?php echo url('lm/index'); ?>" target="mainframe">
<i class="icon folder"></i><span>栏目管理</span>
</a>
</li>
    <li style="display: none;">
        <a  href="<?php echo url('Screen/index'); ?>" target="mainframe">
            <i class="icon folder"></i><span>筛选管理</span>
        </a>
    </li>


<li>
<a target="mainframe" href="<?php echo url('Sql/index'); ?>">
<i class="icon folder"></i><span>数据备份</span>
</a>
</li>

<li>
<a href="<?php echo url('Temp/index'); ?>" target="mainframe">
    <i class="icon folder"></i><span>文件管理</span>
</a>
</li>

  <li>
    <a href="<?php echo url('Prosx/index'); ?>" target="mainframe">
      <i class="icon folder"></i><span>商品属性管理</span>
    </a>
  </li>


<li>
<a href="<?php echo url('Sitemap/index'); ?>" target="mainframe">
    <i class="icon folder"></i><span>生成地图</span>
</a>
</li>

<li>
<a href="<?php echo url('Loglist/index'); ?>" target="mainframe">
    <i class="icon folder"></i><span>系统日志</span>
</a>
</li>


<li>
<a href="<?php echo url('City/index'); ?>" target="mainframe">
    <i class="icon folder"></i><span>城市管理</span>
</a>
</li>

<li>
<a  href="<?php echo url('Article/hsz'); ?>" target="mainframe">
<i class="icon folder"></i><span>文档回收站</span>
</a>
</li>


</ul>
</div>
</div>

<!-------menu2-------->
<div class="list-group" style="display: none;">
<h1 title="广告"><img src="/public/skin/default/nav/home.png"></h1>
<div class="list-wrap">
<h2>广告管理<i></i></h2>

<ul style="display: block;">
<li>
<a href="<?php echo url('Links/index'); ?>" target="mainframe">
<i class="icon folder"></i><span>友情链接</span>
</a>
</li>
<li>
<a href="<?php echo url('Kf/index'); ?>" target="mainframe">
<i class="icon folder"></i><span>在线客服</span>
</a>
</li>
<li>
<a href="<?php echo url('Ad/index'); ?>" target="mainframe">
<i class="icon folder"></i><span>广告位</span>
</a>
</li>
</ul>
</div>
</div>


<!-------menu2-------->
<div class="list-group" style="display: none;">
<h1 title="账户管理"><img src="/public/skin/default/nav/home.png"></h1>
<div class="list-wrap">
<h2>账户管理<i></i></h2>

<ul style="display: block;">
<li>
<a href="<?php echo url('User/index'); ?>" target="mainframe">
<i class="icon folder"></i><span>系统用户</span>
</a>
</li>
<li>
<a href="<?php echo url('Member/index'); ?>" target="mainframe">
<i class="icon folder"></i><span>注册会员</span>
</a>
</li>

</ul>
</div>
</div>




<!-------menu2-------->
<div class="list-group" style="display: none;">
<h1 title="留言"><img src="/public/skin/default/nav/home.png"></h1>
<div class="list-wrap">
<h2>留言管理<i></i></h2>

<ul style="display: block;">
<li>
<a href="<?php echo url('Guest/index'); ?>" target="mainframe">
<i class="icon folder"></i><span>留言管理</span>
</a>
</li>


</ul>
</div>
</div>






<!-------menu2-------->
<div class="list-group" style="display: none;">
<h1 title="更新"><img src="/public/skin/default/nav/home.png"></h1>
<div class="list-wrap">
<h2>内容更新<i></i></h2>

<ul style="display: block;">
<li>
<a target="mainframe" href="<?php echo url('Html/index'); ?>">
<i class="icon folder"></i><span>生成html</span>
</a>
</li>

<li>
<a target="mainframe" href="<?php echo url('Web/delcache'); ?>">
<i class="icon folder"></i><span>更新缓存</span>
</a>
</li>


</ul>
</div>
</div>







<!--------------left menu e------------------------------------------------->
<!--------------left menu e------------------------------------------------->
<!--------------left menu e------------------------------------------------->
</div>
</div>
  
  
  <div class="main-container">
    <iframe id="mainframe" name="mainframe" frameborder="0" src="<?php echo url('index/main'); ?>"></iframe>
  </div>
</div>
</body>
</html>