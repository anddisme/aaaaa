<?php
namespace app\admin\controller;
use app\admin\controller\Common;
use think\db;
class Html extends Common
{
	public function __construct(){
		parent::__construct();
        
	}

public function Index()
{
	@header('Content-type:text/html;charset=utf-8');
	$admin=getadmin();//检查登录
	$qx=qx('admin',$admin['UserType']);
	if(config('html')=='0')
	{
		exit('html更新已关闭');
	}
	$POST=input('post.');
	$idlist=$POST['idlist'];
	$lmstr=implode(",",$idlist);

	$_SESSION['lmstr_session']='';
	
	if($idlist=='99999'){ exit();}
	if(request()->isPost())
	{
		$tpl=get('tpl');
		$type=get('type');
		if($type!='lm' && $type!='wz' && $type!='home' && $type!='all')
		{
		  exit('无法识别类型！');
		}
		//一键更新
		if($type=='all')
		{
			$_SESSION['lmstr_session']=$lmstr;
		}
		
		addlog('Html/index','更新HTML开始/'.$type.'/'.$tpl.'/');
		
		if($type=='home' || $type=='all')
		{//home
		    @header('HTTP/1.1 301 Moved Permanently');
			//echo "Location:".url("Html/makehomehtml")."?tpl=".$tpl;
			//exit;
			@header("Location:".url("Html/makehomehtml",array('tpl'=>$tpl))."?lmstr=".$lmstr);
		}
		
		if(count($idlist)<1)
		{
		  exit('请选择更新栏目！');
		}
		if($type=='lm')
		{//lm
		    @header('HTTP/1.1 301 Moved Permanently');
			//@header("Location:run.php?m=Html&tpl=".$tpl."&a=makehtml&lmstr=".$lmstr);
			//echo $lmstr;
			//exit;
			//echo "Location:".url("Html/makehtml",array('tpl'=>$tpl,'lmstr'=>$lmstr))."";
			//exit;

			//echo "Location:".url("Html/makehtml",array('tpl'=>$tpl))."?lmstr=".$lmstr;
			//exit;
			@header("Location:".url("Html/makehtml",array('tpl'=>$tpl))."?lmstr=".$lmstr);
			exit();
		}else if($type=='wz'){
		//mobile
		    @header('HTTP/1.1 301 Moved Permanently');
			@header("Location:".url("Html/articlehtml",array('tpl'=>$tpl))."?lmstr=".$lmstr);
			exit();
			@header("Location:run.php?m=Html&tpl=".$tpl."&a=articlehtml&lmstr=".$lmstr);
		}else{
		  exit('');
		}
	}
		return view();
}
	
/*lm*/
public function makehtml()
{
	@header('Content-type:text/html;charset=utf-8');
	$admin=getadmin();//检查登录
	$qx=qx('admin',$admin['UserType']);

	$tpl=get('tpl');
	$lmstr=get('lmstr');
	$lmarr=explode(",",$lmstr);
	$webroot=$_SERVER['DOCUMENT_ROOT'];
	$where="`id`='$lmarr[0]'";	  
	$typearr=db::name("lm")->where("$where")->Field("`id`,`weburl`,`PageSize`,`TypeName`,`nohtml`")->find();
	$lmdir=$_SERVER['DOCUMENT_ROOT'].'/'.$tpl.'/'.$typearr['weburl'];
	$lmdir=$lmdir.'/';
	$lmdir=str_replace('//','/',$lmdir);
	$lmdir=str_replace('///','/',$lmdir);
	$lmdir=str_replace('////','/',$lmdir);
	$lmdir=str_replace('/////','/',$lmdir);
	$lmdir=str_replace('//////','/',$lmdir);
	//start
	echo '<span style="color:#006600">'.$tpl.'-栏目更新中...</span><br />';
	if($typearr){
	  echo '<span style="color:red">['.$typearr['TypeName'].']</span><br />'; 
	}else{
	  exit('<span style="color:red">['.$typearr['TypeName'].']栏目不存在.</span><br />'); 
	}
	if($typearr['nohtml']!='1')
	{//nohtml==0
		$type=$_REQUEST['type'];  
		if($typearr['PageSize']=='默认'){ $typearr['PageSize']=16; }
		$idlist=getidlist($typearr['id']);
		$idlistarray=explode(",",$idlist);
		foreach($idlistarray as $v)
		{
			   $fjwhere.= " or `fjid` like '%,".$v.",%'"; 
		}	
		$AllNum=db::name("article")->where("`is_del` <>'1' and (`TypeID` in($idlist)  $fjwhere)")->count();
		//echo M("news_info")->getLastSql();
		//exit;
		$allpage=ceil($AllNum/$typearr['PageSize']);
		for($i=0;$i<=$allpage;$i++)
		{
		    $htmlname='list_'.$i.'.html';
		    if($i=='0')
			{
			  $htmlname='index.html';
			}
			
			//$url='http://'.$_SERVER['HTTP_HOST'].'/index.php?sc=1&tpl='.$tpl.'&p='.$i.'&m=App&TypeID='.$typearr['id'];
			
			//$url='http://'.$_SERVER['HTTP_HOST'].'/index.php/index/App/Index/TypeID/'.$typearr['id'].'';
			$url='http://'.$_SERVER['HTTP_HOST'].url("/index/App/index",array('TypeID'=>$typearr['id'],'html'=>'1'))."?page=".$i;
			//echo $url;
			//exit;
			$zt=$this->schtml($lmdir,$htmlname,$url,$tpl);
			if(trim($zt)=='1')
			{
				 echo $lmdir.$htmlname.'已生成.<br />';
			}else{
				 exit($zt);
			}
		}
	}else{//nohtml==1
		 echo '<span style="color:#FF6600">这个栏目为动态展示.</span><br />';
	}
	unset($lmarr[0]); 
	if(count($lmarr)>0)
	{
		$lmstr=implode(",",$lmarr);
		$tzurl=url("Html/makehtml",array('tpl'=>$tpl))."?lmstr=".$lmstr;
		//echo $tzurl;
		//exit;
		exit("<script> location='".$tzurl."'; </script>");
	}else{
	$lmstr_session=$_SESSION['lmstr_session'];
	addlog('Html/makehtml','更新栏目HTML完成');
	echo '<span style="color:#006600">完成所有更新.</span><br />';
	if(!empty($lmstr_session))
	{
//	echo $lmstr_session;
	//exit;
		echo '正在更新文档...';
		
		header("location:".url("Html/articlehtml",array('tpl'=>$tpl))."?lmstr=".$lmstr_session);
	}
	exit();
	}
}
//run.php?m=Html&tpl=default&a=articlehtml&lmstr=1,2,8,9,10,11,12,13,14,15,36,3,20,17,21,24,22,23,16,18,19,4,5,6,7,26,27,28,29,30,31,32,33,34,35
/*wz*/
public function articlehtml()
{
	@header('Content-type:text/html;charset=utf-8');
	$admin=getadmin();//检查登录
	$qx=qx('admin',$admin['UserType']);

    $lmstr=get('lmstr');
	$tpl=get('tpl');
	$page=get('page'); 
	if($page<1) { $page=1; }
	$where="`is_del` <>'1' and `TypeID` in($lmstr)";
	//import("ORG.Util.Page");
	$AllNum=db::name("article")->where("$where")->count();
	$PageSize=10;
	//$Page = new Page($AllNum,$PageSize);//
	$allpage=ceil($AllNum/$PageSize);
	
	$cpl=round($page/$allpage * 100 , 1) . "%";//已完成%
	if($allpage<1){ $cpl='100%';}
	echo '<span style="color:#006600">['.$tpl.']-文档更新中...已完成'.$cpl.'</span><br />';
	if($allpage<1){ exit('此栏目没有需要更新的文档');}
	
	$listnews = db::name("article")->where("$where")->order("`id` desc")->limit((($page-1)*$PageSize),$PageSize)->Field("`id`,`Title`,`TypeID`")->select();
	//$listnews=db::name('Article')->where("".$where."")->order("`id` desc")->paginate($PageSize);
	foreach($listnews as $k=>$v)
	{
		$typearr=db::name("lm")->where("`id`='$v[TypeID]'")->Field("`id`,`weburl`,`PageSize`,`TypeName`,`nohtml`")->find();
		$lmdir=$_SERVER['DOCUMENT_ROOT'].'/'.$tpl.'/'.$typearr['weburl'];
		$lmdir=$lmdir.'/';
		$lmdir=str_replace('//','/',$lmdir);
		$lmdir=str_replace('///','/',$lmdir);
		$lmdir=str_replace('////','/',$lmdir);
		$lmdir=str_replace('/////','/',$lmdir);
		$lmdir=str_replace('//////','/',$lmdir);
		if($typearr['nohtml']!='1')
		{//nohtml==0
		    $htmlname=$v['id'].'.html';
			//$url='http://'.$_SERVER['HTTP_HOST'].'/index.php/index/App/index/id/'.$v['id'].'&tpl='.$tpl;
			
			$url='http://'.$_SERVER['HTTP_HOST'].url('/Index/App/Index/',array('id'=>$v['id'],'tpl'=>$tpl));
			
			$zt=$this->schtml($lmdir,$htmlname,$url,$tpl);
			if(trim($zt)=='1')
			{
				 echo $lmdir.$htmlname.'已生成.<br />';
			}else{
				 exit($zt);
			}
		}else{
		 echo '<span style="color:#FF6600">这个栏目为动态展示.</span><br />';
		}
	}
	$page=$page+1;
	if($page<=$allpage)
	{
		//$tzurl="run.php?m=Html&tpl=".$tpl."&a=articlehtml&lmstr=".$lmstr."&p=".$p;
		$tzurl=url("Html/articlehtml",array('lmstr'=>$lmstr,'page'=>$page,'tpl'=>$tpl));
		exit("<script> location='".$tzurl."'; </script>");
	}else{
		addlog('Html/articlehtml','更新文档HTML完成');
		exit('<br /><span style="color:#006600">完成所有更新.</span>');
	}

}

/*home*/
public function makehomehtml()
{
	@header('Content-type:text/html;charset=utf-8');
	$admin=getadmin();//检查登录
	$qx=qx('admin',$admin['UserType']);
	
	$tpl=$_REQUEST['tpl'];
	$webpath=$_SERVER['DOCUMENT_ROOT'];
	$webpath.='/'.$tpl.'/';
	$thisutrl='http://'.$_SERVER['HTTP_HOST'].'/index.php?tpl='.$tpl;
	$sc=$this->schtml($webpath.$tplstr,'index.html',$thisutrl,$tpl);
	if($sc!=1) 
	{
		exit($sc);
	}else{
		addlog('Html/makehomehtml','更新首页HTML完成');
		echo $webpath.'index.html'.'<span style="color:#009900"><strong>已生成_<a target=_blank href='.$tplstr.'/index.html>浏览</a></strong></span>';
		$lmstr_session=$_SESSION['lmstr_session'];

		if(!empty($lmstr_session))
		{
			echo '正在更新栏目...';
			@header("Location:".url("Html/makehtml",array('tpl'=>$tpl))."?lmstr=".$lmstr_session);
			exit();
		}else{
			exit('<br />所有更新已完成！');
		}
	}
}
//http://www.music-xp.com/CmsApp/run.php?m=Html&tpl=default&a=makehtml&lmstr=22,23,16,18,19
	
/*生成html文件*/	
protected function schtml($webpath,$htmlname,$url,$tpl) {

	if(!is_dir($_SERVER['DOCUMENT_ROOT'].'/App/Index/view/'.$tpl))
	{
		return $tpl.'目录不存在!';
	}
	if(function_exists(curl_init))
	{
	  $content = $this->curl_file_get_contents($url); 	
	}else{
	  $content = file_get_contents($url);
	}
	
	$webpath=str_replace('/Index','',$webpath);
	$webpath=str_replace('/Index','',$webpath);
	if(!is_dir($webpath))
	{
		if (!mkdir(iconv("UTF-8", "GBK", $webpath),0777,true)){
			return "$webpath 创建失败";
		}
	}
	
	$htmlpath=$webpath.$htmlname;
	//$isfile=file_put_contents($htmlpath,$content);
    
	
	
		$fhtml=fopen($htmlpath,'w');
	if (is_writable($htmlpath)) {
		$isfile=fwrite($fhtml, $content);
		fclose($fhtml);
	}else{
		//  exit($htmlpath.'--<strong style="color:red">生成被终止，无写入权限.</strong>');
	}
	 
	
	//exit;
	if(!file_exists($htmlpath)) 
	{
	  return $htmlpath.$fhtml.$isfile.'生成失败';
	}else{
	  return '1';
	}
}		
	
	
	protected function curl_file_get_contents($durl){  
	  $ch = curl_init();  
	  curl_setopt($ch, CURLOPT_URL, $durl);  
	  curl_setopt($ch, CURLOPT_TIMEOUT, 5);  
	  curl_setopt($ch, CURLOPT_USERAGENT, _USERAGENT_);  
	  curl_setopt($ch, CURLOPT_REFERER,_REFERER_);  
	  curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);  
	  $r = curl_exec($ch);  
	  curl_close($ch);  
	   return $r;  
	}  

	


}
?>