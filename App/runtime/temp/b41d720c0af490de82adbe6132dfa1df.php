<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:66:"E:\2019phpstudy\PHPTutorial\WWW\xs/App/index\view\index\login.html";i:1570516474;s:65:"E:\2019phpstudy\PHPTutorial\WWW\xs/App/index\view\index\head.html";i:1570502831;s:66:"E:\2019phpstudy\PHPTutorial\WWW\xs/App/index\view\index\title.html";i:1568873110;s:65:"E:\2019phpstudy\PHPTutorial\WWW\xs/App/index\view\index\foot.html";i:1570502729;}*/ ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta content="text/html" charset="UTF-8">
    <meta name="viewport" content="width=device-width">
    <meta name="applicable-device" content="pc,mobile">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <?php 
if($nowcity['id'] > 0)
{
  $web['t3']=$nowcity['t'];
  $web['Title']=$nowcity['t'];
  $web['SeoTitle']=$nowcity['k'];
  $web['Description']=$nowcity['d'];
}

if(empty($article['id']) && empty($TypeArr['id'])){
 ?>
<title><?php echo $web['t3']; ?></title>
<meta name="keywords" content="<?php echo $web['SeoTitle']; ?>"/>
<meta name="description" content="<?php echo $web['Description']; ?>"/>
<?php 
}else{
 if($article['id'] != ''): if($article['seotitle'] != ''): ?>
	<title><?php echo $article['seotitle']; ?></title>
	<?php else: ?>
	<title><?php echo $article['Title']; ?>_<?php echo $web['Title']; ?></title>
	<?php endif; ?>
	<meta name="keywords" content="<?php echo (isset($article['seokeywords']) && ($article['seokeywords'] !== '')?$article['seokeywords']:$web[SeoTitle]); ?>"/>
	<meta name="description" content="<?php echo (isset($article['seodescription']) && ($article['seodescription'] !== '')?$article['seodescription']:$web[Description]); ?>"/>
<?php else: if($TypeArr['seo_title'] != ''): ?>
	<title><?php echo $TypeArr['seo_title']; ?></title>
	<?php else: ?>
	<title><?php echo $TypeArr['TypeName']; ?>_<?php echo $web['Title']; ?></title>
	<?php endif; ?>
	<meta name="keywords" content="<?php echo (isset($TypeArr['seo_keywords']) && ($TypeArr['seo_keywords'] !== '')?$TypeArr['seo_keywords']:$web[SeoTitle]); ?>"/>
	<meta name="description" content="<?php echo (isset($TypeArr['seo_miaoshu']) && ($TypeArr['seo_miaoshu'] !== '')?$TypeArr['seo_miaoshu']:$web[Description]); ?>"/>
<?php endif; 
}
 ?>
<META http-equiv="X-UA-Compatible" content="IE=9" ></META>


    <link rel="stylesheet" href="/s/css/normalize.css" type="text/css">
    <link rel="stylesheet" href="/s/css/aos.css" type="text/css">
    <link rel="stylesheet" href="/s/css/style.css" type="text/css">
    <script src="/s/js/jquery-1.12.2.min.js"></script>
</head>
<body>
<div class="blue-bd"></div>
<div class="login-bg white-bg">
    <div class="container">
        <div class="login-wrap">
            <link rel="stylesheet" href="/public/pub/validform/css/validform.css">
            <script type="text/javascript" src="/public/layer/layer.js"></script>
            <script src="/public/pub/validform/js/validform_v5.3.2.js"></script>
            <script src="/public/pub/validform/js/validform.js"></script>
            <script src="/public/pub/validform/js/validform_v5.3.2.js"></script>
            <script src="/public/pub/validform/js/validform.js"></script>
            <form action="/index.php/index_Login_login" method="post" class="form-horizontal== login-form">
                <div class="t-c">
                    <div class="login-tit i-b">
                        <img src="/s/images/logo3.png" alt="人人帮线索系统"><span>人人帮线索系统</span>
                    </div>
                </div>
                <input type="text" name="username" datatype="*4-15" msg="请输入正确的用户名" placeholder="请输入账号">
                <input type="password" name="password" datatype="*4-100" msg="请输入正确的密码" placeholder="请输入密码">
                <div class="clearfix">
                    <input type="text" name="CheckCode" id="CheckCode" placeholder="输入验证码" class="yzm-inp">
                    <div class="yzm"><img src="<?php echo url('Login/showcaptcha'); ?>" alt="图片看不清？点击重新得到验证码" onclick="this.src='<?php echo url("Login/showcaptcha"); ?>?'+Math.random()"></div>
                </div>
                <div class="reafor clearfix">
                    <div class="rmb"><input type="checkbox" placeholder=""><span>记住密码</span></div>
                    <a href="#" class="fgt">忘记密码</a>
                </div>
                <input type="submit" value="登 录" class="login-btn">

                <p>还不是会员？<a href="<?php echo url('Login/reg'); ?>">立即注册</a></p>
            </form>
            <script>
                $(".form-horizontal input").focus(function(){
                    var obj=$(this);
                    if (obj.hasClass("Validform_error"))
                    {
                        var v=obj.val();
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
        </div>
    </div>
</div>







<div class="footer">
    <div class="container clearfix">
        <div class="fl">
            技术支持： <a href="#" target="_blank">人人帮集团</a> | 版权所有 | 官方客服:400-1133-100  或  1355-1066-688
        </div>
        <div class="qr-wrap clearfix">
            <span>人人帮微信公众号</span>
            <div><img class="img-res" src="/s/images/qr.png" alt=""></div>
        </div>
    </div>
</div>





<script src="/s/js/jquery.SuperSlide.2.1.1.js"></script>
<script src="/s/js/aos.js"></script>
<script src="/s/js/common.js"></script>
</body>
</html>