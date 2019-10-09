<?php
namespace app\admin\controller;
use app\admin\controller\Common;
use app\admin\model\Links as LinksModel;
use think\db;
use think\Cookie;


class Links extends Common
{
	public function __construct(){
		parent::__construct();
		$this->Linksmodel=new LinksModel();
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
		$list=db::name('links')->where("`id`>'0' $and")->order('`id` asc')->paginate($PageSize);
		$this->assign("list",$list);	
		$this->assign("PageSize",$PageSize);	
		$this->assign("fenye",$list->render());	
		addlog('Links/index','获取链接列表',Db::name('links')->getLastSql());
		return view();
	}
		
	

	
    public function add(){
		
		@header("Content-Type:text/html; charset=utf-8");
		$admin=getadmin();//检查登录
		$qx=qx('admin',$admin['UserType']);
		if(request()->isPost())
		{
			    $POST=input('post.');
				$TypeObj=db::name('lm');
				$data=$POST;
				$data['enduptime'] = date("Y-m-d H:i:s");
				//dump($data);
				//exit;
				$num=Db::name('links')->insert($data);
				$Lastids=Db::name('links')->getLastInsID();
			if($num>0)
			{
				addlog('Links/add','新增链接成功',Db::name('links')->getLastSql());
				msg('1','数据已添加');exit();
			}else{
				addlog('Links/add','新增链接失败',Db::name('links')->getLastSql());
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
		$links=db::name("links")->find($id);
		if(!$links)
		{
		   $this->error('数据不存在1');
		}
		if(request()->isPost())
		{
			    $POST=input('post.');
				$TypeObj=db::name('lm');
				$data=$POST;
				$data['enduptime'] = date("Y-m-d H:i:s");
		        $num=Db::name('links')->where("`id`='$id'")->update($data);
				//$Lastids=Db::name('links')->getLastInsID();
			if($num>0)
			{
				addlog('Links/updata','修改链接成功',Db::name('links')->getLastSql());
				msg('1','修改成功',url('Links/index'));exit();
			}else{
				addlog('Links/updata','修改链接失败',Db::name('links')->getLastSql());
				msg('-1','修改失败');exit();
			}
		}
	$this->assign("links",$links);
	return view("links/add");
}	

	
	
	
	
	
	
	
	
}
