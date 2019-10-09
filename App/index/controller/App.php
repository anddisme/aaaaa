<?php
namespace app\index\controller;
use think\Cache;
class App extends Common
{






public function _initialize(){
	$this->think();
	$this->wjt=config('wjt');
}


//功能部分
protected function pubmodu($TypeID)
{
	$TypeArr=typearr($TypeID);
	if(!is_numeric($TypeArr['id'])) { 
	    exit(r404('栏目数据不存在'));
	 }
	$patharr=typepatharr($TypeID);//获取路径ID数组
	$this->patharr=$patharr;
	$this->TypeID=$TypeID;
	
	//print_r($TypeArr);
	
	$this->TypeArr=$TypeArr;
	$this->toparr=typearr($patharr[1]);
	$this->blm=$patharr[1];
	$this->pathmenu1=pathmenu1($TypeID,'<li class="interval"></li>');
	$this->assign('pathmenu',pathmenu($TypeID,' > '));
	$this->assign('TypeArr',$TypeArr);
	$this->assign('toparr',$toparr);
	$this->assign('blm',$this->blm);
	$this->assign('patharr',$patharr);
	
	
	
	
}




/*入口*/
public function index() {  
	@header('Content-type:text/html;charset=utf-8');
	//处理URL
	
	$TypeID=get('TypeID');
	
	if(!is_numeric($TypeID))
	{//?TypeID==NULL
		$urltop=get('url');
		$url=get('url');
		//echo $url;
		//exit;
		$url=$_SERVER['REQUEST_URI'];
		$url=strtolower($url);
		
		$url=str_replace('%','',$url);
		$url=str_replace('/a/','/',$url);
		$url=str_replace('"','',$url);
		$url=str_replace(' ','',$url);
		$url=str_replace("'","",$url);
		$url=str_replace("/index.php/index/app/index/url/","/",$url);
		$this->url=$url;
		//$url=$this->url();
		if ($this->url!='')
		{		
			if ($url!=str_replace('?','',$url))
			{
				$uarr=explode('?',$url);
				$key=$uarr[1];
				$key=$_GET['k'];
				$url=$uarr[0];				
				$uarr=explode('?',$url);
				$pagex=(int)$uarr[1];
				$page=(int)$_GET['p'];
				$url=$uarr[0];
			}
			$url2=$url.'/';
			$url2=str_replace('//','/',$url2);


			$url2=str_replace('.html','',$url2);
			$urltype=db("lm")->where("`weburl`='$url2'")->order("`id` desc")->find();
			$TypeID=$urltype['id'];
		}
		
		if(!is_numeric($TypeID))
		{
			$url=explode('/',$url);
			$num=count($url);
			$url=$url[$num-1];
			preg_match_all('/\d+/',$url,$arr);
			$this->id=$arr[0][0];
			if(!is_numeric($this->id))
			{
				header("Location:/?404=$id"); 
				exit();
			}
			$temp = $this->view();
            return view($this->C().'/'.$temp);
			exit();
		}
    }			
	
	//列表和图文页面
	if(!is_numeric($TypeID)){  exit(r404('栏目不存在'.$TypeID)); }
	
		$TypeID=lmfirst($TypeID);
		$TypeID=lmfirst($TypeID);
		$TypeID=lmfirst($TypeID);
	
	
	
	$this->pubmodu($TypeID);
	$TypeArr=$this->TypeArr;
	$this->assign("TypeArr",$TypeArr);
	$px="`istop` desc,`endtime` desc,`id` desc";
	if($TypeArr['newsid']==1)
	{
		//图文栏目
		$article=db("article")->where("`is_del` <>'1' and `TypeID`='$TypeID' ")->order("$px")->find();
		//print_r($article);
		//exit;
		$article['imglist']=db("img")->order("`id` asc")->where("`nid`='$page[id]'")->select();
		$this->assign("article",$article);
	}else{
		//列表
		$idlist=getidlist($TypeID);
		//获取附属栏目的文档
		$idlistarray=explode(",",$idlist);
		foreach($idlistarray as $v)
		{
			$fjwhere.= " or `fjid` like '%,".$v.",%'"; 
		}	
		$where = "`is_del` <>'1' and `isVerify`='1' and  (`TypeID` in($idlist)".$fjwhere.")";
		$PageSize=12;
		if(is_numeric($TypeArr['PageSize']) && $TypeArr['PageSize']>0)
		{
			$PageSize = $TypeArr['PageSize'];
		}
		$sc=$_REQUEST['sc'];
		if($sc==1)
		{
		 import("ORG.Util.fenye");
		}else{
		 import("ORG.Util.Page");
		}
		//$AllNum=db("article")->where("$where")->count();	
		//$Page = new page($AllNum,$PageSize,'',$this->wjt);//
		//$this->assign('fenye',$Page->show());
		//$listnews = M("news_info")->where("$where")->order("$px")->limit($Page->firstRow.','.$Page->listRows)->select();
		//echo $PageSize;
		//exit;
		$list=db('Article')->where(''.$where.$and.'')->order($px)->paginate($PageSize);
		//print_r(db('Article')->getLastSql());die;
	
		$this->assign('fenye',$list->render());
		$this->assign('list_array',$list);
	}
	//print_r($list_array);
	//exit;
  $temp="list";
  if(!empty($TypeArr['temp']))  { $temp=$TypeArr['temp'];}
 
 /*$webroot=$_SERVER['DOCUMENT_ROOT'];
    $htmlpath=$TypeArr['weburl'];
    $htmlname='index.html';
 	$p=$_REQUEST['p'];
	if($p>1)
	{
      $htmlname='list_'.$p.'.html';
	}
	$p=$_GET['p'];
	$tpl=$_GET['tpl'];
	if($_REQUEST[html]==1)
	{
	//echo $TypeID;
	//exit;
	echo $this->schtml($htmlpath,$htmlname,$TypeID,'lm',$p,$tpl);
	exit;
	}*/

		$this->assign('TypeID',$TypeID);
		$fm=get('fm');
		//echo $fm;
		//exit;
		if($fm>0)
		{
		  $temp='fm';	
		}

	$re = new Cache();
//	$arr = array(
//			'aaa'=>'1111',
//			'bbb'=>'222',
//			'ccc'=>'333',
//			'ddd'=>'444'
//	);
//	//$mem = Cache::store('memcache')->set('name',$arr);
//	//$red = Cache::store('memcache')->get('name');
//	$re->set('name',$arr);
//
//	$re->set('name','');
//	$red = $re->get('name');
	//print_r($red);

	//$Redis=new Redis();
	$arr = array(
			'aaa'=>'11131',
			'bbb'=>'2223',
			'ccc'=>'3353',
			'ddd'=>'4446'
	);
	//一次只能推送一条
	//$arr =  $re->type("string")->add("$arr");
	//print_r($arr);



        return view($this->C().'/'.$temp);
    }
	public function lists(){
		$Redis=new Redis();
		$arr = array(
				'aaa'=>'1111',
				'bbb'=>'222',
				'ccc'=>'333',
				'ddd'=>'444'
		);
		//一次只能推送一条
		$arr =  $Redis->add("$arr");
		print_r($arr);die;
	}

	public function read()
	{
		$id = get('id');
		//print_r($id);die;
		//if(!is_numeric($id)){  $id=$_REQUEST['id']; }
		$read_num=db("article")->where("`id`='$id'")->value("read_num");
		//print_r($read_num);die;
		db("article")->query("UPDATE `tb_article` SET `read_num` = read_num+1 WHERE `id` ='$id'");
		// echo  M("news_info")->getLastSql();
		echo $read_num+1;
		exit;
	}


	/*详细页面*/
public function view()
{
	@header('Content-type:text/html;charset=utf-8');
	$id=get('id');
	if(!is_numeric($id)){  
		$id=$this->id;
	}
	if(!is_numeric($id))
	{
		exit(r404('参数非法'.$id));
	}
	$article=db("article")->where("`is_del` <>'1' and `id`='$id'")->find();
	if(!$article)
	{
	    exit(r404('文档未找到'.$id));
	}
	$TypeID=$article['TypeID'];
	$this->pubmodu($TypeID);//公共部分
	$TypeArr=$this->TypeArr;
	if(!is_numeric($TypeArr['id']))
	{
		header("Location:/?404=文档所属栏目数据不存在".$TypeArr['id']); exit();
	}
	
	$imglist=db("img")->where("`nid`='$article[id]'")->order("`id` asc")->select();
	 db("article")->query("UPDATE `tb_article` SET `read_num` = read_num+1 WHERE `id` ='$id'");
	$this->assign("article",$article);
	$this->assign("nex",next_article($id));
	$this->assign('imglist',$imglist);
	$temp='view';
	if($TypeArr['contemp']!='')
	{
		$temp=$TypeArr['contemp'];
	}
	$this->seotype='info';
	//if($_REQUEST[html]==1)
	//{
		//$htmlpath=$TypeArr['weburl'];
		//$htmlname=$id.'.html';
		//$tpl=$_GET['tpl'];
		//echo $this->schtml($htmlpath,$htmlname,$id,'wz',$p,$tpl);
		//exit;
//	}
   $wjt=config('wjt');
   if($wjt!='1')
   {
	   return view($this->C().'/'.$temp);
   }else{
	   return $temp;
   }
}

	
	
	
	
}
?>