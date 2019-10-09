<?php
require_once('qiniu/autoload.php');
use Qiniu\Auth;
use Qiniu\Storage\UploadManager;
function qiniu($imgsrc,$savename)
{
	$file=$imgsrc;
	if(!is_file($_SERVER['DOCUMENT_ROOT'].'/'.$imgsrc))
	{
	  return false;	
	}
	$qnurl='http://p0u7patdd.bkt.clouddn.com';
	//import('ORG.qiniu.qn');
	$accessKey = 'UIjiZ36KgtFHQ8IPb1L8-K2F428EM0GWqkqmffma';
	$secretKey = '7m541oMnL19ro1xTm6DrAABDBBVj7dFMLjjy9gsg';
	$bucket = 'anddisme';
	$savename=str_replace('/public','public',$savename);
	$auth = new Auth($accessKey, $secretKey);
	// 上传文件到七牛后， 七牛将文件名和文件大小回调给业务服务器.
	// 可参考文档: http://developer.qiniu.com/docs/v6/api/reference/security/put-policy.html
	$policy = array(
	 //'callbackUrl' => 'http://temp2.rrbjt.com/upload_verify_callback.php',
	  'callbackBody' => 'filename=$(fname)&filesize=$(fsize)'
	);
	$uptoken = $auth->uploadToken($bucket, $savename, 3600, $policy);
	//上传文件的本地路径
	$filePath = $_SERVER['DOCUMENT_ROOT'].$imgsrc;
	$uploadMgr = new UploadManager();
	
	list($ret, $err) = $uploadMgr->putFile($uptoken,$savename, $filePath);
	if ($err !== null) {
		return false;
		//print_r($err);
		//exit;
		//var_dump($err);
	} else {
		return $ret['key'];
		//print_r($ret);
		//exit();
	}
	return false;
}
