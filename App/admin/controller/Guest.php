<?php
namespace app\admin\controller;
use app\admin\controller\Common;
use app\admin\model\Guest as GuestModel;
use think\db;
use think\Cookie;

class Guest extends Common
{
	public function __construct(){
		parent::__construct();
		$this->Guestmodel=new GuestModel();
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
		if(!empty($kw)){ $and=" and (`t1` like '%".$kw."%' || `t2` like '%".$kw."%' || `t3` like '%".$kw."%' || `t4` like '%".$kw."%' || `t5` like '%".$kw."%' )"; }
		$list=db::name('guest')->where("`id`>'0' $and")->order('`id` asc')->paginate($PageSize);
		$this->assign("list",$list);	
		$this->assign("PageSize",$PageSize);	
		$this->assign("fenye",$list->render());	
		addlog('Guest/index','获取留言列表',Db::name('guest')->getLastSql());
		return view();
	}
		
	

	
	
	
	
	
	
// +----------------------------------------------------------------------
// | 修改
// +----------------------------------------------------------------------
/*public function updata()
{
		@header("Content-Type:text/html; charset=utf-8");
		$id=get('id');
		if(!is_numeric($id))
		{
		   $this->error('数据不存在');
		}
		$links=db::name("kf")->find($id);
		if(!$links)
		{
		   $this->error('数据不存在1');
		}
		if(request()->isPost())
		{
			    $POST=input('post.');
				$TypeObj=db::name('guest');
				$data=$POST;
				$data['enduptime'] = date("Y-m-d H:i:s");
		        $num=Db::name('guest')->where("`id`='$id'")->update($data);
				//$Lastids=Db::name('links')->getLastInsID();
			if($num>0)
			{
				msg('1','修改成功',url('Uuest/index'));exit();
			}else{
				msg('-1','修改失败');exit();
			}
		}
	$this->assign("links",$links);
	return view("Uuest/add");
}	

	
	*/
	
	
	
	
	
	
}
