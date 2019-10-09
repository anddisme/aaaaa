<?php
namespace app\index\controller;
use think\Cache;
use think\db;
use think\Session;
use think\Request;


class Index extends Common
{
	
	public function _initialize(){
		$this->think();
		$this->wjt=config('wjt');
	}
	
	
    public function index()
{
    $memberarr = session::get("memberarr");
    //$admin = $this->islogin();
//     print_r($memberarr);
//     exit;

    // echo WEB_URL;
    // exit;
    // $is = sendEmail('389228847@qq.com','','您的网站有新留言,请登陆查看');
    // exit;

    return view($this->C().'/login');
}
    public function web()
    {
        @header("Content-Type:text/html; charset=utf-8");
        $memberarr = Session::get("memberarr");
        $username = $memberarr['username'];
        $this->assign('username',$username);
        $typeid = get('TypeID');
        $this->assign('typeid',$typeid);
        $where = " `id` >0";
        if(!empty($typeid)){
            $where.=" and `TypeID`=$typeid";
        }
        $p = get('p');
        if($p == '' or $p <1){
            $p = 1;
        }
        //return $p;
        $PageSize = '5';
        $nowpage =($p-1)*$PageSize;
        $list = db::name('article')->where("$where")->order('`id` desc')->limit($nowpage,$PageSize)->select();

       // return db::name('article')->getLastSql();
        if($p==1) {
            $allcount = db::name('article')->count();
            $this->assign('allcount', $allcount);
            $midcount = db::name('article')->where("`mid` = '0'")->count();
            $this->assign('midcount', $midcount);
            $time = date("Y-m-d");
            //`cityname` like '%".$city."%'
            $todaycount = db::name('article')->where("`mid` = '0' and `CreateTime` like '%" . $time . "%'")->count();
            //print_r(db::name('article')->getLastSql());die;
            $this->assign('todaycount', $todaycount);
        }
       // return $p;
        if($p>1){
            //return '1111111111';
            //echo json_encode($list);exit;
            return json($list);
            //$this->assign('list',$list);
        }else{
            $this->assign('list',$list);
            return view($this->C().'/index');
        }


    }






    public function book()
    {
        if(request()->isPost()) {
            $POST = input('post.');
            //print_r($POST);die;
            $data['t1'] = $POST['t1'];
            $data['t2'] = $POST['t2'];
            $data['t3'] = $POST['t3'];
            $data['t4'] = $POST['t4'];
            $data['t5'] = $POST['t5'];
            $data['t6'] = $POST['t6'];
            $data['t7'] = $POST['t7'];
            $data['CreateTime'] = date("Y-m-d H:i:s");
            $num=db::name("guest")->insert($data);
            if($num>0){
				
				sendEmail('19590850@qq.com','',WEB_URL.'您的网站有新留言,请登陆查看');
                msg('1','留言成功');exit;
            }else{
                msg('-1','留言失败');exit;
            }
        }
        //return view($this->C().'/index');
    }
	
	
	public function getuser()
	{
		
        $request = Request::instance();
		$wx_user_info = session::get('wx_user_info');
		if(!is_array($wx_user_info))
		{
		  session('wx_return_url',$request->url());
		  action('Getuser/index');
		}
		
		
		
		print_r($wx_user_info);
		exit('wwwwww');
		
		
	}
	
	
	
	
	
	
}
