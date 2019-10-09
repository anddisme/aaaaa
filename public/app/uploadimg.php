<?php
/**
上传函数 针对于simpleupload
 *
 */
 
/*屏蔽错误*/
error_reporting(0);
header("Content-Type: application/json; charset=utf-8");

require_once 'JSON.php';

$php_path = dirname(__FILE__) . '/';
$php_url = dirname($_SERVER['PHP_SELF']) . '/';
//文件保存目录路径
$save_path = $php_path . '../uploads/user/';
$save_url = $php_url . '../uploads/user/';
if ($user_id!='')
{
	//$save_url = $php_url . '../p/'.$user_id.'/';
	//$save_path = $php_path . '../p/'.$user_id.'/';
}

//定义允许上传的文件扩展名
$ext_arr = array(
	'image' => array('gif', 'jpg', 'jpeg', 'png', 'bmp'),
	'flash' => array('swf', 'flv'),
	'media' => array('flv', 'mp3', 'wav', 'wma', 'wmv', 'mid', 'avi', 'mpg', 'asf', 'rm', 'rmvb','mp4'),
	'file' => array('doc', 'docx', 'xls', 'xlsx', 'ppt', 'htm', 'html', 'txt', 'zip', 'rar', 'gz', 'bz2','pdf'),
);
//最大文件大小
$max_size = 500000000;

$save_path = realpath($save_path) . '/';

//PHP上传失败
if (!empty($_FILES['file']['error'])) {
	switch($_FILES['file']['error']){
		case '1':
			$error = '超过php.ini允许的大小。';
			break;
		case '2':
			$error = '超过表单允许的大小。';
			break;
		case '3':
			$error = '图片只有部分被上传。';
			break;
		case '4':
			$error = '请选择图片。';
			break;
		case '6':
			$error = '找不到临时目录。';
			break;
		case '7':
			$error = '写文件到硬盘出错。';
			break;
		case '8':
			$error = 'File upload stopped by extension。';
			break;
		case '999':
		default:
			$error = '未知错误。';
	}
	alert($error);
}

//有上传文件时
if (empty($_FILES) === false) {
	//原文件名
	$file_name = $_FILES['file']['name'];
	//服务器上临时文件名
	$tmp_name = $_FILES['file']['tmp_name'];
	//文件大小
	$file_size = $_FILES['file']['size'];
	//检查文件名
	if (!$file_name) {
		alert("请选择文件。");
	}
	//检查目录
	if (@is_dir($save_path) === false) {
		alert("上传目录不存在。");
	}
	//检查目录写权限
	if (@is_writable($save_path) === false) {
		alert("上传目录没有写权限。");
	}
	//检查是否已上传
	if (@is_uploaded_file($tmp_name) === false) {
		alert("上传失败。");
	}
	//检查文件大小
	if ($file_size > $max_size) {
		alert("上传文件大小超过限制。");
	}
	//检查目录名
	$dir_name = empty($_GET['dir']) ? 'image' : trim($_GET['dir']);
	if (empty($ext_arr[$dir_name])) {
		alert("目录名不正确。");
	}
	//获得文件扩展名
	$temp_arr = explode(".", $file_name);
	$file_ext = array_pop($temp_arr);
	$file_ext = trim($file_ext);
	$file_ext = strtolower($file_ext);
	//检查扩展名
	if (in_array($file_ext, $ext_arr[$dir_name]) === false) {
		alert("上传文件扩展名是不允许的扩展名。\n只允许" . implode(",", $ext_arr[$dir_name]) . "格式。");
	}
	//创建文件夹
	if ($dir_name !== '') {
		$save_path .= $dir_name . "/";
		$save_url .= $dir_name . "/";
		if (!file_exists($save_path)) {
			mkdir($save_path);
		}
	}
	$ymd = date("ymd");
	$save_path .= $ymd . "/";
	$save_url .= $ymd . "/";
	if (!file_exists($save_path)) {
		mkdir($save_path);
	}
	//新文件名
	$new_file_name = date("His") . '_' . rand(100, 999) . '.' . $file_ext;
	//移动文件
	$file_path = $save_path . $new_file_name;
	if (move_uploaded_file($tmp_name, $file_path) === false) {
		alert("上传文件失败");
	}
	@chmod($file_path, 0644);
	$file_url = $save_url . $new_file_name;

	$file_url=str_replace('/public/app/../uploads','/public/uploads',$file_url);
	$file_url2='../../..'.$file_url;
	//img2thumb($file_url2,$file_url2,'640','3600');/*缩略图功能*/

	$output = array("success"=>true, "code" => 0, "msg" =>'上传成功', "Result"=> $file_url);
	$sucess=1;
}

function alert($msg)
{
	$output = array("success" => false, "msg" =>$msg,"message"=>$msg);
	echo json_encode($output);
	exit;
}



/*缩略图文件名*/
function thumbname($name)
{
	$name=str_replace('.jpg','_thumb.jpg',$name);
	$name=str_replace('.png','_thumb.png',$name);
	$name=str_replace('.gif','_thumb.gif',$name);
	return $name;
} 
function img2thumb($srcFile,$toFile,$toW,$toH) 
{ 
	if($toFile==""){$toFile=$srcFile; } 
	$info = ""; 	
	$data= getimagesize('./'.$srcFile);	  
	$ot = strtolower(jfileextm($srcFile));
	switch ($ot) 
	{ 
		case 'gif': 
			if(!function_exists("imagecreatefromgif")){ return $srcFile;} 
			$im = ImageCreateFromGIF($srcFile); 
			$bgcolor=ImageColorAllocate($im,0,0,0); 
			$bgcolor = ImageColorTransparent($im,$bgcolor) ; 
			break; 
		case 'jpg': 
			if(!function_exists("imagecreatefromjpeg")){ return $srcFile;} 
			$im = ImageCreateFromJpeg($srcFile); 
			break; 
		case 'png': 
			$im = ImageCreateFromPNG($srcFile); 
			break; 
	} 
	$srcW=ImageSX($im); 
	$srcH=ImageSY($im); 
	if($srcW<=$toW && $srcH<=$toH) 
	{ 
		if($srcFile!=$toFile) { copy($srcFile,$toFile); }else{return $srcFile;} 
	} 
	$toWH=$toW/$toH; 
	$srcWH=$srcW/$srcH; 
	if($toWH<=$srcWH)
	{ 
		$ftoW=$toW; 
		$ftoH=$ftoW*($srcH/$srcW); 
	} 
	else
	{ 
		$ftoH=$toH; 
		$ftoW=$ftoH*($srcW/$srcH); 
	} 
	if($srcW>$toW||$srcH>$toH) 
	{ 
		if(function_exists("imagecreatetruecolor"))
		{ 
			@$ni = ImageCreateTrueColor($ftoW,$ftoH); 
			if($ni){ImageCopyResampled($ni,$im,0,0,0,0,$ftoW,$ftoH,$srcW,$srcH);}
			else{ $ni=ImageCreate($ftoW,$ftoH); ImageCopyResized($ni,$im,0,0,0,0,$ftoW,$ftoH,$srcW,$srcH);} 
		}
		else
		{ 
			$ni=ImageCreate($ftoW,$ftoH); 
			ImageCopyResized($ni,$im,0,0,0,0,$ftoW,$ftoH,$srcW,$srcH); 
		} 
		switch ($data[2]) 
		{ 
			case 1: 
			$bgcolor=ImageColorAllocate($ni,0,0,0); 
			$bgcolor = ImageColorTransparent($ni,$bgcolor) ; 
			ImageGif($ni,$toFile); 
			break; 
			case 2: 
			ImageJpeg($ni,$toFile); 
			break; 
			case 3: 
			ImagePNG($ni,$toFile); 
			break; 	
		} 
		ImageDestroy($ni); 
	} 
	ImageDestroy($im); 
	return $toFile;
}

function thumbs($src_file, $dst_file , $new_width , $new_height)
{
	if($new_width <1 || $new_height<1){return $src_file;}
	if(!file_exists($src_file)) {return $src_file;}
	$ot = strtolower(jfileextm($src_file));
	switch ($ot)
	{
		case "png":
			$src_img=imagecreatefrompng($src_file);
			break;
		case "gif":
			$src_img=imagecreatefromgif($src_file);
			break;
		default:
			$src_img=imagecreatefromjpeg($src_file);
			break;
	}
	$w=imagesx($src_img);
	$h=imagesy($src_img);
	$ratio_w=1.0 * $new_width / $w;
	$ratio_h=1.0 * $new_height / $h;
	$ratio=1.0;
	if( ($ratio_w < 1 && $ratio_h < 1) || ($ratio_w > 1 && $ratio_h > 1)) 
	{
		if($ratio_w < $ratio_h)
		{
			$ratio = $ratio_h ;
			$inter_h=(int) ($new_height / $ratio);
			$inter_w=$w;
		}
		else
		{
			$ratio = $ratio_w ;
			$inter_w=(int)($new_width / $ratio);
			$inter_h=$h;
		}


		$ydx=0;$ydy=0;
		if ($w!=$h)
		{
			if ($w>$h)
			{
				$ydx=($inter_w-$inter_h)/2;
			}	
			else
			{
				$ydy=($inter_h-$inter_w)/2;
			}
		}
		$inter_w=(int)($new_width / $ratio);
		$inter_h=(int) ($new_height / $ratio);
		$inter_img=imagecreatetruecolor($inter_w , $inter_h);
		imagecopy($inter_img,$src_img,0,0,$ydx,$ydy,$inter_w,$inter_h);	
		$new_img=imagecreatetruecolor($new_width,$new_height);	
		imagecopyresampled($new_img,$inter_img,0,0,0,0,$new_width,$new_height,$inter_w,$inter_h);
		switch ($ot)
		{
			case "png":
				imagepng($new_img,$dst_file);
				break;
			case "gif":
				imagegif($new_img,$dst_file);
				break;
			default:
				imagejpeg($new_img,$dst_file);
				break;
		}
	}
	else
	{
		$ratio=$ratio_h>$ratio_w? $ratio_h : $ratio_w;
		$inter_w=(int)($w * $ratio);
		$inter_h=(int) ($h * $ratio);
		$inter_img=imagecreatetruecolor($inter_w , $inter_h);
		imagecopyresampled($inter_img,$src_img,0,0,0,0,$inter_w,$inter_h,$w,$h);
		$new_img=imagecreatetruecolor($new_width,$new_height);
		imagecopy($new_img, $inter_img, 0,0,0,0,$new_width,$new_height);
		switch ($ot)
		{
			case "png":
				imagepng($new_img,$dst_file);
				break;
			case "gif":
				imagegif($new_img,$dst_file);
				break;
			default:
				imagejpeg($new_img,$dst_file);
				break;
		}
	}
	return $dst_file;
}
function imageWaterMark($groundImage,$waterPos=0,$waterImage="",$waterText="",$textFont=5,$textColor="#FF0000",$xpx=0,$ypx=0)     
{     
  $isWaterImage = FALSE;     
  $formatMsg = "暂不支持该文件格式，请用图片处理软件将图片转换为GIF、JPG、PNG格式。";     
  //读取水印文件     
  if(!empty($waterImage) && file_exists($waterImage))     
  {     
    $isWaterImage = TRUE;     
    $water_info = getimagesize($waterImage);     
    $water_w   = $water_info[0];//取得水印图片的宽     
    $water_h   = $water_info[1];//取得水印图片的高     

    switch($water_info[2])//取得水印图片的格式     
    {     
        case 1:$water_im = imagecreatefromgif($waterImage);break;     
        case 2:$water_im = imagecreatefromjpeg($waterImage);break;     
        case 3:$water_im = imagecreatefrompng($waterImage);break;     
        default:die($formatMsg);     
    }     
  }     

  //读取背景图片     
  if(!empty($groundImage) && file_exists($groundImage))     
  {     
    $ground_info = getimagesize($groundImage);     
    $ground_w   = $ground_info[0];//取得背景图片的宽     
    $ground_h   = $ground_info[1];//取得背景图片的高     

    switch($ground_info[2])//取得背景图片的格式     
    {     
        case 1:$ground_im = imagecreatefromgif($groundImage);break;     
        case 2:$ground_im = imagecreatefromjpeg($groundImage);break;     
        case 3:$ground_im = imagecreatefrompng($groundImage);break;     
        default:die($formatMsg);     
    }     
  }     
  else    
  {     
    return "需要加水印的图片不存在！";exit();     
  }     

  //水印位置     
  if($isWaterImage)//图片水印     
  {     
    $w = $water_w;     
    $h = $water_h;     
    $label = "图片的";     
  }     
  else//文字水印     
  {     
    $temp = imagettfbbox(ceil($textFont*5),0,"images/simhei.ttf",$waterText);//取得使用 TrueType 字体的文本的范围     
    $w = $temp[2] - $temp[6];     
    $h = $temp[3] - $temp[7];     
    unset($temp);     
    $label = "文字区域";     
  }     
  if( ($ground_w<$w) || ($ground_h<$h) )     
  {     
    return "需要加水印的图片的长度或宽度比水印".$label."还小，无法生成水印！"; exit();    
    return;     
  }     
  switch($waterPos)     
  {     
    case 0://随机     
        $posX = rand(0,($ground_w - $w));     
        $posY = rand(0,($ground_h - $h));     
        break;     
    case 1://1为顶端居左     
        $posX = 0;     
        $posY = 0;     
        break;     
    case 2://2为顶端居中     
        $posX = ($ground_w - $w) / 2;     
        $posY = 0;     
        break;     
    case 3://3为顶端居右     
        $posX = $ground_w - $w;     
        $posY = 0;     
        break;     
    case 4://4为中部居左     
        $posX = 0;     
        $posY = ($ground_h - $h) / 2;     
        break;     
    case 5://5为中部居中     
        $posX = ($ground_w - $w) / 2;     
        $posY = ($ground_h - $h) / 2;     
        break;     
    case 6://6为中部居右     
        $posX = $ground_w - $w;     
        $posY = ($ground_h - $h) / 2;     
        break;     
    case 7://7为底端居左     
        $posX = 0;     
        $posY = $ground_h - $h;     
        break;     
    case 8://8为底端居中     
        $posX = ($ground_w - $w) / 2;     
        $posY = $ground_h - $h;     
        break;     
    case 9://9为底端居右     
        $posX = $ground_w - $w;     
        $posY = $ground_h - $h;     
        break;     
    default://随机     
        $posX = rand(0,($ground_w - $w));     
        $posY = rand(0,($ground_h - $h));     
        break;       
  }     

  //设定图像的混色模式     
  imagealphablending($ground_im, true);     
  if ((int)$xpx>0){$posX=(int)$xpx;$posY=(int)$ypx;}
  if($isWaterImage)//图片水印     
  {     
  	
    imagecopy($ground_im, $water_im, $posX, $posY, 0, 0, $water_w,$water_h);//拷贝水印到目标文件           
  }     
  else//文字水印     
  {     
    if( !empty($textColor) && (strlen($textColor)==7) )     
    {     
        $R = hexdec(substr($textColor,1,2));     
        $G = hexdec(substr($textColor,3,2));     
        $B = hexdec(substr($textColor,5));     
    }     
    else    
    {     
        return "水印文字颜色格式不正确！";exit();     
    }     
    imagestring ( $ground_im, $textFont, $posX, $posY, $waterText, imagecolorallocate($ground_im, $R, $G, $B));           
  }     

  //生成水印后的图片     
  @unlink($groundImage);     
  switch($ground_info[2])//取得背景图片的格式     
  {     
    case 1:imagegif($ground_im,$groundImage);break;     
    case 2:imagejpeg($ground_im,$groundImage);break;     
    case 3:imagepng($ground_im,$groundImage);break;     
    default:die($errorMsg);     
  }     

  //释放内存     
  if(isset($water_info)) unset($water_info);     
  if(isset($water_im)) imagedestroy($water_im);     
  unset($ground_info);     
  imagedestroy($ground_im);   
  return 1;  
}   

//图片缩略图
//生成缩略图函数
function cutphoto($o_photo,$d_photo,$width,$height)
{
	$temp_img = imagecreatefromjpeg($o_photo);
	$o_width  = imagesx($temp_img); //取得原图宽
	$o_height = imagesy($temp_img); //取得原图高	
	//判断处理方法
	if($width>$o_width || $height>$o_height)
	{        //原图宽或高比规定的尺寸小,进行压缩
		$newwidth=$o_width;
		$newheight=$o_height;		
		if($o_width>$width)
		{
		$newwidth=$width;
		$newheight=$o_height*$width/$o_width;
		}		
		if($newheight>$height)
		{
		$newwidth=$newwidth*$height/$newheight;
		$newheight=$height;
		}		
		//缩略图片
		$new_img = imagecreatetruecolor($newwidth, $newheight);
		imagecopyresampled($new_img, $temp_img, 0, 0, 0, 0, $newwidth, $newheight, $o_width, $o_height);
		imagejpeg($new_img , $d_photo);               
		imagedestroy($new_img);
	}
	else
	{       
		if($o_height*$width/$o_width>$height)
		{        
		    $newwidth=$width;
			$newheight=$o_height*$width/$o_width;
			$x=0;
			$y=($newheight-$height)/2;
		}
		else
		{   
			$newwidth=$o_width*$height/$o_height;
			$newheight=$height;
			$x=($newwidth-$width)/2;
			$y=0;
		}	
		//缩略图片
		$new_img = imagecreatetruecolor($newwidth, $newheight);
		imagecopyresampled($new_img, $temp_img, 0, 0, 0, 0, $newwidth, $newheight, $o_width, $o_height);
		imagejpeg($new_img , $d_photo);               
		imagedestroy($new_img);	
		$temp_img = imagecreatefromjpeg($d_photo);
		$o_width  = imagesx($temp_img);
		$o_height = imagesy($temp_img);
		//裁剪图片
		$new_imgx = imagecreatetruecolor($width,$height);
		imagecopyresampled($new_imgx,$temp_img,0,0,$x,$y,$width,$height,$width,$height);
		imagejpeg($new_imgx , $d_photo);
		imagedestroy($new_imgx);
	}
}

function jfileextm($file)
{
    return pathinfo($file, PATHINFO_EXTENSION);
} 
function fileextm($file)
{
    return pathinfo($file, PATHINFO_EXTENSION);
}
function GetIpLookup($ip = ''){
    if($ip =='')
    {
        $ip = GetIPx();
    }
    $res = @file_get_contents('http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js&ip=' . $ip);
    if(empty($res)){ return false; }
    $jsonMatches = array();
    preg_match('#\{.+?\}#', $res, $jsonMatches);
    if(!isset($jsonMatches[0])){ return false; }
    $json = json_decode($jsonMatches[0], true);
    if(isset($json['ret']) && $json['ret'] == 1){
        $json['ip'] = $ip;
        unset($json['ret']);
    }else{
        return false;
    }
    return $json;
}



/*显示json结果*/
if (!$sucess)
{
	$output = array("success" => false, "error" => "Failure!");
}
echo json_encode($output);
exit;