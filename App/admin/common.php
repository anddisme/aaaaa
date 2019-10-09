<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------
use think\Request;
use think\Db;

	
	/*
	  权限控制
	*/
function qx($id,$UserType)
{
	$UserType=explode(",",$UserType);
	if(in_array('admin',$UserType))
	{
	  //超级管理
	  return true;
	}
	
	if(in_array($id,$UserType))
	{
	   return true;	
	}
	exit("<span style='color:red'>您没有权限管理此栏目内容</span>");
}


function getadmin()
{
  $UserName=session('admin.UserName');
  if(empty($UserName))
  {
	return false;  
  }
  $admin=Db::name("user")->where("`UserName`='".$UserName."' and `UserName`<>''")->find();
  $admin['logintime']=$UserName['logintime'];
  if(!$admin) { return false; }
  return $admin;
}





function pagesize($size)
{
  $str='';
  $array=array('1','10','15','20','30','50','100','200');
  foreach($array as $k=>$v)
  {
	 $selected='';
	 if($size==$v)
	 {
	   $selected='selected="selected"';	 
     }
	 $str.='<option '.$selected.' value="'.$v.'" >每页'.$v.'条</option>';  
  }
  return $str;
}

function dir_size($dir,$url){
     $dh = @opendir($dir);             //打开目录，返回一个目录流
     $return = array();
      $i = 0;
          while($file = @readdir($dh)){     //循环读取目录下的文件
             if($file!='.' and $file!='..'){
              $path = $dir.'/'.$file;     //设置目录，用于含有子目录的情况
              if(is_dir($path)){
          }elseif(is_file($path)){
              $filesize[] =  round((filesize($path)/1024),2);//获取文件大小
              $filename[] = $path;//获取文件名称                     
              $filetime[] = date("Y-m-d H:i:s",filemtime($path));//获取文件最近修改日期    
     
              $return[] =  $url.'/'.$file;
          }
          }
          }  
          @closedir($dh);             //关闭目录流
          array_multisort($filesize,SORT_DESC,SORT_NUMERIC, $return);//按大小排序
          //array_multisort($filename,SORT_DESC,SORT_STRING, $files);//按名字排序
          //array_multisort($filetime,SORT_DESC,SORT_STRING, $files);//按时间排序
          return $return;               //返回文件
     }

function getdir($dir) {
    $dirArray[]=NULL;
    if (false != ($handle = opendir ( $dir ))) {
        $i=0;
        while ( false !== ($file = readdir ( $handle )) ) {
            if ($file != "." && $file != ".."&&!strpos($file,".")) {
                $dirArray[$i] = mb_convert_encoding($file, 'UTF-8', 'gbk');
                $i++;
            }
        }
        //关闭句柄
        closedir ( $handle );
    }
    return $dirArray;
}


//获取文件列表
function getfile($dir) {
    $fileArray[]=NULL;
    if (false != ($handle = opendir ( $dir ))) {
        $i=0;
        while ( false !== ($file = readdir ( $handle )) ) {
            //去掉"“.”、“..”以及带“.xxx”后缀的文件
            if ($file != "." && $file != ".."&&strpos($file,".")) {
                $fileArray[$i]= mb_convert_encoding($file, 'UTF-8', 'gbk');
                if($i==100){
                    break;
                }
                $i++;
            }
        }
        //关闭句柄
        closedir ( $handle );
    }
    return $fileArray;
}



//
function pathtype($path)
{
	$path = $_SERVER['DOCUMENT_ROOT'].'/'.$path;
	$path=str_replace('//','/',$path);
	$path=urldecode($path);
	$info=pathinfo($path);
	$path = iconv('UTF-8','GB18030', $path );
	if(is_dir($path))
	{
	  $filetype='dir';
	}else if(is_file($path))
	{
	  $filetype='file';
	}
	$info['type']=$filetype;
	return $info;
}




/*
zip
    文件压缩
*/
function addFileToZip($path,$zip,$oldpath,$temproot){
	$path=delxg($path);
	
    $path3=substr($path , 0 , 1);	
	if($path3=='/'){ $path = substr_replace($path,"",0,1); }

	 //$zip->addEmptyDir('kkkk');
	$handle=opendir($path."."); 
	
	if(!is_file($path))
	{
        while (false !== ($file = readdir($handle)))
        {
			$file_url1='';
           if ($file != "." && $file != "..") {
					 //输出文件名
					 $file_url=$file;
					 $file_url1=delxg($path.'/'.$file_url);
					if(is_dir($file_url1))
					{
						addFileToZip($file_url1,$zip,$oldpath,$temproot); 
					}else{
					   // $file_url1=delxg($path.'/'.$file_url);
						 //file_put_contents('path.txt',$file_url1);
						    if($oldpath!='/')
							{
						      $oldpath1=delxg('/'.$oldpath.'/');
							  $oldpath1=str_replace($oldpath1,'',delxg('/'.$file_url1));
							}
							
							
						   // file_put_contents('path.txt',$oldpath1.'<br />',FILE_APPEND);
							$zip->addFile($file_url1,$oldpath1);
						//$zip->renameName($file_url1,$filename);
					}			
			
           }
        }
		
	}else{
		
		$oldpath1=str_replace($oldpath,'',delxg('/'.$path));
		$zip->addFile($path,$oldpath1);
	}
        closedir($handle);	
}	
	
	
function getenddir($path,$oldpath)
{
		

	if(is_file($path))
	{
	   $path=pathinfo($path);
	   $path=$path['dirname'];
	}
	if(is_file($oldpath))
	{
	   $oldpath=pathinfo($oldpath);
	   $oldpath=$oldpath['dirname'];
	}
	
	$newpath=str_replace($oldpath,'',$path);
//	return strpos($path,$oldpath);
	$dir=explode('/',$oldpath);
	foreach($dir as $k=>$v)
	{
	  if(!empty($v))
	  {
		 $list[]=$v;  
	  }
	}
	
	$num=count($list);
	$pathdir=$list[$num-1];
	$path1='/'.$pathdir.'/';
	
	
	$path1=str_replace('//','/',$path1);
	$path1=str_replace('//','/',$path1);
	//return $path1;
	//$path1=pathinfo($path1);
	//$path1=$path1['dirname'];
	file_put_contents('a.txt',$path1);
	
	return $path1;
	
}

	
	
	
	
	
	
	
	
	
	
	
	/*
	
function create_zip($files = array(),$destination = '',$overwrite = false) { 
    //if the zip file already exists and overwrite is false, return false 
    if(file_exists($destination) && !$overwrite) { return false; } 
    //vars 
    $valid_files = array(); 
    //if files were passed in... 
    if(is_array($files)) { 
        //cycle through each file 
        foreach($files as $file) { 
            //make sure the file exists 
            if(file_exists($file)) { 
                $valid_files[] = $file; 
            } 
        } 
    } 
    //if we have good files... 
    if(count($valid_files)) { 
        //create the archive 
        $zip = new \ZipArchive(); 
        if($zip->open($destination,$overwrite ? ZIPARCHIVE::OVERWRITE : ZIPARCHIVE::CREATE) !== true) { 
            return '创建压缩包失败！'; 
        } 
        //add the files 
        foreach($valid_files as $file) { 
            $file_info_arr= pathinfo($file); 
            $zip->addFile($file,$file_info_arr['basename']);//去掉层级目录 
        } 
        //debug 
        //echo 'The zip archive contains ',$zip->numFiles,' files with a status of ',$zip->status; 

        //close the zip -- done! 
        $zip->close(); 

        //check to make sure the file exists 
        return file_exists($destination); 
    } 
    else
    { 
        return false; 
    } 
} 	*/

	
function formatBytes($size) { 
	$units = array(' B', ' KB', ' MB', ' GB', ' TB'); 
	for ($i = 0; $size >= 1024 && $i < 4; $i++) $size /= 1024; 
	return round($size, 2).$units[$i]; 
}	
	
	
	
	
function getDirSize($dir)
{ 
	$dir = iconv('GB18030','UTF-8', $dir );
   
	$handle = opendir($dir);
	while (false!==($FolderOrFile = readdir($handle)))
	{ 
		if($FolderOrFile != "." && $FolderOrFile != "..") 
		{ 
			if(is_dir("$dir/$FolderOrFile"))
			{ 
				$sizeResult += getDirSize("$dir/$FolderOrFile"); 
			}
			else
			{ 
				$sizeResult += filesize("$dir/$FolderOrFile"); 
			}
		}    
	}
	closedir($handle);
	return $sizeResult;
}


/*
   ADD LOG
*/
function addlog($model,$content='',$sql='')
{
	$admin=getadmin();//检查登录
	$data['UserName']=$admin['UserName'];
	$data['LoginTime']=session('logintime');
	$data['ip']=getip();
	$data['model']=$model;
	$data['content']=$content;
	$data['sql']=$sql;
	$data['endtime']=date("Y-m-d H:i:s");
	$num=db::name('log')->insert($data);
	if($num)
	{
		return true;
	}else{
		return false;
	}
	
}



