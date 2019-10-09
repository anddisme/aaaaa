<?php
namespace app\admin\controller;
use app\admin\controller\Common;
use app\admin\model\Kf as KfModel;
use think\db;
use think\Cookie;


class Kf extends Common
{
	public function __construct(){
		parent::__construct();
		$this->kfmodel=new KfModel();
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
		$list=db::name('kf')->where("`id`>'0' $and")->order('`id` asc')->paginate($PageSize);
		$this->assign("list",$list);	
		$this->assign("PageSize",$PageSize);	
		$this->assign("fenye",$list->render());	
		addlog('Kf/index','获取客服列表',Db::name('Kf')->getLastSql());
		return view();
	}
		
	

	
    public function add(){
		
		@header("Content-Type:text/html; charset=utf-8");
		$admin=getadmin();//检查登录
		$qx=qx('admin',$admin['UserType']);
		
		if(request()->isPost())
		{
			    $POST=input('post.');
				$TypeObj=db::name('kf');
				$data=$POST;
				$data['enduptime'] = date("Y-m-d H:i:s");
				//dump($data);
				//exit;
				$num=Db::name('kf')->insert($data);
				$Lastids=Db::name('kf')->getLastInsID();
			if($num>0)
			{
				addlog('Kf/add','新增客服成功',Db::name('kf')->getLastSql());
				msg('1','数据已添加');exit();
			}else{
				addlog('Kf/add','新增客服失败',Db::name('kf')->getLastSql());
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
		$links=db::name("kf")->find($id);
		if(!$links)
		{
		   $this->error('数据不存在1');
		}
		if(request()->isPost())
		{
			    $POST=input('post.');
				$TypeObj=db::name('kf');
				$data=$POST;
				$data['enduptime'] = date("Y-m-d H:i:s");
		        $num=Db::name('kf')->where("`id`='$id'")->update($data);
				//$Lastids=Db::name('links')->getLastInsID();
			if($num>0)
			{
				addlog('Kf/updata','修改客服成功',Db::name('kf')->getLastSql());
				msg('1','修改成功',url('Kf/index'));exit();
			}else{
				addlog('Kf/updata','修改客服失败',Db::name('kf')->getLastSql());
				msg('-1','修改失败');exit();
			}
		}
	$this->assign("links",$links);
	return view("kf/add");
}	

	
	
	
	
	
	
	
	
}
