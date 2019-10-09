<?php
namespace app\admin\controller;
use think\Controller;
use think\db;


class Upload extends Controller
{
	public function __construct(){
		parent::__construct();
        
	}

	public function Index()
	{
	  @header('Content-type:text/html;charset=utf-8');
            $POST=input('post.');
			
			$data=$POST;
			$query=request();
			$filepath = request()->file('Filedata');
			$daytime = date('Ymd');
			$movepath = WEB_ROOT.'/public/uploads/image/'.$daytime;
			$movepath1 = '/public/uploads/image/'.$daytime;
			$moveinfo = $filepath->rule('uniqid')->validate(['size'=>(((1024*1024)*1024)*10),'ext'=>'gif,jpg,png'])->move($movepath,time().rand(000,999));
			file_put_contents('upload.txt',$filepath->getError());
			if($moveinfo)
			{
			   echo $movepath1.'/'.$moveinfo->getSaveName();
			}else{
				//echo $filepath->getError();
			   echo $filepath->getError().'===';		
			}




	}  

	


}
?>