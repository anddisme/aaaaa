<?php
namespace app\index\controller;
use think\Cache;
use think\Session;
use think\Db;
use app\index\model\Login1;

class Login extends Common {
    public function _initialize(){
        //引入QQ登陆类
		vendor('qqsdk.qqConnectAPI');
     // import('ORG.qqsdk.qqConnectAPI');
        //实例化
      $this->QC = new \QC();
    }
    //开始登陆
    public function index(){
	@header('Content-type:text/html;charset=utf-8');
        $this->QC->qq_login();
    }
	public function reg()
	{
		@header('Content-type:text/html;charset=utf-8');
		if(request()->isPost()){
			$post = input('post.');
			$username = $post['username'];
			$phone = $post['phone'];
			$data['username']=$post['username'];
			$data['password']=$post['password'];
			$data['password1']=$post['spassword'];
			$data['company_name']=$post['companyname'];
			$data['telphone']=$post['phone'];
			if($data['password']!=$data['password1']){
				echo '1111';
				msg('-1','两次的密码不一致！','');exit();
			}
			$data['password'] = md5($post['password']);
			if(!is_numeric($phone) && $phone.length !='11'){
				echo '2222';
				msg('-1','手机号码有问题！','');exit();
			}
			//print_r(55555);die;
			$menmstr = db::name("member")->where("`username`='".$username."' and `telphone` ='".$phone."'")->find();
			//$menmstr =Db::name("member")->where("`username` = ".$username." and `telphone` = ".$phone."")->find();
			//print_r($menmstr);die;
			//print_r(Db::name("member")->getLastSql());die;
			if($menmstr['id']>0){
				msg('-1','你的用户名或则电话号已经存在！','');exit();
			}
			//print_r(11111);die;
			$num = Db::name("member")->insert($data);
			if($num){
				msg('1','注册成功！','');exit();
			}else{
				msg('-1','注册失败！','');exit();
			}

		}
		return view($this->C().'/'.reg);

	}
	public function login(){
		@header('Content-type:text/html;charset=utf-8');
		//$post = request()->isPost();
		if(request()->isPost()){
			$post = input('post.');

			//$code = $post['CheckCode'];
			$login=new Login1();

			$code=input('post.CheckCode');
			$result=$login->check($code);
			if($result===false){

				msg('-1','验证码错误！','');
			}

			$username=$post['username'];
			$password=$post['password'];
			$menmstr =Db::name("member")->where("`username` = '".$username."' and `password` = '".md5($password)."'")->find();

			if($menmstr['id']>0){
				session::set('memberarr',$menmstr);
				$tourl = "/index.php/index_index_web";
				header("location:".$tourl);
				exit();
			}else{
				msg('-1','账号不存在，请注册后登陆！','/index.php/index_Login_reg"');exit();
			}

		}
		return view($this->C().'/'.login);
		//$this->QC->qq_login();
	}
    //回调
    public function qqcallback(){
		@header('Content-type:text/html;charset=utf-8');
		if(session("qqarr.openid")=='')
		{
			vendor('qqsdk.qqConnectAPI');
			$this->QC = new \QC();
			$token  = $this->QC->qq_callback();
			$qqopenid = $this->QC->get_openid();
			if(empty($qqopenid)){
				exit("获取openid失败");
			}
			$QC = new \QC($token,$qqopenid);
			$qqarr = $QC->get_user_info();
			$qqarr['openid'] = $qqopenid;
			if($qqopenid!='')
			{
			  session::set('qqarr',$qqarr);
			}
		}
		$backurl = session::get('backurl');
		if(!empty($backurl)){
			header("location:".$backurl);
		}else{
			exit();
		}
		

        
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
	public function check($code)
	{
		//return true;
		if (!captcha_check($code)) {
			msg('-1','验证码输入错误','');
		} else {
			return true;
		}
	}
	
	
	
}

?>