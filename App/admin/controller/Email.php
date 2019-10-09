<?php
namespace app\admin\controller;
use app\admin\controller\Common;
use app\admin\model\Web as WebModel;
use think\db;

class Email extends Common
{
	public function __construct(){
		parent::__construct();
	//	$this->webmodel=new WebModel();
		//exit('123');
		//$this->GET=Request::instance()->param();
	}
	
    public function Index(){
		@header("Content-Type:text/html; charset=utf-8");
		$admin=getadmin();//检查登录
		$qx=qx('admin',$admin['UserType']);
	if(request()->isPost())
	{
			$POST=input('post.');
			$data=$POST;
			$data['endtime']=date("Y-m-d H:i:s");	
		    $num=Db::name('Email')->where("`id`='1'")->update($data);
			if($num>0)
			{
				addlog('Email/index','更新email成功',Db::name('Email')->getLastSql());
				echo json_encode(array("status"=>'1',"message"=>"更新成功"));
				exit();			
			}else{
				addlog('Email/index','更新email失败',Db::name('Email')->getLastSql());
				echo json_encode(array("status"=>'-1',"message"=>"更新失败"));
				exit();
			}			
	}

			$info=db::name("Email")->find(1);
			$this->assign("info",$info);
		    return view();
	}
		
	
	
}
