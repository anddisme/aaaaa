<?php
namespace app\admin\controller;
use app\admin\controller\Common;
use think\Request;
use think\Cookie;
use think\Db;
use app\admin\model\Article as ArticleModel;
class Article extends Common
{
	public function __construct(){
		parent::__construct();
		//exit('123');
		//$this->GET=Request::instance()->param();
	}


	/*初始化*/
	function _initialize(){
		
	}

    public function Index(){
		@header("Content-Type:text/html; charset=utf-8");
		$admin=getadmin();//检查登录
		$NewsObj = db::name("Article");
		$TypeObj = db::name("lm");
		$TypeID=get('TypeID');
		$PageSize=20;
		
		if(get('PageSize') > 0 && is_numeric(get('PageSize'))){
			$PageSize=get('PageSize');
			cookie::set('PageSize',$PageSize);
		}
         
		$fjwhere='';
		$and='';
		if(is_numeric($TypeID) && $TypeID>0) 
		{
			$idlist=getidlist($TypeID);
			//获取附属栏目的文档
			//echo $idlist;
			//exit;
			$idlistarray=explode(",",$idlist);
			foreach($idlistarray as $v)
			{
			   $fjwhere.= " or `fjid` like '%,".$v.",%'"; 
			}	
			$where = "  (`TypeID` in($idlist)".$fjwhere.")";
		}else{
			$where = "  `id`>'0'";
			$TypeID=0;
		}
		
		
		/*
		权限验证
		*/
		$UserTypestr=$admin['UserType'];
		$UserType=explode(",",$UserTypestr);
		if(!is_numeric($TypeID))
		{
			if(!in_array('admin',$UserType))
			{
			   $and.=" and `TypeID` in($UserTypestr)";
			}
		}else{
			$qx=qx($TypeID,$UserTypestr);
		}
		//print_r($admin);
		//exit;
		
		
		$Recommend=get('Recommend');
		if(is_numeric($Recommend) && $Recommend>0 )
		{
			$and.=" and `Recommend` like '%$Recommend%'";
		}
		$istop=get('istop');
		if(is_numeric($istop) && $istop>0 )
		{
			$and.=" and `istop` ='1'";
		}
		$kw=get('kw');
		if(!empty($kw))
		{
		    $this->kw=$kw;
			$and.=" and (`Title` like '%$kw%' or `id` = '$kw')";
		}
		$pxget=get('pxget');
		$px="`istop` desc,`endtime` desc,`id` desc";
		if(!empty($pxget))
		{
			  $px="`".$pxget."` desc,`id` desc";
		}
		
		$and.=" and `is_del`<>'1'";
		//权限管理
		$UserTypestr=$admin['UserType'];
	//	echo $UserTypestr;
		//exit;
		$UserType=explode(",",$UserTypestr);
		if(!is_numeric($TypeID))
		{
			if(!in_array('admin',$UserType))
			{
			   $and.=" and `TypeID` in($UserTypestr)";
			}
		}else{
			$qx=qx($TypeID,$UserTypestr);
		}
		
		
		//echo $and;
		//exit;
		
        $this->pxget=$pxget;
		//import("ORG.Util.Page2");//导入分页类
		//$AllNum=$NewsObj->where(''.$where.$and.'')->count();
		if(Cookie::get('PageSize')>0) { $PageSize=Cookie::get('PageSize');}
		//echo $PageSize;
		//exit;
		$list=db::name('Article')->where(''.$where.$and.'')->order($px)->paginate($PageSize);
		//echo db::name('Article')->getLastSql();
		//exit;
		//echo $px;
	  // exit;
        
		$this->assign("Recommend",$Recommend);
		$this->assign("istop",$istop);
		$this->assign("kw",$kw);
		$this->assign("list",$list);
		$this->assign("pxget",$pxget);
		$this->assign("TypeID",$TypeID);
		$this->assign("PageSize",$PageSize);
		$this->assign("istop",$istop);
		//$this->assign("Recommed",parent::NewsRecommed());
	//	$this->assign("AllNewsType",$this->AllNewsType());//所有图文类别
		//$this->buildHtml("News_".$_GET['p'],$dirpath);  	
		addlog('Article/index',typearr($TypeID,'TypeName').'文档列表',Db::name('article')->getLastSql());
        return view();
    }

    public function add(){
		@header("Content-Type:text/html; charset=utf-8");
		$admin=getadmin();//检查登录
		$type='';
		$id=get('id');
		$arr=db::name("article")->where("`id`='$id'")->find();
		$TypeID=get("TypeID");
		if(!is_numeric($TypeID))
		{
		  $TypeID=$arr["TypeID"];
		}
		$qx=qx($TypeID,$admin['UserType']);
		$typearr=db::name("lm")->where("`id`='$TypeID'")->find();
		if(!is_numeric($typearr['id']))
		{
		  $this->error("栏目不存在，操作失败");
		}
		$idpatharr=explode(',',$typearr['idpath']);
		$blm=$idpatharr[1];
		
		//$news=model("Article");
		//$data=model("Article");
        if(request()->isPost()){
			$POST=input('post.');

			$POST['Recommend'][]='0';
			$POST['fjid'][]='0';

			
		$data['id']='';
		$data['TypeID']=$POST['TypeID'];
		$data['read_num']=$POST['read_num'];
		$data['Recommend']= implode(",",$POST['Recommend']).',';
		$data['fjid']= ','.implode(",",$POST['fjid']).',';
		$data['istop']=$POST['istop'];
		if($POST['istop']<0){ $POST['istop']=0; }
		$data['hpx']=$POST['hpx'];
		$data['px']=$POST['px'];
		$data['Title']=$POST['Title'];
		$data['Author']=$POST['Author'];
		$data['KeyWords']=$POST['KeyWords'];
		$data['videourl']=$POST['videourl'];
		$data['Content']=$POST['Content'];
		$data['Content1']=$POST['Content1'];
		$data['Content2']=$POST['Content2'];
		$data['Content3']=$POST['Content3'];
		$data['Content4']=$POST['Content4'];
		$data['isVerify']=$POST['isVerify'];
		if(empty($data['isVerify'])) $data['isVerify']=1;
		//$data['HtmlFile']=$POST['HtmlFile'];
		$data['CreateTime']=date("Y-m-d H:i:s");
		$Creator=$_POST['Creator'];
		if(empty($_POST['Creator']))
		{
		  $Creator=$_SESSION['admin']['UserName'];
		}
		$data['Creator']=$Creator;
		$data['S_Image']=$POST['S_Image'];
		//$image->thumb($_SERVER['DOCUMENT_ROOT'].$POST['S_Image'], '', '', 800,800);
		$data['B_Image']=$POST['B_Image'];
		$data['seotitle']=$POST['seotitle'];
		$data['seokeywords']=$POST['seokeywords'];
		$data['seodescription']=$POST['seodescription'];
		//$data['s1']=$POST['s1'];
		$data['s2']=$POST['s2'];
		$data['d1']=$POST['city'];
		$data['d2']=$POST['city1'];
		$data['d3']=$POST['d3'];
		$data['d4']=$POST['d4'];
		$data['d5']=$POST['d5'];
		$data['d6']=$POST['d6'];
		if(empty($_POST['endtime'])){ $_POST['endtime']=date("Y-m-d H:i:s"); }
		$endtime=strtotime($_POST['endtime']); 
		$data['endtime']=$endtime;
		$data['endtime1']=date("Y-m-d H:i:s");
		
		if(empty($data['Title'])){    msg('-1','请输入文档标题');exit;  }
		if(empty($data['TypeID'])){    msg('-1','请选择栏目');exit;  }
	//	$news->data=$data;
			//$NewsObj->data=$data;
			
			$num=db::name("article")->insert($data);
			$id=Db::name('article')->getLastInsID();
			if(!empty($POST['spsxm'])){
				$count = count($POST['spsxm']);
				for($i=0;$i<$count;$i++){
					$data1['sxoption'] = $POST['sxoption'];
					$data1['spsxm'] = $POST['spsxm'][$i];
					$data1['option'] = $POST['option'][$i];
					$data1['kucun'] = $POST['kucun'][$i];
					$data1['shuxingjg'] = $POST['shuxingjg'][$i];
					$data1['proid'] = $id;
					$data1['endtime'] = date("Y-m-d H:i:s");
					db::name("prosxinfo")->insert($data1);
				}
			}
		if($num)
		{

			$s = $POST['s'];
			foreach($s as $i=>$j)
			{
				$imgarr=explode(",",$j);
				if(!empty($imgarr[0]))
				{
					foreach($imgarr as $k=>$v)
					{
						$img['nid']=$id;
						$img['type']=$i;
						$img['image']=$v;
						$img['addtime']=date("Y-m-d H:i:s");
						if(!empty($v)){
							Db::name("img")->insert($img);  }

					}
				}
			}
		    addlog('Article/add','新增文档成功',Db::name('article')->getLastSql());
		    msg('1','数据已添加',url("Article/index")."?TypeID=".$TypeID);exit;
		}else{
			addlog('Article/add','新增文档失败',Db::name('article')->getLastSql());
		    msg('1','数据未添加',url("Article/index")."?TypeID=".$TypeID);exit;
		}	
  
            return;
        }

        
        $this->assign("blm",$blm);
        $this->assign("typearr",$typearr);
        $this->assign("arr",$arr);
        $this->assign("type",$type);
        $this->assign("TypeID",$TypeID);
        return view();
    }




	public function updateimg()
	{
		@header("Content-Type:text/html; charset=utf-8");
		$admin = getadmin();//检查登录
		$id = get('id');
		$this->assign("id",$id);
		//$tupian = $_FILES;

		$file = request()->file('mytupian');
		if($file){
			$id = $_REQUEST['id'];
			$daytime = date('Ymd');
			$movepath = WEB_ROOT.'/public/uploads/image/'.$daytime;
			$imgpath = '/public/uploads/image/'.$daytime;
			$info = $file->rule('uniqid')->validate(['size'=>(((1024*1024)*1024)*10),'ext'=>'jpg,png,gif'])->move($movepath,time().rand(0000,9999));
			if($info){
				// 成功上传后 获取上传信息
				// 输出 42a79759f284b767dfcb2a0197904287.jpg
				$imgpath1 = $imgpath.'/'.$info->getFilename();
				$data['image'] = $imgpath1;
				$data['addtime'] = date("Y-m-d H:i:s");
				$num =Db::name("img")->where("`id` = '$id'")->update($data);
				$fhid =Db::name("img")->where("`id` = '$id'")->find();
				$fhid = $fhid['nid'];
				//$num = Db::name("img")->where("`id` = $id")->update($data);
				//print_r($num);die;
				if($num){
					$this->success('修改成功！');exit();
				}else{
					$this->error('修改成功！');exit();
				}
				//echo $imgpath1;die;
			}else{
				// 上传失败获取错误信息
				echo $file->getError();
			}
		}
		//print_r($file);die;

		//print_r($thisimg);die;
		return view("article/updateimg");
	}







    public function updata(){
		@header("Content-Type:text/html; charset=utf-8");
		$admin=getadmin();//检查登录
		$type='';
		$id=get('id');//exit();
		$arr=db::name("article")->where("`id`='$id'")->find();
		$arrsx = db::name("prosxinfo")->where("`proid`='$id'")->select();
		$arrsx1 = array();
		$arr11 = array();

		foreach ($arrsx as $k=>$v){
			$arrsx1[$v['spsxm']][] = $v;
		}
//		$arrsxcount = count($arrsx1);
//		//print_r($arrsxcount);die;
//		for($i=0;$i<$arrsxcount;$i++){
//			$arr11[] =	$arrsx1[$i];
//		}
//
//		print_r($arr11);die;
		$TypeID=get("TypeID");
		if(!is_numeric($TypeID))
		{
		  $TypeID=$arr["TypeID"];
		}
		
		
		$typearr=db::name("lm")->where("`id`='$TypeID'")->find();
		if(!is_numeric($typearr['id']))
		{
		  $this->error("栏目不存在，操作失败");
		}
		$qx=qx($TypeID,$admin['UserType']);
		$idpatharr=explode(',',$typearr['idpath']);
		$blm=$idpatharr[1];
		
		//$news=model("news_info");
		//$data=model("news_info");

        if(request()->isPost()){
			
			$POST=input('post.');

			$POST['Recommend'][]='0';
			$POST['fjid'][]='0';
			if(!empty($POST['spsxm'])){
				//print_r($POST);die;
				db::name("prosxinfo")->where("`proid` = $id")->delete();
				$count = count($POST['spsxm']);
				for($i=0;$i<$count;$i++){
					$data1['sxoption'] = $POST['sxoption'];
					$data1['spsxm'] = $POST['spsxm'][$i];
					$data1['option'] = $POST['option'][$i];
					$data1['kucun'] = $POST['kucun'][$i];
					$data1['shuxingjg'] = $POST['shuxingjg'][$i];
					$data1['proid'] = $id;
					$data1['endtime'] = date("Y-m-d H:i:s");

					db::name("prosxinfo")->insert($data1);
				}
			}

		$data['read_num']=$POST['read_num'];
		$data['Recommend']= implode(",",$POST['Recommend']).',';
		$data['fjid']= ','.implode(",",$POST['fjid']).',';
		$data['istop']=$POST['istop'];
		if($POST['istop']<0){ $POST['istop']=0; }
		$data['hpx']=$POST['hpx'];
		$data['px']=$POST['px'];
		$data['Title']=$POST['Title'];
		$data['Author']=$POST['Author'];
		$data['KeyWords']=$POST['KeyWords'];
		$data['videourl']=$POST['videourl'];
		$data['Content']=$POST['Content'];
		$data['Content1']=$POST['Content1'];
		$data['Content2']=$POST['Content2'];
		$data['Content3']=$POST['Content3'];
		$data['Content4']=$POST['Content4'];
		$data['isVerify']=$POST['isVerify'];
		if(empty($data['isVerify'])) $data['isVerify']=1;
		//$data['HtmlFile']=$POST['HtmlFile'];
		$data['CreateTime']=date("Y-m-d H:i:s");
		$Creator=$_POST['Creator'];
		if(empty($_POST['Creator']))
		{
		  $Creator=$_SESSION['admin']['UserName'];
		}
		$data['Creator']=$Creator;
		$data['S_Image']=$POST['S_Image'];
		//$image->thumb($_SERVER['DOCUMENT_ROOT'].$POST['S_Image'], '', '', 800,800);
		$data['B_Image']=$POST['B_Image'];
		$data['seotitle']=$POST['seotitle'];
		$data['seokeywords']=$POST['seokeywords'];
		$data['seodescription']=$POST['seodescription'];
		//$data['s1']=$POST['s1'];
		$data['s2']=$POST['s2'];
		$data['d1']=$POST['city'];
		$data['d2']=$POST['city1'];
		$data['d3']=$POST['d3'];
		$data['d4']=$POST['d4'];
		$data['d5']=$POST['d5'];
		$data['d6']=$POST['d6'];
		if(empty($_POST['endtime'])){ $_POST['endtime']=date("Y-m-d H:i:s"); }
		$endtime=strtotime($_POST['endtime']); 
		$data['endtime']=$endtime;
		$data['endtime1']=date("Y-m-d H:i:s");
		if(empty($data['Title'])){   msg('-1','请输入文档标题');exit;  }
		//if(empty($data['TypeID'])){  exit('22');    msg('-1','请选择栏目');exit;  }
		//	$news->data=$data;
		//$NewsObj->data=$data;
		$validate = \think\Loader::validate('Article');
		if(!$validate->scene('edit')->check($data)){
			$this->error($validate->getError());
		}
			
		 $article=new ArticleModel;
		 $save=$article->saveArticle($data,$id);
		if($save)
		{
			$s = $POST['s'];
			foreach($s as $i=>$j)
			{
				$imgarr=explode(",",$j);
				if(!empty($imgarr[0]))
				{
					foreach($imgarr as $k=>$v)
					{
						$img['nid']=$id;
						$img['type']=$i;
						$img['image']=$v;
						$img['addtime']=date("Y-m-d H:i:s");
						if(!empty($v)){
							Db::name("img")->insert($img);  }

					}
				}
			}
			addlog('Article/updata','修改文档成功/id='.$id,Db::name('article')->getLastSql());  
		    msg('1','修改成功',url("Article/index")."?TypeID=".$TypeID);exit;
		}else{
			addlog('Article/updata','修改文档失败/id='.$id,Db::name('article')->getLastSql());  
		    msg('-1','修改失败',url("Article/index")."?TypeID=".$TypeID);exit;
		}	
  
		
			
			   
			   
		   
		   
		   
		   
		   
		   
		   
		   
		   
		   
		   
		   
		   
		   
            return;
        }

        
        $this->assign("blm",$blm);
        $this->assign("typearr",$typearr);
        $this->assign("arr",$arr);
        $this->assign("arrsx",$arrsx);
        $this->assign("arrsx1",$arrsx1);
        $this->assign("type",$type);
        $this->assign("TypeID",$TypeID);
        return view("article/add");
    }


	






    public function hsz(){
		@header("Content-Type:text/html; charset=utf-8");
		$admin=getadmin();//检查登录
		$PageSize=50;
		$kw=get('kw');
		if(!empty($kw))
		{
			$kwand=" and `Title` like '%$kw%'";
		}
		//if(Cookie::get('PageSize')>0) { $PageSize=Cookie::get('PageSize');}
		$list=db::name('Article')->where("`is_del`='1' $kwand")->order('`deltime` desc,`id` desc')->paginate($PageSize);
		$this->assign("list",$list);

		//$this->assign("Recommed",parent::NewsRecommed());
	//	$this->assign("AllNewsType",$this->AllNewsType());//所有图文类别
		//$this->buildHtml("News_".$_GET['p'],$dirpath); 
		addlog('Article/add','查看回收站');
        return view("article/hsz");
    }





    public function yidong(){
		@header("Content-Type:text/html; charset=utf-8");
			if(!empty(get('act')))
			{
				$TypeID=$_REQUEST['TypeID'];
				$ActionIDList=get('ActionIDList');
				if(empty($ActionIDList))
				{
					echo json_encode(array('text'=>'请选择要移动的文档','zt'=>'0'));
					exit;
				}
				if(!is_numeric($TypeID))
				{
					addlog('Article/yidong','移动文档失败：栏目ID不存在，移动失败');
					die(json_encode(array('text'=>'栏目ID不存在，移动失败','zt'=>'0')));
				}
				$data['TypeID']=$TypeID;
				$num=db::name('Article')->where('id in('.$ActionIDList.')')->update($data);
				if($num)
				{
				   addlog('Article/yidong','批量移动成功'.$ActionIDList.'->'.$TypeID,db::name('Article')->getLastSql());
				   die(json_encode(array('text'=>'批量移动成功','zt'=>'1')));
				}else{
				   addlog('Article/yidong','批量移动失败'.$ActionIDList.'->'.$TypeID,db::name('Article')->getLastSql());
				   die(json_encode(array('text'=>'批量移动失败','0')));
				}

			}
        return view("article/yidong");
    }



}
