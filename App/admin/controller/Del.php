<?php
namespace app\admin\controller;
use app\admin\controller\Common;
use think\db;

class Del extends Common
{

	
	public function del($id,$table)//删除数据
	{
		
		$admin=getadmin();//检查登录
		$qx=qx('admin',$admin['UserType']);
		$table=get('table');
		$id=get('id');
		if(empty($table)) exit('error1参数非法，删除失败！');
		if(!is_numeric($id))   exit('参数非法，删除失败！');
		$dbobj=db::name("$table");
		if($table =='prosx'){
			$num=$dbobj->where("`pid`='$id'")->find();
			if($num['id']>0){
				exit('还有下级属性,不能删除');
			}
		}
		/*if($table=='db_info')
		{
		$arr=$dbobj->find($id);
		$file='dbfile/'.$arr['Title'];
		if(is_file($file))@unlink($file);
		}
		*/
		$deldata['is_del']='1';
		$delnum=$dbobj->where("`id`='$id'")->delete();
		if($delnum)
		{
			addlog('Del/del',$table.'/'.$id.'/删除成功',Db::name(''.$table.'')->getLastSql());
			exit('y');
		}else{
			addlog('Del/del',$table.'/'.$id.'/删除失败',Db::name(''.$table.'')->getLastSql());
			exit('删除失败');
		}
	
	}
	
	  
	
	// | 删除指定ID数据    本删除为 public 属性，可以外部调用
	
	public function del_news($id,$table)//删除数据
	{
		$admin=getadmin();//检查登录
		$qx=qx('admin',$admin['UserType']);

		$id=get('id');
		if(!is_numeric($id))   exit('参数非法，删除失败！');
		//$dbobj=db::name("article");
		$deldata['is_del']='1';
		$delnum=db::name('article')->where("`id`='$id'")->update($deldata);
		if($delnum)
		{
		   exit('y');
		}else{
		   exit('删除失败');
		}
	}	  
	  
	  
		  
	public function deltype()
	{
		@header("Content-Type:text/html; charset=utf-8");
		$admin=getadmin();//检查登录
		$qx=qx('admin',$admin['UserType']);

		$id=get('id');
		if(!is_numeric($id)){ exit('参数非法'); }
		$xjnum=db::name("lm")->where("`parentID`='$id'")->count();
		$xjsjnum=db::name("article")->where("`TypeID`='$id' and `is_del`<>'1'")->count();
		if($xjnum>0){ exit('此栏目存在子类，无法删除！');}
		if($xjsjnum>0){ exit('此栏目存在数据，无法删除！');}
		$num=db::name("lm")->where("`id`='$id'")->delete();
		if($num>0)
		{
			exit('y');
		}
	}
	  
	public function delimg()
	{
		@header("Content-Type:text/html; charset=utf-8");
		$admin=getadmin();//检查登录
		$id=get('id');
		if(!is_numeric($id)){ exit('参数非法'); }
		$num=db::name("img")->where("`id`='$id'")->delete();
		if($num>0)
		{
			exit('y');
		}else{
			exit('');
		}
	
	}



	
		function xiugai()//ajax 修改
		{
			$table=get('table');
			$val=get('val');
			
			$fd=get('fd');
			$id=get('id');
			if($fd=='read_num')
			{
			 // if(!is_numeric($val)){ exit('排序必须为数字'); }
			}
			//$sql = "UPDATE `$table` SET `$fd` = '$val' WHERE `id` = '$id'";
			$WebObj = db::name("$table");
			$data=array();
			$data[$fd]=$val;
			$num=$WebObj->where('id='.$id.'')->update($data);
			//echo $WebObj->getLastSql();
			//exit;
			if($num)
			{
			  echo '1';
			  exit;
			}else{
			 //cho '修改失败';
			 //xit;
			}
			 echo '1';
			  exit;
			//file_put_contents("1.txt",$WebObj->getLastSql());
		}
			

	
	
	
	
	
	
}
