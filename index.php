<?php
@header("Content-Type:text/html; charset=utf-8");
//301
$hosturl=$_SERVER['HTTP_HOST'];
$hosturi=$_SERVER['REQUEST_URI'];

if($hosturl=='jsllk.com')
{
	@header('HTTP/1.1 301 Moved Permanently');
	@header("Location: http://www.jsllk.com".$hosturi);
}
define('WEB_ROOT',$_SERVER['DOCUMENT_ROOT']);
define('WEB_URL','http://'.$hosturl);
define('APP_PATH', __DIR__ . '/App/');
define('RUNTIME_PATH', __DIR__ . '/App/runtime/');
require __DIR__ . '/App/mycore/start.php';
?>
