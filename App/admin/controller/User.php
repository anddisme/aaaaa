<?php
namespace app\admin\controller;
use app\admin\controller\Common;
use app\admin\model\User as UserModel;
use think\db;
use think\session;
use think\Cookie;


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
		$admin=getadmin();//检查登录
		$qx=qx('admin',$admin['UserType']);
		$this->assign('mtype','2');
		$PageSize='30';
		if(get('PageSize')>0){ Cookie::set('PageSize',get('PageSize')); }
		if(Cookie::get('PageSize')>0) { $PageSize=Cookie::get('PageSize');}
		$kw=get('kw');
		if(!empty($kw)){ $and=" and (`UserName` like '%".$kw."%' || `RealName` like '%".$kw."%' )"; }
		$list=db::name('user')->where("`id`>'0' and `UserName`<>'admin' $and")->order('`id` asc')->paginate($PageSize);
		$this->assign("list",$list);	
		$this->assign("PageSize",$PageSize);	
		$this->assign("fenye",$list->render());	
		addlog('User/index','获取管理员列表',Db::name('user')->getLastSql());
		return view();
	}
		
	

	
    public function add(){
		
		@header("Content-Type:text/html; charset=utf-8");
		$admin=getadmin();//检查登录
		$qx=qx('admin',$admin['UserType']);
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
				addlog('User/add','新增管理员成功',Db::name('user')->getLastSql());
				msg('1','数据已添加');exit();
			}else{
				addlog('User/add','新增管理员失败',Db::name('user')->getLastSql());
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
		$admin=getadmin();//检查登录
		$qx=qx('admin',$admin['UserType']);
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
				addlog('User/updata','修改管理员成功',Db::name('user')->getLastSql());
				msg('1','修改成功',url('User/index'));exit();
			}else{
				addlog('User/updata','修改管理员失败',Db::name('user')->getLastSql());
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
		//$id=get('id');
		$sess = Session::get();
		$id = $sess['admin']['id'];
		//print_r($id);die;
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
			//$data['UserType']=implode(",",$POST['UserType']);
			if(empty($POST['PassWord']))
			{
				$this->error('密码不能为空');
			}else{
				$data['PassWord']=md5($POST['PassWord']);
			}
			$data['endtime'] = date("Y-m-d H:i:s");
			$num=Db::name('user')->where("`id`='$id'")->update($data);
			//$Lastids=Db::name('links')->getLastInsID();
			if($num>0)
			{
				addlog('User/xgmm',$sess['admin']['UserName'].'修改登录密码成功',Db::name('user')->getLastSql());
				msg('1','修改成功',url('User/index'));exit();
			}else{
				addlog('User/xgmm',$sess['admin']['UserName'].'修改登录密码失败',Db::name('user')->getLastSql());
				msg('-1','修改失败');exit();
			}
		}
		$this->assign("links",$links);
		return view("User/xgmm");
	}
	 public  function logout(){
		 @header("Content-Type:text/html; charset=utf-8");
		 //print_r(00000);die;
		 $sess = Session::get();
		 $sess['admin'] = '';
		 return view("login/index");

	 }








}
