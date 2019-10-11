<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:66:"E:\2019phpstudy\PHPTutorial\WWW\xs/App/index\view\index\index.html";i:1570592051;s:65:"E:\2019phpstudy\PHPTutorial\WWW\xs/App/index\view\index\head.html";i:1570502831;s:66:"E:\2019phpstudy\PHPTutorial\WWW\xs/App/index\view\index\title.html";i:1568873110;s:65:"E:\2019phpstudy\PHPTutorial\WWW\xs/App/index\view\index\foot.html";i:1570502729;}*/ ?>
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
<div class="header">
    <div class="container clearfix">

        <a href="/index.php/index_index_web" class="logo2"><img src="/s/images/logo2.png" alt=""></a>
        <div class="header-r">
            <?php 
                $time = date("Y-m-d");
                echo $time;
             ?>
           ，<?php echo $username; ?>你好，欢迎登录人人帮线索系统 <a href="#">[个人中心]</a> <a onclick="return confirm('确定要退出吗？');" href="<?php echo url('common/logout'); ?>">[安全退出]</a>
        </div>
    </div>
</div>

<div class="container nr-wrap clearfix">
    <div class="l-bd">
        <div class="logo"></div>
        <ul class="main-nav">
            <li class="on"><a href="#"><div></div><span>主页</span></a></li>
            <li><a href="#"><div></div><span>我的线索</span></a></li>
            <li><a href="#"><div></div><span>基本资料</span></a></li>
            <li><a href="#"><div></div><span>安全退出</span></a></li>
        </ul>
    </div>
    <div class="nr-r">
        <div class="policy-wrap white-bg bdr shadow clearfix">
            <div class="t-icon"><img class="img-res" src="/s/images/icon1.png" alt=""></div>
            <div class="policy-slide">
                <div class="hd clearfix">
                    <div class="prev"></div>
                    <div class="next"></div>
                </div>
                <div class="bd">
                    <ul>
                        <li><a href="#">人人帮集团最新政策出台</a></li>
                        <li><a href="#">人人帮集团最新政策出台</a></li>
                        <li><a href="#">人人帮集团最新政策出台</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="acc-wrap white-bg bdr shadow clearfix">
            <div class="t-icon"><img class="img-res" src="/s/images/icon2.png" alt=""></div>
            <p>当前账户余额为<span>300.00</span>元</p>
            <a href="#" class="recharge-btn">点击充值</a>
        </div>
        <div class="my-clue clearfix white-bg shadow bdr">
            <div class="my-clue-l">
                <div class="clue-tit">总线索</div>
                <ul class="clearfix">
                    <li><span><?php echo $midcount; ?></span><p>线索总数</p></li>
                    <li><span><?php echo $todaycount; ?></span><p>今日新增</p></li>
                    <li><span>0</span><p>昨日线索</p></li>
                </ul>
            </div>
            <div class="my-clue-r" style="display: none;">
                <div class="clue-tit">总线索</div>
                <ul class="clearfix">
                    <li><span>36</span><p>今日新增</p></li>
                    <li><span>104</span><p>待领取</p></li>
                </ul>
            </div>
        </div>
        <div class="busi-type clearfix white-bg shadow bdr">
            <div class="busi-type-top clearfix">
                <div class="busi-tit">业务分类</div>
                <div class="search-wrap">
                    <input type="text" placeholder="请输入线索编号或线索名称进行搜索">
                    <input type="button" class="search-btn" value="">
                </div>
            </div>
            <div class="qg-wrap">
                <?php 
                    $caidan = caidan(0,10);
                 ?>
                <ul class="clearfix busi-list">
                    <li <?php if('' == $typeid): ?>class="on"<?php endif; ?>><a href="<?php echo url('index/web'); ?>">全部</a></li>
                    <?php if(is_array($caidan) || $caidan instanceof \think\Collection): if( count($caidan)==0 ) : echo "" ;else: foreach($caidan as $key=>$menu): ?>
                        <li <?php if($menu['id'] == $typeid): ?>class="on"<?php endif; ?>><a href="<?php echo url('index/web',array('TypeID'=>$menu[id])); ?>"><?php echo $menu['TypeName']; ?></a></li>
                    <?php endforeach; endif; else: echo "" ;endif; ?>

                </ul>
                <div class="clearfix ss-wrap">
                    <div class="ss-l"><label>金额范围</label><input type="number" style="width: 60px;" placeholder=""><span>至</span><input type="text" placeholder=""></div>
                    <div class="ss-c"><label>发布时间</label><input type="date" style="width: 135px;" placeholder="2019-03-21"><span>至</span><input type="text" style="width: 135px;" placeholder="2019-03-26"></div>
                    <div class="ss-r">
                        <label>所在区域</label>
                        <select name="">
                            <option value="">四川省</option>
                            <option value="">广东省</option>
                        </select>
                        <select name="">
                            <option value="">成都市</option>
                            <option value="">绵阳市</option>
                        </select>
                    </div>
                    <input type="button" class="ss-btn" value="搜索">
                </div>
            </div>
        </div>
        <div class="clue-wrap qg-wrap white-bg shadow bdr">
            <div class="clue-total">“公司注册”共有67条线索</div>
            <ul class="clue-list" id="erjishuxing">
                <?php if(is_array($list) || $list instanceof \think\Collection): if( count($list)==0 ) : echo "" ;else: foreach($list as $key=>$menu): ?>
                <li class="clearfix">
                    <div class="clue-name"><?php echo $menu['Title']; ?></div>

                    <div class="clue-place" style="width: 170px;">所在地区：<span><?php echo cityname($menu['d1']); ?>/<?php echo cityname($menu['d2']); ?></span></div>
                    <div class="clue-date">发布时间：2019-09-01</div>
                    <div class="clue-num">线索编号：10457851</div>
                    <div class="clue-op">
                        <a href="#" class="dt-btn">查看详情</a>
                        <a href="#" class="rec-clue">领取线索</a>
                    </div>
                </li>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
            </ul>
            <a href="javascript:;" id="getmore" class="more-btn">查看更多</a>
        </div>
    </div>
</div>
 <script>
     $("document").ready(function(){
         var p = 1;
        $("#getmore").click(function(){
            p+=1;
            //alert(p);return false;
            $.ajax({
                type: "POST",
                url: "<?php echo url('index/web'); ?>",
                data: {p:p},
                dataType: "json",
                success: function(data){

                    var trs = '';
                    $.each(data,function(k,v) {
                        trs +='<li class="clearfix">';
                        trs +='<div class="clue-name">测试测试测试测试测试</div>';

                        trs +='<div class="clue-place" style="width: 170px;">所在地区：<span>111/222</span></div>';
                        trs +='<div class="clue-date">发布时间：2019-09-01</div>';
                        trs +='<div class="clue-num">线索编号：10457851</div>';
                        trs +='<div class="clue-op">';
                        trs +='<a href="#" class="dt-btn">查看详情</a>';
                        trs +='<a href="#" class="rec-clue">领取线索</a>';
                        trs +='</div>';
                        trs +='</li>';
                    });
                    //console.log(data);
                    $('#erjishuxing').append(trs);

                }
            });

        })
     })
 </script>

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