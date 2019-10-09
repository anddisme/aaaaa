<?php
namespace app\admin\controller;
use think\Controller;
use think\Session;
use think\Db;
use app\admin\model\Admin;
class Qqlogin extends Common
{
	public function _initialize(){
		//引入QQ登陆类
		vendor('qqsdk.qqConnectAPI');
		// import('ORG.qqsdk.qqConnectAPI');
		//实例化
		$this->hostname = config("hostname");
		$this->QC = new \QC();
	}
	public function index(){
		@header('Content-type:text/html;charset=utf-8');
		$admin=getadmin();
		$qqarr = session('qqarr');
		$this->assign("qqarr",$qqarr);
		if(empty($qqarr['openid'])) {
			$backurl = $_SERVER["HTTP_HOST"] . "/index.php/admin_Qqlogin_index";
			$backurl = config("hostname") . delxg($backurl);
			//print_r($backurl);die;
			session::set('backurl', $backurl);
			//$backurl1 = session::get($backurl);
			$this->QC->qq_login();
		}
		return view();
	}
	public  function bdqq()
	{
		@header("Content-Type:text/html; charset=utf-8");
		$admin=getadmin();
		$qqarr = session('qqarr');
			$old = db::name("login")->where("`openid` = '".$qqarr['openid']."'")->find();
			if($old['id']>0){
				$data['nickname'] = $qqarr['nickname'];
				$data['headimg'] = $qqarr['figureurl_qq'];
				$data['endtime'] = date("Y-m-d H:i:s");
				$num1 = db::name("login")->where("`openid` = '".$qqarr['openid']."'")->update($data);
				//print_r(db::name("login")->getLastSql());die;
				if($num1){
					exit("更新qq信息成功");

				}else{
					exit("更新qq信息失败");
				}
			}
			$data['uid'] = $admin['id'];
			$data['openid'] = $qqarr['openid'];
			$data['nickname'] = $qqarr['nickname'];
			$data['headimg'] = $qqarr['figureurl_qq'];
			$data['type'] = 'qq';
			$data['endtime'] = date("Y-m-d H:i:s");
			$num = db::name("login")->insert($data);
			if($num){
				exit("绑定qq信息成功");
			}else{
				exit("绑定qq信息失败");
			}



	}



	
	
	
	

}
