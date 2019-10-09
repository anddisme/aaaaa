<?php
namespace app\admin\controller;
use app\admin\controller\Common;
use app\admin\model\Ad as AdModel;
use think\db;
use think\Cookie;

class Ad extends Common
{
	public function __construct(){
		parent::__construct();
		$this->admodel=new AdModel();
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
		if(!empty($kw)){ $and=" and (`Title` like '%".$kw."%' || `links` like '%".$kw."%' )"; }
		$list=db::name('ad')->where("`id`>'0' $and")->order('`id` asc')->paginate($PageSize);
		$this->assign("list",$list);
		//exit($PageSize);
		$this->assign("PageSize",$PageSize);
		$this->assign("fenye",$list->render());	
		addlog('Ad/index','获取ad列表',Db::name('ad')->getLastSql());
		return view();
	}
		
	

	
	public function add(){
	
		@header("Content-Type:text/html; charset=utf-8");
		$admin=getadmin();//检查登录
		$qx=qx('admin',$admin['UserType']);
		if(request()->isPost())
		{
			$POST=input('post.');
			$TypeObj=db::name('ad');
			$data=$POST;
			$data['enduptime'] = date("Y-m-d H:i:s");
			//dump($data);
			//exit;
			$num=Db::name('ad')->insert($data);
			$Lastids=Db::name('ad')->getLastInsID();
			if($num>0)
			{
				addlog('Ad/add','新增成功',Db::name('ad')->getLastSql());
				msg('1','数据已添加');exit();
			}else{
				addlog('Ad/add','数据未添加',Db::name('ad')->getLastSql());
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
		$links=db::name("ad")->find($id);
		if(!$links)
		{
		   $this->error('数据不存在1');
		}
		if(request()->isPost())
		{
			    $POST=input('post.');
				$TypeObj=db::name('ad');
				$data=$POST;
				$data['enduptime'] = date("Y-m-d H:i:s");
		        $num=Db::name('ad')->where("`id`='$id'")->update($data);
				//$Lastids=Db::name('links')->getLastInsID();
			if($num>0)
			{
				addlog('ad/updata','修改ad成功',Db::name('ad')->getLastSql()); 
				msg('1','修改成功',url('Ad/index'));exit();
			}else{
				addlog('ad/updata','修改ad失败',Db::name('ad')->getLastSql()); 
				msg('-1','修改失败');exit();
			}
		}
	$this->assign("links",$links);
	return view("ad/add");
}	

	
	
	
	
	
	
	
	
}
