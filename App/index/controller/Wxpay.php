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

class Wxpay extends Common
{
	
	public function _initialize(){
		$this->think();
		//$this->wxpay_ROOT=WEB_ROOT."/vendor/wxpay/";
		$hostname=config('hostname');
		$payurl=config('wxpay.payurl');
		$returnurl=config('wxpay.returnurl');
		
		$this->payurl=$hostname.delxg($payurl);
		$this->returnurl=$hostname.delxg($returnurl);
		//echo $this->returnurl;
		//exit;
		$this->wjt=config('wjt');
	}
	
	/*
	  jsapi支付
	*/
    public function index()
    {		
		@header('Content-type:text/html;charset=utf-8');
		ini_set('date.timezone','Asia/Shanghai');
		//error_reporting(E_ERROR);
		//$wxpay_ROOT=$this->wxpay_ROOT;
		//require_once $wxpay_ROOT."/lib/WxPay.Api.php";
		//require_once $wxpay_ROOT."/WxPay.JsApiPay.php";
		//\think\Loader::import('WxPay.lib.JsApiPay');
        Vendor('WxPay.wxautoload');
		$ordernum='11';
	//①、获取用户openid
		$tools = new \JsApiPay();
		//$openId = $tools->GetOpenid('http://wx.yinuoke.net/a.php/index_wxpay_index?ordernum='.$ordernum);
		//echo $this->payurl;
		//exit;
		
		//$openId = $tools->GetOpenid('?ordernum='.$ordernum);
		$openId = $tools->GetOpenid($this->payurl.'?ordernum='.$ordernum);
		
		$ordernum=1;
		$orderarr=array();
		$orderarr['allprice']=1;
		$SetTotal_fee=1;
		//②、统一下单
		$WxPayApi = new \WxPayApi();
		$input = new \WxPayUnifiedOrder();
		$input->SetBody("在线付款@".$ordernum);
		$input->SetAttach("在线付款@".$ordernum);
		$input->SetOut_trade_no(date("YmdHis"));
	    $input->SetTotal_fee("1");
		$input->SetTime_start(date("YmdHis"));
		$input->SetTime_expire(date("YmdHis", time() + 600));
		$input->SetGoods_tag("亮剑在线支付");
		$input->SetNotify_url($this->returnurl);
		$input->SetTrade_type("JSAPI");
	
	//echo '='.$openId.'=';
		$input->SetOpenid($openId);
		$order =  $WxPayApi->unifiedOrder($input);
		$jsApiParameters = $tools->GetJsApiParameters($order);
		$this->assign("jsApiParameters",$jsApiParameters);
		$this->assign("orderarr",$orderarr);
		
		return view($this->C().'/wxpay');
    }
	
	
	
	/*
	  扫码支付
	*/
    public function qrpay()
    {		
		@header('Content-type:text/html;charset=utf-8');
		ini_set('date.timezone','Asia/Shanghai');
		//error_reporting(E_ERROR);
		//$wxpay_ROOT=$this->wxpay_ROOT;
		//require_once $wxpay_ROOT."/lib/WxPay.Api.php";
		//require_once $wxpay_ROOT."/WxPay.NativePay.php";
        Vendor('WxPay.wxautoload');
		$ordernum='11';
		
		$ordernum=1;
		$orderarr=array();
		$orderarr['allprice']=1;
		$SetTotal_fee=1;
		
		$notify = new \NativePay();
		$url1 = $notify->GetPrePayUrl("123456789");
		
		//②、统一下单
		$input = new \WxPayUnifiedOrder();
		
		$input = new \WxPayUnifiedOrder();
		$input->SetBody("在线付款@".$ordernum);
		$input->SetAttach("在线付款@".$ordernum);
		$input->SetOut_trade_no(date("YmdHis"));
	    $input->SetTotal_fee("1");
		$input->SetTime_start(date("YmdHis"));
		$input->SetTime_expire(date("YmdHis", time() + 600));
		$input->SetGoods_tag("亮剑在线支付");
		$input->SetNotify_url($this->returnurl);
		$input->SetTrade_type("NATIVE");
		$input->SetProduct_id("123456789");
		$result = $notify->GetPayUrl($input);
		$url2 = $result["code_url"];
		$this->assign("url1",$url1);
		$this->assign("url2",$url2);
		
		$this->assign("orderarr",$orderarr);
		
		return view($this->C().'/wxpay1');
    }
	
/**
 * 通知接口
*/
   
   public function notify()
   {
       // $wxpay_ROOT=$this->wxpay_ROOT;
		//include_once($wxpay_ROOT."log_.php");
		//include_once($wxpay_ROOT."WxPayPubHelper/WxPayPubHelper.php");
		Vendor('WxPay.wxautoload');
		file_put_contents("notidy_1.txt",'1111',true);
		//使用通用通知接口
		$notify = new \Notify_pub();
		$xml = file_get_contents("php://input");
		//$xml = input('post.');
		$notify->saveData($xml);
		if($notify->checkSign() == FALSE){
			$notify->setReturnParameter("return_code","FAIL");//返回状态码
			$notify->setReturnParameter("return_msg","签名失败");//返回信息
		}else{
			$notify->setReturnParameter("return_code","SUCCESS");//设置返回码
		}
		$returnXml = $notify->returnXml();
		$log_ = new \Log_();
		$log_name="notify_url.log";//log文件路径
		$log_->log_result($log_name,"【接收到的notify通知】:\n".$xml."\n");
		if($notify->checkSign() == TRUE)
		{
			file_put_contents("notidy_2.txt",'1111',true);
			if ($notify->data["return_code"] == "FAIL") {
				$log_->log_result($log_name,"【通信出错】:\n".$xml."\n");
			}
			elseif($notify->data["result_code"] == "FAIL"){
				$log_->log_result($log_name,"【业务出错】:\n".$xml."\n");
			}
			else{
				$arr=file_put_contents("4.txt","2");
				$log_->log_result($log_name,"【支付成功】:\n".$xml."\n");
			}
			
			$arr=file_put_contents("app.txt",var_export($notify->data,true));
			$beizhu=$notify->data['attach'];
			$beizhu=explode("@",$beizhu);
			$ordernum=$beizhu['1'];
			
			
			$orderarr=M("order1_info")->where("`ordernum`='$ordernum'")->find();
			//print_r($orderarr);die;
			if(!$orderarr){
				exit();
			}
			if($orderarr['status']!='0'){
				exit();
			}
			if($orderarr['allprice']!=($notify->data['total_fee'])/100){
				exit();
			}
			$dataxg['status']='1';
			$orderarr1=M("order1_info")->where("`ordernum`='$ordernum'")->save($dataxg);
			
			//$m = M("order1_info")->where("`ordernum`='$ordernum'")->find();
			//print_r($m);die;
						$mid = $orderarr['mid'];
						$phone1 = M("member_info")->where("`id`='$mid'")->find();
						$phone = $phone1['phone'];
						$sffs = M("osms_info")->where("`ordernum`='$out_trade_no' and `zt`='1'")->find();
						if(empty($sffs)){
							$sms = $this->sms($phone,'您订单号:'.$ordernum.'下单成功请快速与工作人员联系');
						}
								file_put_contents("sqlp2.txt",M("osms_info")->getLastSql());
	
						$sdata['phone']=$phone;
						$sdata['ordernum']=$ordernum;
						$sdata['zt']=$sms;
						$sdata['ordertime']=date("Y-m-d H:i:s");
						M("osms_info")->add($sdata);
			
			file_put_contents("sqlp.txt",M("osms_info")->getLastSql());
			exit();
			
			
						
			//商户自行增加处理流程,
			//例如：更新订单状态
			//例如：数据库操作
			//例如：推送支付完成信息
		}
		
				$arr=file_put_contents("9.txt","2");
   
   }
      	
	
	
}
