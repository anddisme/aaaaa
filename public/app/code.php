<?php
@session_start();
//生成验证码图片
@Header("Content-type: image/PNG");
srand((double)microtime()*1000000);
$im = imagecreate(90,30);
$black = ImageColorAllocate($im, 247,247,247);
$white = ImageColorAllocate($im, 83,53,140);
$gray = ImageColorAllocate($im, 0,0,0);
imagefill($im,90,30,$gray);
while(($authnum=rand()%100000)<10000);
//将四位整数验证码绘入图片
imagestring($im, 5, 10, 3, $authnum, $white);
for($i=0;$i<500;$i++) //加入干扰象素
{
$randcolor = ImageColorallocate($im,rand(83,255),rand(53,255),rand(140,255));
imagesetpixel($im, rand()%70 , rand()%30 , $randcolor);
}
ImagePNG($im);
ImageDestroy($im);
$_SESSION['CheckCode'] = $authnum.'';
?>