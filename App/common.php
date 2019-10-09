<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------
use think\Request;
use think\Db;
use phpmailer\phpmailer;


/**
* 发送邮箱
* @param type $data 邮箱队列数据 包含邮箱地址 内容
*/
function sendEmail($tomail,$Subject,$Body) {
	if(empty($tomail))
	{
		return 'tomail is NULL';
	}
  $email=db::name('email')->where("`id`='1'")->find();
  if(empty($Subject)){ $Subject = $email['subject']; }
  Vendor('phpmailer.phpmailer');
  $mail = new PHPMailer(); //实例化
  $mail->IsSMTP(); // 启用SMTP
  $mail->Host = $email['host']; //SMTP服务器 以126邮箱为例子 
  $mail->Port = $email['port'];  //邮件发送端口
  $mail->SMTPAuth = true;  //启用SMTP认证
  $mail->SMTPSecure = "ssl";   // 设置安全验证方式为ssl
  $mail->CharSet = "UTF-8"; //字符集
  $mail->Encoding = "base64"; //编码方式
  $mail->Username = $email['username'];  //你的邮箱 
  $mail->Password = $email['password'];  //你的密码 
  $mail->Subject = $Subject; //邮件标题  
  $mail->From = $email['from'];  //发件人地址（也就是你的邮箱）
  $mail->FromName = $email['fromname'];  //发件人姓名

      $mail->AddAddress($tomail, $tomail); //添加收件人（地址，昵称）
      $mail->IsHTML(true); //支持html格式内容
      $mail->Body = $Body; //邮件主体内容
	 //print_r($mail);
	 // exit;
      //发送成功就删除
      if ($mail->Send()) {
        return '1';
      }else{
          echo "Mailer Error: ".$mail->ErrorInfo;// 输出错误信息  
      }
}



function get($zi='')
{   
    if(!empty($zi))
	{
		return Request::instance()->param($zi);
	}
	return Request::instance()->param();
}

function jiezi($str, $start=0, $length, $charset="utf-8", $suffix=true)
{
    if(function_exists("mb_substr")){
            if ($suffix && strlen($str)>$length)
                return mb_substr($str, $start, $length, $charset)."...";
        else
                 return mb_substr($str, $start, $length, $charset);
    }
    elseif(function_exists('iconv_substr')) {
            if ($suffix && strlen($str)>$length)
                return iconv_substr($str,$start,$length,$charset)."...";
        else
                return iconv_substr($str,$start,$length,$charset);
    }
    $re['utf-8']   = "/[\x01-\x7f]|[\xc2-\xdf][\x80-\xbf]|[\xe0-\xef][\x80-\xbf]{2}|[\xf0-\xff][\x80-\xbf]{3}/";
    $re['gb2312'] = "/[\x01-\x7f]|[\xb0-\xf7][\xa0-\xfe]/";
    $re['gbk']    = "/[\x01-\x7f]|[\x81-\xfe][\x40-\xfe]/";
    $re['big5']   = "/[\x01-\x7f]|[\x81-\xfe]([\x40-\x7e]|\xa1-\xfe])/";
    preg_match_all($re[$charset], $str, $match);
    $slice = join("",array_slice($match[0], $start, $length));
    if($suffix) return $slice."…";
    return $slice;
}



// 应用公共文件
function msg($stu='',$text='',$url='')
{
if($url=='')
{
  $url='';
}
//$_SERVER['PHP_SELF'].'?'.$_SERVER['QUERY_STRING']
echo json_encode(array("status"=>''.$stu.'',"message"=>"".$text."","url"=>''.$url.''));
exit;
}

function sxlist($TypeID)
{
  $list=Db("page_info")->where("`TypeID`='$TypeID'")->select();
  return $list;
}

//获取下级栏目ID
function getidlist($pid)
{
	
   if(!is_numeric($pid))
   {
	  return '';   
   }
   
   $idstr='';
   $arr=Db::name("lm")->where("`id`='$pid'")->find();
  
   $list=Db::name("lm")->where("`idpath` like '%".$arr['idpath']."%'")->order("`id` asc")->field('id')->select();
   
   foreach($list as $k=>$v)
   {
	 $idstr.=$v['id'].",";  
	// $idstr.= getidlist($v['id']);
   }
   $idstr=rtrim($idstr, ','); 
   return $idstr;
}


/*发送短信验证码*/
function smscode($phone,$type)
{
	if(empty($phone) || empty($type)){ return false; }
	$codenum=rand(100000,999999);
	$Content='您的验证码是('.$codenum.')【人人帮】';
	if(strlen($phone)!=11 || !is_numeric($phone) )
	{
		echo '手机号码格式错误！';
		exit;
	}

	$lastsms=db::name("sms")->where("`phone`='$phone'")->order("`id` desc")->find();
	if($lastsms)
	{
		$timex=timex($lastsms['endtime']);
		if($timex<60)
		{
			echo '请不要重复发送短信验证码！';
			exit;
		}
	}

	/*
      处理短信发送以及发送记录
    */
	$zt=1;
	$zt=sms($phone,$Content);
	$data['phone']=$phone;
	$data['issy']='0';
	$data['codenum']=$codenum;
	$data['type']=$type;
	$data['zt']=$zt;
	$data['Content']=$Content;
	$data['endtime']=date("Y-m-d H:i:s");
	$num1=\think\db::name('sms')->insert($data);
	//echo $zt;
	//exit;
	//return M("sms_info")->getLastSql();
	if($zt<1)
	{
		echo  '短信发送失败'.$zt;
		exit;
	}
	//session.set('codenum',$codenum);
	\think\db::name("sms")->insert($data);
	echo $zt;
	exit;
}

/*发送短信*/
function sms($num,$message)
{
	date_default_timezone_set('PRC'); //设置默认时区为北京时间
	$uid = 'SCLTT008376';
	$passwd = 'SCLTT008376';
	$msg = rawurlencode(mb_convert_encoding($message, "gb2312", "utf-8"));
	//echo $msg.'===';
	//exit;
	$gateway = "http://sdk2.028lk.com/sdk2/BatchSend2.aspx?CorpID={$uid}&Pwd={$passwd}&Mobile={$num}&Content={$msg}&Cell=&SendTime=";
	//file_put_contents('cccc=====.txt',$gateway.'==');
	//exit();
	//file_put_contents('cccc=====.txt',$gateway.'==');
	$result = file_get_contents($gateway);
	//exit($result);
	//exit;
	if($result > 0)
	{
		return 1;
	}else{
		return $result;
	}
	exit;
	$zt=file_get_contents($smsurl);
	return $zt;
}


//去除HTML标签
function gethtml($str)
{
	$str=strip_tags($str);
	$str=str_replace('&nbsp;','',$str);
	return $str;
}


//文档列表
function arclist($TypeID,$limit=10,$Recommend='',$istop='',$sql='')
{

    $typelsnum=TypeName($TypeID);
	if(empty($typelsnum))
	{
	   return false;	
	}
    $TypeList=count(explode(",",$TypeID));
    if($TypeList>1)
	{//获取指定分类
			$TypeIDlist=$TypeID;
	        $typeand=" and `TypeID` in($TypeIDlist)";
	}
	if(is_numeric($TypeID) && $TypeID>0)
	{
	//获取下级
			$TypeIDlist=getidlist($TypeID);
	        $typeand=" and `TypeID` in(".$TypeIDlist.")";
			
	}
	
	
	
	

	//return getidlist();
	
	if(is_numeric($Recommend) && $Recommend>0)
	{
		$Recommend=$Recommend.',';
		$redand = " and `Recommend` like '%$Recommend%'";
	}
	if(is_numeric($istop) && $istop>0)
	{
		$redand = " and `istop`='$istop'";
	}
	if(!empty($sql))
	{
	   $sql.=' '.$sql;
	}
	
	//return var_dump($neq);
	$px="`istop` desc,`endtime` desc,`id` desc";
	$list=Db::name("article")->order("$px")->where("`is_del` <>'1' and `isVerify`='1'". $typeand)->limit("$limit")->select();
	//return M("article")->getLastSql();

	foreach($list as $k=>$v)
	{
		$v['con']=gethtml($v['Content']);
		$v['imglist']=imgs($v['id']);//图片列表
		if (empty($v['S_Image'])) { $v['S_Image']='/public/img/nopic.jpg'; }
		$v['sql']=Db("img")->getLastSql();
		$list2[]=$v;
	}
//return M("article")->getLastSql();
// exit;
   return $list2;
}









	
//获取栏目下的第一个文档
 function getonce($TypeID)
{
  $arr=Db::name("article")->where("`is_del` <>'1' and `TypeID`='$TypeID'")->order("`istop` desc,`endtime` desc,`id` desc")->find();
  //print_r($arr);
  //exit;
  $arr['Content']=gethtml($arr['Content']);
  return $arr;
}
			
	
//获取栏目列表
function caidan($parentID=0,$limit=100,$ids='',$eid='')
{
	$and='';
  if(!empty($ids))
  {
	$and=" and `id` in($ids)";
  }
  if($ids=='gt' && $eid!='')
  {
	$and=" and `id` > $eid";
  }
  if($ids=='lt' && $eid!='')
  {
	$and=" and `id` < $eid";
  }
  $list=Db::name("lm")->where("`parentID`='$parentID' $and and `is_meau`='1'")->limit($limit)->order("`SortNumber` asc,`id` asc")->select();
  //return M("lm")->getLastSql();
  $listarray='';
  foreach($list as $k=>$v)
  {
	 
	 $v['erji']=Db::name("lm")->where("`parentID`='$v[id]' and `is_meau`='1'")->order("`SortNumber` asc,`id` asc")->select();
	 $listarray[]=$v;  
  }
  return $listarray;	
}
	
	

//获取栏目名称	
function TypeName($id,$default='')
{
	$list=Db::name("lm")->where("`id`='$id'")->field("`id`,'TypeName'")->find();
	if(empty($list['TypeName']))
	{ 
	   return $default; 
	}
	return $list['TypeName'];	
}

//获取栏目信息，，array	
function typearr($id,$zd='')
{
	$arr=Db::name("lm")->where("`id`='$id'")->find();
	// return M("lm")->getLastSql();
	// exit;
	if(!$arr)
	{
		return '';
	}
	if(!empty($zd))
	{
	   return $arr[$zd];	
	}
	return $arr;	
}


//获取当前栏目的下级栏目
function lmfirst($id)
{
	$zid=Db::name("lm")->where("parentID='$id'")->order("SortNumber asc,id asc")->limit(1)->Field("id")->find();
	$ids=$zid['id'];
	if ((int)$ids>0){return $ids;}
	return $id;	
}


//文档图集列表	
function imgs($nid,$type=0)
{
	if(!is_numeric($nid))
	{
		return false;
	}
	$list=Db::name("img")->where("`nid`='$nid' and `type`='$type'")->order("`id` asc")->select();
	//return Db::name("img")->getLastSql();
	return $list;	
}


//详细页url
function idlname($id)
{
	$wjt=config('wjt');
	//$urlstr='/index.php/Index/App/view/id/'.$id;
	$urlstr= url('app/view',['id'=>$id]);
	//$urlstr= '/index.php/index/app/view/?id='.$id;

	//$array=;
	//$urlstr= url('index.php/index/App/view',array('id'=>$id));
	
	
	
	if($wjt==0)
	{//未开启伪静态
		return $urlstr;
	}
	if(!is_numeric($id)) 
	{ 
		return $urlstr;
	}
	$narr=Db::name("article")->where("`id`='$id'")->Field("`id`,`TypeID`")->find();
	//Db("article")->close;
	$typearr=Db::name("lm")->where("`id`='$narr[TypeID]'")->Field("`id`,`weburl`,`nohtml`")->find();
	//Db("lm")->close;
	if(!is_numeric($narr['id'])) 
	{ 
		return $urlstr;
	}
	
	if($typearr['weburl']=='' || $typearr['nohtml']=='1')
	{ 
		return $urlstr; 
	}
	$url=''.$typearr['weburl'].$id.'.html';
	return $url;	
}

//栏目url
function lmurl($id,$fm='')
{
	$wjt=config('wjt');
	//return $wjt;
	
	
	//$array=array('TypeID'=>$id);
//	if($fm>0 || $id==2)
//	{
//	  $fmurl='/fm/1.html#zh_cn';
//	  $fmurl_wjt="?fm=1#zh_cn";
//	}
	//$urlstr= '/index.php/Index/App/index/TypeID/'.$id.$fmurl;
	//$urlstr= '/index.php/Index/App/index/TypeID/'.$id.$fmurl;
	$urlstr= url('app/index',['TypeID'=>$id]);
	//$urlstr= '/index.php/index/app/?TypeID='.$id;


	if($wjt==0)
	{//未开启伪静态
	  return $urlstr;
	}
	$typearr=Db::name("lm")->where("`id`='$id'")->Field("`id`,`weburl`,`nohtml`")->find();
	//db::name("lm")->close;
	if($typearr['weburl']=='' || $typearr['nohtml']=='1')
	{ 
		return $urlstr; 
	}
	return $typearr['weburl'].$fmurl_wjt;	
}
	
	
	
	
	
	
	
	
	
	
	


	
	
	
	
	
	
	

//获取栏目路径 id,返回字符串
function typepath($tid)
{
   if(!is_numeric($tid))  
   { 
	   return '';     
   }
   $nowarr=Db::name("lm")->where("`id`='$tid'")->find();
   
 
   
   //获取所有
   $PathTree=$nowarr['PathTree'];
   $PathTree=explode('/'.$nowarr['TypeName'].'',$PathTree);
   foreach($PathTree as $k=>$v)
   {
	 if($pid>0) 
	 { 
		 $pidand=" and `parentID`='$pid'";  
	 }
	 if(!empty($v))
	 {
		$id=Db::name("lm")->where("`TypeName`='$v' $pidand")->getField("id");
		$pid=$id;
		$pathid.=$id.",";
	  // echo $pid."==";
	 }
   }
			// echo $pid;
			//exit;
			//echo M("lm")->getLastSql();
			//  exit;
			//echo $pathid;
			//exit;
   return $pathid;
}

/*
//获取栏目路径 id,返回字符串
function typepatharr($tid)
{
   if(!is_numeric($tid))  
   { 
	   return '';     
   }
   $nowarr=db::name("lm")->where("`id`='$tid'")->find();
   $PathTree=$nowarr['PathTree'];
   $PathTree=explode('/',$PathTree);
   foreach($PathTree as $k=>$v)
   {
	 if($pid>0) { $pidand=" and `parentID`='$pid'";  }
	 if(!empty($v))
	 {
		$id=db::name("lm")->where("`TypeName`='$v' $pidand")->getField("id");
		$pid=$id;
		$pathid.=$id.",";
	  // echo $pid."==";
	 }
   }
 $path=explode(",",$pathid);
 return $path;
}
	
*/	







//获取栏目路径 id,返回字符串
function typepatharr($tid)
{
   if(!is_numeric($tid))  
   { 
	   return '';     
   }
   $nowarr=Db::name("lm")->where("`id`='$tid'")->find();
   $idpath=explode(",",$nowarr['idpath']);
   //$idpath=explode(",",$idpath);
   return $idpath;
}
	










	
//获取栏目导航路径
function pathmenu($TypeID,$str='')
	{
	  if(empty($str)){ $str='&nbsp;&nbsp;>111&nbsp;&nbsp;'; }
	  $path=typepatharr($TypeID);
	  $allnum=count($path)-2;
	//  echo $path;
	//  exit;
	  foreach($path as $k=>$v)
	  {
	    if(!empty($v))
		{
		  if($k==$allnum){ $str=''; }
		  $typarr=typearr($v);
		  $pathstr.='&nbsp;&nbsp;>&nbsp;&nbsp;<a href="'.lmurl($typarr['id']).'">'.$typarr['TypeName'].'</a>';
		}
	  }
	 // echo $pathstr;
	 // exit;
	  return $pathstr;	
}
		
//获取路径
function pathmenu1($TypeID,$str='')
{
  if(empty($str)){ $str='&nbsp;&nbsp;>&nbsp;&nbsp;'; }
  $path=typepatharr($TypeID);
  $allnum=count($path)-2;
  foreach($path as $k=>$v)
  {
	if(!empty($v))
	{
	  if($k==$allnum){ $str=''; }
	  $typarr=typearr($v);
	  $pathstr.='<li><a href="'.lmurl($typarr['id']).'">'.$typarr['TypeName'].'</a></li>'.$str;
	}
  }
  return $pathstr;	
}

	
	
  
//广告位 
function  links($limit=10)
{
	$Adobj=Db::name("links");
	$list=$Adobj->order('id asc')->where("`type`='$type'")->limit($limit)->select();
	return $list;
}

//广告位 
function  ads($limit=10)
{
	$Adobj=Db::name("ad");
	$list=$Adobj->order('id asc')->where("`type`='$type'")->limit($limit)->select();
	return $list;
}
function  kf($limit=10)
{
	$Adobj=Db::name("kf");
	$list=$Adobj->order('id asc')->where("`type`='$type'")->limit($limit)->select();
	return $list;
}

//获取一条links 
function  linksone($id)
{
	$Adobj=Db("links_info");
	$ad=$Adobj->order('id asc')->where("`id`='$id'")->find();
	return $ad;
}


	
function next_article($id)
{
   $newsObj=Db::name("article");
   $ThisNews=$newsObj->find($id);
   $last=$newsObj->where("`is_del` <>'1' and `id`<'$id' and `TypeID`='$ThisNews[TypeID]'")->order('id desc')->find();
   $next=$newsObj->where("`is_del` <>'1' and `id`>'$id' and `TypeID`='$ThisNews[TypeID]'")->order('id asc')->find();
   if($last) 
   {
   $last_text = "<p><a  href='".idlname($last['id'])."'>上一篇：".$last['Title']."</a></p>";
   }else{
	$last_text = "<p><a>上一篇：没有了！</a></p>";   
   }
   if($next) 
   {
   $next_text = "<p><a href='".idlname($next['id'])."'>下一篇：".$next['Title']."</a></p>";
   }else{
	$next_text = "<p><a>下一篇：没有了！</a></p>";   
   }
   $str = $last_text.$next_text;
   return $str;
}	
	
//截取字符串
function jiezi1($str, $start=0, $length, $charset="utf-8", $suffix=true)
{
    if(function_exists("mb_substr")){
            if ($suffix && strlen($str)>$length)
                return mb_substr($str, $start, $length, $charset)."...";
        else
                 return mb_substr($str, $start, $length, $charset);
    }
    elseif(function_exists('iconv_substr')) {
            if ($suffix && strlen($str)>$length)
                return iconv_substr($str,$start,$length,$charset)."...";
        else
                return iconv_substr($str,$start,$length,$charset);
    }
    $re['utf-8']   = "/[\x01-\x7f]|[\xc2-\xdf][\x80-\xbf]|[\xe0-\xef][\x80-\xbf]{2}|[\xf0-\xff][\x80-\xbf]{3}/";
    $re['gb2312'] = "/[\x01-\x7f]|[\xb0-\xf7][\xa0-\xfe]/";
    $re['gbk']    = "/[\x01-\x7f]|[\x81-\xfe][\x40-\xfe]/";
    $re['big5']   = "/[\x01-\x7f]|[\x81-\xfe]([\x40-\x7e]|\xa1-\xfe])/";
    preg_match_all($re[$charset], $str, $match);
    $slice = join("",array_slice($match[0], $start, $length));
	$slice =gethtml($slice);
    if($suffix) return $slice."…";
    return $slice;
}
	

//基本参数 
function webinfo()
{
	$webObj=Db::name("web");
	$arr= $webObj->find(1);
	$webinfo1=webinfo1();
	//if(count($webinfo1))
	foreach($webinfo1 as $k=>$v)
	{
	  $arr[''.$v['field'].'']=$v['val'];	
	}
	return $arr;  
}


//基本参数 
function webinfo1($field='')
{
	$webObj=Db::name("webinfo");
	if(!empty($field))
	{
	  $arr= $webObj->where("`field`='$field'")->find();
	 // return $webObj->getLastSql();
	  return $arr['val'];
	}
	
	$list=array();	
	$arr= $webObj->order("`id` asc")->select();
	return $arr;
	foreach($arr as $k=>$v)
	{
	  $list[$v['field']]=$v['val'];	
	}
	return $list;  
}




/*判断移动端*/
function isMOB()
{ 
	if ( strpos($_SERVER['HTTP_USER_AGENT'], 'MicroMessenger') !== false ) {
			return true;
	}    
    // 如果有HTTP_X_WAP_PROFILE则一定是移动设备
    if (isset ($_SERVER['HTTP_X_WAP_PROFILE']))
    {
        return true;
    } 
    // 如果via信息含有wap则一定是移动设备,部分服务商会屏蔽该信息
    if (isset ($_SERVER['HTTP_VIA']))
    { 
        // 找不到为flase,否则为true
        return stristr($_SERVER['HTTP_VIA'], "wap") ? true : false;
    } 
    // 脑残法，判断手机发送的客户端标志,兼容性有待提高
    if (isset ($_SERVER['HTTP_USER_AGENT']))
    {
        $clientkeywords = array ('nokia',
            'sony',
            'ericsson',
            'mot',
            'samsung',
            'htc',
            'sgh',
            'lg',
            'sharp',
            'sie-',
            'philips',
            'panasonic',
            'alcatel',
            'lenovo',
            'iphone',
            'ipod',
            'blackberry',
            'meizu',
            'android',
            'netfront',
            'symbian',
            'ucweb',
            'windowsce',
            'palm',
            'operamini',
            'operamobi',
            'openwave',
            'nexusone',
            'cldc',
            'midp',
            'wap',
            'mobile'
            ); 
        // 从HTTP_USER_AGENT中查找手机浏览器的关键字
        if (preg_match("/(" . implode('|', $clientkeywords) . ")/i", strtolower($_SERVER['HTTP_USER_AGENT'])))
        {
            return true;
        } 
    } 
    // 协议法，因为有可能不准确，放到最后判断
    if (isset ($_SERVER['HTTP_ACCEPT']))
    { 
        // 如果只支持wml并且不支持html那一定是移动设备
        // 如果支持wml和html但是wml在html之前则是移动设备
        if ((strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') !== false) && (strpos($_SERVER['HTTP_ACCEPT'], 'text/html') === false || (strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') < strpos($_SERVER['HTTP_ACCEPT'], 'text/html'))))
        {
            return true;
        } 
    } 
    return false;
} 


//获取当前页面完整URL地址
function get_wurl() {
	$sys_protocal = isset($_SERVER['SERVER_PORT']) && $_SERVER['SERVER_PORT'] == '443' ? 'https://' : 'http://';
	$php_self = $_SERVER['PHP_SELF'] ? $_SERVER['PHP_SELF'] : $_SERVER['SCRIPT_NAME'];
	$path_info = isset($_SERVER['PATH_INFO']) ? $_SERVER['PATH_INFO'] : '';
	$relate_url = isset($_SERVER['REQUEST_URI']) ? $_SERVER['REQUEST_URI'] : $php_self.(isset($_SERVER['QUERY_STRING']) ? '?'.$_SERVER['QUERY_STRING'] : $path_info);
	$sys_protocal.(isset($_SERVER['HTTP_HOST']) ? $_SERVER['HTTP_HOST'] : '').$relate_url;
	return $sys_protocal.(isset($_SERVER['HTTP_HOST']) ? $_SERVER['HTTP_HOST'] : '').$relate_url;
 }



function Gourl($url)
{
	return $this->Tourl($url);
}
	
//跳转到指定URL
function Tourl($url)
{
	@header('Content-type:text/html;charset=utf-8');
	$gohtml='
	<html>
	<head>
	<meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
	<meta http-equiv="refresh" content="0.1;url='.$url.'">
	<title>加载中...</title>
	</head>
	<body></body>
	</html>
	';
	echo $gohtml;	
}	
	
//用户数据加密       加密数据  
function jiami($data,$num,$numb){
    $length = mb_strlen($data,'utf8')-$num-$numb;
    $str = str_repeat("*",$length);//替换字符数量
    $re = substr_replace($data,$str,$num,$length);
    return $re;
}

function r404($text)
{
  $str='<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
<title>'.$text.'_页面不存在</title> 
</head>
<body>
<div style="width:100%; text-align:center; margin:100px auto;">
<a href="/" style="border:0;"><img style="border:0;" src="/public/img/j404.png" width="393" height="177" alt="页面不存在"></a><br />
'.$text.'
</div>
</span>
</body>
</html>
';
return $str;
}


function curl_file_get_contents($durl){  
  $ch = curl_init();  
  curl_setopt($ch, CURLOPT_URL, $durl);  
  curl_setopt($ch, CURLOPT_TIMEOUT, 5);  
  curl_setopt($ch, CURLOPT_USERAGENT, _USERAGENT_);  
  curl_setopt($ch, CURLOPT_REFERER,_REFERER_);  
  curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);  
  $r = curl_exec($ch);  
  curl_close($ch);  
   return $r;  
}  







/*会员类型*/
function membertype($type)
{
  $list=array('','个人','企业');
  if(is_numeric($type))
  {
    return $list[$type];
  }
  return $list;
}










/*
**获取IP
*/
function getip(){
        $IPaddress='';
        if (isset($_SERVER)){
            if (isset($_SERVER["HTTP_X_FORWARDED_FOR"])){
                $IPaddress = $_SERVER["HTTP_X_FORWARDED_FOR"];
            } else if (isset($_SERVER["HTTP_CLIENT_IP"])) {
                $IPaddress = $_SERVER["HTTP_CLIENT_IP"];
            } else {
                $IPaddress = $_SERVER["REMOTE_ADDR"];
            }
        } else {
            if (getenv("HTTP_X_FORWARDED_FOR")){
                $IPaddress = getenv("HTTP_X_FORWARDED_FOR");
            } else if (getenv("HTTP_CLIENT_IP")) {
                $IPaddress = getenv("HTTP_CLIENT_IP");
            } else {
                $IPaddress = getenv("REMOTE_ADDR");
            }
        }
        return $IPaddress;
}

/*
**获取城市信息
*/
function ipcity(){
        $clientIP=getip();
        $taobaoIP = 'http://ip.taobao.com/service/getIpInfo.php?ip='.$clientIP;
        $IPinfo = json_decode(file_get_contents($taobaoIP));
        $data['region'] = $IPinfo->data->region;
        $data['city'] = $IPinfo->data->city;
        $data['city_id'] = $IPinfo->data->city_id;
        $data['ip'] = $IPinfo->data->ip;
        return $data;
}

/*
**获取数据库城市
 reurn Array
*/

function getcity($city)
{
  
  $where=" `id`>'0'";
 // $city1=str_replace('市','',$city);
  $where.=" and (`cityname` like '%".$city."%')";
  $info=Db::name("city")->where("$where")->find();
  $info['sql']=Db("city")->getLastSql();
  if($info)
  {
    return $info;
  }else{
    return '';
  }
}


/*
**获取城市
 reurn Array
*/

function citylist($pid,$all=0)
{
  
  $pid=$pid;
  $all=$all;
  if($all!='1')
  {
	 $where=" `id`>'0' and `pid`='".$pid."'";
  }
  
  $info=Db::name("city")->where("$where")->order("`id` asc")->select();
 // $info['sql']=Db::name("city")->getLastSql();
  if($info)
  {
    return $info;
  }else{
    return '';
  }
}



function prosxlist($pid,$all=0)
{
	if($all!='1')
	{
		$where=" `id`>'0' and `pid`='".$pid."'";
	}
	$info=Db::name("prosx")->where("$where")->order("`id` asc")->select();
	// $info['sql']=Db::name("city")->getLastSql();
	if($info)
	{
		return $info;
	}else{
		return '';
	}
}

function countsx($id)
{
	$where=" `id`>'0' and `pid`='".$id."'";
	$info=Db::name("prosx")->where("$where")->order("`id` asc")->count();
	//print_r($info);die;
	// $info['sql']=Db::name("city")->getLastSql();
	if($info)
	{
		return $info;
	}else{
		return '';
	}
}

function getsxlist($id)
{
	$where=" `id`>'0' and `pid`='".$id."'";
	$info=Db::name("prosx")->where("$where")->order("`id` asc")->select();
	//print_r($info);die;
	// $info['sql']=Db::name("city")->getLastSql();
	if($info)
	{
		return $info;
	}else{
		return '';
	}
}



function getsplx($pid)
{
	$where=" `id`>'0' and `id`='".$pid."'";
	$info=Db::name("prosx")->where("$where")->order("`id` asc")->find();
	$info1 = $info['cat_name'];
	//print_r($info);die;
	// $info['sql']=Db::name("city")->getLastSql();
	if($info1)
	{
		return $info1;
	}else{
		return '';
	}
}


//栏目数
	
function lmtree($topid)
{
	$TypeObj=Db::name("lm");
	$TypeList = $TypeObj->where("`parentID`='$topid'")->order('`SortNumber` asc,`id` asc')->select();
	foreach($TypeList as $k=>$v)
	{
		$padding='padding-left:'.($v[Depth]*15).'px';
		$str.='<p style="width:100%; float:left; '.$padding.'"><input name="" type="checkbox" value="">'.$v['TypeName'].'</p>';
		$str.='<p>'.lmtree($v[id]).'</p>';
	}
	return $str;
}










function getsize($size, $format) {  
    $p = 0;  
    if ($format == 'kb') {  
        $p = 1;  
    } elseif ($format == 'mb') {  
        $p = 2;  
    } elseif ($format == 'gb') {  
        $p = 3;  
    }  
    $size /= pow(1024, $p);  
    return number_format($size, 3);  
} 
		  
	function NewsRecommed($id='')
	{
		$NewsRecommed=array(
		0=>"不推荐",
		1=>"相关推荐",
		);
		if(is_numeric($id))
		{
		return $NewsRecommed[$id];
		}
		return $NewsRecommed;
	}
	


function  categoryTree($parentID,$sid)   //1因为是本类中使用所以定于为私有函数
{
$Category= Db::name("lm");
$sidarr=explode(",",$sid);
$result = $Category->where("`parentID`=".$parentID)->order("`SortNumber` asc,`id` asc")->select();
$PathTree='';
$str='';
	foreach($result as $k=>$v)
	{
		$selected='';		
		if(in_array($v['id'],$sidarr)) {
			$selected='selected="selected"';
		}
	   $PathTree1=pathtree($v['idpath']);
	   $str.='<option fd="'.$v['TypeName'].'" '.$selected.'  value="'.$v['id'].'">'.$PathTree1.'</option>';
	   $str.=categoryTree($v['id'],$sid);
	}
return $str;
}	

function  menulist($pid)   //1因为是本类中使用所以定于为私有函数
{
$Category= D('lm');
$pTypeName='栏 目:';
if($pid>0)
{
  $parr=$Category->find();
  $pTypeName=$parr['TypeName'];
}

$str='<div class="lmlist"><span>'.$pTypeName.'：</span>';

$result = $Category->where("`parentID`=".$pid)->order("`SortNumber` asc,`id` asc")->select();
//echo $Category->getLastSql();
//exit;
$PathTree='';
	foreach($result as $k=>$v)
	{
		$class='';		
		if(in_array($v[id],$sidarr)) {
			$class='cur';
		}
	  
	   $str.='<a href="run.php?m=App&TypeID='.$v['id'].'">'.$v['TypeName'].'</a>';
	   
	}
$str.='</div>';



return $str;
}	






function pathtree($pathtree)
{
   $pathtreearr=explode(",",$pathtree);
   	$TypeName='';
   foreach($pathtreearr as $k=>$v)
   {

    // $vstr.=$v;
    if(is_numeric($v))
	 {
       $TypeNameArr=Db::name("lm")->where("`id`='$v'")->Field('TypeName')->find();
	  // $sqlstr.=db::name("lm")->getLastSql().'//';
		$fgf='┗';
	   $TypeName.=$fgf.$TypeNameArr['TypeName'].'[ID:'.$v.']';
	   $TypeName=ltrim($TypeName,$fgf);
	} 
   }
return $TypeName;
}





//获取下级栏目ID
function getidlist1($pid)
{
   if(!is_numeric($pid))
   {
	  return '';   
   }
	$arr=Db::name("lm")->where("`id`='$pid'")->find();
	$idpath=explode(',',$arr['idpath']);
	return $idpath;
}




	
	//获取栏目信息，，array	
function typearr1($id)
	{
	  $arr=Db::name("lm")->where("`id`='$id'")->find();
	 // return M("lm")->getLastSql();
	 // exit;
	 if(!$arr){
	  return '';
	  }
	  return $arr;	
	}
	
	
	
	
	
  //查找所有新闻类别
function AllNewsType($setid)
	{
	    $str='';
	    $TypeObj=Db::name("lm");
		$TypeList = $TypeObj->where("`parentID`='0'")->order('`SortNumber` asc,`id` asc')->select();
		
		foreach($TypeList as $k=>$v)
		{
		    $selected='';
			if($v['id']==$setid)
			{
				$selected='selected="selected"';
			}
			$str.="<option  $selected value='".$v['id']."'>".$v['PathTree']."</option>";
			$str.=xiaji1($v['id'],$setid);
		}
		//echo $str;
		//exit;
	return $str;
	}
	
	
	
	
function xiaji1($topid,$setid)
	{
	$str='';
	$selected='';
	$TypeObj=Db::name("lm");
	$TypeList = $TypeObj->where("`parentID`='$topid'")->order('`SortNumber` asc,`id` asc')->select();
	foreach($TypeList as $k=>$v)
	{
            $selected='';
			if($v['id']==$setid)
			{
				$selected='selected="selected"';
			}
			$str.="<option  $selected value='".$v['id']."'>".$v['PathTree']."</option>";
			xiaji1($v['id'],$setid);
	}
	return $str;
	}
	
	
	
	
	
		
	
	
	
//获取栏目路径 id,返回字符串
function typepath1($tid)
{
   if(!is_numeric($tid))  
   { 
	   return '';     
   }
   $nowarr=Db::name("lm")->where("`id`='$tid'")->find();
   //print_r($nowarr);
  // exit;
   $PathTree=$nowarr['PathTree'];
    // echo $PathTree.'=';

   $PathTree=explode('/',$PathTree);
   $id='';
   foreach($PathTree as $k=>$v)
   {
	 if($pid>0) 
	 { 
		 $pidand=" and `parentID`='$pid'";  
	 }
	 if(!empty($v))
	 {
		$id=Db::name("lm")->where("`TypeName`='$v' $pidand")->getField("id");
		$pid=$id;
		$pathid.=$id.",";
	 // echo $pid."=";
	 }
   }
			//exit;
			// echo $pid;
			//exit;
			//echo M("lm")->getLastSql();
			//  exit;
			//echo $pathid;
			//exit;
			//echo $pathid.'==';
		//	exit;
   return $pathid;
}

function getptop($pid)
{
	$TypeObj=Db::name("lm");
	if($pid=='' || $pid=='0' || !is_numeric($pid)) return '0';//pid为空则是顶级栏目
	$idpath1=TypeArr($pid);
	$idpath=$idpath1['idpath'];
	//if(!$arr) return '0';
	$topid=explode(",",$idpath);
	if($topid<1)
	{
	  exit("<script> alert('topid获取失败，请联系管理员！'); history.back(); </script>");
	}
	return $topid[1];
}	
	
	
function weburl($weburl)
{
    if(empty($weburl)) return false;
	$weburl='/'.$weburl.'/';
	$weburl=str_replace('//','/',$weburl);	
	$weburl=str_replace('//','/',$weburl);
	$weburl=str_replace('//','/',$weburl);
	$weburl=strtolower($weburl);	
   return $weburl;
}

function cityname($id)
{
  if(!is_numeric($id)){ return ''; }
  if($id=='0'){ return '顶级城市'; }
  $cityname1=Db::name("city")->where("`id` =$id")->find();
	$cityname = $cityname1['cityname'];
  return $cityname;
}
	
	
/*
  微信浏览器
  return true;
*/
function isweixin(){ 
if ( strpos($_SERVER['HTTP_USER_AGENT'],'MicroMessenger') !== false ) {

        return 1;
    }  
        return 0;
}



/*
  去除多余斜杠 /
  return string;
*/
function delxg($str)
{
	$str=str_replace('//','/',$str);
	$str=str_replace('//','/',$str);
	$str=str_replace('//','/',$str);
	$str=str_replace('//','/',$str);
	return $str;
}




/*
**获取city  
 reurn Array
*/

function cityarr($host)
{
   if(empty($host)){ return false; }
   $cityarr=db::name("city")->where("`host`='$host'")->find();
   $cityarr['sql']=db::name("city")->getLastSql();
  // return db::name("city")->getLastSql();
   return $cityarr;
}



/*
**解析当前url
 reurn Array
*/

function nowcity()
{
   $nowhost_url=$_SERVER['HTTP_HOST']; 
   $nowhost_url=str_replace('http://','',$nowhost_url);
   $nowhost_url=str_replace('https://','',$nowhost_url);
   $nowhost_url=explode('.',$nowhost_url);
   $nowhost=$nowhost_url[0];
   if(count($nowhost_url)<3){ $nowhost = 'www';  }
   if($nowhost=='' || $nowhost=='www'){ $cityarr=cityarr('www');  }
   $cityarr=cityarr($nowhost);
   if($cityarr['id']<1)
   {
	 //exit('站点不存在');  
     return false;
   }
    return $cityarr;
}
