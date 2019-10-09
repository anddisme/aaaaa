<?php
namespace app\index\controller;
use think\Controller;
use think\Session;
use think\Db;

class Getuser extends Controller
{

  function _initialize(){
    $this->appid  = config('appid');   //你的appId
    $this->secret =config('secret');   //你的appSecret
}
	


    //获取用户的openid
    function index(){
		//echo  '/'.$this->appid;
		//exit;
        //1.获取到code=================================
        $redirect_uri = urlencode("http://".$_SERVER['HTTP_HOST']."/index.php/index_Getuser_getUserInfo");//这里的地址需要http://
        $url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=".$this->appid."&redirect_uri=".$redirect_uri."&response_type=code&scope=snsapi_base&state=123#wechat_redirect";
     // echo $url;
	 // exit;
	  header('location:'.$url);
    }

    function getUserInfo(){
		
        $data = request()->get();
        $code   = $data['code'];
        //2.获取到网页授权的access_token===============
        //第一步，获取access_token
        
		$content=session('token_txt');
        $arr = json_decode($content,true);  //转化为数组
        if (is_array($arr)) {
			
            if (isset($arr['end_time']) && $arr['end_time'] > time()) {  //access_token未过时，直接拿来使用
                $token = $arr;
            } else {    //access_token超时，重新获取
			   // exit('222');
                $url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=$this->appid&secret=$this->secret";
                $token = $this->getJson($url);
                $token['start_time'] = time();
                $token['end_time']   = time()+6000;
				$token_txt = json_encode($token);
				session('token_txt',$token_txt);
				if(empty(session::get('token_txt'))){ exit('写入token_txt失败'); }
            }
        } else {     //用于新建文件时的写入
		    
            $url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=$this->appid&secret=$this->secret";
            $token = $this->getJson($url);
            $token['start_time'] = time();
            $token['end_time']   = time()+5000;
			$token_txt = json_encode($token);
			session('token_txt',NULL);
		    session('token_txt',$token_txt);
		    if(empty(session::get('token_txt'))){ exit('写入token_txt失败'); }
        }
		
		
        //第二步:取得openid
        $oauth2Url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=$this->appid&secret=$this->secret&code=$code&grant_type=authorization_code";
		
		
        $oauth2 = $this->getJson($oauth2Url);
     
	   //第三步:根据全局access_token和openid查询用户信息
        $access_token = $token["access_token"];
        $openid = $oauth2['openid'];
        $get_user_info_url = "https://api.weixin.qq.com/cgi-bin/user/info?access_token=$access_token&openid=$openid&lang=zh_CN";
        $wx_user_info = $this->getJson($get_user_info_url);
		session('openid',$openid);
		session('wx_user_info',$wx_user_info);
		//检查用户
		$memberarr=db::name('member')->where("`openid`='$openid' and `openid`<>''")->find();	
		
		
		if($wx_user_info['nickname']!='')
		{
		  $data['name']=$wx_user_info['nickname'];
		}
		$data['endtime']=date('Y-m-d H:i:s');

		if($memberarr['id']<1)
		{
			//不存在微信账号
			  //创建写入账号
			  $data['openid']=$openid;
			  $data['username']='u'.date('YmdHis').rand(0,9);
			  $data['password']=md5('123456abcd');
			  $data['regtime']=date('Y-m-d H:i:s');
              $num = db::name('member')->insert($data);
			  $memberarr=db::name('member')->where("openid='$opendid' and openid<>''")->find();	
			  if(!$num)
			  {
				exit('创建用户失败，请联系管理员');  
			  }
			  
			  
		}else{
			//已经存在该微信用户
			  //更新账号信息
			  db::name('member')->where("`openid`='$openid'")->update($data);
		}
		session('memberarr',$memberarr);	
		
		
		
		$gourl=session::get('gourl');
		if(empty($gourl))
		{
		    $gourl='/';
		}
		header("location:".$gourl);
       // return json_encode($wx_user_info);
    }

    function getJson($url){
		
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        $output = curl_exec($ch);
        curl_close($ch);
		//$output = file_get_contents($url);
        return json_decode($output, true);
    }
}
