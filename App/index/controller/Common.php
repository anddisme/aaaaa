<?php
namespace app\index\controller;
use think\Controller;
use think\Db;
use think\Session;
use think\Request;

class Common extends Controller
{
	

    public function think(){
		//$nowcity = nowcity();
		//$this->assign('nowcity',$nowcity);
        $web=webinfo();
		if($web['Locked'])
		{
		  exit('网站维护关闭中...');	
		}
		$ip=$_SERVER["REMOTE_ADDR"];
		$ip1=@$_SERVER["HTTP_X_REAL_IP"];
		$ips=array_filter(explode("\r\n", trim($web['ips'])));
		if(in_array($ip,$ips)){ exit('禁止访问'); }
		if(in_array($ip1,$ips)){ exit('禁止访问'); }
        $this->assign('web',$web);
        
    }
	
	
	/*
	  是否登录
	   return member 
	              array
	*/
	protected function islogin()
	{
		session('gourl',NULL);
		//session('memberarr',NULL);
		//exit;
		
		$memberarr=session::get('memberarr');
		$memberarr=db::name("member")->where("`username`='".$memberarr['username']."'")->find();
		
		if($memberarr['id']<1)
		{
			$request = Request::instance();
			$gourl=$request->url();
			session('gourl',$gourl);//登录后返回的url
			if(isweixin()==1)
			{
			  @header("location:/index.php/index_Getuser_index");  
			}else{
			  @header("location:/login.html");  
			}
		}
		return $memberarr;
	}
	
	
	
	/*
	  检测模板
	*/
	public function C()
	{
		$tpl=$_REQUEST['tpl'];
		if(!empty($tpl))
		{
		//return $tpl;
		}
		//print_r(111111);die;
		return 'index';
		if(isMOB()==false)
		{
			return 'index';
		}else{
			return 'm';
		}
	}

	public function regsms(){
		$phone = get('phone');

	}
	public function logout(){
		session::set("memberarr",null);
		header("location:/index.php/index_index_index");

		die;

	}



 

}
