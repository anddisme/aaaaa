<?php
namespace app\index\controller;
use think\Cache;
use think\db;
use think\Session;
use think\Request;
/*
  微信支付
  QQ 1959850
*/

class Alipay extends Common
{
	
	public function _initialize(){
		$this->think();
       
		$this->wjt=config('wjt');
	}
	
	/*
	  jsapi支付
	*/
    public function index()
    {		
		@header('Content-type:text/html;charset=utf-8');
		 Vendor('palipay.alipayconfig');
		 Vendor('palipay.lib.alipay_submitclass');
	    $config=new \config();
		$alipay_config=$config->config();
		//print_r($alipay_config);
		//exit;
		/**************************请求参数**************************/
		$shuju=base64_decode($_REQUEST['shuju']);
		$sjarr=explode("|",$shuju);

		//支付类型
		$payment_type = "1";
		//必填，不能修改
		$notify_url = "http://shop.gemut.cn/alipayr/";
		//页面跳转同步通知页面路径
		$return_url = "http://shop.gemut.cn";
		//卖家支付宝帐户
		$seller_email =$alipay_config['seller_id'] ;//$_POST['WIDseller_email']
		//必填
		//商户订单号
		$out_trade_no = time();
		//商户网站订单系统中唯一订单号，必填
		//订单名称
		$subject = '亮剑在线付款';
		//必填
		//付款金额
		$total_fee = '1';
		//必填
		//订单描述
		$body = '亮剑在线付款';
		//商品展示地址
		$show_url = "http://shop.gemut.cn/1.php";
		//需以http://开头的完整路径，例如：http://www.xxx.com/myorder.html
		//防钓鱼时间戳
		$anti_phishing_key = "";
		//若要使用请调用类文件submit中的query_timestamp函数
		//客户端的IP地址
		$exter_invoke_ip = $_SERVER['REMOTE_ADDR'];
		//非局域网的外网IP地址，如：221.0.0.1


		/************************************************************/
		//构造要请求的参数数组，无需改动
		$parameter = array(
		"service" => "create_direct_pay_by_user",
		"partner" => trim($alipay_config['partner']),
		"payment_type"	=> $payment_type,
		"notify_url"	=> $notify_url,
		"return_url"	=> $return_url,
		"seller_email"	=> $seller_email,
		"out_trade_no"	=> $out_trade_no,
		"subject"	=> $subject,
		"total_fee"	=> $total_fee,
		"body"	=> $body,
		"show_url"	=> $show_url,
		"anti_phishing_key"	=> $anti_phishing_key,
		"exter_invoke_ip"	=> $exter_invoke_ip,
		"_input_charset"	=> trim(strtolower($alipay_config['input_charset']))
		);
		//print_r($parameter);
		//exit;

		//建立请求
		$alipaySubmit = new \AlipaySubmit($alipay_config);
		$html_text = $alipaySubmit->buildRequestForm($parameter,"get", "处理中...");
		echo $html_text;		
		//return view($this->C().'/alipay');
    }
	
	
	
	
	
  public function notify(){
		@header("Content-Type:text/html; charset=utf-8");
		error_reporting(1);
		$root=$_SERVER['DOCUMENT_ROOT'];
		//@require_once($root."/alipay/alipay.config.php");
		//@require_once($root."/alipay/lib/alipay_notify.class.php");
		 Vendor('palipay.alipayconfig');
		 Vendor('palipay.lib.alipay_notifyclass');
		
		$alipayNotify = new \AlipayNotify($alipay_config);
		$verify_result = $alipayNotify->verifyNotify();
			if($verify_result) {//验证成功
				$str = var_export ($_REQUEST, 1);
					file_put_contents("pay.txt",$str."========".date("Y-m-d H:i:s"));
					$out_trade_no = $_POST['out_trade_no'];//商户订单号
					$trade_no = $_POST['trade_no'];//支付宝交易号
					$trade_status = $_POST['trade_status'];//交易状态
					$total_fee = $_POST['total_fee'];//交易状态
					$paytime=$_POST['gmt_payment'];
				if($_POST['trade_status'] == 'TRADE_FINISHED') {
				}
				else 
				if ($_POST['trade_status'] == 'TRADE_SUCCESS') {
				}
				    $odata['status']='2';
				    $odata['paystatus']='1';
				    $odata['payprice']=$total_fee;
				    $odata['paytime']=$paytime;
					$this->orderobj()->where("`orderno`='$out_trade_no'")->save($odata);
					file_put_contents("pay.txt",var_export($_REQUEST,'1').date("Y-m-d H:i:s"));
					exit;
			}
			else {
			
			
			}			
			
			}	
	
	
	
	
	
}
