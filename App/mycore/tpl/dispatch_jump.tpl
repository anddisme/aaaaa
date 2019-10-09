{__NOLAYOUT__}<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>跳转提示</title>
    <style type="text/css">
 html, body{margin:0; padding:0; border:0 none;font:16px Tahoma,Verdana;line-height:100%;background:#eeeeee;}
a{text-decoration:none; color:#0590c9; border-bottom:1px dashed gray}
a:hover{color:#0590c9; border-bottom:1px dashed gray;}
div.message{clear:both;padding:5px; text-align:left; width:98%; text-align:center; padding-top:18%; font-size:16px;}
span.wait{color:#0590c9;font-weight:bold}
span.error{color:#000;font-weight:bold}
span.success{color:blue;font-weight:bold}
div.msg{margin:10px 0px}
</style>
</head>
<body>
    <div class="message">
    <div class="msg">
        <?php switch ($code) {?>
            <?php case 1:?>
            <h1 style="color:green;">:)</h1>
            <p class="success"><?php echo(strip_tags($msg));?></p>
            <?php break;?>
            <?php case 0:?>
            <h1 style="color:#F00;">:(</h1>
            <p class="error"><?php echo(strip_tags($msg));?></p>
            <?php break;?>
        <?php } ?>
        <p class="detail"></p>
        <p class="jump">
            页面自动 <a id="href" href="<?php echo($url);?>">跳转</a> 等待时间： <b id="wait"><?php echo($wait);?></b>
        </p>
    </div>
    </div>
    <script type="text/javascript">
        (function(){
            var wait = document.getElementById('wait'),
                href = document.getElementById('href').href;
            var interval = setInterval(function(){
                var time = --wait.innerHTML;
                if(time <= 0) {
                    location.href = href;
                    clearInterval(interval);
                };
            }, 1000);
        })();
    </script>
</body>
</html>
