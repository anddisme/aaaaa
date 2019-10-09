<?php
namespace app\admin\controller;
use app\admin\controller\Common;
use app\admin\model\Web as WebModel;
use think\db;

class Web extends Common
{
	public function __construct(){
		parent::__construct();
	//	$this->webmodel=new WebModel();
		//exit('123');
		//$this->GET=Request::instance()->param();
	}
	
    public function index(){
		@header("Content-Type:text/html; charset=utf-8");
		$admin=getadmin();//检查登录
		$qx=qx('admin',$admin['UserType']);
	if(request()->isPost())
	{
			$POST=input('post.');
			$data=$POST;
			$data['enduptime']=date("Y-m-d H:i:s");	
		    $num=Db::name('web')->where("`id`='1'")->update($data);
		//	echo $num;
		//	exit;
			//echo Db::name('web')->getLastSql();
			//exit;
		    $runtime_path=RUNTIME_PATH;
			$this->dir_delete($_SERVER['DOCUMENT_ROOT'].'/temp/');
			$this->dir_delete($runtime_path.'/log/');
			$this->dir_delete($runtime_path.'/cache/');
			
			if(is_file($runtime_path.'~app.php'))@unlink($runtime_path.'~app.php');
			//F('webconfig',$data,$runtime_path.'/Data/');
			file_put_contents($runtime_path.'/webconfig.php',var_export($data,true));
			if($num>0)
			{
				if($data['cache']!=1){
		         	if(is_file($_SERVER['DOCUMENT_ROOT'].'/index.html'))@unlink($_SERVER['DOCUMENT_ROOT'].'/index.html');
					}
				addlog('Web/index','更新系统配置成功',Db::name('web')->getLastSql());
				echo json_encode(array("status"=>'1',"message"=>"更新成功"));
				exit();			
			}else{
				addlog('Web/index','更新系统配置失败',Db::name('web')->getLastSql());
				echo json_encode(array("status"=>'-1',"message"=>"更新失败"));
				exit();
			}			
	}
	
			//if (S('info')) { 
			//$info = S('info'); 
			//}else{
			$info=db::name("web")->find(1);
			$this->assign("info",$info);
		return view();
	}
		
	
	
	public function delcache()//Clear_Cache
	{	
		      @header('Content-type:text/html;charset=utf-8');

		$runtime_path=RUNTIME_PATH;

		$this->dir_delete($_SERVER['DOCUMENT_ROOT'].'/log/');
		//echo $runtime_path.'temp/';
		//exit;
		$this->dir_delete($runtime_path.'temp/');
		$this->dir_delete($runtime_path.'/cache/');
		//if(is_file($runtime_path.'~app.php'))@unlink($runtime_path.'~app.php');
		$m=db::name('web');
		$webset=$m->find(1);
		file_put_contents($runtime_path.'/webconfig.php',var_export($webset,true));
		//$this->assign('jumpUrl',U('Index/main'));
		addlog('Web/delcache','更新系统缓存');
		$this->success("网站更新完成...",url('Index/main'));
		//echo '<span style="color:red">网站更新完成...</span>';
		//exit();
	}
	public function dir_delete($dir) {
		$dir = $this->dir_path($dir);
		if (!is_dir($dir))
			return FALSE;
		$list = glob($dir . '*');
		foreach ($list as $v) {
			is_dir($v) ? $this->dir_delete($v) : @ unlink($v);
		}
		return @ rmdir($dir);
	}
	
	public function dir_path($path) {
		$path = str_replace('\\', '/', $path);
		if (substr($path, -1) != '/')
			$path = $path . '/';
		return $path;
	}	
	
}
