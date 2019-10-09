<?php
namespace app\admin\controller;
use app\admin\controller\Common;
use app\admin\model\Lm as LmModel;
use think\db;

class Lm extends Common
{
	public function __construct(){
		parent::__construct();
		$this->lmmodel=new LmModel();
		//exit('123');
		//$this->GET=Request::instance()->param();
	}
	
	public function index()
	{
		@header("Content-Type:text/html; charset=utf-8");
		$this->assign('mtype','2');
		$TypeObj=db::name('lm');
		$TypeList = $this->sanji(0);
		$this->assign("TypeList",$TypeList);	
		return view();
	}
		
	
	
public function sanji($topid)
{

	$TypeObj=db::name('lm');
	$TypeList = $TypeObj->where("`parentID`='$topid'")->order('`SortNumber` asc,`id` asc')->select();
	//echo $TypeObj->getLastSql();
	//exit;
	//print_r($TypeList);
	//exit;
	foreach($TypeList as $k=>$v)
	{
		$temp=$v['temp'];
		if(empty($temp)){$temp='list.html';	}
		$contemp=$v['contemp'];
		if(empty($contemp)){ $temp='view.html';	}
		$PageSize=$v['PageSize'];
		if(empty($PageSize)) {  $PageSize='默认';	}
		if($v[Depth]>1){$strd='└─&nbsp;'; }
		$strbg='';
		$strbgclass='';
		$countnex=db::name("lm")->where("`parentID`='$v[id]'")->count();
		$newsnum=db::name("article")->where("`TypeID`='$v[id]'")->count();
		if($v['parentID']==0){$strbg='#f3f5f9';}
		if($countnex>0){$strbgclass='font-weight:bold;';}
		//$isnext = C('isnext');
		
		//$notdel = C('notdel');
		
		$tjzl='<a href="'.url("lm/add",array('TypeID'=>$v['id'])).'">【添加子类】</a>';
		if($v['Depth']!=1 && $v['parentID_top']!='2')
		{
		  $tjzl='';
		}
		
		//$patharr=typepatharr($arr['id']);
		/*
		if($v['id']==4 || $v['id']==5)
		{
			$tjzl='';
		}
		*/
		if(in_array($v['id'],$notdel))
		{//不可删除的ID
		   $isdel='';
		}else{
		   $isdel='<a onClick="if(confirm(\'请谨慎删除,确定要删除吗？\')){ return deltype('.$v[id].'); }" href="javascript:;" >【删除】</a> ';
		}
		
		if($v['Depth']==1)
		{
		  $isdel='';
		}
	
		$is_meau="";
		if($v['is_meau']!='1')
		{
		  $is_meau="<span id='color2' style='font-weight:normal; color:#27a9e3; font-size:12px;'> [隐藏]</span>";
		}
		$padding=$v[Depth]*15;
		$jianjiao='<img src="skin/3.jpg"/>';
		if($v[Depth]==1){ $jianjiao='<i class="icon-folder-open-alt mg-lf"></i>';}
		/////
			$str.='
			<tr id="'.$v[id].'" >
			<td>
			<span style="display:inline-block;width:'.$padding.'px;"></span><span class="folder-line"></span><span class="folder-open"></span>
			<a id="color'.$v[Depth].'" style="'.$strbgclass.'" href="'.url("Article/index",array('TypeID'=>$v['id'])).'">'.$v[TypeName].'   <font style="color:#333; font-size:12px; font-weight:normal;"> [ID:'.$v[id].']'.$v[id1path].'</font>'.$is_meau.'<!-- [文章:'.$newsnum.']--></a>
			</td>
			<td align="left">
			'.$tjzl.'
			</td>
			<td align="right">
			<a href="'.url('Lm/updata',array('id'=>$v['id'])).'"">【修改】</a>  '.$isdel.'
			</td>
			<td align="center" fd="SortNumber" style="winth:60px; overflow:hidden">'.$v['SortNumber'].'</td>
			</tr>';
			//////
		$str.=$this->sanji($v[id]);
	}
	return $str;
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
    public function add(){
		@header("Content-Type:text/html; charset=utf-8");
		$this->assign('mtype','2');
		$TypeID=get('TypeID');
		$this->assign("type","添加");
		$this->assign("TypeID",$TypeID);
		$parentarr=db::name("lm")->where("`id`='$TypeID'")->find();
		if($TypeID>0)
		{
		  $idpatharr=explode(",",$parentarr['idpath']);
		  $this->idpatharr=$idpatharr;
		  $this->blm=$idpatharr[1];
		  $this->assign("idpatharr", $this->idpatharr);
		  $this->assign("idpatharr", $this->blm);
		}
		//echo $TypeID;
		//exit;
		//exit;
		  // $data=model("lm");
		if(request()->isPost())
		{
			    $POST=input('post.');
				$TypeObj=db::name('lm');
				$data['id'] = '';
				$data['is_meau'] = $POST['is_meau'];
				$data['TypeName'] = str_replace("/","\/",$POST['TypeName']);;
				$data['parentID'] = $POST['parentID'];
				$data['SortNumber'] = $POST['SortNumber'];
				if(!is_numeric($data['SortNumber']))
				{
				   msg('-1','排序参数不合法');exit();
				}
				$data['parentID_top'] = getptop($data['parentID']);
				$data['temp'] = $POST['temp'];
				if($data['temp'] == '') $data['temp'] = 'about';
				$data['contemp'] = $POST['contemp'];
				if($data['contemp'] == '') $data['contemp'] = 'about';
				$data['PageSize'] = $POST['PageSize'];
				if(!is_numeric($data['PageSize'])) $data['PageSize']="默认";
				$data['sTypeName'] = $POST['sTypeName'];
				$data['Video'] = $POST['Video'];
				$data['con1'] = $POST['con1'];
				$data['con2'] = $POST['con2'];
				$data['con3'] = $POST['con3'];
				$data['img1'] = $POST['img1'];
				$data['newsid'] = $POST['newsid'];
				$data['img2'] = $POST['img2'];
				$data['img3'] = $POST['img3'];
				$data['img4'] = $POST['img4'];
				$data['img5'] = $POST['img5'];
				$data['seo_title'] = $POST['seo_title'];
				$data['seo_keywords'] = $POST['seo_keywords'];
				$data['seo_miaoshu'] = $POST['seo_miaoshu'];
				$data['weburl'] = weburl($POST['weburl']);
				if(empty($data['TypeName'])){ msg('-1','请填写栏目名称');exit();}
				if(empty($data['weburl'])){ msg('-1','请填写网站url');exit();}
				$data['nohtml'] = $POST['nohtml'];
				$data['endtime'] = date("Y-m-d H:i:s");
				//dump($data);
				//exit;
				$num=Db::name('lm')->insert($data);
				$Lastids=Db::name('user')->getLastInsID();
				//exit;
				///echo $num;
				//exit;
				//dump(Db::name('lm')->getLastSql());
				//exit;
			if($num>0)
			{
			
				$parent=TypeArr($data['parentID']);
				$parent_idpath=$parent['idpath'];
				if(empty($parent_idpath)) $parent_idpath=',';
				$data1['idpath']=$parent_idpath.$Lastids.',';
				$arrTemp=explode(",",$data1['idpath']);
				$data1['Depth'] = count($arrTemp)-2;
				Db::name('lm')->where("`id`='$Lastids'")->update($data1);
				//echo Db::name('think_user')->getLastSql();
				//exit;
				//$this->lmmodel->save($data1,$ids);
				msg('1','数据已添加');exit();
			}else{
				msg('0','数据未添加');exit();
			}
		}
		
		//获取系统最大的栏目ID
		$maxtypeid=db::name("lm")->order("`id` desc")->field('id')->find();
		$thsiurl=$parentarr['weburl'].'/list'.($maxtypeid['id']+1).'/';
		$thsiurl=str_replace('//','/',$thsiurl);
		$addweburl=$thsiurl;
		//echo $weburl;
		//exit;
		$this->assign("addweburl",$addweburl);
		$this->assign("parentarr",$parentarr);
		//$this->assign("AllNewsType",$this->AllNewsType());//所有图文类别
		$scid=db::name("lm")->order("`id` desc")->field("id")->find();
		$this->assign("scid",$scid['id']);
		$this->assign("mtype",'2');
        return view();
    }


	
	
	
	
	
	
// +----------------------------------------------------------------------
// | 修改栏目
// +----------------------------------------------------------------------
public function updata()
{
	@header("Content-Type:text/html; charset=utf-8");
	$id=get('id');
	if(!is_numeric($id)){ msg('-1','参数非法');exit();}
	$TypeObj=db::name('lm');	
	$arr=$TypeObj->where("`id`='".$id."'")->find();
	if(!$arr) {msg('-1','系统无法找到指定数据');exit();}
	$this->assign("arr",$arr);
	$this->assign("type","修改");
	if($arr['id']>0)
	{
		$idpatharr=explode(",",$arr['idpath']);
		$this->idpatharr=$idpatharr;
		$this->blm=$idpatharr[1];
		$this->assign("idpatharr", $this->idpatharr);
		$this->assign("idpatharr", $this->blm);
	}
	

	if(request()->isPost())
	{
		$POST=input('post.');
		$TypeObj=db::name('lm');
		$data['parentID'] = $POST['parentID'];
		$thisidpath=','.$id.',';
		if($data['parentID']>0)
		{
		  $thisidpath=','.$data['parentID'].$thisidpath;
		}
		
		$parent=TypeArr($data['parentID']);
		$parent_idpath=$parent['idpath'];
		if(empty($parent_idpath)) $parent_idpath=',';
		$data['idpath']=$parent_idpath.$id.',';
		$arrTemp=explode(",",$data['idpath']);
		$data['Depth'] = count($arrTemp)-2;
		//print_r($data);
		//exit;
		$data['is_meau'] = $POST['is_meau'];
		$data['TypeName'] = str_replace("/"," ",$POST['TypeName']);;
		$parentarr=$parent;
		$parentPathTree=$parentarr['PathTree'];
		$is_meau=$POST['is_meau'];
		$data['SortNumber'] = $POST['SortNumber'];
		if(!is_numeric($data['SortNumber'])) { msg('-1','排序参数不合法');exit(); }
		$data['parentID_top'] =getptop($data['parentID']);
		//print_r(getptop($data['parentID']));
		//exit;
		$data['temp'] = $POST['temp'];
		if($data['temp'] == '') $data['temp'] = 'about';
		$data['contemp'] = $POST['contemp'];
		if($data['contemp'] == '') $data['contemp'] = 'about';
		$data['PageSize'] = $POST['PageSize'] ;
		$data['sTypeName'] = $POST['sTypeName'];
		$data['Video'] = $POST['Video'];
		$data['con1'] = $POST['con1'];
		$data['con2'] = $POST['con2'];
		$data['con3'] = $POST['con3'];
		$data['img1'] = $POST['img1'];
		$data['newsid'] = $POST['newsid'];
		$data['img2'] = $POST['img2'];
		$data['img3'] = $POST['img3'];
		$data['img4'] = $POST['img4'];
		$data['img5'] = $POST['img5'];
		$data['seo_title'] = $POST['seo_title'];
		$data['seo_keywords'] = $POST['seo_keywords'];
		$data['seo_miaoshu'] = $POST['seo_miaoshu'];
		$data['weburl'] = weburl($POST['weburl']);
		if(empty($data['TypeName'])){ msg('-1','请填写栏目名称');exit();}
		if(empty($data['weburl'])){ msg('-1','请填写网站url');exit();}
		if(!is_numeric($data['PageSize'])) $data['PageSize']="默认";
		$data['nohtml'] = $POST['nohtml'];
		$data['endtime'] = date("Y-m-d H:i:s");
		//$num=$TypeObj->where('id='.$id.'')->save($data);
		
		$num=Db::name('lm')->where("`id`='$id'")->update($data);
		if($num>0)
		{
		   //更新当前栏目下所有栏目的idpath等参数
			$idlike=','.$id.',';
			$oldlist=Db::name('lm')->where("`idpath` like '%$idlike%' and `idpath` <> '$idlike'")->Field('`id`,`parentID`')->select();
			$parent_idpath='';
			foreach($oldlist as $oldk=>$oldv)
			{
			    $parent1=TypeArr($oldv['parentID']);
				$parent_idpath=$parent1['idpath'];
				if(empty($parent_idpath)) $parent_idpath=',';
				$data1['idpath']=$parent_idpath.$oldv['id'].',';
				$data1['parentID_top']=getptop($oldv['parentID']);;
				$arrTemp=explode(",",$data1['idpath']);
				$data1['Depth'] = count($arrTemp)-2;
				//$TypeObj->where("`id`='$oldv[id]'")->save($data1);
				Db::name('lm')->where("`id`='".$oldv['id']."'")->update($data1);
			}
			
			//批量更换子栏目类型以及模板
			if($_POST['jcmb']=='1')
			{
			
				$idlike=','.$id.',';
				$likelist=db::name("lm")->where("`idpath` like '%$idlike%'")->select();
				foreach($likelist as $k1 => $v1)
				{
					$data2['newsid']=$data['newsid'];
					$data2['temp']=$data['temp'];
					$data2['contemp']=$data['contemp'];
					$num1=db::name('lm')->where('id='.$v1['id'].'')->update($data2);
					$pu=db::name('lm')->getLastSql();
					//echo $pu;
					//exit;
					if($num1<1){
					//msg('1','数据已修改,子栏目模板更换失败','index.php?m=App&a=lm');exit();
					}else{
			          // msg('-1','子栏目批量更新失败');exit();
					}
				}
			}
			msg('1','数据已修改',url('Lm/index'));exit();
			//parent::getnews("添加成功","run.php?m=page&a=pagetype");
		}else{
			msg('0','数据未修改');exit();
		}
	}
	
	$this->assign("TypeID",$arr['parentID']);
	$this->assign("mtype",'2');
	return view("Lm/add");
}	

	
	
	
	
	
	
	
	
}
