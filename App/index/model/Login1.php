<?php
namespace app\index\model;
use think\Model;
class Login1  extends Model
{
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
