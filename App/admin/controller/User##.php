<?php
namespace app\admin\controller;
use app\admin\controller\Common;
use app\admin\model\User as UserModel;
use think\db;

class User extends Common
{
	public function __construct(){
		parent::__construct();
		$this->Usermodel=new UserModel();
		//exit('123');
		//$this->GET=Request::instance()->param();
	}
	
	public function index()
	{
		@header("Content-Type:text/html; charset=utf-8");
		$this->assign('mtype','2');
		$PageSize='15';
		$list=db::name('user')->order('`id` asc')->paginate($PageSize);
		$this->assign("list",$list);	
		$this->assign("fenye",$list->render());	
		return view();
	}
		
	

	
    public function add(){
		
		@header("Content-Type:text/html; charset=utf-8");
		if(request()->isPost())
		{
			    $POST=input('post.');
				$TypeObj=db::name('user');
				$data=$POST;
				$data['UserType']=implode(",",$POST['UserType']);
				$data['passWord']=md5($POST['UserType']);
				$data['endtime'] = date("Y-m-d H:i:s");
				//dump($data);
				//exit;
				$num=Db::name('user')->insert($data);
				$Lastids=Db::name('user')->getLastInsID();
			if($num>0)
			{
				msg('1','数据已添加');exit();
			}else{
				msg('-1','数据未添加');exit();
			}
		}
        return view();
    }


	
	
	
	
	
	
// +----------------------------------------------------------------------
// | 修改
// +----------------------------------------------------------------------
public function updata()
{
		@header("Content-Type:text/html; charset=utf-8");
		$id=get('id');
		if(!is_numeric($id))
		{
		   $this->error('数据不存在');
		}
		$links=db::name("User")->find($id);
		if(!$links)
		{
		   $this->error('数据不存在1');
		}
		if(request()->isPost())
		{
			    $POST=input('post.');
				$TypeObj=db::name('user');
				$data=$POST;
				$data['UserType']=implode(",",$POST['UserType']);
				if(empty($POST['PassWord']))
				{
				  unset($data['PassWord']); 
				}else{
				  $data['PassWord']=md5($POST['PassWord']);
				}
				$data['endtime'] = date("Y-m-d H:i:s");
		        $num=Db::name('user')->where("`id`='$id'")->update($data);
				//$Lastids=Db::name('links')->getLastInsID();
			if($num>0)
			{
				msg('1','修改成功',url('User/index'));exit();
			}else{
				msg('-1','修改失败');exit();
			}
		}
	$this->assign("links",$links);
	return view("user/add");
}

// +----------------------------------------------------------------------
// | 修改密码
// +----------------------------------------------------------------------
	public function xgmm()
	{
		@header("Content-Type:text/html; charset=utf-8");
		$id=get('id');
		if(!is_numeric($id))
		{
			$this->error('数据不存在');
		}
		$links=db::name("User")->find($id);
		if(!$links)
		{
			$this->error('数据不存在1');
		}
		if(request()->isPost())
		{
			$POST=input('post.');
			$TypeObj=db::name('user');
			$data=$POST;
			$data['UserType']=implode(",",$POST['UserType']);
			if(empty($POST['PassWord']))
			{
				unset($data['PassWord']);
			}else{
				$data['PassWord']=md5($POST['PassWord']);
			}
			$data['endtime'] = date("Y-m-d H:i:s");
			$num=Db::name('user')->where("`id`='$id'")->update($data);
			//$Lastids=Db::name('links')->getLastInsID();
			if($num>0)
			{
				msg('1','修改成功',url('User/index'));exit();
			}else{
				msg('-1','修改失败');exit();
			}
		}
		$this->assign("links",$links);
		return view("user/add");
	}








}
