<?php
namespace app\admin\controller;
use think\Controller;
use think\Request;
use think\db;
use think\Cookie;

class Common extends Controller
{
    public function _initialize(){


        $admin=Db("user")->where("`UserName`='".session('admin.UserName')."' and `UserName`<>''")->find();		
        if($admin['id']<1 || $admin['UserName']==''){
           $this->error('您尚未登录系统',url('login/index')); 
        }else if($admin['isVerify']!='1'){
		   session('admin',NULL);
		   session('logintime',NULL);
           $this->error('账号未启用',url('login/index')); 
		}
        $auth=new Auth();
        $request=Request::instance();
        $con=$request->controller();
        $action=$request->action();
        $name=$con.'/'.$action;
		$webinfo=webinfo();
		$this->assign("webinfo",$webinfo);
		//print_r($weblist);die;
		$this->assign('admin',$admin);
		$readme = array('php_version'=>phpversion(),'max_execution_time'=>ini_get('max_execution_time'),'upload_max_filesize'=>ini_get('upload_max_filesize'),'attime'=>date('Y-m-d h:i:s'));
		$this->assign('readme', $readme);
		$this->assign("SERVER",$_SERVER['SERVER_SOFTWARE']);
        $notCheck=array('Index/index','Admin/lst','Admin/logout');
    }
	
	
	
	

	public function action()
	{
		//$admin=$this->is_login();
		$ActionIDList=$_REQUEST['ActionIDList'];
		$Action=$_REQUEST['Action'];
		//echo $TypeID;
		//exit;
		//exit();
		$table=get('table');
		$backurl=get('backurl');		
		$msgstr2=array('text'=>'批量处理失败','url'=>'-1');
		if(empty($table))  $msgstr1=array('text'=>'数据表不存在','url'=>'1');;
		$dbObj=db::name("$table");
		switch($Action)
		{
			
			case "isVerify1":
			
			$date['isVerify']=1;
			$num=$dbObj->where('id in('.$ActionIDList.')')->update($date);
            $msgstr1=array('text'=>'选中文档-已审核','url'=>'1');
			break;		
		case "isVerify0":
			$date['isVerify']=0;
			$num=$dbObj->where('id in('.$ActionIDList.')')->update($date);
            $msgstr1=array('text'=>'选中文档-已取消审核','url'=>'1');
			break;	
		case "DelSome":
			$num=$dbObj->where('id in('.$ActionIDList.')')->delete();
			
			$msgstr1=array('text'=>'选中文档-已删除','url'=>'1');
			break;
		case "UserType0":
			$date['UserType']=0;
			$num=$dbObj->where('id in('.$ActionIDList.')')->delete();
            $msgstr1=array('text'=>'选中用户-已禁用','url'=>'1');
			break;	
		case "UserType1":
			$date['UserType']=1;
			$num=$dbObj->where('id in('.$ActionIDList.')')->delete();
            $msgstr1=array('text'=>'选中用户-已启用','url'=>'1');
			break;	
		
		case "UserType2":
			$date['UserType']=2;
			$num=$dbObj->where('id in('.$ActionIDList.')')->delete();
			break;	
			
			//文档还原
		case "huanyuan":
			$date['is_del']=0;
			$num=$dbObj->where('id in('.$ActionIDList.')')->update($date);
            $msgstr1=array('text'=>'选中文档-已还原','url'=>'1');
			break;	
			//文档移动到回收站
		case "delnews":
			$date['deltime']=time();
			$date['is_del']=1;
			$num=$dbObj->where('id in('.$ActionIDList.')')->update($date);
			
            $msgstr1=array('text'=>'选中文档-已删除','url'=>'1');
			break;	
			
		case "logdel":
		    
			if(config('logdel')=='1')
			{
				$date['is_del']=1;
				$num=$dbObj->where('id in('.$ActionIDList.')')->update($date);
				$msgstr1=array('text'=>'选中日志-已删除','url'=>'1');
			}else{
				$num=1;
				$msgstr1=array('text'=>'日志无法删除','url'=>'-1');
			}
			break;	


			//移动文档
		case "yd":
		    $TypeID=$_REQUEST['TypeID'];
		if(!is_numeric($TypeID))
			{
		    	$msgstr1=array('text'=>'栏目ID不存在，移动失败','url'=>'-1');
		    }
			$data['TypeID']=$TypeID;
			$num=$dbObj->where('id in('.$ActionIDList.')')->update($data);
			$msgstr1=array('text'=>'选中文档-批量移动成功','url'=>url("Article/index",array('TypeID'=>$TypeID)));
			break;	
		default:
		    $msgstr1=array('text'=>'批量处理失败','url'=>'-1');
		    $msgstr2=array('text'=>'批量处理失败','url'=>'-1');
			break;
		}	
$sql=$dbObj->getLastSql();
//$msgstrerror=array('text'=>$sql,'url'=>'1');
// die(json_encode($msgstrerror));
		if($num)
		{
		 addlog($table,'批量操作成功/：'.$msgstr1['text'].'.'.$table,$dbObj->getLastSql());
	      die(json_encode($msgstr1));
		}else{
		 addlog($table,'批量操作失败/：'.$msgstr2['text'].'.'.$table,$dbObj->getLastSql());
	      die(json_encode($msgstr2));
		}
	
	}

	public function uploads(){

		$path0='/public/uploads/image/'.date("Ymd");
		$path = WEB_ROOT.$path0;
		if(!file_exists($path)){
			mkdir($path,0777,true);
		}
		$file = $this->request->file('file_name');
		//print_r($file);die;
		if(!$file){
			$result = array('src'=>'请选择要上传的图片');
			return json_encode($result);
		}
		$moveinfo = $file->validate(['size'=>(((1024*1024)*1024)*10),'ext'=>'gif,jpg,png,bmg,txt,html,js,css,zip'])->rule('uniqid')->move($path,time().rand(00,99));
		$src = $moveinfo->getSaveName();
		$imgarr=$path0.'/'.$src;
		$id=get('id');
		$tab=get('tab');

		if(is_numeric($id) && $id>0 && !empty($tab))
		{
			$db=\think\db::name(''.$tab.'');
			$data['image']=$imgarr;
			$num = $db->where("`id`='".$id."'")->update($data);
			if(!$num)
			{
				$result = array('src'=>'图片保存失败');
				return json_encode($result);
				exit();
			}
		}



		$result = array('src'=>$imgarr);
		return json_encode($result);


	}
	
	
	
	


}
