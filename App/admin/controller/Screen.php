<?php
namespace app\admin\controller;
use app\admin\controller\Common;
use app\admin\model\Webinfo as WebinfoModel;
use think\db;

class Screen extends Common
{
	public function __construct(){
		parent::__construct();
	//	$this->webmodel=new WebModel();
		//exit('123');
		//$this->GET=Request::instance()->param();
	}


    public function add(){
        @header("Content-Type:text/html; charset=utf-8");
		$admin=getadmin();//检查登录
		$qx=qx('admin',$admin['UserType']);
		
        if(request()->isPost())
        {
            $POST=input('post.');
            $data=$POST;
			$fieldname = $POST['field'];
			$name = $POST['name'];
			//print_r($fieldname);die;  !ctype_alnum($vipurl)
			if(empty($fieldname)){
				echo json_encode(array("status"=>'-1',"message"=>"请输入字段名"));
				exit();
			}
			if(!ctype_alnum($fieldname)){
				echo json_encode(array("status"=>'-1',"message"=>"字段名只能是英文和数字的组合并且以英文开头"));
				exit();
			}

			if(empty($name)){
				echo json_encode(array("status"=>'-1',"message"=>"请输入名称"));
				exit();
			}
			$where=array(
					"field"=>$fieldname
			);
			$filed = Db::name("webinfo")->where($where)->find();

			//print_r($filed);die;
			if($filed['id'] >0){
				echo json_encode(array("status"=>'-1',"message"=>"字段重名，请重新输入字段名"));
				exit();
			}
            //$data['']
            $num = Db::name("webinfo")->insert($data);
			//print_r(2222);die;
            if($num>0)
            {
				addlog('Webinfo/index',$filed.'/新增网站参数字段成功',Db::name('webinfo')->getLastSql());	
                echo json_encode(array("status"=>'1',"message"=>"新增成功"));
                exit();
            }else{
				addlog('Webinfo/index',$filed.'/新增网站参数字段失败',Db::name('webinfo')->getLastSql());
                echo json_encode(array("status"=>'-1',"message"=>"新增失败"));
                exit();
            }
        }

      //  return view();
    }




    public function index(){
		@header("Content-Type:text/html; charset=utf-8");
		//print_r(1111);die;
        if(request()->isPost())
        {
			$POST=input('post.');
			$data=$POST;
			$keys = array_keys($data);
			$keyscoun = count($keys);
			$vals = array_values($data);
			for ($x=0; $x<=$keyscoun-1; $x++) {
				$where=array(
						"field"=>$keys[$x]
				);

				$data1['val'] = $vals[$x];
				//$num1 = Db::name("webinfo")->where($where)->find();
				Db::name("webinfo")->where($where)->update($data1);

			}
			    addlog('Webinfo/index','更新网站参数成功',Db::name('webinfo')->getLastSql());
				echo json_encode(array("status"=>'1',"message"=>"更新成功"));
				exit();			

	}

			$webinfo=db::name("webinfo")->select();

			$this->assign("infolist",$webinfo);
		return view();
	}
	
	
}
