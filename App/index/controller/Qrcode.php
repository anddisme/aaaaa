<?php
namespace app\index\controller;
use think\Request;
use phpqrcode\phpqrcode;


class Qrcode
{
	/*
	  生成二维码
	*/
    public function index()
    {
		Vendor('phpqrcode.phpqrcode');
		$qrcode = new \QRcode();
		$url = urldecode(get("data"));
		if(substr($url, 0, 6) == "weixin"){
			$qrcode::png($url);
		}else{
			$qrcode::png($url);
		}
		
	}
}
