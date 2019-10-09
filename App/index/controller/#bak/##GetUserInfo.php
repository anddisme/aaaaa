<?php
namespace app\index\controller;
use think\Session;

class GetUserInfo
{
    private $appid  = "wxd24888425adf6867";   //你的appId
    private $secret = "b018e3474f414a4eee80dfc07382c166";   //你的appSecret

    //获取用户的openid
    function index(){
        //1.获取到code=================================
        $redirect_uri = urlencode("http://".$_SERVER['HTTP_HOST']."/index.php/index/GetUserInfo/getUserInfo");//这里的地址需要http://
        $url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=".$this->appid."&redirect_uri=".$redirect_uri."&response_type=code&scope=snsapi_base&state=123#wechat_redirect";
        header('location:'.$url);
    }

    function getUserInfo(){
        $data = request()->get();
        $code   = $data['code'];
        //2.获取到网页授权的access_token===============
        //第一步，获取access_token
        //新建一个文件存储access_token，避免多次获取，access_token的有效时间是2个小时，这里的目录是根目录：www.xxx.xxx/access_token.txt
        $token_txt = '';
			/*
			if (!file_exists($file_name)) {     //文件不存在，新建并附赋权限
				$my_file = fopen($file_name, "w");
				$file_name = $my_file;
				chmod($file_name,0777);
			}
			*/
		$content=session::get('token_txt');
        //$content = file_get_contents($file_name);  //读取文件内容
        $arr = json_decode($content,true);  //转化为数组
        if (is_array($arr)) {
			print_r($arr);
			exit;
            if (isset($arr['end_time']) && $arr['end_time'] > time()) {  //access_token未过时，直接拿来使用
                $token = $arr;
            } else {    //access_token超时，重新获取
                $url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=$this->appid&secret=$this->secret";
                $token = $this->getJson($url);
                $token['start_time'] = time();
                $token['end_time']   = time()+7000;
				$token_txt = json_encode($token);
				//$my_file = fopen($file_name, "w") or die("Unable to open file!");
			   // fwrite($my_file, $txt);
			   // fclose($my_file);
				//$num = file_put_contents($file_name,$token_txt);
				session('token_txt',$token_txt);
				file_put_contents('yyy.txt',$token_txt);
				//if($num<1){
				//	   exit('写入token_txt失败');
				//}
            }
        } else {     //用于新建文件时的写入
            $url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=$this->appid&secret=$this->secret";
            $token = $this->getJson($url);
            $token['start_time'] = time();
            $token['end_time']   = time()+7000;
			$token_txt = json_encode($token);
            //$my_file = fopen($file_name, "w") or die("Unable to open file!");
           // fwrite($my_file, $txt);
           // fclose($my_file);
		      session('token_txt',$token_txt);
		   // $num = file_put_contents($file_name,$token_txt);
		   // if($num<1){
			//	   exit('写入token_txt失败');
			//}
        }
        //第二步:取得openid
        $oauth2Url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=$this->appid&secret=$this->secret&code=$code&grant_type=authorization_code";
		
        $oauth2 = $this->getJson($oauth2Url);
        //第三步:根据全局access_token和openid查询用户信息
        $access_token = $token["access_token"];
        var_dump($oauth2);
        $openid = $oauth2['openid'];
        $get_user_info_url = "https://api.weixin.qq.com/cgi-bin/user/info?access_token=$access_token&openid=$openid&lang=zh_CN";
        $user_info = $this->getJson($get_user_info_url);

        //打印用户信息
        //print_r($user_info);
        //返回用户信息，这里不能直接返回数组
        return json_encode($user_info);
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
