<?php
namespace app\admin\controller;
use app\admin\controller\Common;
use app\admin\model\Ad as AdModel;
use think\db;
use think\Cookie;

class Prosx extends Common
{
	public function __construct(){
		parent::__construct();
		//$this->GET=Request::instance()->param();
	}
	
	public function index()
	{
		@header("Content-Type:text/html; charset=utf-8");
		$admin=getadmin();//检查登录
		$qx=qx('admin',$admin['UserType']);
        

		
		$pid=get('pid');
		$this->assign('pid',$pid);
		$parr=db::name("prosx")->where("`id`='".$pid."'")->find();
		
		if($parr) {
		  	$and=" and `pid`='".$pid."'";
		  	$this->assign('parr',$parr);
		}else{
		 	 $and=" and `pid`='0'";
		}
	
		
		
		
		$PageSize='30';
		if(get('PageSize')>0){ Cookie::set('PageSize',get('PageSize')); }
		if(Cookie::get('PageSize')>0) { $PageSize=Cookie::get('PageSize');}
		$kw=get('kw');
		if(!empty($kw)){ $and.=" and (`cat_name` like '%".$kw."%'  )"; }
		
		$list=db::name('prosx')->where("`id`>'0' $and")->order('`id` asc')->paginate($PageSize);
		$this->assign("list",$list);
		//exit($PageSize);
		$this->assign("PageSize",$PageSize);
		$this->assign("fenye",$list->render());	
		//addlog('City/index','获取城市列表',Db::name('city')->getLastSql());
		return view();
	}



	public function sxlist()
	{
		@header("Content-Type:text/html; charset=utf-8");
		$admin=getadmin();//检查登录
		$qx=qx('admin',$admin['UserType']);

		$pid=get('pid');
		//print_r($pid);die;
		$this->assign('pid',$pid);
		$parr=db::name("prosx")->where("`id`='".$pid."'")->find();

		if($parr) {
			$and=" and `pid`='".$pid."'";
			$this->assign('parr',$parr);
		}else{
			$and=" and `pid`='0'";
		}

		$PageSize='30';
		if(get('PageSize')>0){ Cookie::set('PageSize',get('PageSize')); }
		if(Cookie::get('PageSize')>0) { $PageSize=Cookie::get('PageSize');}
		$kw=get('kw');
		//print_r($kw);die;
		if(!empty($kw)){ $and.=" and (`attr_name` like '%".$kw."%' || `attr_values` like '%".$kw."%' )"; }

		$list=db::name('prosx')->where("`id`>'0' $and")->order('`id` asc')->paginate($PageSize);
		//print_r(db::name('prosx')->getLastSql());die;
		$this->assign("list",$list);
		//exit($PageSize);
		$this->assign("PageSize",$PageSize);
		$this->assign("fenye",$list->render());
		//addlog('City/index','获取城市列表',Db::name('city')->getLastSql());
		return view();
	}



	public function ajaxsx()
	{
		@header("Content-Type:text/html; charset=utf-8");
		$admin=getadmin();//检查登录
		$qx=qx('admin',$admin['UserType']);
		$id=get('id');
		$vid=get('vid');

		if($vid>0){
			$where=" `id`>'0' and `id`='".$vid."'";
			$info1=Db::name("prosx")->where("$where")->find();
			if($info1['id']<0){
				exit();
			}
			echo json_encode($info1);
			exit;
		}
		if($id<1) { exit(); }
		$where=" `id`>'0' and `pid`='".$id."'";
		$info=Db::name("prosx")->where("$where")->order("`id` asc")->select();
        echo json_encode($info);
		exit;

	}

	

	
	public function add(){
	
		@header("Content-Type:text/html; charset=utf-8");
		$admin=getadmin();//检查登录
		$qx=qx('admin',$admin['UserType']);
		$pid =$_REQUEST['pid'];
		$this->assign('pid',$pid);
		if(request()->isPost())
		{
			$POST=input('post.');
			$TypeObj=db::name('prosx');
			$data=$POST;
			$data['endtime'] = date("Y-m-d H:i:s");
			//dump($data);
			//exit;
			$num=Db::name('prosx')->insert($data);
			//$Lastids=Db::name('prosx')->getLastInsID();
			if($num>0)
			{
				//addlog('City/add','新增城市成功',Db::name('City')->getLastSql());
				msg('1','数据已添加');exit();
			}else{
				//addlog('City/add','数据城市未添加',Db::name('City')->getLastSql());
				msg('-1','数据未添加');exit();
			}
			}
		$this->assign('type','添加');
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
		$links=db::name("prosx")->find($id);
		if(!$links)
		{
		   $this->error('数据不存在1');
		}
		$pid = $links['pid'];
		$this->assign("pid",$pid);
		if(request()->isPost())
		{
			    $POST=input('post.');
				$TypeObj=db::name('prosx');
				$data=$POST;
				$data['endtime'] = date("Y-m-d H:i:s");
		        $num=Db::name('prosx')->where("`id`='$id'")->update($data);
				//$Lastids=Db::name('links')->getLastInsID();
			if($num>0)
			{
				//addlog('city/updata','修改城市成功',Db::name('city')->getLastSql());
				msg('1','修改成功',url('prosx/index'));exit();
			}else{
				//addlog('ad/updata','修改城市失败',Db::name('city')->getLastSql());
				msg('-1','修改失败');exit();
			}
		}
	$this->assign("links",$links);
	$this->assign("type",'修改');
	return view("prosx/add");
}	

	
	
	
	
	
	
	
	
}
