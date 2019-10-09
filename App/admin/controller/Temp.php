<?php
namespace app\admin\controller;
use app\admin\controller\Common;
use app\admin\model\Ad as AdModel;
use think\db;
use think\Cookie;

class Temp extends Common
{
	public function __construct(){
		parent::__construct();
		$this->root=$_SERVER['DOCUMENT_ROOT'];
		$this->temp0='';
		$this->notshow='';

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
	    $root=$this->root;
		$temp0=$this->temp0;
		if(get('dirroot')!='')
		{
		  $temp0 =get('dirroot');	
		}
		$temp=$root.$temp0;
		$dir=delxg(get('dir').'/');
		if(!empty($dir))
		{
		  $dir=str_replace($this->temp0,'',$dir);	
		}
		$temp.=$dir;
		//php str_replace
		$tempshow=str_replace($_SERVER['DOCUMENT_ROOT'],'',$temp);
		//$listdir=scandir($temp);
		$temp=delxg($temp.'/');
		$notshow=array('index.php','ht.php','vendor','admin','controller','model','mycore','config.php','command.php','common.php','database.php','route.php','tags.php','public','composer.json');
		$this->notshow=$notshow;
		$temp = iconv('UTF-8','GB18030', $temp );
		if(!is_file($temp) && !is_dir($temp))
		{
		  addlog('Temp/index','获取文件列表错误：文件或文件夹不存在'.$temp);
		  $this->error('文件或文件夹不存在',url('Temp/index'));	
		}
		
		$temp10=array_filter(explode("/",$temp));
		$temp10size=sizeof($temp10);
		if(in_array($temp10[$temp10size-1],$notshow))
		{
			addlog('Temp/index','获取文件列表错误：文件或文件夹路径非法'.$temp10[$temp10size-1]);
			$this->error('文件或文件夹路径非法',url('Temp/index'));	
		}
		
		$listdir = array_diff(scandir($temp),array('.','..'));
       // $filelist=getfile($temp);
	   
	   foreach($listdir as $k=>$v)
	   {
		 if(!in_array($v,$notshow))
		 {
			 $pathtype=pathtype(delxg($tempshow.'/'.$v));
			 $v = mb_convert_encoding($v, 'UTF-8', 'gbk');
			 //$v = mb_convert_encoding($v, 'gbk', 'UTF-8');
			 if($pathtype['type']!='file')
			 {
			   $list1[]=$v; 
			 }else{
			   $list2[]=$v; 
			 }
		 }
	   }
	   if(sizeof($list1)>0 && sizeof($list2)>0)
	   {
	    $list3=array_merge($list1, $list2);
	   }else{
		 if(sizeof($list1)>0){ $list3=$list1; } elseif(sizeof($list2)>0){ $list3=$list2; } else {  $list3=array_merge($list1, $list2); }  
	   }
		$this->assign("listdir",$list3);
		$this->assign("tempshow",$tempshow);
		$this->assign("temp0",$temp0);
		$this->assign("dir",$dir);
		$this->assign("filelist",$filelist);
		$this->assign("dirlist",$dirlist);
		$this->assign("temp",$temp);
		//exit($PageSize);
		addlog('Temp/index','文件管理列表'.$tempshow);
		return view();
	}
		
// +----------------------------------------------------------------------
// | 打包
// +----------------------------------------------------------------------
	public function ziprar()
	{
		@header("Content-Type:text/html; charset=utf-8");
		$admin=getadmin();//检查登录
		$qx=qx('admin',$admin['UserType']);
		$files=$_REQUEST['files'];
		if($files=='/')
		{
		  $files=$_SERVER['DOCUMENT_ROOT'];	
		  $nowdir=$_SERVER['DOCUMENT_ROOT'];
		}else{
		    $nowdir=$files;
			$nowdir1=pathinfo($nowdir);
			if($nowdir1['extension']!='')
			{
			  $nowdir=$nowdir1['dirname'];
			}
		}
			
		$files1=$this->root.'/'.$this->temp0.'/'.$files;
		$files1=str_replace('//','/',$files1);
		$files1=str_replace('//','/',$files1);
		//最终生成的文件名（含路径）
		$tempshow=get('tempshow');
		if(!empty($tempshow))
		{
		  $filename=$tempshow.'/'.date("YmdHis").'.zip'; 
		}else{
		  $filename=$nowdir.'/'.date("YmdHis").'.zip'; 
		}
		$filename=delxg($filename); 
		
		$filename=$this->temp0.date("YmdHis").'.zip'; 
		$root=$_SERVER['DOCUMENT_ROOT'];
		$file=WEB_ROOT.'/'.$filename;
		if(file_exists($file)){   unlink($file); }
		//重新生成文件
		$zip=new \ZipArchive();
		
 		if($zip->open($file,\ZIPARCHIVE::CREATE)!==TRUE){  
		addlog('Temp/ziprar','生成zip压缩文件失败/'.$file);
		$this->error('无法打开zip文件，或者压缩文件创建失败');
		
}
		//$files=get('files');
		$files=explode(",",$files);
	
		$oldpathurl=$nowdir;
		if(!empty($tempshow))
		{
		  $oldpathurl=$tempshow;	
		}	
	
		foreach($files as $k=>$v)
		{
				$filelist='';
				$filelist=WEB_ROOT.'/'.$v;	
				$filelist=str_replace('//','/',$filelist);
				$listfile[]=$filelist;
				//$v=delxg($v);
			//echo $tempshow;
			//exit;
				addFileToZip($v, $zip,$oldpathurl,$this->temp0);
		}
		$zip->close(); //
		addlog('Temp/ziprar','生成zip压缩文件成功/'.$filename);
		echo '<span style=" color:#060;">/'.$filename.'|打包命令已发送！请稍后查看文件压缩情况'."</span>";
		exit();
	}
	
	
	
	
	
	
	

	
// +----------------------------------------------------------------------
// | 解压缩
// +----------------------------------------------------------------------

	public function zipfile()
	{
		@header("Content-Type:text/html; charset=utf-8");
		$admin=getadmin();//检查登录
		$qx=qx('admin',$admin['UserType']);
		$files=get('files');
		$files = iconv('UTF-8','GB18030', $files );
		
		
		$file=WEB_ROOT.'/'.$files;
		$file=str_replace('//','/',$file);
		$file=str_replace('///','/',$file);
		$file=iconv('gbk','UTF-8',urldecode($file));
		$fileinfo=pathinfo($file);
		if (!file_exists($file) || $fileinfo['extension']!='zip') {
			addlog('Temp/ziprar','解压zip文件失败/'.$file);
			$this->error('zip文件不存在');
		}
		$WEB_ROOT=WEB_ROOT.'/';
		$WEB_ROOT=delxg($WEB_ROOT);
		$topath=str_replace($WEB_ROOT,'',$file);
		$topath=pathinfo($topath);
		$dirname=$topath['dirname'];
		$filename=$topath['filename'];
		if(empty($filename)){ $filename = time("YmdHis"); }
		$dirname1=delxg($dirname.'/'.$filename);
		
		if(!is_dir($dirname))
		{
		  addlog('Temp/ziprar','解压存放路径不正确/'.$dirname);
		  exit('解压存放路径不正确');	
		}
		
		$zip=new \ZipArchive;
		if($zip->open(''.$file.'')===TRUE){ 
		$zip->extractTo(''.$dirname1.'');
		$zip->close();
		if(is_dir($dirname1))
		{
		  $retrunpath=delxg('/'.$dirname.'/');	
		  addlog('Temp/ziprar',"文件解压成功：".$dirname1);
		  $this->success("文件已经解压到：".$dirname1,url('Temp/index').'?dir='.$retrunpath);	
		}
		
		
		
		
} 
		
		
		
		
		
	}


	
	
	

	
// +----------------------------------------------------------------------
// | 下载
// +----------------------------------------------------------------------

	public function download()
	{
		@header("Content-Type:text/html; charset=utf-8");
		$admin=getadmin();//检查登录
		$qx=qx('admin',$admin['UserType']);
		$files=$_REQUEST['files'];
		$files = iconv('UTF-8','GB18030', $files );
		$file=$_SERVER['DOCUMENT_ROOT'].$files;
		$file=str_replace('//','/',$file);
		$file=str_replace('///','/',$file);
		$file=iconv('gbk','UTF-8',urldecode($file));
		
		if (!file_exists($file)) {
		}
		
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









	
	public function add(){
	
		@header("Content-Type:text/html; charset=utf-8");
		$admin=getadmin();//检查登录
		$qx=qx('admin',$admin['UserType']);
		
		if(request()->isPost())
		{
			$POST=input('post.');
			$TypeObj=db::name('ad');
			$data=$POST;
			$query=request();
			$tempshow=urldecode($POST['tempshow']);
			$tempshow1=urlencode(urldecode($POST['tempshow']));
			$movepath=delxg(WEB_ROOT.'/'.$tempshow.'/');
			//echo $movepath;
			//exit;
			$filepath = request()->file('myFile');
			if(!$filepath)
			{
			  addlog('Temp/add','上传文件错误：请选择要上传的文件');
			  $this->error('请选择要上传的文件',url("Temp/index").'?dir='.$tempshow);		
			}
			$movepath = iconv("GB2312", "UTF-8", $movepath);

			$moveinfo = $filepath->validate(['size'=>(((1024*1024)*1024)*10),'ext'=>'gif,jpg,png,bmg,txt,html,js,css,zip'])->rule('uniqid')->move($movepath,'');
			
			
			if($moveinfo)
			{
				addlog('Temp/add','上传文件成功：'.$moveinfo->getSaveName());
				$url=url("Temp/index").'?file='.$moveinfo->getSaveName().'&dir='.$tempshow1;
				
			  header("location:".$url);
			}else{
				//echo $filepath->getError();
			  addlog('Temp/add','上传文件错误：'.$filepath->getError());
			  $this->error($filepath->getError(),url("Temp/index").'?dir='.$tempshow1);		
			}
			
			
			
		}
			exit();
	}
	
	
	
	
	
	
	
	
// +----------------------------------------------------------------------
// | 修改
// +----------------------------------------------------------------------
public function updata()
{
		@header("Content-Type:text/html; charset=utf-8");
		$admin=getadmin();//检查登录
		$qx=qx('admin',$admin['UserType']);
		$root=$_SERVER['DOCUMENT_ROOT'];
		$files=$root.'/'.get('files');
		//$files = iconv('UTF-8','GB18030', $files );
		$files=str_replace('//','/',$files);
		$files=str_replace('///','/',$files);
	 

		if (!file_exists(mb_convert_encoding($files,'gbk'))) {
		  $this->error('文件不存在，修改失败');
		}
       	
		$contents=file_get_contents($files);
		$filespath=pathinfo($files);
		$file_path_name=$filespath['filename'];
		$file_path_ext=$filespath['extension'];
		
		$filespath0=$filespath['dirname'];
		$filespath=str_replace($_SERVER['DOCUMENT_ROOT'],'',$filespath0);

	
		if(request()->isPost())
		{
			    $POST=input('post.');
				$TypeObj=db::name('ad');
				$contents=$POST['contents'];
			
				$copy_destination=$filespath0.'/#'.date("YmdHis").'_'.$file_path_name.'.'.$file_path_ext;
		        $copy_destination=str_replace('//','/',$copy_destination);
				copy($files,mb_convert_encoding($copy_destination,'gbk'));
				$num=file_put_contents($files,$contents);
			if($num>0)
			{
				msg('1','修改成功',url('Temp/index').'?dirroot='.urlencode($filespath));exit();
			}else{
				msg('-1','修改失败');exit();
			}
		}
	
	$this->assign("contents",$contents);
	$this->assign("files",get('files'));
	return view("temp/add");
}	

	
	
	
	
	
	
	
	
}
