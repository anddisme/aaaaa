<?php
namespace app\admin\controller;
use think\Controller;
use think\Session;
use think\Db;
use app\admin\model\Admin;
class Login extends Controller
{
    public function index()
    {
		@header("Content-Type:text/html; charset=utf-8");
        //$sess = Session::get();
       // print_r($sess);die;
        if(request()->isPost()){
		   
        	$admin=new Admin();
			$CheckCode=input('post.CheckCode');
			$result=$admin->check($CheckCode);
			if($result===false){
			   msg('-1','验证码错误！','');
			}
		  // file_put_contents('a.txt','='.$num.'=');
        	$num=$admin->login(input('post.'));
        	if($num==1){
                msg('-1','用户不存在','');
				exit();
        	}
			if($num==4){
                msg('-1','你的账号未启用','');
				exit();
        	}
        	if($num==2){
				msg('1','登录成功',url('index/index'));
				exit();
        	}
        	if($num==3){
               msg('-1','密码错误','');
			   exit();
        	}
        	return '';
        }
        return view();
    }

	public function qqlogin(){
		@header("Content-Type:text/html; charset=utf-8");
		vendor('qqsdk.qqConnectAPI');
		$this->QC = new \QC();
		$qqarr = session('qqarr');

		if(empty($qqarr['openid'])) {
			$backurl = $_SERVER["HTTP_HOST"] . "/index.php/admin_Login_qqlogin";
			$backurl = config("hostname") . delxg($backurl);
			//print_r($backurl);die;
			session::set('backurl', $backurl);
			//$backurl1 = session::get($backurl);
			$this->QC->qq_login();
		}
		$openid = $qqarr['openid'];
		$login=db::name("login")->where("`openid`='".$openid."'")->find();
		//print_r($login);die;
		if(empty($login['id'])){
			//exit("你的qq账号还没有绑定，请先绑定后才可以登陆");
			$this->error("你的qq账号还没有绑定，请先绑定后才可以登陆",url("Login/index"));

		}
		$uid = $login['uid'];
		$admin=db::name("user")->where("`id`='".$uid."'")->find();
		//print_r($admin);die;
		$admin1=new Admin();
		$num = $admin1->login($admin);

		if($num==1){
			//msg('-2','用户不存在','');
			exit("用户不存在");
		}
		if($num==4){
			//msg('-1','你的账号未启用','');
			exit("你的账号未启用");
		}
		if($num==2){
			header("location:/index.php/admin_index_index.php");
			//msg('1','登录成功',url('index/index'));
			exit();
		}
		if($num==3){
			//msg('-1','密码错误','');
			exit("密码错误");
		}
//		session('admin', $admin);
//		//print_r($login);die;
//		if($admin['id']>0){
//			header("location:/index.php/admin_index_index.php");exit();
//			//msg('1','登录成功',url('index/index'));exit();
//		}else{
//			msg('-1','登录失败');exit();
//		}


	}

 public function showcaptcha(){
        $captcha = new \think\captcha\Captcha();
        $captcha->imageW=100;
        $captcha->imageH = 40;  //图片高
        $captcha->fontSize =18;  //字体大小
        $captcha->length   = 2;  //字符数
        $captcha->fontttf = '';  //字体
        $captcha->expire = 30;  //有效期
        $captcha->useNoise = true;  //不添加杂点
        //$captcha->reset = true;  //不添加杂点
        return $captcha->entry();
 }
 
 


    public  function logout(){
        @header("Content-Type:text/html; charset=utf-8");
             
	    session('admin',NULL);
	    session('qqarr',NULL);
		session('logintime',NULL);
		$url = url('login/index');
		addlog('Login/logout','注销成功'); 
		header("location:".$url);
		//$this->success('注销成功',$url);
		header("location:".$url);
    }
	
	
	
	
	
	
	
	
	
	
    public function fond()
    {
		@header("Content-Type:text/html; charset=utf-8");
       
        if(request()->isPost()){
		   
        	$admin=new Admin();
			$CheckCode=input('post.CheckCode');
			$result=$admin->check($CheckCode);
		
        }
        return view();
    }	
	
	
	
	

}
