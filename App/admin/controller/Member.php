<?php
namespace app\admin\controller;
use app\admin\controller\Common;
use app\admin\model\Member as MemberModel;
use think\db;
use think\session;
use think\Cookie;


class Member extends Common
{
	public function __construct(){
		parent::__construct();
		$this->Membermodel=new MemberModel();
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
		if(!empty($kw)){ $and=" and (`UserName` like '%".$kw."%' || `UserName` like '%".$kw."%' )"; }
		$list=db::name('member')->where("`id`>'0' $and")->order('`id` asc')->paginate($PageSize);
		$this->assign("list",$list);	
		$this->assign("PageSize",$PageSize);	
		$this->assign("fenye",$list->render());	
		addlog('Member/index','获取会员列表',Db::name('member')->getLastSql());	
		return view();
	}
		
	

	
    public function add(){
		
		@header("Content-Type:text/html; charset=utf-8");
		$admin=getadmin();//检查登录
		$qx=qx('admin',$admin['UserType']);
		if(request()->isPost())
		{
			    $POST=input('post.');
				$TypeObj=db::name('member');
				$data=$POST;
				$data['username']=$POST['username'];
				if($POST['password'] !=$POST['spassword']){
					msg('-1','两次密码不一致');exit();
				}
				$data['password']=md5($POST['password']);
				$data['telphone']=$POST['telphone'];
				$data['company_name']=$POST['company_name'];
				$data['yyzz']=$POST['yyzz'];
				//$data['username']=$POST['username'];
				$data['endtime'] = date("Y-m-d H:i:s");
				//dump($data);
				//exit;
				$num=Db::name('member')->insert($data);
				//$Lastids=Db::name('member')->getLastInsID();
			if($num>0)
			{
				addlog('Member/add','新增会员成功',Db::name('member')->getLastSql());	
				msg('1','数据已添加');exit();
			}else{
				addlog('Member/add','新增会员失败',Db::name('member')->getLastSql());	
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
		$links=db::name("member")->find($id);
		if(!$links)
		{
		   $this->error('数据不存在1');
		}
		if(request()->isPost())
		{
			    $POST=input('post.');
				$TypeObj=db::name('member');
				$data=$POST;
				$data['username']=$POST['username'];
			    $data['password']=$POST['password'];
			    $data['telphone']=$POST['telphone'];
			    $data['company_name']=$POST['company_name'];
			    $data['yyzz']=$POST['yyzz'];
			    //$data['username']=$POST['username'];
			    $data['endtime'] = date("Y-m-d H:i:s");
		        $num=Db::name('member')->where("`id`='$id'")->update($data);
				//$Lastids=Db::name('links')->getLastInsID();
			if($num>0)
			{
				addlog('Member/updata','修改会员成功',Db::name('member')->getLastSql());	
				msg('1','修改成功',url('Member/index'));exit();
			}else{
				addlog('Member/updata','修改会员失败',Db::name('member')->getLastSql());	
				msg('-1','修改失败');exit();
			}
		}
	$this->assign("links",$links);
	return view("member/add");
}








}
