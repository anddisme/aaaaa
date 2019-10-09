<?php
namespace app\admin\controller;
use app\admin\controller\Common;
use app\admin\model\Sql as SqlModel;
use think\db;

class Sql extends Common
{
	public function __construct(){
		parent::__construct();
	}
	
	public function index()
	{
		@header("Content-Type:text/html; charset=utf-8");
		$admin=getadmin();//检查登录
		$qx=qx('admin',$admin['UserType']);

		$sql = "show tables";
		$re = Db::query($sql);
		//print_r($re);die;




		$PageSize='20';
		$list=db::name('sql')->order('`id` asc')->paginate($PageSize);
		$this->assign("list",$list);	
		$this->assign("re",$re);
		$this->assign("fenye",$list->render());
		return view();
	}
		
	

	
	public function bak()
	{
		@header("Content-Type:text/html; charset=utf-8");
		$admin=getadmin();//检查登录
		$qx=qx('admin',$admin['UserType']);
			  
		$Dbobj=new SqlModel();
		$dbName = config('database');
		$dbName=$dbName['database'];
		
		$sqlstr=$Dbobj->ExportAllData();
		
	
		$filepath=$_SERVER['DOCUMENT_ROOT'].'/public/sqlbak/';
		
		$filename=date("Ymd_His").'.sql';
		$nowtime=date("Y-m-d H:i:s");
		$filenum=file_put_contents($filepath.$filename,$sqlstr);
		if($filenum)
		{
		  $db['Title']=$filename;
		  $db['file']=$filename;
		  $db['endtime']=$nowtime;
		  $db['size']=$filenum;
		  $sqlnum=db::name("sql")->insert($db);
		  if($sqlnum>0)
		  {
			   addlog('Sql/bak','数据库备份成功',Db::name('sql')->getLastSql());
			   echo json_encode(array('text'=>'数据库备份成功','url'=>url('Sql/index')));
			   exit();
		  }else{
			   addlog('Sql/bak','数据库备份失败',Db::name('sql')->getLastSql());
			   echo json_encode(array('text'=>'数据库备份失败','url'=>''));
			   exit();
		  }
		  
		  
		}else{
		   echo json_encode(array('text'=>'备份文件创建失败！','url'=>''));
		   exit();
		}
		//$this->display();	
	}
	

	
	


	
	

	
// +----------------------------------------------------------------------
// | 下载
// +----------------------------------------------------------------------

	public function download()
	{
	@header("Content-Type:text/html; charset=utf-8");
	$admin=getadmin();//检查登录
	$qx=qx('admin',$admin['UserType']);
	$id=get('id');
	$arr=db::name("sql")->where	("`id`='$id'")->find(); 
	  if(!$arr)
	  {
	    exit("<script> alert('备份不存在'); history.back();</script>");
	  }
	$file=$_SERVER['DOCUMENT_ROOT'].'/public/sqlbak/'.$arr['Title'];
	//echo $file;
	//exit;
	if (!file_exists($file)) {
	    exit("<script> alert('文件不存在'); history.back(); </script>");
    }
	 addlog('Sql/download','数据库备份下载',Db::name('sql')->getLastSql());
	
	/*输出下载*/	
	header('Content-Description: File Transfer');
	header('Content-Type: application/octet-stream');
	header('Content-Disposition: attachment; filename='.basename($file));
	header('Content-Transfer-Encoding: binary');
	header('Expires: 0');
	header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
	header('Pragma: public');
	header('Content-Length: ' . filesize($file));
	readfile($file);
	exit; 
	}

	
	
	
	
	
}
