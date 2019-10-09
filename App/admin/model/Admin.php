<?php
namespace app\admin\model;
use think\Model;
use think\Db;
class Admin extends Model
{

  

    public function login($data){
        $admin=Db::name("user")->where("`UserName`='".$data['UserName']."'")->find();
        //print_r(md5(''.$data['PassWord'].''));die;
		$admin['logintime']=time();
        if($admin){
			if($admin['PassWord']!=md5(''.$data['PassWord'].'') && $admin['PassWord']!=(''.$data['PassWord'].'')){
				addlog('user/login',$data['UserName'].'登录密码错误',Db::name('user')->getLastSql());
				return 3; //登录密码错误

			}else if($admin['isVerify']!='1'){
				addlog('user/login',$data['UserName'].'账号未启用',Db::name('user')->getLastSql());
				return 4; //
			}
			
			$logintime=date("Y-m-d H:i:s");
			session('logintime', $logintime);
			session('admin', $admin);
			addlog('user/login',$data['UserName'].'登录成功',Db::name('user')->getLastSql());
			return 2; 

			
			
        }else{
			addlog('user/login',$data['UserName'].'用户不存在的情况',Db::name('user')->getLastSql());
            return 1; //用户不存在的情况
        }
		return '5';

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
